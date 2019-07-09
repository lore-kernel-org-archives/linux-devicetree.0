From: Jiangfeng Xiao <xiaojiangfeng@huawei.com>
Subject: [PATCH v2 02/10] net: hisilicon: Cleanup for got restricted __be32
Date: Tue, 9 Jul 2019 11:31:03 +0800
Message-ID: <1562643071-46811-3-git-send-email-xiaojiangfeng@huawei.com>
References: <1562643071-46811-1-git-send-email-xiaojiangfeng@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1562643071-46811-1-git-send-email-xiaojiangfeng@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: davem@davemloft.net, robh+dt@kernel.org, yisen.zhuang@huawei.com, salil.mehta@huawei.com, mark.rutland@arm.com, dingtianhong@huawei.com, xiaojiangfeng@huawei.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, leeyou.li@huawei.com, nixiaoming@huawei.com, jianping.liu@huawei.com, xiekunxun@huawei.com
List-Id: devicetree@vger.kernel.org

This patch fixes the following warning from sparse:
hip04_eth.c:468:25: warning: incorrect type in assignment
hip04_eth.c:468:25:    expected unsigned int [usertype] send_addr
hip04_eth.c:468:25:    got restricted __be32 [usertype]
hip04_eth.c:469:25: warning: incorrect type in assignment
hip04_eth.c:469:25:    expected unsigned int [usertype] send_size
hip04_eth.c:469:25:    got restricted __be32 [usertype]
hip04_eth.c:470:19: warning: incorrect type in assignment
hip04_eth.c:470:19:    expected unsigned int [usertype] cfg
hip04_eth.c:470:19:    got restricted __be32 [usertype]
hip04_eth.c:472:23: warning: incorrect type in assignment
hip04_eth.c:472:23:    expected unsigned int [usertype] wb_addr
hip04_eth.c:472:23:    got restricted __be32 [usertype]

Signed-off-by: Jiangfeng Xiao <xiaojiangfeng@huawei.com>
---
 drivers/net/ethernet/hisilicon/hip04_eth.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/hisilicon/hip04_eth.c b/drivers/net/ethernet/hisilicon/hip04_eth.c
index 2b5112b..31f13cf 100644
--- a/drivers/net/ethernet/hisilicon/hip04_eth.c
+++ b/drivers/net/ethernet/hisilicon/hip04_eth.c
@@ -465,11 +465,11 @@ static void hip04_start_tx_timer(struct hip04_priv *priv)
 
 	priv->tx_skb[tx_head] = skb;
 	priv->tx_phys[tx_head] = phys;
-	desc->send_addr = cpu_to_be32(phys);
-	desc->send_size = cpu_to_be32(skb->len);
-	desc->cfg = cpu_to_be32(TX_CLEAR_WB | TX_FINISH_CACHE_INV);
+	desc->send_addr = (__force u32)cpu_to_be32(phys);
+	desc->send_size = (__force u32)cpu_to_be32(skb->len);
+	desc->cfg = (__force u32)cpu_to_be32(TX_CLEAR_WB | TX_FINISH_CACHE_INV);
 	phys = priv->tx_desc_dma + tx_head * sizeof(struct tx_desc);
-	desc->wb_addr = cpu_to_be32(phys);
+	desc->wb_addr = (__force u32)cpu_to_be32(phys);
 	skb_tx_timestamp(skb);
 
 	hip04_set_xmit_desc(priv, phys);
-- 
1.8.5.6
