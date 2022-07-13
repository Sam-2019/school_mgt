module Mutations
    class AddStudent < Mutations::BaseMutation
      argument :params, Types::Input::StudentInputType, required: true
  
      field :student, Types::StudentType, null: false
  
      def resolve(params:)
        student_params = Hash params
  
        begin
          student = Student.create!(student_params)
  
          { student: student }
        rescue ActiveRecord::RecordInvalid => e
          GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
            " #{e.record.errors.full_messages.join(', ')}")
        end
      end
    end
  end