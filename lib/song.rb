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
    song = Song.new
    Song.all << song
    song
  end 

  def self.new_by_name (name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name (name)
    song = Song.new
    song.name = name
    Song.all << song
    song
  end 

  def self.find_by_name (name)
    Song.all.find{|song| song.name == name}
  end 

  def self.find_or_create_by_name (name)
    if !Song.all.map{|song| song.name}.include?(name)
      new_song = Song.create_by_name(name)
    end
    Song.find_by_name (name)
  end

  def self.alphabetical
    Song.all.sort_by{|song| song.name}
  end 

  def self.new_from_filename (filename)
    song_info = filename.split(/[-.]/).map{|n| n.strip}
    new_song = Song.create_by_name(song_info[1])
    new_song.artist_name = song_info[0]

    new_song
  end

  def self.create_from_filename (filename)
    song_info = filename.split(/[-.]/).map{|n| n.strip}
    new_song = Song.create_by_name(song_info[1])
    new_song.artist_name = song_info[0]

    new_song.save
  end

  def self.destroy_all
    Song.all.clear
  end

end
