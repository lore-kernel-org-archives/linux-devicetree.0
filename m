Return-Path: <SRS0=xUMM=UN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:12204 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbfFNHsm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 14 Jun 2019 03:48:42 -0400
From: JC Kuo <jckuo@nvidia.com>
Subject: [PATCH 6/8] phy: tegra: xusb: t210: support wake and sleepwalk
Date: Fri, 14 Jun 2019 15:48:22 +0800
Message-ID: <20190614074824.22023-2-jckuo@nvidia.com>
In-Reply-To: <20190614074824.22023-1-jckuo@nvidia.com>
References: <20190614074824.22023-1-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, pdeschrijver@nvidia.com, afrid@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, nkristam@nvidia.com, skomatineni@nvidia.com, JC Kuo <jckuo@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

This commit implements Tegra210 XUSB PADCTL wake and sleepwalk
routines.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
---
 drivers/phy/tegra/xusb-tegra210.c | 574 ++++++++++++++++++++++++++++--
 1 file changed, 548 insertions(+), 26 deletions(-)

diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
index 007bf352b45e..afa4bfa23be8 100644
--- a/drivers/phy/tegra/xusb-tegra210.c
+++ b/drivers/phy/tegra/xusb-tegra210.c
@@ -16,6 +16,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
+#include <soc/tegra/pmc.h>
 
 #include <soc/tegra/fuse.h>
 
@@ -48,6 +49,20 @@
 #define XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP_MASK(x) (0x7 << ((x) * 5))
 #define XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP(x, v) (((v) & 0x7) << ((x) * 5))
 
+#define XUSB_PADCTL_ELPG_PROGRAM_0 0x20
+#define   USB2_PORT_WAKE_INTERRUPT_ENABLE(x)      BIT((x))
+#define   USB2_PORT_WAKEUP_EVENT(x)               BIT((x) + 7)
+#define   SS_PORT_WAKE_INTERRUPT_ENABLE(x)        BIT((x) + 14)
+#define   SS_PORT_WAKEUP_EVENT(x)                 BIT((x) + 21)
+#define   USB2_HSIC_PORT_WAKE_INTERRUPT_ENABLE(x) BIT((x) + 28)
+#define   USB2_HSIC_PORT_WAKEUP_EVENT(x)          BIT((x) + 30)
+#define   ALL_WAKE_EVENTS ( \
+		USB2_PORT_WAKEUP_EVENT(0) | USB2_PORT_WAKEUP_EVENT(1) | \
+		USB2_PORT_WAKEUP_EVENT(2) | USB2_PORT_WAKEUP_EVENT(3) | \
+		SS_PORT_WAKEUP_EVENT(0) | SS_PORT_WAKEUP_EVENT(1) | \
+		SS_PORT_WAKEUP_EVENT(2) | SS_PORT_WAKEUP_EVENT(3) | \
+		USB2_HSIC_PORT_WAKEUP_EVENT(0))
+
 #define XUSB_PADCTL_ELPG_PROGRAM1 0x024
 #define XUSB_PADCTL_ELPG_PROGRAM1_AUX_MUX_LP0_VCORE_DOWN (1 << 31)
 #define XUSB_PADCTL_ELPG_PROGRAM1_AUX_MUX_LP0_CLAMP_EN_EARLY (1 << 30)
@@ -81,6 +96,8 @@
 #define XUSB_PADCTL_USB2_OTG_PAD_CTL1_PD_DR (1 << 2)
 #define XUSB_PADCTL_USB2_OTG_PAD_CTL1_PD_DISC_OVRD (1 << 1)
 #define XUSB_PADCTL_USB2_OTG_PAD_CTL1_PD_CHRP_OVRD (1 << 0)
+#define   RPD_CTRL(x)                      (((x) & 0x1f) << 26)
+#define   RPD_CTRL_VALUE(x)                (((x) >> 26) & 0x1f)
 
 #define XUSB_PADCTL_USB2_BIAS_PAD_CTL0 0x284
 #define XUSB_PADCTL_USB2_BIAS_PAD_CTL0_PD (1 << 11)
