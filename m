Return-Path: <SRS0=xUMM=UN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:19679 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725812AbfFNHsl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 14 Jun 2019 03:48:41 -0400
From: JC Kuo <jckuo@nvidia.com>
Subject: [PATCH 5/8] soc/tegra: pmc: support T210 USB 2.0 Sleepwalk
Date: Fri, 14 Jun 2019 15:48:21 +0800
Message-ID: <20190614074824.22023-1-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, pdeschrijver@nvidia.com, afrid@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, nkristam@nvidia.com, skomatineni@nvidia.com, JC Kuo <jckuo@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

This commit implements Tegra210 PMC USB 2.0 (UTMI and HSIC) Sleepwalk
programming sequence. With Sleepwalk enabled, XUSB host controller
can be put into ELPG (Engine Level PowerGate) state when controller
is idle to save power. The Sleepwalk logic is in charge of wake event
detection and maintain resume signal accordingly till XUSB host
controller is bring out of ELPG.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 462 ++++++++++++++++++++++++++++++++++++++++
 include/soc/tegra/pmc.h |  13 ++
 2 files changed, 475 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 8878720dd779..8a143cfc83b3 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -142,6 +142,142 @@
 #define  TEGRA_SMC_PMC_READ	0xaa
 #define  TEGRA_SMC_PMC_WRITE	0xbb
 
