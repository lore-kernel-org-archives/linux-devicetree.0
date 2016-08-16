From: William Wu <william.wu@rock-chips.com>
Subject: [PATCH v11 4/5] usb: dwc3: add dis_del_phy_power_chg_quirk
Date: Tue, 16 Aug 2016 22:44:39 +0800
Message-ID: <1471358680-30857-5-git-send-email-william.wu@rock-chips.com>
References: <1471358680-30857-1-git-send-email-william.wu@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1471358680-30857-1-git-send-email-william.wu@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, balbi@kernel.org, heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org, briannorris@google.com, dianders@google.com, kever.yang@rock-chips.com, huangtao@rock-chips.com, frank.wang@rock-chips.com, eddie.cai@rock-chips.com, John.Youn@synopsys.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, sergei.shtylyov@cogentembedded.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, zhengsq@rock-chips.com, zyw@rock-chips.com, William Wu <william.wu@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Add a quirk to clear the GUSB3PIPECTL.DELAYP1TRANS bit,
which specifies whether disable delay PHY power change
from P0 to P1/P2/P3 when link state changing from U0
to U1/U2/U3 respectively.

Signed-off-by: William Wu <william.wu@rock-chips.com>
Acked-by: Rob Herring <robh@kernel.org>
---
Changes in v11:
- None

Changes in v10:
- None

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

 Documentation/devicetree/bindings/usb/dwc3.txt | 2 ++
 drivers/usb/dwc3/core.c                        | 5 +++++
 drivers/usb/dwc3/core.h                        | 3 +++
 3 files changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 020b0e9..e96bfc2 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -42,6 +42,8 @@ Optional properties:
  - snps,dis-u2-freeclk-exists-quirk: when set, clear the u2_freeclk_exists
 			in GUSB2PHYCFG, specify that USB2 PHY doesn't provide
 			a free-running PHY clock.
+ - snps,dis-del-phy-power-chg-quirk: when set core will change PHY power
+			from P0 to P1/P2/P3 without delay.
  - snps,is-utmi-l1-suspend: true when DWC3 asserts output signal
 			utmi_l1_suspend_n, false when asserts utmi_sleep_n
  - snps,hird-threshold: HIRD threshold
diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index cdac019..e887b38 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -448,6 +448,9 @@ static int dwc3_phy_setup(struct dwc3 *dwc)
 	if (dwc->dis_u3_susphy_quirk)
 		reg &= ~DWC3_GUSB3PIPECTL_SUSPHY;
 
+	if (dwc->dis_del_phy_power_chg_quirk)
+		reg &= ~DWC3_GUSB3PIPECTL_DEPOCHANGE;
+
 	dwc3_writel(dwc->regs, DWC3_GUSB3PIPECTL(0), reg);
 
 	reg = dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(0));
@@ -947,6 +950,8 @@ static int dwc3_probe(struct platform_device *pdev)
 				"snps,dis_rxdet_inp3_quirk");
 	dwc->dis_u2_freeclk_exists_quirk = device_property_read_bool(dev,
 				"snps,dis-u2-freeclk-exists-quirk");
+	dwc->dis_del_phy_power_chg_quirk = device_property_read_bool(dev,
+				"snps,dis-del-phy-power-chg-quirk");
 
 	dwc->tx_de_emphasis_quirk = device_property_read_bool(dev,
 				"snps,tx_de_emphasis_quirk");
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index cc4f551..3d94acd 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -818,6 +818,8 @@ struct dwc3_scratchpad_array {
  * @dis_u2_freeclk_exists_quirk : set if we clear u2_freeclk_exists
  *			in GUSB2PHYCFG, specify that USB2 PHY doesn't
  *			provide a free-running PHY clock.
+ * @dis_del_phy_power_chg_quirk: set if we disable delay phy power
+ *			change quirk.
  * @tx_de_emphasis_quirk: set if we enable Tx de-emphasis quirk
  * @tx_de_emphasis: Tx de-emphasis value
  * 	0	- -6dB de-emphasis
@@ -963,6 +965,7 @@ struct dwc3 {
 	unsigned		dis_enblslpm_quirk:1;
 	unsigned		dis_rxdet_inp3_quirk:1;
 	unsigned		dis_u2_freeclk_exists_quirk:1;
+	unsigned		dis_del_phy_power_chg_quirk:1;
 
 	unsigned		tx_de_emphasis_quirk:1;
 	unsigned		tx_de_emphasis:2;
-- 
1.9.1
