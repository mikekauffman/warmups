class Dogs
  POOR = (0..5).to_a.sample
  AVERAGE = (6..10).to_a.sample
  EXCELLENT = (11..15).to_a.sample

  def initialize
    joe = {
      :name => {:first => "Joe", :last => "Smith"},
      :owner_quality => EXCELLENT
    }
    sarah = {
      :name => {:first => "Sarah", :last => "Smith"},
      :owner_quality => AVERAGE
    }
    andrew = {
      :name => {:first => "Andrew", :last => "Beter"},
      :owner_quality => AVERAGE
    }

    @dogs = [{:name => "Fido", :size => :large, :owner => joe},
             {:name => "Yapper", :size => :small, :owner => joe},
             {:name => "Bruiser", :size => :large, :owner => joe},
             {:name => "Tank", :size => :huge, :owner => sarah},
             {:name => "Beast", :size => :large, :owner => sarah},
             {:name => "Harleigh", :size => :medium, :owner => andrew},
             {:name => "Trixie", :size => :small, :owner => andrew},]
  end

  def small_dogs
    dog_size_filter(:small)
  end

  def huge_dog
    dog_size_filter(:huge).first
  end

  def large_dog_names
    @dogs.map { |dog| hash_value_return(dog, :name) if size_filter(dog, :size, :large) }.compact
  end

  def joes_large_dogs
    @dogs.map { |dog| hash_value_return(dog, :name) if three_keys_value_return(dog, :owner, :name, :first) == "Joe" && size_filter(dog, :size, :large) }.compact
  end

  def sizes
    @dogs.map { |dog| hash_value_return(dog, :size) }.uniq!
  end

  def owners
    @dogs.map { |dog| two_keys_value_return(dog, :owner, :name) }.uniq!.map { |owner| (hash_value_return(owner, :first) + " " + hash_value_return(owner, :last)) }.compact
  end

  def average_owners
    @dogs.map { |dog| (three_keys_value_return(dog, :owner, :name, :first) + " " + three_keys_value_return(dog, :owner, :name, :last)) if two_keys_value_return(dog, :owner, :owner_quality) == AVERAGE }.uniq!.compact
  end

end

private

def dog_size_filter(size)
  @dogs.select { |dog| dog if dog[:size] == size }
end

def size_filter(hash, key, value)
  hash[key] ==  value
end

def hash_value_return(hash, key)
  hash[key]
end

def two_keys_value_return(hash, k1, k2)
  hash[k1][k2]
end

def three_keys_value_return(hash, k1, k2, k3)
  hash[k1][k2][k3]
end