+/* USB2 SLEEPWALK registers */
+#define UTMIP(_port, _offset1, _offset2) \
+		(((_port) <= 2) ? (_offset1) : (_offset2))
+
+#define PMC_UTMIP_UHSIC_SLEEP_CFG(x)	UTMIP(x, 0x1fc, 0x4d0)
+#define   UTMIP_MASTER_ENABLE(x)		UTMIP(x, BIT(8 * (x)), BIT(0))
+#define   UTMIP_FSLS_USE_PMC(x)			UTMIP(x, BIT(8 * (x) + 1), \
+							BIT(1))
+#define   UTMIP_PCTRL_USE_PMC(x)		UTMIP(x, BIT(8 * (x) + 2), \
+							BIT(2))
+#define   UTMIP_TCTRL_USE_PMC(x)		UTMIP(x, BIT(8 * (x) + 3), \
+							BIT(3))
+#define   UTMIP_WAKE_VAL(_port, _value)		(((_value) & 0xf) << \
+					(UTMIP(_port, 8 * (_port) + 4, 4)))
+#define   UTMIP_WAKE_VAL_NONE(_port)		UTMIP_WAKE_VAL(_port, 12)
+#define   UTMIP_WAKE_VAL_ANY(_port)		UTMIP_WAKE_VAL(_port, 15)
+
+#define PMC_UTMIP_UHSIC_SLEEP_CFG1	(0x4d0)
+#define   UTMIP_RPU_SWITC_LOW_USE_PMC_PX(x)	BIT((x) + 8)
+#define   UTMIP_RPD_CTRL_USE_PMC_PX(x)		BIT((x) + 16)
+
+#define PMC_UTMIP_MASTER_CONFIG		(0x274)
+#define   UTMIP_PWR(x)				UTMIP(x, BIT(x), BIT(4))
+#define   UHSIC_PWR(x)				BIT(3)
+
+#define PMC_USB_DEBOUNCE_DEL		(0xec)
+#define   DEBOUNCE_VAL(x)			(((x) & 0xffff) << 0)
+#define   UTMIP_LINE_DEB_CNT(x)			(((x) & 0xf) << 16)
+#define   UHSIC_LINE_DEB_CNT(x)			(((x) & 0xf) << 20)
+
+#define PMC_UTMIP_UHSIC_FAKE(x)		UTMIP(x, 0x218, 0x294)
+#define   UTMIP_FAKE_USBOP_VAL(x)		UTMIP(x, BIT(4 * (x)), BIT(8))
+#define   UTMIP_FAKE_USBON_VAL(x)		UTMIP(x, BIT(4 * (x) + 1), \
+							BIT(9))
+#define   UTMIP_FAKE_USBOP_EN(x)		UTMIP(x, BIT(4 * (x) + 2), \
+							BIT(10))
+#define   UTMIP_FAKE_USBON_EN(x)		UTMIP(x, BIT(4 * (x) + 3), \
+							BIT(11))
+
+#define PMC_UTMIP_UHSIC_SLEEPWALK_CFG(x)	UTMIP(x, 0x200, 0x288)
+#define   UTMIP_LINEVAL_WALK_EN(x)		UTMIP(x, BIT(8 * (x) + 7), \
+							BIT(15))
+
+#define PMC_USB_AO			(0xf0)
+#define   USBOP_VAL_PD(x)			UTMIP(x, BIT(4 * (x)), BIT(20))
+#define   USBON_VAL_PD(x)			UTMIP(x, BIT(4 * (x) + 1), \
+							BIT(21))
+#define   STROBE_VAL_PD(x)			BIT(12)
+#define   DATA0_VAL_PD(x)			BIT(13)
+#define   DATA1_VAL_PD				BIT(24)
+
+#define PMC_UTMIP_UHSIC_SAVED_STATE(x)	UTMIP(x, 0x1f0, 0x280)
+#define   SPEED(_port, _value)			(((_value) & 0x3) << \
+						(UTMIP(_port, 8 * (_port), 8)))
+#define   UTMI_HS(_port)			SPEED(_port, 0)
+#define   UTMI_FS(_port)			SPEED(_port, 1)
+#define   UTMI_LS(_port)			SPEED(_port, 2)
+#define   UTMI_RST(_port)			SPEED(_port, 3)
+
+#define PMC_UTMIP_UHSIC_TRIGGERS		(0x1ec)
+#define   UTMIP_CLR_WALK_PTR(x)			UTMIP(x, BIT(x), BIT(16))
+#define   UTMIP_CAP_CFG(x)			UTMIP(x, BIT((x) + 4), BIT(17))
+#define   UTMIP_CLR_WAKE_ALARM(x)		UTMIP(x, BIT((x) + 12), \
+							BIT(19))
+#define   UHSIC_CLR_WALK_PTR			BIT(3)
+#define   UHSIC_CLR_WAKE_ALARM			BIT(15)
+
+#define PMC_UTMIP_SLEEPWALK_PX(x)	UTMIP(x, 0x204 + (4 * (x)), \
+							0x4e0)
+/* phase A */
+#define   UTMIP_USBOP_RPD_A			BIT(0)
+#define   UTMIP_USBON_RPD_A			BIT(1)
+#define   UTMIP_AP_A				BIT(4)
+#define   UTMIP_AN_A				BIT(5)
+#define   UTMIP_HIGHZ_A				BIT(6)
+/* phase B */
+#define   UTMIP_USBOP_RPD_B			BIT(8)
+#define   UTMIP_USBON_RPD_B			BIT(9)
+#define   UTMIP_AP_B				BIT(12)
+#define   UTMIP_AN_B				BIT(13)
+#define   UTMIP_HIGHZ_B				BIT(14)
+/* phase C */
+#define   UTMIP_USBOP_RPD_C			BIT(16)
+#define   UTMIP_USBON_RPD_C			BIT(17)
+#define   UTMIP_AP_C				BIT(20)
+#define   UTMIP_AN_C				BIT(21)
+#define   UTMIP_HIGHZ_C				BIT(22)
+/* phase D */
+#define   UTMIP_USBOP_RPD_D			BIT(24)
+#define   UTMIP_USBON_RPD_D			BIT(25)
+#define   UTMIP_AP_D				BIT(28)
+#define   UTMIP_AN_D				BIT(29)
+#define   UTMIP_HIGHZ_D				BIT(30)
+
+#define PMC_UTMIP_UHSIC_LINE_WAKEUP	(0x26c)
+#define   UTMIP_LINE_WAKEUP_EN(x)		UTMIP(x, BIT(x), BIT(4))
+#define   UHSIC_LINE_WAKEUP_EN			BIT(3)
+
+#define PMC_UTMIP_TERM_PAD_CFG		(0x1f8)
+#define   PCTRL_VAL(x)				(((x) & 0x3f) << 1)
+#define   TCTRL_VAL(x)				(((x) & 0x3f) << 7)
+
+#define PMC_UTMIP_PAD_CFGX(x)		(0x4c0 + (4 * (x)))
+#define   RPD_CTRL_PX(x)			(((x) & 0x1f) << 22)
+
+#define PMC_UHSIC_SLEEP_CFG	PMC_UTMIP_UHSIC_SLEEP_CFG(0)
+#define   UHSIC_MASTER_ENABLE			BIT(24)
+#define   UHSIC_WAKE_VAL(_value)		(((_value) & 0xf) << 28)
+#define   UHSIC_WAKE_VAL_SD10			UHSIC_WAKE_VAL(2)
+#define   UHSIC_WAKE_VAL_NONE			UHSIC_WAKE_VAL(12)
+
+#define PMC_UHSIC_FAKE			PMC_UTMIP_UHSIC_FAKE(0)
+#define   UHSIC_FAKE_STROBE_VAL			BIT(12)
+#define   UHSIC_FAKE_DATA_VAL			BIT(13)
+#define   UHSIC_FAKE_STROBE_EN			BIT(14)
+#define   UHSIC_FAKE_DATA_EN			BIT(15)
+
+#define PMC_UHSIC_SAVED_STATE		PMC_UTMIP_UHSIC_SAVED_STATE(0)
+#define   UHSIC_MODE(_value)			(((_value) & 0x1) << 24)
+#define   UHSIC_HS				UHSIC_MODE(0)
+#define   UHSIC_RST				UHSIC_MODE(1)
+
+#define PMC_UHSIC_SLEEPWALK_CFG		PMC_UTMIP_UHSIC_SLEEPWALK_CFG(0)
+#define   UHSIC_WAKE_WALK_EN			BIT(30)
+#define   UHSIC_LINEVAL_WALK_EN			BIT(31)
+
+#define PMC_UHSIC_SLEEPWALK_P0		(0x210)
+#define   UHSIC_DATA0_RPD_A			BIT(1)
+#define   UHSIC_DATA0_RPU_B			BIT(11)
+#define   UHSIC_DATA0_RPU_C			BIT(19)
+#define   UHSIC_DATA0_RPU_D			BIT(27)
+#define   UHSIC_STROBE_RPU_A			BIT(2)
+#define   UHSIC_STROBE_RPD_B			BIT(8)
+#define   UHSIC_STROBE_RPD_C			BIT(16)
+#define   UHSIC_STROBE_RPD_D			BIT(24)
+
 struct tegra_powergate {
 	struct generic_pm_domain genpd;
 	struct tegra_pmc *pmc;
@@ -689,6 +825,332 @@ static int tegra_genpd_power_off(struct generic_pm_domain *domain)
 	return err;
 }
 
