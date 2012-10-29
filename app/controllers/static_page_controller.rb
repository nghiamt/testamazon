class StaticPageController < ApplicationController
  skip_before_filter :authorize_admin
  def help
  end

  def about
  end
end