@@ -99,6 +116,8 @@
 #define XUSB_PADCTL_USB2_BIAS_PAD_CTL1_TRK_START_TIMER_SHIFT 12
 #define XUSB_PADCTL_USB2_BIAS_PAD_CTL1_TRK_START_TIMER_MASK 0x7f
 #define XUSB_PADCTL_USB2_BIAS_PAD_CTL1_TRK_START_TIMER_VAL 0x1e
+#define   TCTRL_VALUE(x)                (((x) & 0x3f) >> 0)
+#define   PCTRL_VALUE(x)                (((x) >> 6) & 0x3f)
 
 #define XUSB_PADCTL_HSIC_PADX_CTL0(x) (0x300 + (x) * 0x20)
 #define XUSB_PADCTL_HSIC_PAD_CTL0_RPU_STROBE (1 << 18)
@@ -228,10 +247,18 @@ struct tegra210_xusb_fuse_calibration {
 	u32 rpd_ctrl;
 };
 
+struct tegra210_xusb_padctl_context {
+	u32 usb2_pad_mux;
+	u32 usb2_port_cap;
+	u32 ss_port_map;
+	u32 usb3_pad_mux;
+};
+
 struct tegra210_xusb_padctl {
 	struct tegra_xusb_padctl base;
-
+	struct tegra_utmi_pad_config utmi_pad_cfg;
 	struct tegra210_xusb_fuse_calibration fuse;
+	struct tegra210_xusb_padctl_context context;
 };
 
 static inline struct tegra210_xusb_padctl *
@@ -868,6 +895,317 @@ static int tegra210_hsic_set_idle(struct tegra_xusb_padctl *padctl,
 	return 0;
 }
 
