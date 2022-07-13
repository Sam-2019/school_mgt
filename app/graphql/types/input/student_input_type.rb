module Types
    module Input
      class StudentInputType < Types::BaseInputObject
        description "Attributes for creating or updating a student"
        argument :first_name, String, "First name"
        argument :middle_name, String, "Middle name", required: false
        argument :last_name, String, "Last name"
      end
    end
  end