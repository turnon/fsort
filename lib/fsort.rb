require "fsort/version"
require 'fsort/option'
require 'fsort/comparator'
require 'fsort/comparable_file'

module Fsort
  def self.sort files, opt={}
    stats = opt[:by].keys
    order = opt[:by].values

    comparator = Comparator.new order

    comparable_files = files.map { |f| ComparableFile.new f, stats }.
      sort(&comparator)

    return comparable_files if opt[:return_stats]

    comaprable_files.map(&:path)
  end
end
