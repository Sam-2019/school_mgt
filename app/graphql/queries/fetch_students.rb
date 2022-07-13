module Queries
  class FetchStudents < Queries::BaseQuery
    type [Types::StudentType], null: false

    def resolve
      Student.all.order(created_at: :desc)
    end
  end
end