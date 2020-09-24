/**
 给定一个整数 n，返回 n! 结果尾数中零的数量。

 示例 1:

 输入: 3
 输出: 0
 解释: 3! = 6, 尾数中没有零。
 示例 2:

 输入: 5
 输出: 1
 解释: 5! = 120, 尾数中有 1 个零.
 说明: 你算法的时间复杂度应为 O(log n) 。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/factorial-trailing-zeroes
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

// 关键在于提取因子5的出现次数
// 出现零时 2*5, 2的出现个数必然大于5, 所有找到一个5必然可以找到一个2与之对应
func trailingZeroes(_ n: Int) -> Int {
    var count = 0
    for i in 1 ... n {
        var temp = i
        while temp > 0 {
            if temp%5 == 0 {
                count += 1
                temp = temp/5
            } else {
                break
            }
        }
    }
    return count
}

trailingZeroes(125)
