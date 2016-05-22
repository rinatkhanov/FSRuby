describe PagePolicy do
  # self methods starts with #
  # other - with .
  describe '.edit?' do
    let(:page) { create :page }

    subject { described_class.new(user, page) }

    context "with administrator" do
      let(:user) { create :user, role: 'administrator' }

      it { is_expected.to eq true }
    end

    context "with user" do
      let(:user) { create :user, role: 'user'}

      it { is_expected.to eq false }
    end
  end








  describe '.destroy?' do
    let(:user) { create :user }
    let(:page) { create :page }

    subject { described_class.new(user, page) }
  end
end
