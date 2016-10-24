module Fsort
  class ComparableFile
  
    attr_reader :stats, :path
  
    def initialize path, criterias
      @stats = criterias.map{|stat, order| File.send stat, path}
      @path = path
    end

    def stats_path
      @st_p ||= stats + [path]
    end
  
  end
end

