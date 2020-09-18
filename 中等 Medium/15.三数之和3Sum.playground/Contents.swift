/**
 给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有满足条件且不重复的三元组。

 注意：答案中不可以包含重复的三元组。

  

 示例：

 给定数组 nums = [-1, 0, 1, 2, -1, -4]，

 满足要求的三元组集合为：
 [
   [-1, 0, 1],
   [-1, -1, 2]
 ]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/3sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func threeSum(_ nums: [Int]) -> [[Int]] {
    if nums.count < 3 { return [] }
    let sortArray = nums.sorted()
    var res = [[Int]]()
    for i in 0 ..< sortArray.count - 2 {
        if sortArray[i] > 0 { break }
        if i > 0 && sortArray[i] == sortArray[i - 1] { continue }
        var left = i + 1, right = sortArray.count - 1
        while left < right {
            let result = sortArray[i] + sortArray[left] + sortArray[right]
            if result == 0 {
                res.append([sortArray[i], sortArray[left], sortArray[right]])
                repeat {
                    left += 1
                } while left < right && sortArray[left] == sortArray[left - 1]
                repeat {
                    right -= 1
                } while left < right && sortArray[right] == sortArray[right + 1]
            } else if result < 0 {
                repeat {
                    left += 1
                } while left < right && sortArray[left] == sortArray[left - 1]
            } else {
                repeat {
                    right -= 1
                } while left < right && sortArray[right] == sortArray[right + 1]
            }
        }
    }
    return res
}

threeSum([-1, 0, 1, 2, -1, -4])
