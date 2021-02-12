def quicksort(first, last, arr)
    if first < last
        index = partition(arr, first, last)
        quicksort(arr, first, index - 1)
        quicksort(arr, index + 1, last)
end

def partition(first, last, arr)
    pivot = arr[last]
    index = first
    i = first
    while i < last
        if arr[i] <= pivot
            temp = arr[i]
            arr[i] = arr[index]
            arr[index] = temp
            index += 1
        end
        i += 1
    end
    temp = arr[p_index]
    arr[p_index] = pivot
    arr[last] = temp
    return p_index
end
