/**
 给定一个二叉搜索树（Binary Search Tree），把它转换成为累加树（Greater Tree)，使得每个节点的值是原来的节点值加上所有大于它的节点值之和。

  

 例如：

 输入: 原始二叉搜索树:
               5
             /   \
            2     13

 输出: 转换为累加树:
              18
             /   \
           20     13

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/convert-bst-to-greater-tree
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

//二叉搜索树的特性：当前的节点的值一定大于其左子树的值并且小于其右子树的值
//逆向中序遍历
class Solution {
    var sum = 0
    
    func convertBST(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        convertBST(root.right)
        sum += root.val
        root.val = sum
        convertBST(root.left)
        return root
    }
}
