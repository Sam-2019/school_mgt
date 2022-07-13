module Queries
    class FetchStudent < Queries::BaseQuery
      type Types::StudentType, null: false
      argument :id, ID, required: true
  
      def resolve(id:)
        Student.find(id)
      rescue ActiveRecord::RecordNotFound => _e
        GraphQL::ExecutionError.new('Student does not exist.')
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end