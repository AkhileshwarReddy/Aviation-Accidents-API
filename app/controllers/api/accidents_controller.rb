class Api::AccidentsController < ApplicationController
  def country_wise_accidents
    @accidents_by_country = Aviation.select("country_id AS id, country, COUNT(*) AS no_of_accidents").group(:country_id, :country).sort
    render json: {data: @accidents_by_country}
  end

  def month_wise_accidents_in_us
    @accidents = Aviation.select("CAST(EXTRACT(MONTH FROM event_date) AS INTEGER)").where(country: "United States").group("CAST(EXTRACT(MONTH FROM event_date) AS INTEGER)").count.sort
    month_wise_accidents = []
    @accidents.each do |accident|
      month_wise_accidents.append({
        "month": accident[0].to_int,
        "no_of_accidents": accident[1]
      })
    end
    render json: {data: month_wise_accidents}
  end

  def injury_severity_count
    @injury_severities = Aviation.group(:injury_severity).count.sort_by { |k, v| -v }
    injury_severity_data = []
    @injury_severities.each do |severity|
      injury_severity_data.append({
        "injurity_severity": severity[0],
        "count": severity[1]
      })
    end
    render json: {data: injury_severity_data}
  end

  def top_ten_companies
    @top_companies = Aviation.group("UPPER(make)").count.sort_by {|company, count| -count}.take(10)
    top_companies_list = []
    @top_companies.each do |company|
      top_companies_list.append({
        "company": company[0],
        "no_of_accidents": company[1]
      })
    end
    render json: {data: top_companies_list }
  end

  def accidents_per_state_in_us
    accidents_by_state = Aviation.select("TRIM(REVERSE(SPLIT_PART(REVERSE(location),',',1))) AS state, COUNT(*) AS no_of_accidents").group("state").where(country: "United States").to_a
    data = []
    accidents_by_state.each do |state|
      data.append({
        "state": state.state,
        "no_of_accidents": state.no_of_accidents
      })
    end
    render json: {data: data}
  end
end
