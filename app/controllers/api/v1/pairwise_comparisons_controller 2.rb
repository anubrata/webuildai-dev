# frozen_string_literal: true

module Api
  module V1
    class PairwiseComparisonsController < ApplicationController
      # TODO: remove this
      skip_before_action :verify_authenticity_token
      before_action :check_login

      NUM_PAIRS = Rails.env.development? ? 20 : 40
      ML_URL = Rails.env.production? ? 'https://webuildai-ml-server.herokuapp.com' : 'http://localhost:5000'
      SCENS = Rails.env.development? ? 5 : 40

      def generate_pairwise_comparisons
        # feat_ids = params[:selected_features]
        category = params[:category]
        # session[:pairwise_old_request] = nil
        # return

        if Rails.env.development? && !session[:pairwise_old_request].nil?
          session[:pairwise_old_request].each do |id|
            pc = PairwiseComparison.find(id)
            if !pc.nil?
              pc.destroy
            end
          end
        end

        @pairwise_comparisons = []
        all_feats = Feature.active.where(category: category).added_by(current_user.id).for_user(current_user.id, category)

        # three_feats = feat_ids.map{|id| Feature.find(id)}
        @scenarios = []
        @num_pairs = NUM_PAIRS
        @num_pairs.times do
          # TO DO: use ScenarioGroup
          # last_id = Scenario.all.empty? ? 1 : Scenario.all.last.group_id + 1
          
          last_id = ScenarioGroup.create()
          first_scenario = create_scenario(all_feats, last_id)
          second_last_id = ScenarioGroup.create()
          second_scenario = create_scenario(all_feats, last_id)
          @scenarios += first_scenario
          @scenarios += second_scenario

          new_pairwise = PairwiseComparison.create(participant_id: current_user.id,
                                                   scenario_1: last_id, scenario_2: second_last_id,
                                                   category: category)
          puts new_pairwise
          @pairwise_comparisons << new_pairwise
        end

        session[:pairwise_old_request] = @pairwise_comparisons.map{|pc| pc["id"]}
        comparisons_json = @pairwise_comparisons.map{|pc| pc.pc_to_json()}

        render json: {
          pairwiseComparisons: comparisons_json,
          mlServerUrl: ML_URL,
          participantId: current_user.id,
        }.to_json
      end

      def update_choice
        id = params[:pairwise_id]
        choice = params[:choice]
        reason = params[:reason]
        pwc = PairwiseComparison.find(id)
        pwc.choice = choice == -1 ? nil : choice
        pwc.reason = reason
        pwc.save
      end

      private

      def create_scenario(feats, group)
        scenarios = Array.new
        puts "=" * 10
        puts group
        feats.each do |f|
          puts f.inspect
          data_range = f.data_range

          if data_range.is_categorical
            fval = f.categorical_data_options.sample.option_value
            scenarios << Scenario.create(group_id: group, feature_id: f.id,
                                         feature_value: fval)

          else
            if f.name.downcase['distance'] || f.name.downcase['earning'] || f.name.downcase['cancel']# checks if distance/earning/cancel is in the name
              fval = ((rand(data_range.lower_bound..data_range.upper_bound) / 5).ceil) * 5
              scenarios << Scenario.create(group_id: group, feature_id: f.id,
                                           feature_value: fval)

            elsif f.name.downcase['rating'] && f.name.downcase['driver']
              fval = (data_range.lower_bound+ 0.25 * (rand(((data_range.upper_bound.to_f - data_range.lower_bound.to_f)/0.25)+1)))
              scenarios << Scenario.create(group_id: group, feature_id: f.id,
                                           feature_value: fval)

            elsif f.name.downcase['rating'] && f.name.downcase['customer']
              fval = (data_range.lower_bound+ 0.1 * (rand(((data_range.upper_bound.to_f - data_range.lower_bound.to_f)/0.1)+1)))
              scenarios << Scenario.create(group_id: group, feature_id: f.id,
                                           feature_value: fval)

            else
              scenarios << Scenario.create(group_id: group, feature_id: f.id,
                                           feature_value: ((rand(data_range.lower_bound...data_range.upper_bound + 1) * 1).floor / 1.0).to_i.to_s)
            end

          end
        end

        return scenarios

      end

    end
  end
end
