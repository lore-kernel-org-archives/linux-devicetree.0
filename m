From: Jaret Cantu <jaret.cantu-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v3] usb: phy: mxs: Add DT bindings to configure TX settings
Date: Mon, 21 Mar 2016 12:32:27 -0400
Message-ID: <1458577947-12614-1-git-send-email-jaret.cantu@timesys.com>
References: <20160318211936.GA4158@rob-hp-laptop>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160318211936.GA4158@rob-hp-laptop>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

The TX settings can be calibrated for particular hardware.  The
phy is reset by Linux, so this cannot be handled by the bootloader.

The TRM mentions that the maximum resistance should be used for the
DN/DP calibration in order to pass USB certification.

The values for the TX registers are poorly described in the TRM.
The meanings of the register values were taken from another
Freescale-provided document:
https://community.freescale.com/message/566147#comment-566912

Signed-off-by: Jaret Cantu <jaret.cantu-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
---
v3. Added unit suffix (-ohms) to tx-cal-45-d*

v2. Copying devicetree list
    Removed prettifying extra whitespace
    Removed unnecessary register rewrite on resume
    Use min and max constants for clarity

 .../devicetree/bindings/phy/mxs-usb-phy.txt        |   10 ++++
 drivers/usb/phy/phy-mxs-usb.c                      |   58 ++++++++++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/mxs-usb-phy.txt b/Documentation/devicetree/bindings/phy/mxs-usb-phy.txt
index 379b84a..1d25b04 100644
--- a/Documentation/devicetree/bindings/phy/mxs-usb-phy.txt
+++ b/Documentation/devicetree/bindings/phy/mxs-usb-phy.txt
@@ -12,6 +12,16 @@ Required properties:
 - interrupts: Should contain phy interrupt
 - fsl,anatop: phandle for anatop register, it is only for imx6 SoC series
 
+Optional properties:
+- fsl,tx-cal-45-dn-ohms: Integer [30-55]. Resistance (in ohms) of switchable
+  high-speed trimming resistor connected in parallel with the 45 ohm resistor
+  that terminates the DN output signal. Default: 45
+- fsl,tx-cal-45-dp-ohms: Integer [30-55]. Resistance (in ohms) of switchable
+  high-speed trimming resistor connected in parallel with the 45 ohm resistor
+  that terminates the DP output signal. Default: 45
+- fsl,tx-d-cal: Integer [79-119]. Current trimming value (as a percentage) of
+  the 17.78mA TX reference current. Default: 100
+
 Example:
 usbphy1: usbphy@020c9000 {
 	compatible = "fsl,imx6q-usbphy", "fsl,imx23-usbphy";
diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
index 00bfea0..6c6b12c 100644
--- a/drivers/usb/phy/phy-mxs-usb.c
+++ b/drivers/usb/phy/phy-mxs-usb.c
@@ -27,6 +27,7 @@
 #define DRIVER_NAME "mxs_phy"
 
 #define HW_USBPHY_PWD				0x00
+#define HW_USBPHY_TX				0x10
 #define HW_USBPHY_CTRL				0x30
 #define HW_USBPHY_CTRL_SET			0x34
 #define HW_USBPHY_CTRL_CLR			0x38
@@ -38,6 +39,10 @@
 #define HW_USBPHY_IP_SET			0x94
 #define HW_USBPHY_IP_CLR			0x98
 
+#define GM_USBPHY_TX_TXCAL45DP(x)            (((x) & 0xf) << 16)
+#define GM_USBPHY_TX_TXCAL45DN(x)            (((x) & 0xf) << 8)
+#define GM_USBPHY_TX_D_CAL(x)                (((x) & 0xf) << 0)
+
 #define BM_USBPHY_CTRL_SFTRST			BIT(31)
 #define BM_USBPHY_CTRL_CLKGATE			BIT(30)
 #define BM_USBPHY_CTRL_OTG_ID_VALUE		BIT(27)
@@ -115,6 +120,12 @@
  */
 #define MXS_PHY_NEED_IP_FIX			BIT(3)
 
+/* Minimum and maximum values for device tree entries */
+#define MXS_PHY_TX_CAL45_MIN			30
+#define MXS_PHY_TX_CAL45_MAX			55
+#define MXS_PHY_TX_D_CAL_MIN			79
+#define MXS_PHY_TX_D_CAL_MAX			119
+
 struct mxs_phy_data {
 	unsigned int flags;
 };
@@ -164,6 +175,8 @@ struct mxs_phy {
 	const struct mxs_phy_data *data;
 	struct regmap *regmap_anatop;
 	int port_id;
+	u32 tx_reg_set;
+	u32 tx_reg_mask;
 };
 
 static inline bool is_imx6q_phy(struct mxs_phy *mxs_phy)
@@ -185,6 +198,20 @@ static void mxs_phy_clock_switch_delay(void)
 	usleep_range(300, 400);
 }
 
