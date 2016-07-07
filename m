From: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v6 4/5] usb: dwc3: add dis_del_phy_power_chg_quirk
Date: Thu,  7 Jul 2016 10:54:25 +0800
Message-ID: <1467860066-15142-5-git-send-email-william.wu@rock-chips.com>
References: <1467860066-15142-1-git-send-email-william.wu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1467860066-15142-1-git-send-email-william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org, William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add a quirk to clear the GUSB3PIPECTL.DELAYP1TRANS bit,
which specifies whether disable delay PHY power change
from P0 to P1/P2/P3 when link state changing from U0
to U1/U2/U3 respectively.

Signed-off-by: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
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
index 8d7317d..1c140df 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -42,6 +42,8 @@ Optional properties:
  - snps,dis-u2-freeclk-exists-quirk: when set, clear the u2_freeclk_exists
 			in GUSB2PHYCFG, specify that USB2 PHY doesn't provide
 			a free-running PHY clock.
+ - snps,dis-del-phy-power-chg-quirk: when set core will change PHY power
+			from P0 to P1/P2/P3 without delay.
  - snps,phyif-utmi-quirk: when set core will set phyif UTMI+ interface.
  - snps,phyif-utmi: the value to configure the core to support a UTMI+ PHY
 			with an 8- or 16-bit interface. Value 0 select 8-bit
diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 94036b1..e79d6a4 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -449,6 +449,9 @@ static int dwc3_phy_setup(struct dwc3 *dwc)
 	if (dwc->dis_u3_susphy_quirk)
 		reg &= ~DWC3_GUSB3PIPECTL_SUSPHY;
 
+	if (dwc->dis_del_phy_power_chg_quirk)
+		reg &= ~DWC3_GUSB3PIPECTL_DEPOCHANGE;
+
 	dwc3_writel(dwc->regs, DWC3_GUSB3PIPECTL(0), reg);
 
 	reg = dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(0));
@@ -943,6 +946,8 @@ static int dwc3_probe(struct platform_device *pdev)
 				"snps,dis_rxdet_inp3_quirk");
 	dwc->dis_u2_freeclk_exists_quirk = device_property_read_bool(dev,
 				"snps,dis-u2-freeclk-exists-quirk");
+	dwc->dis_del_phy_power_chg_quirk = device_property_read_bool(dev,
+				"snps,dis-del-phy-power-chg-quirk");
 	dwc->phyif_utmi_quirk = device_property_read_bool(dev,
 				"snps,phyif-utmi-quirk");
 	 device_property_read_u8(dev, "snps,phyif-utmi",
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index cf6696c..55e136d 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -809,6 +809,8 @@ struct dwc3_scratchpad_array {
  * @dis_u2_freeclk_exists_quirk : set if we clear u2_freeclk_exists
  *			in GUSB2PHYCFG, specify that USB2 PHY doesn't
  *			provide a free-running PHY clock.
+ * @dis_del_phy_power_chg_quirk: set if we disable delay phy power
+ *			change quirk.
  * @phyif_utmi_quirk: set if we enable phyif UTMI+ quirk
  * @phyif_utmi: UTMI+ PHY interface value
  *	0	- 8 bits
@@ -957,6 +959,7 @@ struct dwc3 {
 	unsigned		dis_enblslpm_quirk:1;
 	unsigned		dis_rxdet_inp3_quirk:1;
 	unsigned		dis_u2_freeclk_exists_quirk:1;
+	unsigned		dis_del_phy_power_chg_quirk:1;
 
 	unsigned		phyif_utmi_quirk:1;
 	unsigned		phyif_utmi:1;
-- 
1.9.1
