module Fsort
  module Comparator

    def self.new order
      order = order.values if order.kind_of? Hash
      lambda do |f1, f2|
	st_1, st_2 = f1.stats, f2.stats

        st_1.zip(st_2).
	  each_with_index do |st1_st2, i|
            cmp = if order[i] == :desc
                    st1_st2[1] <=> st1_st2[0]
                  else
                    st1_st2[0] <=> st1_st2[1]
                  end
            return cmp if cmp != 0
          end

        return 0
      end
    end

  end
end
