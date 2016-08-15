From: William Wu <william.wu@rock-chips.com>
Subject: [PATCH v9 1/5] usb: dwc3: add dis_u2_freeclk_exists_quirk
Date: Mon, 15 Aug 2016 14:59:55 +0800
Message-ID: <1471244399-1356-2-git-send-email-william.wu@rock-chips.com>
References: <1471244399-1356-1-git-send-email-william.wu@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1471244399-1356-1-git-send-email-william.wu@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, balbi@kernel.org, heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org, briannorris@google.com, dianders@google.com, kever.yang@rock-chips.com, huangtao@rock-chips.com, frank.wang@rock-chips.com, eddie.cai@rock-chips.com, John.Youn@synopsys.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, sergei.shtylyov@cogentembedded.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, zhengsq@rock-chips.com, zyw@rock-chips.com, William Wu <william.wu@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Add a quirk to clear the GUSB2PHYCFG.U2_FREECLK_EXISTS bit,
which specifies whether the USB2.0 PHY provides a free-running
PHY clock, which is active when the clock control input is active.

Signed-off-by: William Wu <william.wu@rock-chips.com>
Acked-by: Rob Herring <robh@kernel.org>
---
Changes in v9:
- None

Changes in v8:
- add Acked-by (Rob Herring)

Changes in v7:
- None

Changes in v6:
- use '-' instead of '_' in dts (Rob Herring)

Changes in v5:
- None

Changes in v4:
- rebase on top of balbi testing/next, remove pdata (balbi)

Changes in v3:
- None

Changes in v2:
- None

 Documentation/devicetree/bindings/usb/dwc3.txt | 3 +++
 drivers/usb/dwc3/core.c                        | 5 +++++
 drivers/usb/dwc3/core.h                        | 5 +++++
 3 files changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 7d7ce08..020b0e9 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -39,6 +39,9 @@ Optional properties:
 			disabling the suspend signal to the PHY.
  - snps,dis_rxdet_inp3_quirk: when set core will disable receiver detection
 			in PHY P3 power state.
+ - snps,dis-u2-freeclk-exists-quirk: when set, clear the u2_freeclk_exists
+			in GUSB2PHYCFG, specify that USB2 PHY doesn't provide
+			a free-running PHY clock.
  - snps,is-utmi-l1-suspend: true when DWC3 asserts output signal
 			utmi_l1_suspend_n, false when asserts utmi_sleep_n
  - snps,hird-threshold: HIRD threshold
diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 35d0924..14316e5 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -500,6 +500,9 @@ static int dwc3_phy_setup(struct dwc3 *dwc)
 	if (dwc->dis_enblslpm_quirk)
 		reg &= ~DWC3_GUSB2PHYCFG_ENBLSLPM;
 
+	if (dwc->dis_u2_freeclk_exists_quirk)
+		reg &= ~DWC3_GUSB2PHYCFG_U2_FREECLK_EXISTS;
+
 	dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(0), reg);
 
 	return 0;
@@ -924,6 +927,8 @@ static int dwc3_probe(struct platform_device *pdev)
 				"snps,dis_enblslpm_quirk");
 	dwc->dis_rxdet_inp3_quirk = device_property_read_bool(dev,
 				"snps,dis_rxdet_inp3_quirk");
+	dwc->dis_u2_freeclk_exists_quirk = device_property_read_bool(dev,
+				"snps,dis-u2-freeclk-exists-quirk");
 
 	dwc->tx_de_emphasis_quirk = device_property_read_bool(dev,
 				"snps,tx_de_emphasis_quirk");
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 1a6cc48..08ed9e0 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -199,6 +199,7 @@
 
 /* Global USB2 PHY Configuration Register */
 #define DWC3_GUSB2PHYCFG_PHYSOFTRST	(1 << 31)
+#define DWC3_GUSB2PHYCFG_U2_FREECLK_EXISTS	(1 << 30)
 #define DWC3_GUSB2PHYCFG_SUSPHY		(1 << 6)
 #define DWC3_GUSB2PHYCFG_ULPI_UTMI	(1 << 4)
 #define DWC3_GUSB2PHYCFG_ENBLSLPM	(1 << 8)
@@ -803,6 +804,9 @@ struct dwc3_scratchpad_array {
  * @dis_u2_susphy_quirk: set if we disable usb2 suspend phy
  * @dis_enblslpm_quirk: set if we clear enblslpm in GUSB2PHYCFG,
  *                      disabling the suspend signal to the PHY.
+ * @dis_u2_freeclk_exists_quirk : set if we clear u2_freeclk_exists
+ *			in GUSB2PHYCFG, specify that USB2 PHY doesn't
+ *			provide a free-running PHY clock.
  * @tx_de_emphasis_quirk: set if we enable Tx de-emphasis quirk
  * @tx_de_emphasis: Tx de-emphasis value
  * 	0	- -6dB de-emphasis
@@ -946,6 +950,7 @@ struct dwc3 {
 	unsigned		dis_u2_susphy_quirk:1;
 	unsigned		dis_enblslpm_quirk:1;
 	unsigned		dis_rxdet_inp3_quirk:1;
+	unsigned		dis_u2_freeclk_exists_quirk:1;
 
 	unsigned		tx_de_emphasis_quirk:1;
 	unsigned		tx_de_emphasis:2;
-- 
1.9.1
