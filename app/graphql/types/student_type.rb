# frozen_string_literal: true

module Types
  class StudentType < Types::BaseObject
    field :id, ID
    field :first_name, String
    field :middle_name, String
    field :last_name, String
  end
end
