# frozen_string_literal: true

class DashboardsController < ApplicationController
  def index
    @members = Member.all
  end
end
