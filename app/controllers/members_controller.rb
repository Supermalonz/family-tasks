# frozen_string_literal: true

class MembersController < ApplicationController
  def new
    @member = Member.new
  end

  def create
    @member = Member.new(create_member_params)

    if @member.save
      redirect_to dashboards_path, success: 'Created a member!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def create_member_params
    params.require(:member).permit(:name)
  end
end
