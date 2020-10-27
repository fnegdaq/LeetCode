/**
 反转一个单链表。

 示例:

 输入: 1->2->3->4->5->NULL
 输出: 5->4->3->2->1->NULL
 */

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head?.next == nil || head == nil { return head }
        // 双指针迭代
        var pre: ListNode?
        var cur = head
        while (head != nil) {
            /// 现保存cur下一个节点
            let temp = cur?.next
            /// 然后头节点指向pre
            cur?.next = pre
            /// pre cur 前进一位
            pre = cur
            cur = temp
        }
        return pre
    }
}

