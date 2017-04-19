From: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v3] usb: dwc3: add disable u2mac linestate check quirk
Date: Wed, 19 Apr 2017 20:11:38 +0800
Message-ID: <1492603898-25070-1-git-send-email-william.wu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, groeck-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds a quirk to disable USB 2.0 MAC linestate check
during HS transmit. Refer the dwc3 databook, we can use it for
some special platforms if the linestate not reflect the expected
line state(J) during transmission.

When use this quirk, the controller implements a fixed 40-bit
TxEndDelay after the packet is given on UTMI and ignores the
linestate during the transmit of a token (during token-to-token
and token-to-data IPGAP).

On some rockchip platforms (e.g. rk3399), it requires to disable
the u2mac linestate check to decrease the SSPLIT token to SETUP
token inter-packet delay from 566ns to 466ns, and fix the issue
that FS/LS devices not recognized if inserted through USB 3.0 HUB.

Signed-off-by: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
Changes in v3:
- change quirk name
- only read and write GUCTL1 if dwc3 version >= 2.50a

Changes in v2:
- fix coding style

 Documentation/devicetree/bindings/usb/dwc3.txt |  2 ++
 drivers/usb/dwc3/core.c                        | 20 ++++++++++++++------
 drivers/usb/dwc3/core.h                        |  4 ++++
 3 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index f658f39..52fb410 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -45,6 +45,8 @@ Optional properties:
 			a free-running PHY clock.
  - snps,dis-del-phy-power-chg-quirk: when set core will change PHY power
 			from P0 to P1/P2/P3 without delay.
+ - snps,dis-tx-ipgap-linecheck-quirk: when set, disable u2mac linestate check
+			during HS transmit.
  - snps,is-utmi-l1-suspend: true when DWC3 asserts output signal
 			utmi_l1_suspend_n, false when asserts utmi_sleep_n
  - snps,hird-threshold: HIRD threshold
diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 455d89a..9d5a67c 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -796,13 +796,19 @@ static int dwc3_core_init(struct dwc3 *dwc)
 		dwc3_writel(dwc->regs, DWC3_GUCTL2, reg);
 	}
 
-	/*
-	 * Enable hardware control of sending remote wakeup in HS when
-	 * the device is in the L1 state.
-	 */
-	if (dwc->revision >= DWC3_REVISION_290A) {
+	if (dwc->revision >= DWC3_REVISION_250A) {
 		reg = dwc3_readl(dwc->regs, DWC3_GUCTL1);
-		reg |= DWC3_GUCTL1_DEV_L1_EXIT_BY_HW;
+
+		/*
+		 * Enable hardware control of sending remote wakeup
+		 * in HS when the device is in the L1 state.
+		 */
+		if (dwc->revision >= DWC3_REVISION_290A)
+			reg |= DWC3_GUCTL1_DEV_L1_EXIT_BY_HW;
+
+		if (dwc->dis_tx_ipgap_linecheck_quirk)
+			reg |= DWC3_GUCTL1_TX_IPGAP_LINECHECK_DIS;
+
 		dwc3_writel(dwc->regs, DWC3_GUCTL1, reg);
 	}
 
@@ -1023,6 +1029,8 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 				"snps,dis-u2-freeclk-exists-quirk");
 	dwc->dis_del_phy_power_chg_quirk = device_property_read_bool(dev,
 				"snps,dis-del-phy-power-chg-quirk");
+	dwc->dis_tx_ipgap_linecheck_quirk = device_property_read_bool(dev,
+				"snps,dis-tx-ipgap-linecheck-quirk");
 
 	dwc->tx_de_emphasis_quirk = device_property_read_bool(dev,
 				"snps,tx_de_emphasis_quirk");
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 981c77f..6f6294d 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -204,6 +204,7 @@
 #define DWC3_GCTL_DSBLCLKGTNG		BIT(0)
 
 /* Global User Control 1 Register */
+#define DWC3_GUCTL1_TX_IPGAP_LINECHECK_DIS	BIT(28)
 #define DWC3_GUCTL1_DEV_L1_EXIT_BY_HW	BIT(24)
 
 /* Global USB2 PHY Configuration Register */
@@ -850,6 +851,8 @@ struct dwc3_scratchpad_array {
  *			provide a free-running PHY clock.
  * @dis_del_phy_power_chg_quirk: set if we disable delay phy power
  *			change quirk.
+ * @dis_tx_ipgap_linecheck_quirk: set if we disable u2mac linestate
+ *			check during HS transmit.
  * @tx_de_emphasis_quirk: set if we enable Tx de-emphasis quirk
  * @tx_de_emphasis: Tx de-emphasis value
  * 	0	- -6dB de-emphasis
@@ -1004,6 +1007,7 @@ struct dwc3 {
 	unsigned		dis_rxdet_inp3_quirk:1;
 	unsigned		dis_u2_freeclk_exists_quirk:1;
 	unsigned		dis_del_phy_power_chg_quirk:1;
+	unsigned		dis_tx_ipgap_linecheck_quirk:1;
 
 	unsigned		tx_de_emphasis_quirk:1;
 	unsigned		tx_de_emphasis:2;
-- 
2.0.0