+static int tegra210_usb3_phy_enable_sleepwalk(struct phy *phy)
+{
+	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
+	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	int index = tegra210_usb3_lane_map(lane);
+	struct device *dev = padctl->dev;
+	u32 reg;
+
+	if (index < 0) {
+		dev_err(dev, "invalid usb3 port number %d\n", index);
+		return -EINVAL;
+	}
+
+	dev_dbg(dev, "phy enable sleepwalk on usb3-%d\n", index);
+
+	mutex_lock(&padctl->lock);
+
+	reg = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
+	reg |= XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN_EARLY(index);
+	padctl_writel(padctl, reg, XUSB_PADCTL_ELPG_PROGRAM1);
+
+	usleep_range(100, 200);
+
+	reg = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
+	reg |= XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN(index);
+	padctl_writel(padctl, reg, XUSB_PADCTL_ELPG_PROGRAM1);
+
+	usleep_range(250, 350);
+
+	mutex_unlock(&padctl->lock);
+
+	return 0;
+}
+
+static void tegra210_utmi_phy_get_pad_config(
+				struct tegra_xusb_padctl *padctl,
+				int port, struct tegra_utmi_pad_config *config)
+{
+	u32 reg;
+
+	reg = padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
+	config->tctrl = TCTRL_VALUE(reg);
+	config->pctrl = PCTRL_VALUE(reg);
+
+	reg = padctl_readl(padctl, XUSB_PADCTL_USB2_OTG_PADX_CTL1(port));
+	config->rpd_ctrl = RPD_CTRL_VALUE(reg);
+}
+
+static int tegra210_usb3_phy_disable_sleepwalk(struct phy *phy)
+{
+	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
+	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	int index = tegra210_usb3_lane_map(lane);
+	struct device *dev = padctl->dev;
+	u32 reg;
+
+	if (index < 0) {
+		dev_err(dev, "invalid usb3 port number %d\n", index);
+		return -EINVAL;
+	}
+
+	dev_dbg(dev, "phy disable sleepwalk on usb3-%d\n", index);
+
+	mutex_lock(&padctl->lock);
+
+	reg = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
+	reg &= ~XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN_EARLY(index);
+	padctl_writel(padctl, reg, XUSB_PADCTL_ELPG_PROGRAM1);
+
+	usleep_range(100, 200);
+
+	reg = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
+	reg &= ~XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN(index);
+	padctl_writel(padctl, reg, XUSB_PADCTL_ELPG_PROGRAM1);
+
+	mutex_unlock(&padctl->lock);
+
+	return 0;
+}
+
+static int tegra210_usb3_phy_enable_wake(struct phy *phy)
+{
+	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
+	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	int index = tegra210_usb3_lane_map(lane);
+	struct device *dev = padctl->dev;
+	u32 reg;
+
+	if (index < 0) {
+		dev_err(dev, "invalid usb3 port number %d\n", index);
+		return -EINVAL;
+	}
+
+	dev_dbg(dev, "phy enable wake on usb3-%d\n", index);
+
+	mutex_lock(&padctl->lock);
+
+	reg = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM_0);
+	reg &= ~ALL_WAKE_EVENTS;
+	reg |= SS_PORT_WAKEUP_EVENT(index);
+	padctl_writel(padctl, reg, XUSB_PADCTL_ELPG_PROGRAM_0);
+
+	usleep_range(10, 20);
+
+	reg = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM_0);
+	reg &= ~ALL_WAKE_EVENTS;
+	reg |= SS_PORT_WAKE_INTERRUPT_ENABLE(index);
+	padctl_writel(padctl, reg, XUSB_PADCTL_ELPG_PROGRAM_0);
+
+	mutex_unlock(&padctl->lock);
+
+	return 0;
+}
+
+static int tegra210_usb3_phy_disable_wake(struct phy *phy)
+{
+	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
+	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	int index = tegra210_usb3_lane_map(lane);
+	struct device *dev = padctl->dev;
+	u32 reg;
+
+	if (index < 0) {
+		dev_err(dev, "invalid usb3 port number %d\n", index);
+		return -EINVAL;
+	}
+
+	dev_dbg(dev, "phy disable wake on usb3-%d\n", index);
+
+	mutex_lock(&padctl->lock);
+
+	reg = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM_0);
+	reg &= ~ALL_WAKE_EVENTS;
+	reg &= ~SS_PORT_WAKE_INTERRUPT_ENABLE(index);
+	padctl_writel(padctl, reg, XUSB_PADCTL_ELPG_PROGRAM_0);
+
+	usleep_range(10, 20);
+
+	reg = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM_0);
+	reg &= ~ALL_WAKE_EVENTS;
+	reg |= SS_PORT_WAKEUP_EVENT(index);
+	padctl_writel(padctl, reg, XUSB_PADCTL_ELPG_PROGRAM_0);
+
+	mutex_unlock(&padctl->lock);
+
+	return 0;
+}
+
+static int tegra210_utmi_phy_enable_wake(struct phy *phy)
+{
+	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
+	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	unsigned int index = lane->index;
+	struct device *dev = padctl->dev;
+	u32 reg;
+
+	dev_dbg(dev, "phy enable wake on usb2-%d\n", index);
+
+	mutex_lock(&padctl->lock);
+
+	reg = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM_0);
+	reg &= ~ALL_WAKE_EVENTS;
+	reg |= USB2_PORT_WAKEUP_EVENT(index);
+	padctl_writel(padctl, reg, XUSB_PADCTL_ELPG_PROGRAM_0);
+
+	usleep_range(10, 20);
+
+	reg = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM_0);
+	reg &= ~ALL_WAKE_EVENTS;
+	reg |= USB2_PORT_WAKE_INTERRUPT_ENABLE(index);
+	padctl_writel(padctl, reg, XUSB_PADCTL_ELPG_PROGRAM_0);
+
+	mutex_unlock(&padctl->lock);
+
+	return 0;
+}
+
+static int tegra210_utmi_phy_disable_wake(struct phy *phy)
+{
+	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
+	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	unsigned int index = lane->index;
+	struct device *dev = padctl->dev;
+	u32 reg;
+
+	dev_dbg(dev, "phy disable wake on usb2-%d\n", index);
+
+	mutex_lock(&padctl->lock);
+
+	reg = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM_0);
+	reg &= ~ALL_WAKE_EVENTS;
+	reg &= ~USB2_PORT_WAKE_INTERRUPT_ENABLE(index);
+	padctl_writel(padctl, reg, XUSB_PADCTL_ELPG_PROGRAM_0);
+
+	usleep_range(10, 20);
+
+	reg = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM_0);
+	reg &= ~ALL_WAKE_EVENTS;
+	reg |= USB2_PORT_WAKEUP_EVENT(index);
+	padctl_writel(padctl, reg, XUSB_PADCTL_ELPG_PROGRAM_0);
+
+	mutex_unlock(&padctl->lock);
+
+	return 0;
+}
+
+static int tegra210_hsic_phy_enable_wake(struct phy *phy)
+{
+	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
+	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	unsigned int index = lane->index;
+	struct device *dev = padctl->dev;
+	u32 reg;
+
+	dev_dbg(dev, "phy enable wake on hsic-%d\n", index);
+
+	mutex_lock(&padctl->lock);
+
+	reg = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM_0);
+	reg &= ~ALL_WAKE_EVENTS;
+	reg |= USB2_HSIC_PORT_WAKEUP_EVENT(index);
+	padctl_writel(padctl, reg, XUSB_PADCTL_ELPG_PROGRAM_0);
+
+	usleep_range(10, 20);
+
+	reg = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM_0);
+	reg &= ~ALL_WAKE_EVENTS;
+	reg |= USB2_HSIC_PORT_WAKE_INTERRUPT_ENABLE(index);
+	padctl_writel(padctl, reg, XUSB_PADCTL_ELPG_PROGRAM_0);
+
+	mutex_unlock(&padctl->lock);
+
+	return 0;
+}
+
+static int tegra210_hsic_phy_disable_wake(struct phy *phy)
+{
+	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
+	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	unsigned int index = lane->index;
+	struct device *dev = padctl->dev;
+	u32 reg;
+
+	dev_dbg(dev, "phy disable wake on hsic-%d\n", index);
+
+	mutex_lock(&padctl->lock);
+
+	reg = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM_0);
+	reg &= ~ALL_WAKE_EVENTS;
+	reg &= ~USB2_HSIC_PORT_WAKE_INTERRUPT_ENABLE(index);
+	padctl_writel(padctl, reg, XUSB_PADCTL_ELPG_PROGRAM_0);
+
+	usleep_range(10, 20);
+
+	reg = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM_0);
+	reg &= ~ALL_WAKE_EVENTS;
+	reg |= USB2_HSIC_PORT_WAKEUP_EVENT(index);
+	padctl_writel(padctl, reg, XUSB_PADCTL_ELPG_PROGRAM_0);
+
+	mutex_unlock(&padctl->lock);
+
+	return 0;
+}
+
+static int tegra210_usb3_phy_remote_wake_detected(
+			struct tegra_xusb_padctl *padctl, int port)
+{
+	u32 reg;
+
+	if (port < 0) {
+		dev_err(padctl->dev, "invalid usb3 port number %d\n",
+					port);
+		return false;
+	}
+
+	reg = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM_0);
+	if ((reg & SS_PORT_WAKE_INTERRUPT_ENABLE(port)) &&
+	    (reg & SS_PORT_WAKEUP_EVENT(port)))
+		return true;
+	else
+		return false;
+}
+
+static int tegra210_utmi_phy_remote_wake_detected(
+			struct tegra_xusb_padctl *padctl, int port)
+{
+	u32 reg;
+
+	reg = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM_0);
+	if ((reg & USB2_PORT_WAKE_INTERRUPT_ENABLE(port)) &&
+	    (reg & USB2_PORT_WAKEUP_EVENT(port)))
+		return true;
+	else
+		return false;
+}
+
+static int tegra210_hsic_phy_remote_wake_detected(
+			struct tegra_xusb_padctl *padctl, int port)
+{
+	u32 reg;
+
+	dev_dbg(padctl->dev, "hsic-%d remote wake detected\n", port);
+
+	reg = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM_0);
+	if ((reg & USB2_HSIC_PORT_WAKE_INTERRUPT_ENABLE(port)) &&
+	    (reg & USB2_HSIC_PORT_WAKEUP_EVENT(port)))
+		return true;
+	else
+		return false;
+}
+
 static int tegra210_usb3_set_lfps_detect(struct tegra_xusb_padctl *padctl,
 					 unsigned int index, bool enable)
 {
@@ -970,8 +1308,23 @@ static int tegra210_usb2_phy_init(struct phy *phy)
 {
 	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
 	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	unsigned int index = lane->index;
+	struct tegra_xusb_usb2_port *port;
+	int err;
 	u32 value;
 
+	port = tegra_xusb_find_usb2_port(padctl, index);
+	if (!port) {
+		dev_err(&phy->dev, "no port found for USB2 lane %u\n", index);
+		return -ENODEV;
+	}
+
+	err = regulator_enable(port->supply);
+	if (err)
+		return err;
+
+	mutex_lock(&padctl->lock);
+
 	value = padctl_readl(padctl, XUSB_PADCTL_USB2_PAD_MUX);
 	value &= ~(XUSB_PADCTL_USB2_PAD_MUX_USB2_BIAS_PAD_MASK <<
 		   XUSB_PADCTL_USB2_PAD_MUX_USB2_BIAS_PAD_SHIFT);
@@ -979,12 +1332,28 @@ static int tegra210_usb2_phy_init(struct phy *phy)
 		 XUSB_PADCTL_USB2_PAD_MUX_USB2_BIAS_PAD_SHIFT;
 	padctl_writel(padctl, value, XUSB_PADCTL_USB2_PAD_MUX);
 
+	mutex_unlock(&padctl->lock);
+
 	return tegra210_xusb_padctl_enable(padctl);
 }
 
 static int tegra210_usb2_phy_exit(struct phy *phy)
 {
 	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
+	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	unsigned int index = lane->index;
+	struct tegra_xusb_usb2_port *port;
+	int err;
+
+	port = tegra_xusb_find_usb2_port(padctl, index);
+	if (!port) {
+		dev_err(&phy->dev, "no port found for USB2 lane %u\n", index);
+		return -ENODEV;
+	}
+
+	err = regulator_disable(port->supply);
+	if (err)
+		return err;
 
 	return tegra210_xusb_padctl_disable(lane->pad->padctl);
 }
@@ -996,19 +1365,14 @@ static int tegra210_usb2_phy_power_on(struct phy *phy)
 	struct tegra_xusb_usb2_pad *pad = to_usb2_pad(lane->pad);
 	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
 	struct tegra210_xusb_padctl *priv;
-	struct tegra_xusb_usb2_port *port;
 	unsigned int index = lane->index;
 	u32 value;
 	int err;
 
-	port = tegra_xusb_find_usb2_port(padctl, index);
-	if (!port) {
-		dev_err(&phy->dev, "no port found for USB2 lane %u\n", index);
-		return -ENODEV;
-	}
-
 	priv = to_tegra210_xusb_padctl(padctl);
 
+	mutex_lock(&padctl->lock);
+
 	value = padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL0);
 	value &= ~((XUSB_PADCTL_USB2_BIAS_PAD_CTL0_HS_SQUELCH_LEVEL_MASK <<
 		    XUSB_PADCTL_USB2_BIAS_PAD_CTL0_HS_SQUELCH_LEVEL_SHIFT) |
@@ -1062,12 +1426,6 @@ static int tegra210_usb2_phy_power_on(struct phy *phy)
 	padctl_writel(padctl, value,
 		      XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL1(index));
 
-	err = regulator_enable(port->supply);
-	if (err)
-		return err;
-
-	mutex_lock(&padctl->lock);
-
 	if (pad->enable > 0) {
 		pad->enable++;
 		mutex_unlock(&padctl->lock);
@@ -1076,7 +1434,7 @@ static int tegra210_usb2_phy_power_on(struct phy *phy)
 
 	err = clk_prepare_enable(pad->clk);
 	if (err)
-		goto disable_regulator;
+		goto out;
 
 	value = padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
 	value &= ~((XUSB_PADCTL_USB2_BIAS_PAD_CTL1_TRK_START_TIMER_MASK <<
@@ -1108,8 +1466,7 @@ static int tegra210_usb2_phy_power_on(struct phy *phy)
 
 	return 0;
 
-disable_regulator:
-	regulator_disable(port->supply);
+out:
 	mutex_unlock(&padctl->lock);
 	return err;
 }
@@ -1119,16 +1476,9 @@ static int tegra210_usb2_phy_power_off(struct phy *phy)
 	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
 	struct tegra_xusb_usb2_pad *pad = to_usb2_pad(lane->pad);
 	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
-	struct tegra_xusb_usb2_port *port;
+	unsigned int index = lane->index;
 	u32 value;
 
-	port = tegra_xusb_find_usb2_port(padctl, lane->index);
-	if (!port) {
-		dev_err(&phy->dev, "no port found for USB2 lane %u\n",
-			lane->index);
-		return -ENODEV;
-	}
-
 	mutex_lock(&padctl->lock);
 
 	if (WARN_ON(pad->enable == 0))
@@ -1137,12 +1487,19 @@ static int tegra210_usb2_phy_power_off(struct phy *phy)
 	if (--pad->enable > 0)
 		goto out;
 
+	value = padctl_readl(padctl, XUSB_PADCTL_USB2_OTG_PADX_CTL0(index));
+	value |= XUSB_PADCTL_USB2_OTG_PAD_CTL0_PD;
+	padctl_writel(padctl, value, XUSB_PADCTL_USB2_OTG_PADX_CTL0(index));
+
+	value = padctl_readl(padctl, XUSB_PADCTL_USB2_OTG_PADX_CTL1(index));
+	value |= XUSB_PADCTL_USB2_OTG_PAD_CTL1_PD_DR;
+	padctl_writel(padctl, value, XUSB_PADCTL_USB2_OTG_PADX_CTL1(index));
+
 	value = padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL0);
 	value |= XUSB_PADCTL_USB2_BIAS_PAD_CTL0_PD;
 	padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL0);
 
 out:
-	regulator_disable(port->supply);
 	mutex_unlock(&padctl->lock);
 	return 0;
 }
