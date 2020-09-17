import UIKit

/**
 给定不同面额的硬币 coins 和一个总金额 amount。编写一个函数来计算可以凑成总金额所需的最少的硬币个数。如果没有任何一种硬币组合能组成总金额，返回 -1。

 示例 1:

 输入: coins = [1, 2, 5], amount = 11
 输出: 3
 解释: 11 = 5 + 5 + 1
 示例 2:

 输入: coins = [2], amount = 3
 输出: -1

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/coin-change
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */
// 动态规划  找出状态转移方程

func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    if amount == 0 { return 0 }
    // [0, 4, 4, 4]
    // 因为凑成 amount 金额的硬币数最多只可能等于 amount（全用 1 元面值的硬币），所以初始化为 amount + 1 就相当于初始化为正无穷，便于后续取最小值。
    var dp = [Int](repeating: amount + 1, count: amount + 1)
    dp[0] = 0
    var index = 1
    while index < dp.count {
        for coin in coins {  // [2]
            /**
             每拿出一枚硬币
               1.拿一枚面值为 1 的硬币 + 总金额为 119 的最优解法的硬币数量
                 这里我们只需要假设总金额为 119 的最优解法的硬币数有人已经帮我们算好了
                 即：dp[119] + 1
               2.拿一枚面值为 2 的硬币 dp[118] + 1
               3.拿一枚面值为 5 的硬币 dp[115] + 1
             */
            
            // index = 3 , coin = 2
            if index - coin >= 0 {
                //  min(dp[3] = 4, dp[3-2] = 4)
                //  do[3] = 4
                dp[index] = min(dp[index], dp[index - coin] + 1)
            }
        }
        index += 1
    }
    return dp[amount] > amount ? -1 : dp[amount]
}

coinChange([2], 3)
