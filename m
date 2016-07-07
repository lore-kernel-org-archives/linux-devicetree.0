From: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v6 2/5] usb: dwc3: add dis_u2_freeclk_exists_quirk
Date: Thu,  7 Jul 2016 10:54:23 +0800
Message-ID: <1467860066-15142-3-git-send-email-william.wu@rock-chips.com>
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

Add a quirk to clear the GUSB2PHYCFG.U2_FREECLK_EXISTS bit,
which specifies whether the USB2.0 PHY provides a free-running
PHY clock, which is active when the clock control input is active.

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
index 9466431..0b7bfd2 100644
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
index 45d6de5..f321a5c 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -199,6 +199,7 @@
 
 /* Global USB2 PHY Configuration Register */
 #define DWC3_GUSB2PHYCFG_PHYSOFTRST	(1 << 31)
+#define DWC3_GUSB2PHYCFG_U2_FREECLK_EXISTS	(1 << 30)
 #define DWC3_GUSB2PHYCFG_SUSPHY		(1 << 6)
 #define DWC3_GUSB2PHYCFG_ULPI_UTMI	(1 << 4)
 #define DWC3_GUSB2PHYCFG_ENBLSLPM	(1 << 8)
@@ -799,6 +800,9 @@ struct dwc3_scratchpad_array {
  * @dis_u2_susphy_quirk: set if we disable usb2 suspend phy
  * @dis_enblslpm_quirk: set if we clear enblslpm in GUSB2PHYCFG,
  *                      disabling the suspend signal to the PHY.
+ * @dis_u2_freeclk_exists_quirk : set if we clear u2_freeclk_exists
+ *			in GUSB2PHYCFG, specify that USB2 PHY doesn't
+ *			provide a free-running PHY clock.
  * @tx_de_emphasis_quirk: set if we enable Tx de-emphasis quirk
  * @tx_de_emphasis: Tx de-emphasis value
  * 	0	- -6dB de-emphasis
@@ -942,6 +946,7 @@ struct dwc3 {
 	unsigned		dis_u2_susphy_quirk:1;
 	unsigned		dis_enblslpm_quirk:1;
 	unsigned		dis_rxdet_inp3_quirk:1;
+	unsigned		dis_u2_freeclk_exists_quirk:1;
 
 	unsigned		tx_de_emphasis_quirk:1;
 	unsigned		tx_de_emphasis:2;
-- 
1.9.1
