From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 9/9] dt-bindings: usb: mtk-xhci: remove dummy clocks and
 add optional ones
Date: Fri, 13 Oct 2017 16:26:41 +0800
Message-ID: <6a5d01f35d7df6a49d0442c8326c3daa9bcda9d3.1507882470.git.chunfeng.yun@mediatek.com>
References: <994382d16d6bdc0f3d7c11b22f1710252e056e34.1507882470.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <994382d16d6bdc0f3d7c11b22f1710252e056e34.1507882470.git.chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Remove dummy clocks for usb wakeup and add optional ones for
MCU_BUS_CK and DMA_BUS_CK.

Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/usb/mediatek,mtk-xhci.txt  |   18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt
index 2d9b459..3059596 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt
@@ -26,10 +26,11 @@ Required properties:
  - clocks : a list of phandle + clock-specifier pairs, one for each
 	entry in clock-names
  - clock-names : must contain
-	"sys_ck": for clock of xHCI MAC
-	"ref_ck": for reference clock of xHCI MAC
-	"wakeup_deb_p0": for USB wakeup debounce clock of port0
-	"wakeup_deb_p1": for USB wakeup debounce clock of port1
+	"sys_ck": controller clock used by normal mode,
+	the following ones are optional:
+	"ref_ck": reference clock used by low power mode etc,
+	"mcu_ck": mcu_bus clock for register access,
+	"dma_ck": dma_bus clock for data transfer by DMA
 
  - phys : a list of phandle + phy specifier pairs
 
@@ -57,9 +58,7 @@ usb30: usb@11270000 {
 	clocks = <&topckgen CLK_TOP_USB30_SEL>, <&clk26m>,
 		 <&pericfg CLK_PERI_USB0>,
 		 <&pericfg CLK_PERI_USB1>;
-	clock-names = "sys_ck", "ref_ck",
-		      "wakeup_deb_p0",
-		      "wakeup_deb_p1";
+	clock-names = "sys_ck", "ref_ck";
 	phys = <&phy_port0 PHY_TYPE_USB3>,
 	       <&phy_port1 PHY_TYPE_USB2>;
 	vusb33-supply = <&mt6397_vusb_reg>;
@@ -91,9 +90,8 @@ Required properties:
 
  - clocks : a list of phandle + clock-specifier pairs, one for each
 	entry in clock-names
- - clock-names : must be
-	"sys_ck": for clock of xHCI MAC
-	"ref_ck": for reference clock of xHCI MAC
+ - clock-names : must contain "sys_ck", and the following ones are optional:
+	"ref_ck", "mcu_ck" and "dma_ck"
 
 Optional properties:
  - vbus-supply : reference to the VBUS regulator;
-- 
1.7.9.5
