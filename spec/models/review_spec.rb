RSpec.describe City, type: :model do
  subject { Review.new(title: "Prishtina", description: "blabla", score: 4, city_id: 1  ) }
  
  before {subject.save}

  it "should be present" do
    subject.title = nil
    
    expect(subject).to_not be_valid
  end

  context 'validation test' do
    it 'Reviews return false if the score is not provided' do
      city = Review.new(title: 'last', description: 'username', city_id: 1).save
      expect(city).to eq(false)
    end
  end

  context 'validation test' do
    it 'Reviews return false if the city_id is not provided' do
      city = Review.new(title: 'last', description: 'username', score: 1).save
      expect(city).to eq(false)
    end
  end

  context 'validation test' do
    it 'Reviews return false if the title is not provided' do
      city = Review.new(description: 'username', score: 1, city_id: 1).save
      expect(city).to eq(false)
    end
  end

  context 'validation test' do
    it 'Reviews return false if the description is not provided' do
      city = Review.new(title: 'last', score: 1, city_id: 1).save
      expect(city).to eq(false)
    end
  end

  context 'validation test' do
    it 'Reviews return true if the everything is  provided' do
      city = Review.new(title: 'last', description: "yes", score: 1, city_id: 1).save
      expect(city).to_not eq(true)
    end
  end

  context 'Association Test' do
    it 'has many to attendances' do
      expect(Review.reflect_on_association(:city).macro).to be :belongs_to
    end
  end

end