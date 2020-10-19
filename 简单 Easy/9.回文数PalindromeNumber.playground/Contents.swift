/**
 判断一个整数是否是回文数。回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。

 示例 1:

 输入: 121
 输出: true
 示例 2:

 输入: -121
 输出: false
 解释: 从左向右读, 为 -121 。 从右向左读, 为 121- 。因此它不是一个回文数。
 示例 3:

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/palindrome-number
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */
/// O(logN)
/// % 取出最低数字
/// / 自身降一位
/// 判断条件为降位后的数小于尾数积累的值
/// 最后 偶数判断相等, 奇数中间数会被排到最后位,所以/10后判断相等
func isPalindrome(_ x: Int) -> Bool {
    if x < 0 || (x % 10 == 0 && x != 0) { return false }
    var temp = x
    var rearview = 0
    while temp > rearview {
        rearview = rearview * 10 + temp % 10
        temp /= 10
    }
    return x == rearview || x == rearview / 10
}

isPalindrome(12321)
