/**
 给定一个包含大写字母和小写字母的字符串，找到通过这些字母构造成的最长的回文串。

 在构造过程中，请注意区分大小写。比如 "Aa" 不能当做一个回文字符串。

 注意:
 假设字符串的长度不会超过 1010。

 示例 1:

 输入:
 "abccccdd"

 输出:
 7

 解释:
 我们可以构造的最长的回文串是"dccaccd", 它的长度是 7。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-palindrome
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func longestPalindrome(_ s: String) -> Int {
    if s.count == 0 { return 0 }
//    var chars = [Character]()
//    for char in s {
//        if let index = chars.firstIndex(of: char) {
//            chars.remove(at: index)
//        } else {
//            chars.append(char)
//        }
//    }
//    // 判断chars奇数的个数
//    return chars.count == 0 ? (s.count) : (s.count - chars.count + 1)
    
    var chars = [Character: Int]()
    for char in s {
        chars[char] = (chars[char] ?? 0) + 1
    }
    
    var even = 0, odd = 0
    for (_, value) in chars {
        if value % 2 == 0 {
            even += value
        } else {
            // 奇数>1的时候先-1就是偶数个, 最后加上单独一奇数
            even += value - 1
            odd = 1
        }
    }
    return even + odd
}

longestPalindrome("abccccdd")
