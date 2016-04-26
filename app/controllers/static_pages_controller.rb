class StaticPagesController < ApplicationController
  def home
  end

  def call_for_papers
  end

  def important_dates
  end

  def paper_ethics
  end

  def commitee
  end

  def venue_and_contact
  end

  def selections
  end

  def brochure
    send_file(
      "#{Rails.root}/public/icrtet.pdf",
      filename: "bro.pdf",
      type: "application/pdf"
    )
  end

  def schedule
    send_file(
      "#{Rails.root}/public/schedule.pdf",
      filename: "schedule.pdf",
      type: "application/pdf"
    )
  end
end
