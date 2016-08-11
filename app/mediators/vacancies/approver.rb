# frozen_string_literal: true
module Vacancies
  class Approver
    def initialize(vacancy)
      @vacancy = vacancy
    end

    def self.run(vacancy)
      new(vacancy).call
    end

    def call
      @vacancy.approve!
      notify if @vacancy.approved?

      @vacancy
    end

    private

    def notify
      VacancyMailer.approval_notice(@vacancy).deliver_later
    end
  end
end
