module Exercise
  module Arrays
    class << self
      def replace(array)
        max_value = array[0]

        array.each do |el|
          max_value = el if el > max_value
        end
        array.map do |el|
          el = max_value if el.positive?
          el
        end
      end

      def search(array, value, array_border_start = nil, array_border_end = nil)
        return -1 if array.empty?

        array_start = array_border_start || 0
        array_end = array_border_end || array.length - 1
        array_mid = (array_start + array_end) / 2

        if value > array[array_end] || value < array[array_start]
          -1
        elsif array[array_mid] == value
          array_mid
        elsif array[array_mid] > value
          search(array, value, array_start, array_mid - 1)
        else
          search(array, value, array_mid + 1, array_end)
        end
      end
    end
  end
end
