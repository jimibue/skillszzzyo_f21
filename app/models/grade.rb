class Grade < ApplicationRecord
  belongs_to :user
  belongs_to :skill


  def self.all_and_then_some
    grades = Grade.all
    grades
    # this a bad way to do this
    # behind scesnes using sql, but in a bad way

    # n + 1 query n is going the number of extra queries, this is generally a bad thing
    grades.map do |grade|
      {id: grade.id, score:grade.score, user:grade.user, skill:grade.skill}
    end
  end

  def self.tp_grades
    grades = Grade.all
    grades
    # this a bad way to do this
    # behind scesnes using sql, but in a bad way

    # n + 1 query n is going the number of extra queries, this is generally a bad thing
    grades.map do |grade|
      {
        id: grade.id, 
        score:grade.score, 
        user_name: grade.user.name, 
        skill_name:grade.skill.name,
        description:grade.skill.description,
        user_id:grade.user.id,
        skill_id:grade.skill.id,
      }
    end
  end
end

