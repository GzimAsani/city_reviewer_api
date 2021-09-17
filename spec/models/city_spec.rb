require 'rails_helper'

RSpec.describe City, type: :model do
  subject { City.new(name: "Prishtina", image_url: "https://upload.wikimedia.org/wikipedia/commons/5/5f/Prishtina_Collage.jpg",  ) }
  
  before {subject.save}

  it "should be present" do
    subject.name = nil
    
    expect(subject).to_not be_valid
  end

  describe "flowers API", type: :request do
    it "returns all flowers" do
      get '/api/v1/cities'

      expect(response).to have_http_status(:success)
    end
  end

  context 'validation test' do
    it 'ensures validations' do
      city = City.new(name: 'last', image_url: 'username').save
      expect(city).to eq(true)
    end
  end

  context 'validation test' do
    it 'ensures validations' do
      city = City.new(image_url: 'username').save
      expect(city).to eq(false)
    end
  end

  context 'Association Test' do
    it 'has many to reviews' do
      expect(City.reflect_on_association(:reviews).macro).to be :has_many
    end
  end
end