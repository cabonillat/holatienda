require "rails_helper"

RSpec.describe User, :type => :model do

  before do
    stub_user
  end

  it 'save an user with a name and password' do
    user = User.create(name: 'demo', password: '123')
    expect(user.persisted?).to be true
  end

  it "user can not be saved email error" do
    user = User.create(name: "Andy", email: 'asdadads')
    expect(user.persisted?).to be false
    expect(user).to have(1).error_on(:email)
  end

  it "user can not be saved password error" do
    user = User.create(name: "Andy")
    expect(user.persisted?).to be false
    expect(user).to have(1).error_on(:password)
  end

  context 'when user saved' do

    before do
      @user = User.create(name: 'demo', password: '123')
    end

    it 'change email to user' do
      bool = @user.update_attribute(:email, "demo@demo.com")
      expect(bool).to be true
      expect(@user.errors.size).to eq 0
      expect(@user.email).to eq "demo@demo.com"
    end

    it 'change user name' do
      old_name = @user.name
      @user.update_attribute(:name, 'demo123')
      expect(@user.name).not_to eq old_name
    end

    it 'deletes the user' do
      @user.destroy
      expect(User.count).to eq 0
    end

    it 'find by name' do
      @user = User.where(name: 'demo').first
      expect(@user).not_to be nil
    end
    
  end

end