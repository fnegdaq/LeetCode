import UIKit
 
/**
 给定一个 没有重复 数字的序列，返回其所有可能的全排列。

 示例:

 输入: [1,2,3]
 输出:
 [
   [1,2,3],
   [1,3,2],
   [2,1,3],
   [2,3,1],
   [3,1,2],
   [3,2,1]
 ]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/permutations
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
// 回溯算法
func permute(_ num: [Int]) -> [[Int]] {
    var res = [[Int]]()
    if num.count == 0 { return res }
    var path = [Int]() // 行走路线
    var used = [Bool](repeating: false, count: num.count) // 撤销判断路径
    backTracing(num, path: &path, used: &used, res: &res)
    return res
}

func backTracing(_ nums: [Int], path: inout [Int], used: inout [Bool], res: inout [[Int]]) {
    // 判断已走路径个数 = 给定序列个数
    if path.count == nums.count {
        let temp = path
        res.append(temp)
        return
    }
    for (index, num) in nums.enumerated() {
        if used[index] { continue } //选过的另起
        used[index] = true
        path.append(num) //选择
        backTracing(nums, path: &path, used: &used, res: &res)
        path.removeLast() //撤回
        used[index] = false
    }
}


permute([1, 2, 3])
