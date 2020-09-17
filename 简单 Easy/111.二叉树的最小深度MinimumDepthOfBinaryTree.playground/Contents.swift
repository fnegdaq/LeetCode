import UIKit

/**
 给定一个二叉树，找出其最小深度。

 最小深度是从根节点到最近叶子节点的最短路径上的节点数量。

 说明: 叶子节点是指没有子节点的节点。

 示例:

 给定二叉树 [3,9,20,null,null,15,7],

     3
    / \
   9  20
     /  \
    15   7
 返回它的最小深度  2.

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/minimum-depth-of-binary-tree
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

// BFS (breadth-first search)
//「齐头并进」
// 这样的话最坏情况下空间复杂度应该是树的最底层节点的数量，也就是 N/2，用 Big O 表示的话也就是 O(N)
class Solution {
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
 
        var container = [TreeNode]()
        container.append(root)
        var depth = 1
        while !container.isEmpty {
            let size = container.count
            for i in 0 ..< size {
                let node = container[i]
                // 扫到某一节点下面没有左右子树即为最小深度
                if node.left == nil && node.right == nil {
                    return depth
                }
                if node.left != nil {
                    container.append(node.left!)
                }
                if node.right != nil {
                    container.append(node.right!)
                }
            }
            container.removeSubrange(0 ..< size)
            depth += 1
        }
        return depth
    }
}
