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
    @dogs.select do |dog|
      dog if dog[:size] == :small
    end
  end

  def huge_dog
    huge = @dogs.select do |dog|
      dog if dog[:size] == :huge
    end
    huge.first
  end

  def large_dog_names
    large_dog_names = @dogs.map do |dog|
      dog[:name] if dog[:size] == :large
    end
    large_dog_names.compact
  end

  def joes_large_dogs
    joes_dogs = @dogs.map do |dog|
      dog[:name] if dog[:owner][:name][:first] == "Joe" && dog[:size] == :large
    end
    joes_dogs.compact
  end

  def sizes
    dog_array = @dogs.map do |dog|
      dog[:size]
    end
    dog_array.uniq!
  end

  def owners
    owner_array = @dogs.map do |dog|
      dog[:owner][:name]
    end
    owner_array.uniq!
    owner_names = owner_array.map do |owner|
      (owner[:first] + " " + owner[:last])
    end
    owner_names.compact
  end

  def average_owners
    owner_array = @dogs.map do |dog|
      (dog[:owner][:name][:first] + " " + dog[:owner][:name][:last]) if dog[:owner][:owner_quality] == AVERAGE
    end
    owner_array.uniq!.compact
  end

end
