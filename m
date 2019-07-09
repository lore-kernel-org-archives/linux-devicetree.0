From: Jiangfeng Xiao <xiaojiangfeng@huawei.com>
Subject: [PATCH v2 03/10] net: hisilicon: Cleanup for cast to restricted __be32
Date: Tue, 9 Jul 2019 11:31:04 +0800
Message-ID: <1562643071-46811-4-git-send-email-xiaojiangfeng@huawei.com>
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
hip04_eth.c:533:23: warning: cast to restricted __be16
hip04_eth.c:533:23: warning: cast to restricted __be16
hip04_eth.c:533:23: warning: cast to restricted __be16
hip04_eth.c:533:23: warning: cast to restricted __be16
hip04_eth.c:534:23: warning: cast to restricted __be32
hip04_eth.c:534:23: warning: cast to restricted __be32
hip04_eth.c:534:23: warning: cast to restricted __be32
hip04_eth.c:534:23: warning: cast to restricted __be32
hip04_eth.c:534:23: warning: cast to restricted __be32
hip04_eth.c:534:23: warning: cast to restricted __be32

Signed-off-by: Jiangfeng Xiao <xiaojiangfeng@huawei.com>
---
 drivers/net/ethernet/hisilicon/hip04_eth.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/hisilicon/hip04_eth.c b/drivers/net/ethernet/hisilicon/hip04_eth.c
index 31f13cf..d8f0619 100644
--- a/drivers/net/ethernet/hisilicon/hip04_eth.c
+++ b/drivers/net/ethernet/hisilicon/hip04_eth.c
@@ -530,8 +530,8 @@ static int hip04_rx_poll(struct napi_struct *napi, int budget)
 		priv->rx_phys[priv->rx_head] = 0;
 
 		desc = (struct rx_desc *)skb->data;
-		len = be16_to_cpu(desc->pkt_len);
-		err = be32_to_cpu(desc->pkt_err);
+		len = be16_to_cpu((__force __be16)desc->pkt_len);
+		err = be32_to_cpu((__force __be32)desc->pkt_err);
 
 		if (0 == len) {
 			dev_kfree_skb_any(skb);
-- 
1.8.5.6
