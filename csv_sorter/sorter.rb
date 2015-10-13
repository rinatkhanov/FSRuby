class User
  attr_accessor :name, :age, :phone, 
                :address, :comments

  def initialize(params)
    comps = params.split(/,/)
    @name, @age, @phone = comps[0], comps[1], comps[2]
    @address, @comments = comps[3], comps[4]
  end

  def to_s
    [@name, @age, @phone, @address, @comments]
    .reduce { |s, att| s + ', ' + att }
  end
end

class UserCollection
  attr_accessor :users

  def initialize(file)
    @users = []
    (file = File.open file).gets
    while (line = file.gets) do
      @users << User.new(line)
    end
    file.close
  end

  def method_missing(name)
		arg = name[8..-1]
    
    users.sort! { 
      |a, b| a.public_send(arg) <=> b.public_send(arg)
    }
  end
end

collection = UserCollection.new 'data.csv'
collection.sort_by_name
puts collection.users