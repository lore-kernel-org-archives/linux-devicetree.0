From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 3/5] phy: Add Marvell USB 2.0 OTG 28nm PHY
Date: Wed, 13 May 2015 17:48:58 -0500
Message-ID: <1431557340-5421-4-git-send-email-robh@kernel.org>
References: <1431557340-5421-1-git-send-email-robh@kernel.org>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431557340-5421-1-git-send-email-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add driver for USB PHY found in Marvell PXA1928 SOC.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
---
 drivers/phy/Kconfig       |  10 ++
 drivers/phy/Makefile      |   1 +
 drivers/phy/phy-mv-usb2.c | 329 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 340 insertions(+)
 create mode 100644 drivers/phy/phy-mv-usb2.c

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index a53bd5b..ef7634f 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -52,6 +52,16 @@ config PHY_EXYNOS_MIPI_VIDEO
 	  Support for MIPI CSI-2 and MIPI DSI DPHY found on Samsung S5P
 	  and EXYNOS SoCs.
 
+config PHY_MV_USB2
+	tristate "Marvell USB 2.0 28nm PHY Driver"
+	select GENERIC_PHY
+	help
+	  Enable this to support Marvell USB 2.0 PHY driver for Marvell
+	  SoC. This driver will do the PHY initialization and shutdown.
+	  The PHY driver will be used by Marvell udc/ehci/otg driver.
+
+	  To compile this driver as a module, choose M here.
+
 config PHY_MVEBU_SATA
 	def_bool y
 	depends on ARCH_DOVE || MACH_DOVE || MACH_KIRKWOOD
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index f126251..768e55a 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_ARMADA375_USBCLUSTER_PHY)	+= phy-armada375-usb2.o
 obj-$(CONFIG_BCM_KONA_USB2_PHY)		+= phy-bcm-kona-usb2.o
 obj-$(CONFIG_PHY_EXYNOS_DP_VIDEO)	+= phy-exynos-dp-video.o
 obj-$(CONFIG_PHY_EXYNOS_MIPI_VIDEO)	+= phy-exynos-mipi-video.o
+obj-$(CONFIG_PHY_MV_USB2)		+= phy-mv-usb2.o
 obj-$(CONFIG_PHY_MVEBU_SATA)		+= phy-mvebu-sata.o
 obj-$(CONFIG_PHY_MIPHY28LP) 		+= phy-miphy28lp.o
 obj-$(CONFIG_PHY_MIPHY365X)		+= phy-miphy365x.o
