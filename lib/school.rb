class Schools

  attr_reader :name, :vscore, :mscore, :wscore, :total_score

  @@all_schools = []

  def initialize(name, vscore=0, mscore=0, wscore=0)
    @name = name
    @vscore = vscore
    @mscore=mscore
    @wscore=wscore
    @total_score= vscore+mscore+wscore
    @@all_schools << self
  end

  def self.all_schools
    @@all_schools
  end

  def self.sort_by_total_score
    @@all_schools.sort_by {|school| school.total_score}.reverse
  end

  def self.sort_by_vscore
    @@all_schools.sort_by {|school| school.vscore}.reverse
  end

  def self.sort_by_mscore
    @@all_schools.sort_by {|school| school.mscore}.reverse
  end

  def self.sort_by_wscore
    @@all_schools.sort_by {|school| school.wscore}.reverse
  end

end
