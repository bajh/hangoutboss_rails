require 'rails_helper'

RSpec.describe AboutController, :type => :controller do

  it "renders index page" do
    get :index
    expect(response).to render_template(:index)
  end

end