+/* T210 USB2 SLEEPWALK APIs */
+int tegra_pmc_utmi_phy_enable_sleepwalk(int port, enum usb_device_speed speed,
+					struct tegra_utmi_pad_config *config)
+{
+	u32 reg;
+
+	pr_debug("PMC %s : port %d, speed %d\n", __func__, port, speed);
+
+	/* ensure sleepwalk logic is disabled */
+	reg = tegra_pmc_readl(pmc, PMC_UTMIP_UHSIC_SLEEP_CFG(port));
+	reg &= ~UTMIP_MASTER_ENABLE(port);
+	tegra_pmc_writel(pmc, reg, PMC_UTMIP_UHSIC_SLEEP_CFG(port));
+
+	/* ensure sleepwalk logics are in low power mode */
+	reg = tegra_pmc_readl(pmc, PMC_UTMIP_MASTER_CONFIG);
+	reg |= UTMIP_PWR(port);
+	tegra_pmc_writel(pmc, reg, PMC_UTMIP_MASTER_CONFIG);
+
+	/* set debounce time */
+	reg = tegra_pmc_readl(pmc, PMC_USB_DEBOUNCE_DEL);
+	reg &= ~UTMIP_LINE_DEB_CNT(~0);
+	reg |= UTMIP_LINE_DEB_CNT(0x1);
+	tegra_pmc_writel(pmc, reg, PMC_USB_DEBOUNCE_DEL);
+
+	/* ensure fake events of sleepwalk logic are desiabled */
+	reg = tegra_pmc_readl(pmc, PMC_UTMIP_UHSIC_FAKE(port));
+	reg &= ~(UTMIP_FAKE_USBOP_VAL(port) | UTMIP_FAKE_USBON_VAL(port) |
+			UTMIP_FAKE_USBOP_EN(port) | UTMIP_FAKE_USBON_EN(port));
+	tegra_pmc_writel(pmc, reg, PMC_UTMIP_UHSIC_FAKE(port));
+
+	/* ensure wake events of sleepwalk logic are not latched */
+	reg = tegra_pmc_readl(pmc, PMC_UTMIP_UHSIC_LINE_WAKEUP);
+	reg &= ~UTMIP_LINE_WAKEUP_EN(port);
+	tegra_pmc_writel(pmc, reg, PMC_UTMIP_UHSIC_LINE_WAKEUP);
+
+	/* disable wake event triggers of sleepwalk logic */
+	reg = tegra_pmc_readl(pmc, PMC_UTMIP_UHSIC_SLEEP_CFG(port));
+	reg &= ~UTMIP_WAKE_VAL(port, ~0);
+	reg |= UTMIP_WAKE_VAL_NONE(port);
+	tegra_pmc_writel(pmc, reg, PMC_UTMIP_UHSIC_SLEEP_CFG(port));
+
+	/* power down the line state detectors of the pad */
+	reg = tegra_pmc_readl(pmc, PMC_USB_AO);
+	reg |= (USBOP_VAL_PD(port) | USBON_VAL_PD(port));
+	tegra_pmc_writel(pmc, reg, PMC_USB_AO);
+
+	/* save state per speed */
+	reg = tegra_pmc_readl(pmc, PMC_UTMIP_UHSIC_SAVED_STATE(port));
+	reg &= ~SPEED(port, ~0);
+	if (speed == USB_SPEED_HIGH)
+		reg |= UTMI_HS(port);
+	else if (speed == USB_SPEED_FULL)
+		reg |= UTMI_FS(port);
+	else if (speed == USB_SPEED_LOW)
+		reg |= UTMI_LS(port);
+	else
+		reg |= UTMI_RST(port);
+	tegra_pmc_writel(pmc, reg, PMC_UTMIP_UHSIC_SAVED_STATE(port));
+
+	/* enable the trigger of the sleepwalk logic */
+	reg = tegra_pmc_readl(pmc, PMC_UTMIP_UHSIC_SLEEPWALK_CFG(port));
+	reg |= UTMIP_LINEVAL_WALK_EN(port);
+	tegra_pmc_writel(pmc, reg, PMC_UTMIP_UHSIC_SLEEPWALK_CFG(port));
+
+	/* reset the walk pointer and clear the alarm of the sleepwalk logic,
+	 * as well as capture the configuration of the USB2.0 pad
+	 */
+	reg = tegra_pmc_readl(pmc, PMC_UTMIP_UHSIC_TRIGGERS);
+	reg |= (UTMIP_CLR_WALK_PTR(port) | UTMIP_CLR_WAKE_ALARM(port) |
+		UTMIP_CAP_CFG(port));
+	tegra_pmc_writel(pmc, reg, PMC_UTMIP_UHSIC_TRIGGERS);
+
+	/* program electrical parameters read from XUSB PADCTL */
+	reg = tegra_pmc_readl(pmc, PMC_UTMIP_TERM_PAD_CFG);
+	reg &= ~(TCTRL_VAL(~0) | PCTRL_VAL(~0));
+	reg |= (TCTRL_VAL(config->tctrl) | PCTRL_VAL(config->pctrl));
+	tegra_pmc_writel(pmc, reg, PMC_UTMIP_TERM_PAD_CFG);
+
+	reg = tegra_pmc_readl(pmc, PMC_UTMIP_PAD_CFGX(port));
+	reg &= ~RPD_CTRL_PX(~0);
+	reg |= RPD_CTRL_PX(config->rpd_ctrl);
+	tegra_pmc_writel(pmc, reg, PMC_UTMIP_PAD_CFGX(port));
+
+	/* setup the pull-ups and pull-downs of the signals during the four
+	 * stages of sleepwalk.
+	 * if device is connected, program sleepwalk logic to maintain a J and
+	 * keep driving K upon seeing remote wake.
+	 */
+	reg = tegra_pmc_readl(pmc, PMC_UTMIP_SLEEPWALK_PX(port));
+	reg = (UTMIP_USBOP_RPD_A | UTMIP_USBOP_RPD_B | UTMIP_USBOP_RPD_C |
+		UTMIP_USBOP_RPD_D);
+	reg |= (UTMIP_USBON_RPD_A | UTMIP_USBON_RPD_B | UTMIP_USBON_RPD_C |
+		UTMIP_USBON_RPD_D);
+	if (speed == USB_SPEED_UNKNOWN) {
+		reg |= (UTMIP_HIGHZ_A | UTMIP_HIGHZ_B | UTMIP_HIGHZ_C |
+			UTMIP_HIGHZ_D);
+	} else if ((speed == USB_SPEED_HIGH) || (speed == USB_SPEED_FULL)) {
+		/* J state: D+/D- = high/low, K state: D+/D- = low/high */
+		reg |= UTMIP_HIGHZ_A;
+		reg |= UTMIP_AP_A;
+		reg |= (UTMIP_AN_B | UTMIP_AN_C | UTMIP_AN_D);
+	} else if (speed == USB_SPEED_LOW) {
+		/* J state: D+/D- = low/high, K state: D+/D- = high/low */
+		reg |= UTMIP_HIGHZ_A;
+		reg |= UTMIP_AN_A;
+		reg |= (UTMIP_AP_B | UTMIP_AP_C | UTMIP_AP_D);
+	}
+	tegra_pmc_writel(pmc, reg, PMC_UTMIP_SLEEPWALK_PX(port));
+
+	/* power up the line state detectors of the pad */
+	reg = tegra_pmc_readl(pmc, PMC_USB_AO);
+	reg &= ~(USBOP_VAL_PD(port) | USBON_VAL_PD(port));
+	tegra_pmc_writel(pmc, reg, PMC_USB_AO);
+
+	usleep_range(50, 100);
+
+	/* switch the electric control of the USB2.0 pad to PMC */
+	reg = tegra_pmc_readl(pmc, PMC_UTMIP_UHSIC_SLEEP_CFG(port));
+	reg |= (UTMIP_FSLS_USE_PMC(port) | UTMIP_PCTRL_USE_PMC(port) |
+			UTMIP_TCTRL_USE_PMC(port));
+	tegra_pmc_writel(pmc, reg, PMC_UTMIP_UHSIC_SLEEP_CFG(port));
+
+	reg = tegra_pmc_readl(pmc, PMC_UTMIP_UHSIC_SLEEP_CFG1);
+	reg |= (UTMIP_RPD_CTRL_USE_PMC_PX(port) |
+			UTMIP_RPU_SWITC_LOW_USE_PMC_PX(port));
+	tegra_pmc_writel(pmc, reg, PMC_UTMIP_UHSIC_SLEEP_CFG1);
+
+	/* set the wake signaling trigger events */
+	reg = tegra_pmc_readl(pmc, PMC_UTMIP_UHSIC_SLEEP_CFG(port));
+	reg &= ~UTMIP_WAKE_VAL(port, ~0);
+	reg |= UTMIP_WAKE_VAL_ANY(port);
+	tegra_pmc_writel(pmc, reg, PMC_UTMIP_UHSIC_SLEEP_CFG(port));
+
+	/* enable the wake detection */
+	reg = tegra_pmc_readl(pmc, PMC_UTMIP_UHSIC_SLEEP_CFG(port));
+	reg |= UTMIP_MASTER_ENABLE(port);
+	tegra_pmc_writel(pmc, reg, PMC_UTMIP_UHSIC_SLEEP_CFG(port));
+
+	reg = tegra_pmc_readl(pmc, PMC_UTMIP_UHSIC_LINE_WAKEUP);
+	reg |= UTMIP_LINE_WAKEUP_EN(port);
+	tegra_pmc_writel(pmc, reg, PMC_UTMIP_UHSIC_LINE_WAKEUP);
+
+	return 0;
+}
+EXPORT_SYMBOL(tegra_pmc_utmi_phy_enable_sleepwalk);
+
+int tegra_pmc_utmi_phy_disable_sleepwalk(int port)
+{
+	u32 reg;
+
+	pr_debug("PMC %s : port %d\n", __func__, port);
+
+	/* disable the wake detection */
+	reg = tegra_pmc_readl(pmc, PMC_UTMIP_UHSIC_SLEEP_CFG(port));
+	reg &= ~UTMIP_MASTER_ENABLE(port);
+	tegra_pmc_writel(pmc, reg, PMC_UTMIP_UHSIC_SLEEP_CFG(port));
+
+	reg = tegra_pmc_readl(pmc, PMC_UTMIP_UHSIC_LINE_WAKEUP);
+	reg &= ~UTMIP_LINE_WAKEUP_EN(port);
+	tegra_pmc_writel(pmc, reg, PMC_UTMIP_UHSIC_LINE_WAKEUP);
+
+	/* switch the electric control of the USB2.0 pad to XUSB or USB2 */
+	reg = tegra_pmc_readl(pmc, PMC_UTMIP_UHSIC_SLEEP_CFG(port));
+	reg &= ~(UTMIP_FSLS_USE_PMC(port) | UTMIP_PCTRL_USE_PMC(port) |
+			UTMIP_TCTRL_USE_PMC(port));
+	tegra_pmc_writel(pmc, reg, PMC_UTMIP_UHSIC_SLEEP_CFG(port));
+
+	reg = tegra_pmc_readl(pmc, PMC_UTMIP_UHSIC_SLEEP_CFG1);
+	reg &= ~(UTMIP_RPD_CTRL_USE_PMC_PX(port) |
+			UTMIP_RPU_SWITC_LOW_USE_PMC_PX(port));
+	tegra_pmc_writel(pmc, reg, PMC_UTMIP_UHSIC_SLEEP_CFG1);
+
+	/* disable wake event triggers of sleepwalk logic */
+	reg = tegra_pmc_readl(pmc, PMC_UTMIP_UHSIC_SLEEP_CFG(port));
+	reg &= ~UTMIP_WAKE_VAL(port, ~0);
+	reg |= UTMIP_WAKE_VAL_NONE(port);
+	tegra_pmc_writel(pmc, reg, PMC_UTMIP_UHSIC_SLEEP_CFG(port));
+
+	/* power down the line state detectors of the port */
+	reg = tegra_pmc_readl(pmc, PMC_USB_AO);
+	reg |= (USBOP_VAL_PD(port) | USBON_VAL_PD(port));
+	tegra_pmc_writel(pmc, reg, PMC_USB_AO);
+
+	/* clear alarm of the sleepwalk logic */
+	reg = tegra_pmc_readl(pmc, PMC_UTMIP_UHSIC_TRIGGERS);
+	reg |= UTMIP_CLR_WAKE_ALARM(port);
+	tegra_pmc_writel(pmc, reg, PMC_UTMIP_UHSIC_TRIGGERS);
+
+	return 0;
+}
+EXPORT_SYMBOL(tegra_pmc_utmi_phy_disable_sleepwalk);
+
+int tegra_pmc_hsic_phy_enable_sleepwalk(int port)
+{
+	u32 reg;
+
+	pr_debug("PMC %s : port %dn", __func__, port);
+
+	/* ensure sleepwalk logic is disabled */
+	reg = tegra_pmc_readl(pmc, PMC_UHSIC_SLEEP_CFG);
+	reg &= ~UHSIC_MASTER_ENABLE;
+	tegra_pmc_writel(pmc, reg, PMC_UHSIC_SLEEP_CFG);
+
+	/* ensure sleepwalk logics are in low power mode */
+	reg = tegra_pmc_readl(pmc, PMC_UTMIP_MASTER_CONFIG);
+	reg |= UHSIC_PWR(port);
+	tegra_pmc_writel(pmc, reg, PMC_UTMIP_MASTER_CONFIG);
+
+	/* set debounce time */
+	reg = tegra_pmc_readl(pmc, PMC_USB_DEBOUNCE_DEL);
+	reg &= ~UHSIC_LINE_DEB_CNT(~0);
+	reg |= UHSIC_LINE_DEB_CNT(0x1);
+	tegra_pmc_writel(pmc, reg, PMC_USB_DEBOUNCE_DEL);
+
+	/* ensure fake events of sleepwalk logic are desiabled */
+	reg = tegra_pmc_readl(pmc, PMC_UHSIC_FAKE);
+	reg &= ~(UHSIC_FAKE_STROBE_VAL | UHSIC_FAKE_DATA_VAL |
+			UHSIC_FAKE_STROBE_EN | UHSIC_FAKE_DATA_EN);
+	tegra_pmc_writel(pmc, reg, PMC_UHSIC_FAKE);
+
+	/* ensure wake events of sleepwalk logic are not latched */
+	reg = tegra_pmc_readl(pmc, PMC_UTMIP_UHSIC_LINE_WAKEUP);
+	reg &= ~UHSIC_LINE_WAKEUP_EN;
+	tegra_pmc_writel(pmc, reg, PMC_UTMIP_UHSIC_LINE_WAKEUP);
+
+	/* disable wake event triggers of sleepwalk logic */
+	reg = tegra_pmc_readl(pmc, PMC_UHSIC_SLEEP_CFG);
+	reg &= ~UHSIC_WAKE_VAL(~0);
+	reg |= UHSIC_WAKE_VAL_NONE;
+	tegra_pmc_writel(pmc, reg, PMC_UHSIC_SLEEP_CFG);
+
+	/* power down the line state detectors of the port */
+	reg = tegra_pmc_readl(pmc, PMC_USB_AO);
+	reg |= (STROBE_VAL_PD(port) | DATA0_VAL_PD(port) | DATA1_VAL_PD);
+	tegra_pmc_writel(pmc, reg, PMC_USB_AO);
+
+	/* save state, HSIC always comes up as HS */
+	reg = tegra_pmc_readl(pmc, PMC_UHSIC_SAVED_STATE);
+	reg &= ~UHSIC_MODE(~0);
+	reg |= UHSIC_HS;
+	tegra_pmc_writel(pmc, reg, PMC_UHSIC_SAVED_STATE);
+
+	/* enable the trigger of the sleepwalk logic */
+	reg = tegra_pmc_readl(pmc, PMC_UHSIC_SLEEPWALK_CFG);
+	reg |= (UHSIC_WAKE_WALK_EN | UHSIC_LINEVAL_WALK_EN);
+	tegra_pmc_writel(pmc, reg, PMC_UHSIC_SLEEPWALK_CFG);
+
+	/* reset the walk pointer and clear the alarm of the sleepwalk logic,
+	 * as well as capture the configuration of the USB2.0 port
+	 */
+	reg = tegra_pmc_readl(pmc, PMC_UTMIP_UHSIC_TRIGGERS);
+	reg |= (UHSIC_CLR_WALK_PTR | UHSIC_CLR_WAKE_ALARM);
+	tegra_pmc_writel(pmc, reg, PMC_UTMIP_UHSIC_TRIGGERS);
+
+	/* setup the pull-ups and pull-downs of the signals during the four
+	 * stages of sleepwalk.
+	 * maintain a HSIC IDLE and keep driving HSIC RESUME upon remote wake
+	 */
+	reg = tegra_pmc_readl(pmc, PMC_UHSIC_SLEEPWALK_P0);
+	reg = (UHSIC_DATA0_RPD_A | UHSIC_DATA0_RPU_B | UHSIC_DATA0_RPU_C |
+		UHSIC_DATA0_RPU_D);
+	reg |= (UHSIC_STROBE_RPU_A | UHSIC_STROBE_RPD_B | UHSIC_STROBE_RPD_C |
+		UHSIC_STROBE_RPD_D);
+	tegra_pmc_writel(pmc, reg, PMC_UHSIC_SLEEPWALK_P0);
+
+	/* power up the line state detectors of the port */
+	reg = tegra_pmc_readl(pmc, PMC_USB_AO);
+	reg &= ~(STROBE_VAL_PD(port) | DATA0_VAL_PD(port) | DATA1_VAL_PD);
+	tegra_pmc_writel(pmc, reg, PMC_USB_AO);
+
+	usleep_range(50, 100);
+
+	/* set the wake signaling trigger events */
+	reg = tegra_pmc_readl(pmc, PMC_UHSIC_SLEEP_CFG);
+	reg &= ~UHSIC_WAKE_VAL(~0);
+	reg |= UHSIC_WAKE_VAL_SD10;
+	tegra_pmc_writel(pmc, reg, PMC_UHSIC_SLEEP_CFG);
+
+	/* enable the wake detection */
+	reg = tegra_pmc_readl(pmc, PMC_UHSIC_SLEEP_CFG);
+	reg |= UHSIC_MASTER_ENABLE;
+	tegra_pmc_writel(pmc, reg, PMC_UHSIC_SLEEP_CFG);
+
+	reg = tegra_pmc_readl(pmc, PMC_UTMIP_UHSIC_LINE_WAKEUP);
+	reg |= UHSIC_LINE_WAKEUP_EN;
+	tegra_pmc_writel(pmc, reg, PMC_UTMIP_UHSIC_LINE_WAKEUP);
+
+	return 0;
+}
+EXPORT_SYMBOL(tegra_pmc_hsic_phy_enable_sleepwalk);
+
+int tegra_pmc_hsic_phy_disable_sleepwalk(int port)
+{
+	u32 reg;
+
+	pr_debug("PMC %s : port %dn", __func__, port);
+
+	/* disable the wake detection */
+	reg = tegra_pmc_readl(pmc, PMC_UHSIC_SLEEP_CFG);
+	reg &= ~UHSIC_MASTER_ENABLE;
+	tegra_pmc_writel(pmc, reg, PMC_UHSIC_SLEEP_CFG);
+
+	reg = tegra_pmc_readl(pmc, PMC_UTMIP_UHSIC_LINE_WAKEUP);
+	reg &= ~UHSIC_LINE_WAKEUP_EN;
+	tegra_pmc_writel(pmc, reg, PMC_UTMIP_UHSIC_LINE_WAKEUP);
+
+	/* disable wake event triggers of sleepwalk logic */
+	reg = tegra_pmc_readl(pmc, PMC_UHSIC_SLEEP_CFG);
+	reg &= ~UHSIC_WAKE_VAL(~0);
+	reg |= UHSIC_WAKE_VAL_NONE;
+	tegra_pmc_writel(pmc, reg, PMC_UHSIC_SLEEP_CFG);
+
+	/* power down the line state detectors of the port */
+	reg = tegra_pmc_readl(pmc, PMC_USB_AO);
+	reg |= (STROBE_VAL_PD(port) | DATA0_VAL_PD(port) | DATA1_VAL_PD);
+	tegra_pmc_writel(pmc, reg, PMC_USB_AO);
+
+	/* clear alarm of the sleepwalk logic */
+	reg = tegra_pmc_readl(pmc, PMC_UTMIP_UHSIC_TRIGGERS);
+	reg |= UHSIC_CLR_WAKE_ALARM;
+	tegra_pmc_writel(pmc, reg, PMC_UTMIP_UHSIC_TRIGGERS);
+
+	return 0;
+}
+EXPORT_SYMBOL(tegra_pmc_hsic_phy_disable_sleepwalk);
+
 /**
  * tegra_powergate_power_on() - power on partition
  * @id: partition ID
diff --git a/include/soc/tegra/pmc.h b/include/soc/tegra/pmc.h
index 57e58faf660b..987109e79da9 100644
--- a/include/soc/tegra/pmc.h
+++ b/include/soc/tegra/pmc.h
@@ -11,6 +11,7 @@
 #define __SOC_TEGRA_PMC_H__
 
 #include <linux/reboot.h>
+#include <linux/usb/ch9.h>
 
 #include <soc/tegra/pm.h>
 
@@ -171,6 +172,18 @@ enum tegra_suspend_mode tegra_pmc_get_suspend_mode(void);
 void tegra_pmc_set_suspend_mode(enum tegra_suspend_mode mode);
 void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode);
 
+/* T210 USB2 SLEEPWALK APIs */
+struct tegra_utmi_pad_config {
+	u32 tctrl;
+	u32 pctrl;
+	u32 rpd_ctrl;
+};
+int tegra_pmc_utmi_phy_enable_sleepwalk(int port, enum usb_device_speed speed,
+					struct tegra_utmi_pad_config *config);
+int tegra_pmc_utmi_phy_disable_sleepwalk(int port);
+int tegra_pmc_hsic_phy_enable_sleepwalk(int port);
+int tegra_pmc_hsic_phy_disable_sleepwalk(int port);
+
 #else
 static inline int tegra_powergate_power_on(unsigned int id)
 {
-- 
2.17.1
