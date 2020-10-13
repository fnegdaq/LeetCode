/**
 输入两个递增排序的链表，合并这两个链表并使新链表中的节点仍然是递增排序的。

 示例1：

 输入：1->2->4, 1->3->4
 输出：1->1->2->3->4->4
 限制：

 0 <= 链表长度 <= 1000



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/he-bing-liang-ge-pai-xu-de-lian-biao-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    // 时间复杂度：O(m+n)
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        // 创建新的头结点
        var head: ListNode? = ListNode(0)
        // 尾插法建立链表
        let result = head
        var l1 = l1, l2 = l2
        
        while l1 != nil && l2 != nil {
            if l1!.val < l2!.val {
                head?.next = l1
                l1 = l1?.next
            } else {
                head?.next = l2
                l2 = l2?.next
            }
            head = head?.next
        }
        head?.next = l1 != nil ? l1 : l2
        return result!.next
    }
}
