/**
 给定两个字符串 s1 和 s2，写一个函数来判断 s2 是否包含 s1 的排列。

 换句话说，第一个字符串的排列之一是第二个字符串的子串。

 示例1:

 输入: s1 = "ab" s2 = "eidbaooo"
 输出: True
 解释: s2 包含 s1 的排列之一 ("ba").
  

 示例2:

 输入: s1= "ab" s2 = "eidboaoo"
 输出: False
  

 注意：

 输入的字符串只包含小写字母
 两个字符串的长度都在 [1, 10,000] 之间

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/permutation-in-string
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

/// 滑动窗口
class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        var left = 0, right = 0
        // 窗口中满足 need 条件的字符个数
        var match = 0
        // 窗口, 字符:出现个数
        var needs = [Character: Int](), windows = [Character: Int]()
        for c in s1 {
            needs[c] != nil ? (needs[c]! += 1) : (needs[c] = 1)
        }
        while right < s2.count {
            let c = s2[s2.index(s2.startIndex, offsetBy: right)]
            right += 1
            // 窗口数据更新
            if needs[c] != nil {
                windows[c] != nil ? (windows[c]! += 1) : (windows[c] = 1)
                if windows[c] == needs[c] {
                    match += 1
                }
            }
            
            // 判断左侧窗口是否要收缩
            while right - left >= s1.count {
                if match == needs.count {
                    return true
                }
                let c = s2[s2.index(s2.startIndex, offsetBy: left)]
                left += 1
                if needs.keys.contains(c) {
                    if windows[c] == needs[c] {
                        match -= 1
                    }
                    windows[c]! -= 1
                }
            }
        }
        return false
    }
}

let test = Solution()
test.checkInclusion("ab", "eidbbaooo")
