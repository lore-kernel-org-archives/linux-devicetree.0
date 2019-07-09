From: Jiangfeng Xiao <xiaojiangfeng@huawei.com>
Subject: [PATCH v2 09/10] net: hisilicon: Add an rx_desc to adapt HI13X1_GMAC
Date: Tue, 9 Jul 2019 11:31:10 +0800
Message-ID: <1562643071-46811-10-git-send-email-xiaojiangfeng@huawei.com>
References: <1562643071-46811-1-git-send-email-xiaojiangfeng@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1562643071-46811-1-git-send-email-xiaojiangfeng@huawei.com>
Sender: netdev-owner@vger.kernel.org
To: davem@davemloft.net, robh+dt@kernel.org, yisen.zhuang@huawei.com, salil.mehta@huawei.com, mark.rutland@arm.com, dingtianhong@huawei.com, xiaojiangfeng@huawei.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, leeyou.li@huawei.com, nixiaoming@huawei.com, jianping.liu@huawei.com, xiekunxun@huawei.com
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
