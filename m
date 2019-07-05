From: Jiangfeng Xiao <xiaojiangfeng@huawei.com>
Subject: [PATCH 09/10] net: hisilicon: Add an rx_desc to adapt HI13X1_GMAC
Date: Fri, 5 Jul 2019 14:12:29 +0800
Message-ID: <1562307149-103877-1-git-send-email-xiaojiangfeng@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: yisen.zhuang@huawei.com, salil.mehta@huawei.com, dingtianhong@huawei.com, xiaojiangfeng@huawei.com
Cc: davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, leeyou.li@huawei.com, xiekunxun@huawei.com, jianping.liu@huawei.com, nixiaoming@huawei.com
List-Id: devicetree@vger.kernel.org

HI13X1 changed the offsets and bitmaps for rx_desc
registers in the same peripheral device on different
models of the hip04_eth.

Signed-off-by: Jiangfeng Xiao <xiaojiangfeng@huawei.com>
---
 drivers/net/ethernet/hisilicon/hip04_eth.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/ethernet/hisilicon/hip04_eth.c b/drivers/net/ethernet/hisilicon/hip04_eth.c
index c578934..780fc46 100644
--- a/drivers/net/ethernet/hisilicon/hip04_eth.c
+++ b/drivers/net/ethernet/hisilicon/hip04_eth.c
@@ -171,11 +171,20 @@ struct tx_desc {
 } __aligned(64);
 
 struct rx_desc {
+#if defined(CONFIG_HI13X1_GMAC)
+	u32 reserved1[3];
+	u16 pkt_len;
+	u16 reserved_16;
+	u32 reserved2[6];
+	u32 pkt_err;
+	u32 reserved3[5];
+#else
 	u16 reserved_16;
 	u16 pkt_len;
 	u32 reserve1[3];
 	u32 pkt_err;
 	u32 reserve2[4];
+#endif
 };
 
 struct hip04_priv {
-- 
1.8.5.6
