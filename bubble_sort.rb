##Gabe Ryan
##Bubble Sort
##June 21, 2017
##Ruby


def bubble_sort(arr)
  (arr.length-1).downto(0) { |num|
    num.times { |i|
      if arr[i] > arr[i+1]
        arr[i],arr[i+1] = arr[i+1],arr[i]
      end
    }
  }
  p arr
end


bubble_sort([4,3,78,2,2,])
bubble_sort([1,3,2,4,5,7,6,8])
bubble_sort([4,8,35,86,2,123,36,9,55,23,14,6,3,1])

###############################################

def bubble_sort_by(arr)
  arr.length.times { |i|
    arr.length.times { |j|
      if yield(arr[i],arr[j]) < 0
        arr[i],arr[j] = arr[j],arr[i]
      end
    }
  }
  p arr
end

bubble_sort_by(["hi","hello","hey"]) { |left,right| left.length - right.length }
bubble_sort_by(["something","hi","something longer","hello","hey"]) { |left,right| left.length - right.length }

###############################################

def sort_1(arr)
  arr.length.times { |i|
    remain_vals = arr[i..-1]
    if arr[i] > remain_vals.min
      j =remain_vals.index(remain_vals.min)+i
      arr[i],arr[j] = arr[j],arr[i]
    end
  }
  p arr
end

sort_1([4,3,78,2,2,])
sort_1([1,3,2,4,5,7,6,8])
sort_1([4,8,35,86,2,123,36,9,55,23,14,6,3,1])
