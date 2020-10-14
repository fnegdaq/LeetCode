/**
 给定仅有小写字母组成的字符串数组 A，返回列表中的每个字符串中都显示的全部字符（包括重复字符）组成的列表。例如，如果一个字符在每个字符串中出现 3 次，但不是 4 次，则需要在最终答案中包含该字符 3 次。
 
 你可以按任意顺序返回答案。

  

 示例 1：

 输入：["bella","label","roller"]
 输出：["e","l","l"]
 示例 2：

 输入：["cool","lock","cook"]
 输出：["c","o"]
  

 提示：

 1 <= A.length <= 100
 1 <= A[i].length <= 100
 A[i][j] 是小写字母

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/find-common-characters
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func commonChars(_ A: [String]) -> [String] {
    // 宽 26 高 N (n=A.count)的二维数组 [[0...26], [0...26], [0...26]]
    var array = [[Int]](repeating: [Int](repeating: 0, count: 26), count: A.count)
    for i in 0 ..< A.count {
        let str = A[i]
        for c in str {
            // "a" ascii == 97
            array[i][Int(c.asciiValue! - 97)] += 1
        }
    }
    
    var res = [String]()
    for col in 0 ..< 26 {
        var count = 200
        // 取字符出现最小次数. 例如 a 出现为 1, 1, 0 所以最后 count = 0
        // e 出现为 1, 1, 1 count = 1, 添加到res中 
        for row in 0 ..< array.count {
            count = min(count, array[row][col])
        }
        while count > 0 {
            res.append(String(Character(UnicodeScalar(col + 97)!)))
            count -= 1
        }
    }
    return res
}

commonChars(["bella","label","roller"])
