From: Jiangfeng Xiao <xiaojiangfeng@huawei.com>
Subject: [PATCH v2 04/10] net: hisilicon: HI13X1_GMAX skip write LOCAL_PAGE_REG
Date: Tue, 9 Jul 2019 11:31:05 +0800
Message-ID: <1562643071-46811-5-git-send-email-xiaojiangfeng@huawei.com>
References: <1562643071-46811-1-git-send-email-xiaojiangfeng@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1562643071-46811-1-git-send-email-xiaojiangfeng@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: davem@davemloft.net, robh+dt@kernel.org, yisen.zhuang@huawei.com, salil.mehta@huawei.com, mark.rutland@arm.com, dingtianhong@huawei.com, xiaojiangfeng@huawei.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, leeyou.li@huawei.com, nixiaoming@huawei.com, jianping.liu@huawei.com, xiekunxun@huawei.com
List-Id: devicetree@vger.kernel.org

HI13X1_GMAC changed the offsets and bitmaps for
GE_TX_LOCAL_PAGE_REG registers in the same peripheral
device on different models of the hip04_eth. With the
default configuration, HI13X1_GMAC can also work without
any writes to the GE_TX_LOCAL_PAGE_REG register.

Signed-off-by: Jiangfeng Xiao <xiaojiangfeng@huawei.com>
---
 drivers/net/ethernet/hisilicon/hip04_eth.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/hisilicon/hip04_eth.c b/drivers/net/ethernet/hisilicon/hip04_eth.c
index d8f0619..fe61b01 100644
--- a/drivers/net/ethernet/hisilicon/hip04_eth.c
+++ b/drivers/net/ethernet/hisilicon/hip04_eth.c
@@ -308,8 +308,10 @@ static void hip04_config_fifo(struct hip04_priv *priv)
 	val |= GE_RX_STRIP_PAD | GE_RX_PAD_EN;
 	writel_relaxed(val, priv->base + GE_RECV_CONTROL_REG);
 
+#ifndef CONFIG_HI13X1_GMAC
 	val = GE_AUTO_NEG_CTL;
 	writel_relaxed(val, priv->base + GE_TX_LOCAL_PAGE_REG);
+#endif
 }
 
 static void hip04_mac_enable(struct net_device *ndev)
-- 
1.8.5.6
