From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 5/6] dt-bindings: mt8173-xhci: add reference clock
Date: Mon, 6 Feb 2017 17:29:00 +0800
Message-ID: <1486373341-4399-5-git-send-email-chunfeng.yun@mediatek.com>
References: <1486373341-4399-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1486373341-4399-1-git-send-email-chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Due to the reference clock comes from 26M oscillator directly
on mt8173, and it is a fixed-clock in DTS which always turned
on, we ignore it before. But on some platforms, it comes
from PLL, and need be controlled, so here add it, no matter
it is a fixed-clock or not.

Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/usb/mt8173-xhci.txt        |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/mt8173-xhci.txt b/Documentation/devicetree/bindings/usb/mt8173-xhci.txt
index 2a930bd..ab8bb27 100644
--- a/Documentation/devicetree/bindings/usb/mt8173-xhci.txt
+++ b/Documentation/devicetree/bindings/usb/mt8173-xhci.txt
@@ -23,6 +23,7 @@ Required properties:
 	entry in clock-names
  - clock-names : must contain
 	"sys_ck": for clock of xHCI MAC
+	"ref_ck": for reference clock of xHCI MAC
 	"wakeup_deb_p0": for USB wakeup debounce clock of port0
 	"wakeup_deb_p1": for USB wakeup debounce clock of port1
 
@@ -47,10 +48,10 @@ usb30: usb@11270000 {
 	reg-names = "mac", "ippc";
 	interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_LOW>;
 	power-domains = <&scpsys MT8173_POWER_DOMAIN_USB>;
-	clocks = <&topckgen CLK_TOP_USB30_SEL>,
+	clocks = <&topckgen CLK_TOP_USB30_SEL>, <&clk26m>,
 		 <&pericfg CLK_PERI_USB0>,
 		 <&pericfg CLK_PERI_USB1>;
-	clock-names = "sys_ck",
+	clock-names = "sys_ck", "ref_ck",
 		      "wakeup_deb_p0",
 		      "wakeup_deb_p1";
 	phys = <&phy_port0 PHY_TYPE_USB3>,
@@ -82,6 +83,7 @@ Required properties:
 	entry in clock-names
  - clock-names : must be
 	"sys_ck": for clock of xHCI MAC
+	"ref_ck": for reference clock of xHCI MAC
 
 Optional properties:
  - vbus-supply : reference to the VBUS regulator;
@@ -94,8 +96,8 @@ usb30: usb@11270000 {
 	reg-names = "mac";
 	interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_LOW>;
 	power-domains = <&scpsys MT8173_POWER_DOMAIN_USB>;
-	clocks = <&topckgen CLK_TOP_USB30_SEL>;
-	clock-names = "sys_ck";
+	clocks = <&topckgen CLK_TOP_USB30_SEL>, <&clk26m>;
+	clock-names = "sys_ck", "ref_ck";
 	vusb33-supply = <&mt6397_vusb_reg>;
 	usb3-lpm-capable;
 };
-- 
1.7.9.5