diff --git a/drivers/phy/phy-mv-usb2.c b/drivers/phy/phy-mv-usb2.c
new file mode 100644
index 0000000..c48d111
--- /dev/null
+++ b/drivers/phy/phy-mv-usb2.c
@@ -0,0 +1,329 @@
+/*
+ * Copyright (C) 2015 Linaro, Ltd.
+ * Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
+ *
+ * Based on vendor driver:
+ * Copyright (C) 2013 Marvell Inc.
+ * Author: Chao Xie <xiechao.mail-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+#include <linux/delay.h>
+#include <linux/slab.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/io.h>
+#include <linux/err.h>
+#include <linux/clk.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/phy/phy.h>
+
+/* USB PXA1928 PHY mapping */
+#define PHY_28NM_PLL_REG0			0x0
+#define PHY_28NM_PLL_REG1			0x4
+#define PHY_28NM_CAL_REG			0x8
+#define PHY_28NM_TX_REG0			0x0c
+#define PHY_28NM_TX_REG1			0x10
+#define PHY_28NM_RX_REG0			0x14
+#define PHY_28NM_RX_REG1			0x18
+#define PHY_28NM_DIG_REG0			0x1c
+#define PHY_28NM_DIG_REG1			0x20
+#define PHY_28NM_TEST_REG0			0x24
+#define PHY_28NM_TEST_REG1			0x28
+#define PHY_28NM_MOC_REG			0x2c
+#define PHY_28NM_PHY_RESERVE			0x30
+#define PHY_28NM_OTG_REG			0x34
+#define PHY_28NM_CHRG_DET			0x38
+#define PHY_28NM_CTRL_REG0			0xc4
+#define PHY_28NM_CTRL_REG1			0xc8
+#define PHY_28NM_CTRL_REG2			0xd4
+#define PHY_28NM_CTRL_REG3			0xdc
+
+/* PHY_28NM_PLL_REG0 */
+#define PHY_28NM_PLL_READY			BIT(31)
+
+#define PHY_28NM_PLL_SELLPFR_SHIFT		28
+#define PHY_28NM_PLL_SELLPFR_MASK		(0x3 << 28)
+
+#define PHY_28NM_PLL_FBDIV_SHIFT		16
+#define PHY_28NM_PLL_FBDIV_MASK			(0x1ff << 16)
+
+#define PHY_28NM_PLL_ICP_SHIFT			8
+#define PHY_28NM_PLL_ICP_MASK			(0x7 << 8)
+
+#define PHY_28NM_PLL_REFDIV_SHIFT		0
+#define PHY_28NM_PLL_REFDIV_MASK		0x7f
+
+/* PHY_28NM_PLL_REG1 */
+#define PHY_28NM_PLL_PU_BY_REG			BIT(1)
+
+#define PHY_28NM_PLL_PU_PLL			BIT(0)
+
+/* PHY_28NM_CAL_REG */
+#define PHY_28NM_PLL_PLLCAL_DONE		BIT(31)
+
+#define PHY_28NM_PLL_IMPCAL_DONE		BIT(23)
+
+#define PHY_28NM_PLL_KVCO_SHIFT			16
+#define PHY_28NM_PLL_KVCO_MASK			(0x7 << 16)
+
+#define PHY_28NM_PLL_CAL12_SHIFT		20
+#define PHY_28NM_PLL_CAL12_MASK			(0x3 << 20)
+
+#define PHY_28NM_IMPCAL_VTH_SHIFT		8
+#define PHY_28NM_IMPCAL_VTH_MASK		(0x7 << 8)
+
+#define PHY_28NM_PLLCAL_START_SHIFT		22
+#define PHY_28NM_IMPCAL_START_SHIFT		13
+
+/* PHY_28NM_TX_REG0 */
+#define PHY_28NM_TX_PU_BY_REG			BIT(25)
+
+#define PHY_28NM_TX_PU_ANA			BIT(24)
+
+#define PHY_28NM_TX_AMP_SHIFT			20
+#define PHY_28NM_TX_AMP_MASK			(0x7 << 20)
+
+/* PHY_28NM_RX_REG0 */
+#define PHY_28NM_RX_SQ_THRESH_SHIFT		0
+#define PHY_28NM_RX_SQ_THRESH_MASK		(0xf << 0)
+
+/* PHY_28NM_RX_REG1 */
+#define PHY_28NM_RX_SQCAL_DONE			BIT(31)
+
+/* PHY_28NM_DIG_REG0 */
+#define PHY_28NM_DIG_BITSTAFFING_ERR		BIT(31)
+#define PHY_28NM_DIG_SYNC_ERR			BIT(30)
+
+#define PHY_28NM_DIG_SQ_FILT_SHIFT		16
+#define PHY_28NM_DIG_SQ_FILT_MASK		(0x7 << 16)
+
+#define PHY_28NM_DIG_SQ_BLK_SHIFT		12
+#define PHY_28NM_DIG_SQ_BLK_MASK		(0x7 << 12)
+
+#define PHY_28NM_DIG_SYNC_NUM_SHIFT		0
+#define PHY_28NM_DIG_SYNC_NUM_MASK		(0x3 << 0)
+
+#define PHY_28NM_PLL_LOCK_BYPASS		BIT(7)
+
+/* PHY_28NM_OTG_REG */
+#define PHY_28NM_OTG_CONTROL_BY_PIN		BIT(5)
+#define PHY_28NM_OTG_PU_OTG			BIT(4)
+
+#define PHY_28NM_CHGDTC_ENABLE_SWITCH_DM_SHIFT_28 13
+#define PHY_28NM_CHGDTC_ENABLE_SWITCH_DP_SHIFT_28 12
+#define PHY_28NM_CHGDTC_VSRC_CHARGE_SHIFT_28	10
+#define PHY_28NM_CHGDTC_VDAT_CHARGE_SHIFT_28	8
+#define PHY_28NM_CHGDTC_CDP_DM_AUTO_SWITCH_SHIFT_28 7
+#define PHY_28NM_CHGDTC_DP_DM_SWAP_SHIFT_28	6
+#define PHY_28NM_CHGDTC_PU_CHRG_DTC_SHIFT_28	5
+#define PHY_28NM_CHGDTC_PD_EN_SHIFT_28		4
+#define PHY_28NM_CHGDTC_DCP_EN_SHIFT_28		3
+#define PHY_28NM_CHGDTC_CDP_EN_SHIFT_28		2
+#define PHY_28NM_CHGDTC_TESTMON_CHRGDTC_SHIFT_28 0
+
+#define PHY_28NM_CTRL1_CHRG_DTC_OUT_SHIFT_28	4
+#define PHY_28NM_CTRL1_VBUSDTC_OUT_SHIFT_28	2
+
+#define PHY_28NM_CTRL3_OVERWRITE		BIT(0)
+#define PHY_28NM_CTRL3_VBUS_VALID		BIT(4)
+#define PHY_28NM_CTRL3_AVALID			BIT(5)
+#define PHY_28NM_CTRL3_BVALID			BIT(6)
+
+struct mv_usb2_phy {
+	struct phy		*phy;
+	struct platform_device	*pdev;
+	void __iomem		*base;
+	struct clk		*clk;
+};
+
+static bool wait_for_reg(void __iomem *reg, u32 mask, unsigned long timeout)
+{
+	timeout += jiffies;
+	while (time_is_after_eq_jiffies(timeout)) {
+		if ((readl(reg) & mask) == mask)
+			return true;
+		msleep(1);
+	}
+	return false;
+}
+
+static int mv_usb2_phy_28nm_init(struct phy *phy)
+{
+	struct mv_usb2_phy *mv_phy = phy_get_drvdata(phy);
+	struct platform_device *pdev = mv_phy->pdev;
+	void __iomem *base = mv_phy->base;
+	u32 reg;
+
+	clk_prepare_enable(mv_phy->clk);
+
+	/* PHY_28NM_PLL_REG0 */
+	reg = readl(base + PHY_28NM_PLL_REG0) &
+		~(PHY_28NM_PLL_SELLPFR_MASK | PHY_28NM_PLL_FBDIV_MASK
+		| PHY_28NM_PLL_ICP_MASK	| PHY_28NM_PLL_REFDIV_MASK);
+	writel(reg | (0x1 << PHY_28NM_PLL_SELLPFR_SHIFT
+		| 0xf0 << PHY_28NM_PLL_FBDIV_SHIFT
+		| 0x3 << PHY_28NM_PLL_ICP_SHIFT
+		| 0xd << PHY_28NM_PLL_REFDIV_SHIFT),
+		base + PHY_28NM_PLL_REG0);
+
+	/* PHY_28NM_PLL_REG1 */
+	reg = readl(base + PHY_28NM_PLL_REG1);
+	writel(reg | PHY_28NM_PLL_PU_PLL | PHY_28NM_PLL_PU_BY_REG,
+		base + PHY_28NM_PLL_REG1);
+
+	/* PHY_28NM_TX_REG0 */
+	reg = readl(base + PHY_28NM_TX_REG0) & ~PHY_28NM_TX_AMP_MASK;
+	writel(reg | PHY_28NM_TX_PU_BY_REG | 0x3 << PHY_28NM_TX_AMP_SHIFT |
+		PHY_28NM_TX_PU_ANA,
+		base + PHY_28NM_TX_REG0);
+
+	/* PHY_28NM_RX_REG0 */
+	reg = readl(base + PHY_28NM_RX_REG0) & ~PHY_28NM_RX_SQ_THRESH_MASK;
+	writel(reg | 0xa << PHY_28NM_RX_SQ_THRESH_SHIFT,
+		base + PHY_28NM_RX_REG0);
+
+	/* PHY_28NM_DIG_REG0 */
+	reg = readl(base + PHY_28NM_DIG_REG0) &
+		~(PHY_28NM_DIG_BITSTAFFING_ERR | PHY_28NM_DIG_SYNC_ERR |
+		PHY_28NM_DIG_SQ_FILT_MASK | PHY_28NM_DIG_SQ_BLK_MASK |
+		PHY_28NM_DIG_SYNC_NUM_MASK);
+	writel(reg | (0x1 << PHY_28NM_DIG_SYNC_NUM_SHIFT |
+		PHY_28NM_PLL_LOCK_BYPASS),
+		base + PHY_28NM_DIG_REG0);
+
+	/* PHY_28NM_OTG_REG */
+	reg = readl(base + PHY_28NM_OTG_REG) | PHY_28NM_OTG_PU_OTG;
+	writel(reg & ~PHY_28NM_OTG_CONTROL_BY_PIN, base + PHY_28NM_OTG_REG);
+
+	/*  Calibration Timing
+	*		   ____________________________
+	*  CAL START   ___|
+	*			   ____________________
+	*  CAL_DONE    ___________|
+	*		  | 400us |
+	*/
+
+	/* Make sure PHY Calibration is ready */
+	if (!wait_for_reg(base + PHY_28NM_CAL_REG,
+	    PHY_28NM_PLL_PLLCAL_DONE | PHY_28NM_PLL_IMPCAL_DONE,
+	    HZ / 10)) {
+		dev_warn(&pdev->dev, "USB PHY PLL calibrate not done after 100mS.");
+		return -ETIMEDOUT;
+	}
+	if (!wait_for_reg(base + PHY_28NM_RX_REG1,
+	    PHY_28NM_RX_SQCAL_DONE, HZ / 10)) {
+		dev_warn(&pdev->dev, "USB PHY RX SQ calibrate not done after 100mS.");
+		return -ETIMEDOUT;
+	}
+
+	/* Make sure PHY PLL is ready */
+	if (!wait_for_reg(base + PHY_28NM_PLL_REG0,
+	    PHY_28NM_PLL_READY, HZ / 10)) {
+		dev_warn(&pdev->dev, "PLL_READY not set after 100mS.");
+		return -ETIMEDOUT;
+	}
+
+	writel(readl(base + PHY_28NM_CTRL_REG3) |
+		(PHY_28NM_CTRL3_OVERWRITE | PHY_28NM_CTRL3_VBUS_VALID
+		| PHY_28NM_CTRL3_AVALID	| PHY_28NM_CTRL3_BVALID),
+		base + PHY_28NM_CTRL_REG3);
+
+	return 0;
+}
+
+static int mv_usb2_phy_28nm_power_off(struct phy *phy)
+{
+	struct mv_usb2_phy *mv_phy = phy_get_drvdata(phy);
+	void __iomem *base = mv_phy->base;
+	unsigned int val;
+
+	writel(readl(base + PHY_28NM_CTRL_REG3) |
+		~(PHY_28NM_CTRL3_OVERWRITE | PHY_28NM_CTRL3_VBUS_VALID
+		| PHY_28NM_CTRL3_AVALID	| PHY_28NM_CTRL3_BVALID),
+		base + PHY_28NM_CTRL_REG3);
+
+	val = readw(base + PHY_28NM_PLL_REG1);
+	val &= ~PHY_28NM_PLL_PU_PLL;
+	writew(val, base + PHY_28NM_PLL_REG1);
+
+	/* power down PHY Analog part */
+	val = readw(base + PHY_28NM_TX_REG0);
+	val &= ~PHY_28NM_TX_PU_ANA;
+	writew(val, base + PHY_28NM_TX_REG0);
+
+	/* power down PHY OTG part */
+	val = readw(base + PHY_28NM_OTG_REG);
+	val &= ~PHY_28NM_OTG_PU_OTG;
+	writew(val, base + PHY_28NM_OTG_REG);
+
+	clk_disable_unprepare(mv_phy->clk);
+	return 0;
+}
+
+static const struct phy_ops usb_ops = {
+	.init		= mv_usb2_phy_28nm_init,
+	.power_off	= mv_usb2_phy_28nm_power_off,
+};
+
+static int mv_usb2_phy_probe(struct platform_device *pdev)
+{
+	struct phy_provider *phy_provider;
+	struct mv_usb2_phy *mv_phy;
+	struct resource *r;
+
+	mv_phy = devm_kzalloc(&pdev->dev, sizeof(*mv_phy), GFP_KERNEL);
+	if (!mv_phy)
+		return -ENOMEM;
+
+	mv_phy->pdev = pdev;
+
+	mv_phy->clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(mv_phy->clk)) {
+		dev_err(&pdev->dev, "failed to get clock.\n");
+		return PTR_ERR(mv_phy->clk);
+	}
+
+	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	mv_phy->base = devm_ioremap_resource(&pdev->dev, r);
+	if (IS_ERR(mv_phy->base))
+		return PTR_ERR(mv_phy->base);
+
+	mv_phy->phy = devm_phy_create(&pdev->dev, pdev->dev.of_node, &usb_ops);
+	if (IS_ERR(mv_phy->phy))
+		return PTR_ERR(mv_phy->phy);
+
+	phy_set_drvdata(mv_phy->phy, mv_phy);
+
+	phy_provider = devm_of_phy_provider_register(&pdev->dev, of_phy_simple_xlate);
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
+static const struct of_device_id mv_usbphy_dt_match[] = {
+	{ .compatible = "marvell,pxa1928-usb-phy", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, mv_usbphy_dt_match);
+
+static struct platform_driver mv_usb2_phy_driver = {
+	.probe	= mv_usb2_phy_probe,
+	.driver = {
+		.name   = "mv-usb2-phy",
+		.of_match_table = of_match_ptr(mv_usbphy_dt_match),
+	},
+};
+module_platform_driver(mv_usb2_phy_driver);
+
+MODULE_AUTHOR("Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>");
+MODULE_DESCRIPTION("Marvell USB2 phy driver");
+MODULE_LICENSE("GPL v2");
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
