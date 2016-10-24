require 'optparse'

module Fsort
  module Option

    def self.parse argv
      opts = OptionParser.new
      criterias = {}

      opts.on('--size [asc]') {|order| criterias[:size] = (order == 'asc' ? :asc : :desc)}
      opts.on('--mtime [desc]') {|order| criterias[:mtime] = (order == 'desc' ? :desc : :asc)}
      opts.on('--atime [desc]') {|order| criterias[:atime] = (order == 'desc' ? :desc : :asc)}
      opts.on('--ctime [desc]') {|order| criterias[:ctime] = (order == 'desc' ? :desc : :asc)}

      opts.parse argv
      criterias
    end

  end
end
