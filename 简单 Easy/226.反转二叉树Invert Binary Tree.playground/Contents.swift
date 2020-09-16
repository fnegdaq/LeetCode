import UIKit

/**
 翻转一棵二叉树。

 示例：
 输入：

      4
    /   \
   2     7
  / \   / \
 1   3 6   9
 输出：

      4
    /   \
   7     2
  / \   / \
 9   6 3   1

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/invert-binary-tree
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        let tempNode = root.left
        root.left = root.right
        root.right = tempNode
        invertTree(root.left)
        invertTree(root.right)
        return root
    }
}
