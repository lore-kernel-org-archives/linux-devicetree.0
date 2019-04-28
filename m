From: Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 2/7] usb: phy: phy-mxs-usb: add imx7ulp support
Date: Sun, 28 Apr 2019 02:51:16 +0000
Message-ID: <20190428024847.5046-3-peter.chen@nxp.com>
References: <20190428024847.5046-1-peter.chen@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190428024847.5046-1-peter.chen@nxp.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>, "balbi@kernel.org" <balbi@kernel.org>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Peter Chen <peter.chen@nxp.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

At imx7ulp, the USB related analog register is located in PHY register
region too, so we need to control PLL at PHY driver directly.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/phy/phy-mxs-usb.c | 76 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 75 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
index 1b1bb0ad40c3..90c96a8e9342 100644
--- a/drivers/usb/phy/phy-mxs-usb.c
+++ b/drivers/usb/phy/phy-mxs-usb.c
@@ -20,6 +20,7 @@
 
 #define DRIVER_NAME "mxs_phy"
 
+/* Register Macro */
 #define HW_USBPHY_PWD				0x00
 #define HW_USBPHY_TX				0x10
 #define HW_USBPHY_CTRL				0x30
@@ -37,6 +38,11 @@
 #define GM_USBPHY_TX_TXCAL45DN(x)            (((x) & 0xf) << 8)
 #define GM_USBPHY_TX_D_CAL(x)                (((x) & 0xf) << 0)
 
+/* imx7ulp */
+#define HW_USBPHY_PLL_SIC			0xa0
+#define HW_USBPHY_PLL_SIC_SET			0xa4
+#define HW_USBPHY_PLL_SIC_CLR			0xa8
+
 #define BM_USBPHY_CTRL_SFTRST			BIT(31)
 #define BM_USBPHY_CTRL_CLKGATE			BIT(30)
 #define BM_USBPHY_CTRL_OTG_ID_VALUE		BIT(27)
@@ -55,6 +61,12 @@
 #define BM_USBPHY_IP_FIX                       (BIT(17) | BIT(18))
 
 #define BM_USBPHY_DEBUG_CLKGATE			BIT(30)
+/* imx7ulp */
+#define BM_USBPHY_PLL_LOCK			BIT(31)
+#define BM_USBPHY_PLL_REG_ENABLE		BIT(21)
+#define BM_USBPHY_PLL_BYPASS			BIT(16)
+#define BM_USBPHY_PLL_POWER			BIT(12)
+#define BM_USBPHY_PLL_EN_USB_CLKS		BIT(6)
 
 /* Anatop Registers */
 #define ANADIG_ANA_MISC0			0x150
@@ -167,6 +179,9 @@ static const struct mxs_phy_data imx6ul_phy_data = {
 	.flags = MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS,
 };
 
+static const struct mxs_phy_data imx7ulp_phy_data = {
+};
+
 static const struct of_device_id mxs_phy_dt_ids[] = {
 	{ .compatible = "fsl,imx6sx-usbphy", .data = &imx6sx_phy_data, },
 	{ .compatible = "fsl,imx6sl-usbphy", .data = &imx6sl_phy_data, },
@@ -174,6 +189,7 @@ static const struct of_device_id mxs_phy_dt_ids[] = {
 	{ .compatible = "fsl,imx23-usbphy", .data = &imx23_phy_data, },
 	{ .compatible = "fsl,vf610-usbphy", .data = &vf610_phy_data, },
 	{ .compatible = "fsl,imx6ul-usbphy", .data = &imx6ul_phy_data, },
+	{ .compatible = "fsl,imx7ulp-usbphy", .data = &imx7ulp_phy_data, },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mxs_phy_dt_ids);
@@ -198,6 +214,11 @@ static inline bool is_imx6sl_phy(struct mxs_phy *mxs_phy)
 	return mxs_phy->data == &imx6sl_phy_data;
 }
 
+static inline bool is_imx7ulp_phy(struct mxs_phy *mxs_phy)
+{
+	return mxs_phy->data == &imx7ulp_phy_data;
+}
+
 /*
  * PHY needs some 32K cycles to switch from 32K clock to
  * bus (such as AHB/AXI, etc) clock.
@@ -221,14 +242,59 @@ static void mxs_phy_tx_init(struct mxs_phy *mxs_phy)
 	}
 }
 
+static int wait_for_pll_lock(const void __iomem *base)
+{
+	int loop_count = 100;
+
+	/* Wait for PLL to lock */
+	do {
+		if (readl(base + HW_USBPHY_PLL_SIC) & BM_USBPHY_PLL_LOCK)
+			break;
+		usleep_range(100, 150);
+	} while (loop_count-- > 0);
+
+	return readl(base + HW_USBPHY_PLL_SIC) & BM_USBPHY_PLL_LOCK
+			? 0 : -ETIMEDOUT;
+}
+
+static int mxs_phy_pll_enable(void __iomem *base, bool enable)
+{
+	int ret = 0;
+
+	if (enable) {
+		writel(BM_USBPHY_PLL_REG_ENABLE, base + HW_USBPHY_PLL_SIC_SET);
+		writel(BM_USBPHY_PLL_BYPASS, base + HW_USBPHY_PLL_SIC_CLR);
+		writel(BM_USBPHY_PLL_POWER, base + HW_USBPHY_PLL_SIC_SET);
+		ret = wait_for_pll_lock(base);
+		if (ret)
+			return ret;
+		writel(BM_USBPHY_PLL_EN_USB_CLKS, base +
+				HW_USBPHY_PLL_SIC_SET);
+	} else {
+		writel(BM_USBPHY_PLL_EN_USB_CLKS, base +
+				HW_USBPHY_PLL_SIC_CLR);
+		writel(BM_USBPHY_PLL_POWER, base + HW_USBPHY_PLL_SIC_CLR);
+		writel(BM_USBPHY_PLL_BYPASS, base + HW_USBPHY_PLL_SIC_SET);
+		writel(BM_USBPHY_PLL_REG_ENABLE, base + HW_USBPHY_PLL_SIC_CLR);
+	}
+
+	return ret;
+}
+
 static int mxs_phy_hw_init(struct mxs_phy *mxs_phy)
 {
 	int ret;
 	void __iomem *base = mxs_phy->phy.io_priv;
 
+	if (is_imx7ulp_phy(mxs_phy)) {
+		ret = mxs_phy_pll_enable(base, true);
+		if (ret)
+			return ret;
+	}
+
 	ret = stmp_reset_block(base + HW_USBPHY_CTRL);
 	if (ret)
-		return ret;
+		goto disable_pll;
 
 	/* Power up the PHY */
 	writel(0, base + HW_USBPHY_PWD);
@@ -253,6 +319,11 @@ static int mxs_phy_hw_init(struct mxs_phy *mxs_phy)
 	mxs_phy_tx_init(mxs_phy);
 
 	return 0;
+
+disable_pll:
+	if (is_imx7ulp_phy(mxs_phy))
+		mxs_phy_pll_enable(base, false);
+	return ret;
 }
 
 /* Return true if the vbus is there */
@@ -374,6 +445,9 @@ static void mxs_phy_shutdown(struct usb_phy *phy)
 	writel(BM_USBPHY_CTRL_CLKGATE,
 	       phy->io_priv + HW_USBPHY_CTRL_SET);
 
+	if (is_imx7ulp_phy(mxs_phy))
+		mxs_phy_pll_enable(phy->io_priv, false);
+
 	clk_disable_unprepare(mxs_phy->clk);
 }
 
-- 
2.14.1
