import UIKit



//Sliding Window

//Suppose you have an array of numbers, and you want to find the maximum sum of a subarray of a fixed length k

func maxSlid(_ arr: [Int] , _ k:Int)->Int{
    var maxSum = 0
    var currentSum = 0
    
    for i in 0..<arr.count{
        currentSum += arr[i]
        if i >= k-1 {
            maxSum = max(maxSum, currentSum)
            currentSum -= arr[i - k+1]  // Remove the first element of the window
        }
    }
    
    return maxSum
}
let arr = [2, 1, 5, 1, 3, 2]
let k = 3
let result = maxSlid(arr, k)
//print("Maximum sum subarray of size \(k) is \(result)")

//Given a string, find the length of the longest substring without repeating characters. The sliding window can be used to keep track of the substring.
func longestSub(str:String)->Int {
    var length = 0
    var currentLength = ""
    
    for i in 0..<str.count{
            currentLength.append( String(str[str.index(str.startIndex ,offsetBy: i)]))
        if isUnique(currentLength) {
            print(currentLength)
            length = max(length ,currentLength.count )
//            currentLength.dropFirst()
        }
        
        
        
    }
return length
}

func isUnique(_ str:String)->Bool{
    var arr:[Character] = []
    for (_,char) in str.enumerated(){
        arr.append(char)
    }
    let set = Set(arr)
    if arr.count == Array(set).count{
        return true
    }else{
        return false
    }
}
//print(isUnique("helo"))
//print(longestSub(str: "hello"))






//Islands (Matrix Traversal) technique

//Given a 2D grid consisting of '1's (land) and '0's (water), count the number of islands. An island is formed by connecting adjacent '1's horizontally or vertically.
func findIsland(grid:[[Int]])->Int{
    var grid = grid
    var count = 0
    for i in 0..<grid.count{
        for j in 0..<grid[i].count{
            if grid[i][j] == 1 {
                count+=1
                
//                markAsRead(&grid , i , j)
            }
        }
    }
    return count
}
func markAsRead(_ grid: inout [[Int]] ,_ i:Int ,_ j:Int){
    if i < 0 || i >= grid.count || j < 0 || j >= grid[i].count || grid[i][j] == 0 {
          return
      }
    grid[i][j] = 0
//    markAsRead(&grid, i - 1, j)
//    markAsRead(&grid, i + 1, j)
//    markAsRead(&grid, i, j - 1)
//    markAsRead(&grid, i, j + 1)
}
let grid = [[1, 1 ,0 ,0,0],
            [1 ,1 ,0 ,0 ,1],
            [0 ,0 ,0, 1 ,1],
            [0 ,0 ,0 ,0, 0],
            [1 ,1 ,0 ,0, 0]]

//print(findIsland(grid: grid))







//Two Pointers

//Given a sorted array of integers and a target value, find two numbers in the array such that their sum is equal to the target. Return the indices of these two numbers.

func twoPointer(arr:[Int] , target:Int)->[Int]{
    var left = 0
    var right = arr.count - 1
    while left < right{
//        print([left,right])
        if arr[left] + arr[right] == target {
            return [left + 1 , right + 1]
        }else if arr[left] + arr[right] < target {
            left+=1
        }else{
            right-=1
            
        }
    }
        return[]
    
}
print(twoPointer(arr: [2, 7, 11, 15], target: 9))
