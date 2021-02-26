class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    self.all << song
    song
  end 

  def self.new_by_name (name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name (name)
    song = self.new
    song.name = name
    self.all << song
    song
  end 

  def self.find_by_name (name)
    self.all.find{|song| song.name == name}
  end 

  def self.find_or_create_by_name (name)
    if !self.all.map{|song| song.name}.include?(name)
      new_song = Song.create_by_name(name)
    end
    self.find_by_name (name)
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end 

  def self.new_from_filename (filename)
    song_info = filename.split(/[-.]/).map{|n| n.strip}
    new_song = self.create_by_name(song_info[1])
    new_song.artist_name = song_info[0]

    new_song
  end

  def self.create_from_filename (filename)
    song_info = filename.split(/[-.]/).map{|n| n.strip}
    new_song = self.create_by_name(song_info[1])
    new_song.artist_name = song_info[0]

    new_song.save
  end

  def self.destroy_all
    self.all.clear
  end

end
