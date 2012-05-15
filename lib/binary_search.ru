def b_search(array, key)
  max = array.length
  min = 0
  while max >= min
    mid = (max + min)/2
    
    if array[mid] < key
      min = mid + 1
    elsif
      max = mid - 1
    else
      return mid
    end  
  end
  return 'error'
end
