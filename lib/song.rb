require 'pry'
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

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.find {|song_inst| song_inst.name == name}
  end

  def self.find_or_create_by_name(name)
    if !self.create_by_name(name) == name
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song_name| song_name.name} 
  end

  def self.new_from_filename(mp3_file)
    # split("-") => array with two elements - artist and song.mp3
    # take second element (song.mp3) and split(".") => array with two elements
    # pop off second element (.mp3)
    # save artist to artist
    # save song_name to name
    artist_song = mp3_file.split(" - ")
    song_mp3 = artist_song[1].split(".")
    artist = artist_song[0]
    name = song_mp3[0]
    song = self.new
    song.name = name
    song.artist_name = artist
    song
    # binding.pry
    # puts 's'
  end

  def self.create_from_filename(mp3_file)
    artist_song = mp3_file.split(" - ")
    song_mp3 = artist_song[1].split(".")
    artist = artist_song[0]
    name = song_mp3[0]
    song = self.new
    song.name = name
    song.artist_name = artist
    self.all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end
end

# blank = Song.create
# blank = Song.new_by_name("blank")
# blank = Song.create_by_name("space")
# binding.pry
# puts 's'
