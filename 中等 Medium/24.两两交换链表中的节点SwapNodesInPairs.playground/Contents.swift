/**
 给定一个链表，两两交换其中相邻的节点，并返回交换后的链表。

 你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。

  

 示例:

 给定 1->2->3->4, 你应该返回 2->1->4->3.

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/swap-nodes-in-pairs
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() {
        self.val = 0
        self.next = nil
    }
    
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

class Solution {
    // 将传进来的节点 head 和 其next 进行反转 并返回链表的新头部节点
    func swapPairs(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil { return head }
        // 假设链表是 1->2->3->4
        // 先保存节点2
        let next = head?.next
        // 继续递归, 处理 3->4
        // 递归结束变为 4->3
        // head节点指向4. 1->4->3
        head?.next = swapPairs(next?.next)
        // 最后将保存的节点2指向1
        next?.next = head
        return next
    }
}

let test = Solution()
let node = ListNode(1)
node.next = ListNode(2)
node.next?.next = ListNode(3)
node.next?.next?.next = ListNode(4)
test.swapPairs(node)
