class StaticPageController < ApplicationController
  skip_before_filter :authorize, :authorize_admin
  def help
  end

  def about
  end
end
