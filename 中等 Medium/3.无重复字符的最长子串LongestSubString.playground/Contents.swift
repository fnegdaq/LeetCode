/**
 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。

 示例 1:

 输入: "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 示例 2:

 输入: "bbbbb"
 输出: 1
 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 示例 3:

 输入: "pwwkew"
 输出: 3
 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
      请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-substring-without-repeating-characters
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func lengthOfLongestSubstring(_ s: String) -> Int {
    if s.count == 0 { return 0 }
    /*
    var window = [Character: Int]()
    /// 指针起点, 结束, 最长子串长度
    var start = 0, end = 0, ans = 0
    let array = Array(s)
    while end < s.count {
        let char = array[end]
        /// 如果end没有遇到重复继续走, 否则更换start的位置为重复字符next index
        if let val = window[char] {
            start = max(start, val)
        }
        end += 1
        ans = max(ans, end - start)
        window[char] = end
    }
    return ans
     */
    
    /**
     
         var longest = 0, startIndex = 0
         var charMap: [Character: Int] = [:]

         for (index, char) in s.enumerated() {
             if let foundIndex = charMap[char] {
                 startIndex = max(foundIndex+1, startIndex)
             }
             longest = max(longest, index - startIndex + 1)
             charMap[char] = index
         }
         return longest
        
     */
    
    let unicode = s.unicodeScalars.map { Int($0.value) }
    var indexs = Array(repeating: -1, count: 128)
    var left = -1, maxCount = 0
    for i in 0 ..< unicode.count {
        left = max(left, indexs[unicode[i]])
        indexs[unicode[i]] = i
        maxCount = max(maxCount, i - left)
    }
    return maxCount
}

lengthOfLongestSubstring("pwwkew")