@@ -1863,6 +2220,114 @@ static const struct phy_ops tegra210_sata_phy_ops = {
 	.owner = THIS_MODULE,
 };
 
+static inline bool is_usb3_phy(struct phy *phy)
+{
+	return (phy->ops == &tegra210_pcie_phy_ops ||
+		phy->ops == &tegra210_sata_phy_ops);
+}
+
+static inline bool is_hsic_phy(struct phy *phy)
+{
+	return phy->ops == &tegra210_hsic_phy_ops;
+}
+
+static inline bool is_utmi_phy(struct phy *phy)
+{
+	return phy->ops == &tegra210_usb2_phy_ops;
+}
+
+static int tegra210_xusb_padctl_phy_wake(struct tegra_xusb_padctl *padctl,
+					 struct phy *phy, bool enable)
+{
+	if (!phy)
+		return 0;
+
+	if (is_usb3_phy(phy)) {
+		if (enable)
+			return tegra210_usb3_phy_enable_wake(phy);
+		else
+			return tegra210_usb3_phy_disable_wake(phy);
+	} else if (is_utmi_phy(phy)) {
+		if (enable)
+			return tegra210_utmi_phy_enable_wake(phy);
+		else
+			return tegra210_utmi_phy_disable_wake(phy);
+	} else if (is_hsic_phy(phy)) {
+		if (enable)
+			return tegra210_hsic_phy_enable_wake(phy);
+		else
+			return tegra210_hsic_phy_disable_wake(phy);
+	} else
+		return -EINVAL;
+
+	return 0;
+}
+
+int tegra210_xusb_padctl_remote_wake_detected(struct phy *phy)
+{
+	struct tegra_xusb_lane *lane;
+	struct tegra_xusb_padctl *padctl;
+
+	if (!phy)
+		return 0;
+
+	lane = phy_get_drvdata(phy);
+	padctl = lane->pad->padctl;
+
+	if (is_utmi_phy(phy))
+		return tegra210_utmi_phy_remote_wake_detected(padctl,
+					lane->index);
+	else if (is_hsic_phy(phy))
+		return tegra210_hsic_phy_remote_wake_detected(padctl,
+					lane->index);
+	else if (is_usb3_phy(phy))
+		return tegra210_usb3_phy_remote_wake_detected(padctl,
+					tegra210_usb3_lane_map(lane));
+
+	return -EINVAL;
+}
+
+static int tegra210_xusb_padctl_phy_sleepwalk(struct tegra_xusb_padctl *padctl,
+					      struct phy *phy, bool enable,
+					      enum usb_device_speed speed)
+{
+	struct tegra210_xusb_padctl *priv;
+	struct tegra_xusb_lane *lane;
+
+	if (!phy)
+		return 0;
+
+	priv = to_tegra210_xusb_padctl(padctl);
+	lane = phy_get_drvdata(phy);
+
+	if (is_usb3_phy(phy)) {
+		if (enable)
+			return tegra210_usb3_phy_enable_sleepwalk(phy);
+		else
+			return tegra210_usb3_phy_disable_sleepwalk(phy);
+	} else if (is_utmi_phy(phy)) {
+		tegra210_utmi_phy_get_pad_config(padctl, lane->index,
+				&priv->utmi_pad_cfg);
+		if (enable)
+			return tegra_pmc_utmi_phy_enable_sleepwalk(
+					lane->index, speed,
+					&priv->utmi_pad_cfg);
+		else
+			return tegra_pmc_utmi_phy_disable_sleepwalk(
+					lane->index);
+	} else if (is_hsic_phy(phy)) {
+		if (enable)
+			return tegra_pmc_hsic_phy_enable_sleepwalk(
+					lane->index);
+		else
+			return tegra_pmc_hsic_phy_disable_sleepwalk(
+					lane->index);
+	} else
+		return -EINVAL;
+
+	return 0;
+}
+
 static struct tegra_xusb_pad *
 tegra210_sata_pad_probe(struct tegra_xusb_padctl *padctl,
 			const struct tegra_xusb_pad_soc *soc,
@@ -2081,11 +2546,68 @@ static void tegra210_xusb_padctl_remove(struct tegra_xusb_padctl *padctl)
 {
 }
 
+static void tegra210_xusb_padctl_save(struct tegra_xusb_padctl *padctl)
+{
+	struct tegra210_xusb_padctl *priv = to_tegra210_xusb_padctl(padctl);
+
+	priv->context.usb2_pad_mux =
+				padctl_readl(padctl, XUSB_PADCTL_USB2_PAD_MUX);
+	priv->context.usb2_port_cap =
+				padctl_readl(padctl, XUSB_PADCTL_USB2_PORT_CAP);
+	priv->context.ss_port_map =
+				padctl_readl(padctl, XUSB_PADCTL_SS_PORT_MAP);
+	priv->context.usb3_pad_mux =
+			padctl_readl(padctl, XUSB_PADCTL_USB3_PAD_MUX);
+}
+
+static void tegra210_xusb_padctl_restore(struct tegra_xusb_padctl *padctl)
+{
+	struct tegra210_xusb_padctl *priv = to_tegra210_xusb_padctl(padctl);
+
+	padctl_writel(padctl, priv->context.usb2_pad_mux,
+			XUSB_PADCTL_USB2_PAD_MUX);
+	padctl_writel(padctl, priv->context.usb2_port_cap,
+			XUSB_PADCTL_USB2_PORT_CAP);
+	padctl_writel(padctl, priv->context.ss_port_map,
+			XUSB_PADCTL_SS_PORT_MAP);
+	padctl_writel(padctl, priv->context.usb3_pad_mux,
+			XUSB_PADCTL_USB3_PAD_MUX);
+}
+
+static int tegra210_xusb_padctl_suspend_noirq(struct tegra_xusb_padctl *padctl)
+{
+	mutex_lock(&padctl->lock);
+
+	tegra210_uphy_deinit(padctl);
+
+	tegra210_xusb_padctl_save(padctl);
+
+	mutex_unlock(&padctl->lock);
+	return 0;
+}
+
+static int tegra210_xusb_padctl_resume_noirq(struct tegra_xusb_padctl *padctl)
+{
+	mutex_lock(&padctl->lock);
+
+	tegra210_xusb_padctl_restore(padctl);
+
+	tegra210_uphy_init(padctl);
+
+	mutex_unlock(&padctl->lock);
+	return 0;
+}
+
 static const struct tegra_xusb_padctl_ops tegra210_xusb_padctl_ops = {
 	.probe = tegra210_xusb_padctl_probe,
 	.remove = tegra210_xusb_padctl_remove,
+	.suspend_noirq = tegra210_xusb_padctl_suspend_noirq,
+	.resume_noirq = tegra210_xusb_padctl_resume_noirq,
 	.usb3_set_lfps_detect = tegra210_usb3_set_lfps_detect,
 	.hsic_set_idle = tegra210_hsic_set_idle,
+	.phy_sleepwalk = tegra210_xusb_padctl_phy_sleepwalk,
+	.phy_wake = tegra210_xusb_padctl_phy_wake,
+	.remote_wake_detected = tegra210_xusb_padctl_remote_wake_detected,
 };
 
 const struct tegra_xusb_padctl_soc tegra210_xusb_padctl_soc = {
-- 
2.17.1
