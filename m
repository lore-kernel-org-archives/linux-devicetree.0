From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v7 14/14] usb: phy-mxs: Add sync time after controller clear phcd
Date: Fri, 20 Dec 2013 15:52:10 +0800
Message-ID: <1387525930-27313-15-git-send-email-peter.chen@freescale.com>
References: <1387525930-27313-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387525930-27313-1-git-send-email-peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, frank.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

After clear portsc.phcd, PHY needs 200us stable time for switch
32K clock to AHB clock.

Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 drivers/usb/phy/phy-mxs-usb.c |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
index d75670a..6c3dae2 100644
--- a/drivers/usb/phy/phy-mxs-usb.c
+++ b/drivers/usb/phy/phy-mxs-usb.c
@@ -156,6 +156,15 @@ static inline bool is_imx6sl_phy(struct mxs_phy *mxs_phy)
 	return mxs_phy->data == &imx6sl_phy_data;
 }
 
+/*
+ * PHY needs some 32K cycles to switch from 32K clock to
+ * bus (such as AHB/AXI, etc) clock.
+ */
+static void mxs_phy_clock_switch_delay(void)
+{
+	usleep_range(300, 400);
+}
+
 static int mxs_phy_hw_init(struct mxs_phy *mxs_phy)
 {
 	int ret;
@@ -281,6 +290,7 @@ static int mxs_phy_init(struct usb_phy *phy)
 {
 	struct mxs_phy *mxs_phy = to_mxs_phy(phy);
 
+	mxs_phy_clock_switch_delay();
 	clk_prepare_enable(mxs_phy->clk);
 	return mxs_phy_hw_init(mxs_phy);
 }
@@ -305,6 +315,7 @@ static int mxs_phy_suspend(struct usb_phy *x, int suspend)
 		       x->io_priv + HW_USBPHY_CTRL_SET);
 		clk_disable_unprepare(mxs_phy->clk);
 	} else {
+		mxs_phy_clock_switch_delay();
 		clk_prepare_enable(mxs_phy->clk);
 		writel(BM_USBPHY_CTRL_CLKGATE,
 		       x->io_priv + HW_USBPHY_CTRL_CLR);
-- 
1.7.8


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