+static void mxs_phy_tx_init(struct mxs_phy *mxs_phy)
+{
+	void __iomem *base = mxs_phy->phy.io_priv;
+	u32 phytx;
+
+	/* Update TX register if there is anything to write */
+	if (mxs_phy->tx_reg_mask) {
+		phytx = readl(base + HW_USBPHY_TX);
+		phytx &= ~mxs_phy->tx_reg_mask;
+		phytx |= mxs_phy->tx_reg_set;
+		writel(phytx, base + HW_USBPHY_TX);
+	}
+}
+
 static int mxs_phy_hw_init(struct mxs_phy *mxs_phy)
 {
 	int ret;
@@ -214,6 +241,8 @@ static int mxs_phy_hw_init(struct mxs_phy *mxs_phy)
 	if (mxs_phy->data->flags & MXS_PHY_NEED_IP_FIX)
 		writel(BM_USBPHY_IP_FIX, base + HW_USBPHY_IP_SET);
 
+	mxs_phy_tx_init(mxs_phy);
+
 	return 0;
 }
 
@@ -459,6 +488,7 @@ static int mxs_phy_probe(struct platform_device *pdev)
 	int ret;
 	const struct of_device_id *of_id;
 	struct device_node *np = pdev->dev.of_node;
+	u32 val;
 
 	of_id = of_match_device(mxs_phy_dt_ids, &pdev->dev);
 	if (!of_id)
@@ -491,6 +521,34 @@ static int mxs_phy_probe(struct platform_device *pdev)
 		}
 	}
 
+	/* Precompute which bits of the TX register are to be updated, if any */
+	if (!of_property_read_u32(np, "fsl,tx-cal-45-dn-ohms", &val) &&
+	    val >= MXS_PHY_TX_CAL45_MIN && val <= MXS_PHY_TX_CAL45_MAX) {
+		/* scale to 4-bit value */
+		val = (MXS_PHY_TX_CAL45_MAX - val) * 0xF
+			/ (MXS_PHY_TX_CAL45_MAX - MXS_PHY_TX_CAL45_MIN);
+		mxs_phy->tx_reg_mask |= GM_USBPHY_TX_TXCAL45DN(~0);
+		mxs_phy->tx_reg_set  |= GM_USBPHY_TX_TXCAL45DN(val);
+	}
+
+	if (!of_property_read_u32(np, "fsl,tx-cal-45-dp-ohms", &val) &&
+	    val >= MXS_PHY_TX_CAL45_MIN && val <= MXS_PHY_TX_CAL45_MAX) {
+		/* scale to 4-bit value */
+		val = (MXS_PHY_TX_CAL45_MAX - val) * 0xF
+			/ (MXS_PHY_TX_CAL45_MAX - MXS_PHY_TX_CAL45_MIN);
+		mxs_phy->tx_reg_mask |= GM_USBPHY_TX_TXCAL45DP(~0);
+		mxs_phy->tx_reg_set  |= GM_USBPHY_TX_TXCAL45DP(val);
+	}
+
+	if (!of_property_read_u32(np, "fsl,tx-d-cal", &val) &&
+	    val >= MXS_PHY_TX_D_CAL_MIN && val <= MXS_PHY_TX_D_CAL_MAX) {
+		/* scale to 4-bit value */
+		val = (MXS_PHY_TX_D_CAL_MAX - val) * 0xF
+			/ (MXS_PHY_TX_D_CAL_MAX - MXS_PHY_TX_D_CAL_MIN);
+		mxs_phy->tx_reg_mask |= GM_USBPHY_TX_D_CAL(~0);
+		mxs_phy->tx_reg_set  |= GM_USBPHY_TX_D_CAL(val);
+	}
+
 	ret = of_alias_get_id(np, "usbphy");
 	if (ret < 0)
 		dev_dbg(&pdev->dev, "failed to get alias id, errno %d\n", ret);
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
