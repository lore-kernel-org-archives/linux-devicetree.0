From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2,
 6/6] dt-bindings: phy-mt65xx-usb: add support for new version phy
Date: Fri, 20 Jan 2017 16:18:41 +0800
Message-ID: <1484900321-26933-6-git-send-email-chunfeng.yun@mediatek.com>
References: <1484900321-26933-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1484900321-26933-1-git-send-email-chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

add a new compatible string for "mt2712", and move reference clock
into each port node;

Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 .../devicetree/bindings/phy/phy-mt65xx-usb.txt     |   91 +++++++++++++++++---
 1 file changed, 77 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/phy-mt65xx-usb.txt b/Documentation/devicetree/bindings/phy/phy-mt65xx-usb.txt
index 33a2b1e..1d06604 100644
--- a/Documentation/devicetree/bindings/phy/phy-mt65xx-usb.txt
+++ b/Documentation/devicetree/bindings/phy/phy-mt65xx-usb.txt
@@ -6,21 +6,27 @@ This binding describes a usb3.0 phy for mt65xx platforms of Medaitek SoC.
 Required properties (controller (parent) node):
  - compatible	: should be one of
 		  "mediatek,mt2701-u3phy"
+		  "mediatek,mt2712-u3phy"
 		  "mediatek,mt8173-u3phy"
- - reg		: offset and length of register for phy, exclude port's
-		  register.
- - clocks	: a list of phandle + clock-specifier pairs, one for each
-		  entry in clock-names
- - clock-names	: must contain
-		  "u3phya_ref": for reference clock of usb3.0 analog phy.
 
 Required nodes	: a sub-node is required for each port the controller
 		  provides. Address range information including the usual
 		  'reg' property is used inside these nodes to describe
 		  the controller's topology.
 
+Optional properties (controller (parent) node):
+ - reg		: offset and length of register shared by multiple ports,
+		  exclude port's private register. It is needed on mt2701
+		  and mt8173, but not on mt2712.
+
 Required properties (port (child) node):
 - reg		: address and length of the register set for the port.
+- clocks	: a list of phandle + clock-specifier pairs, one for each
+		  entry in clock-names
+- clock-names	: must contain
+		  "ref_clk": 48M reference clock for HighSpeed analog phy; and
+			26M reference clock for SuperSpeed analog phy, sometimes is
+			24M, 25M or 27M, depended on platform.
 - #phy-cells	: should be 1 (See second example)
 		  cell after port phandle is phy type from:
 			- PHY_TYPE_USB2
@@ -31,21 +37,31 @@ Example:
 u3phy: usb-phy@11290000 {
 	compatible = "mediatek,mt8173-u3phy";
 	reg = <0 0x11290000 0 0x800>;
-	clocks = <&apmixedsys CLK_APMIXED_REF2USB_TX>;
-	clock-names = "u3phya_ref";
 	#address-cells = <2>;
 	#size-cells = <2>;
 	ranges;
 	status = "okay";
 
-	phy_port0: port@11290800 {
-		reg = <0 0x11290800 0 0x800>;
+	u2port0: port@11290800 {
+		reg = <0 0x11290800 0 0x100>;
+		clocks = <&apmixedsys CLK_APMIXED_REF2USB_TX>;
+		clock-names = "ref_clk";
 		#phy-cells = <1>;
 		status = "okay";
 	};
 
-	phy_port1: port@11291000 {
-		reg = <0 0x11291000 0 0x800>;
+	u3port0: port@11290900 {
+		reg = <0 0x11290800 0 0x700>;
+		clocks = <&clk26m>;
+		clock-names = "ref_clk";
+		#phy-cells = <1>;
+		status = "okay";
+	};
+
+	u2port1: port@11291000 {
+		reg = <0 0x11291000 0 0x100>;
+		clocks = <&apmixedsys CLK_APMIXED_REF2USB_TX>;
+		clock-names = "ref_clk";
 		#phy-cells = <1>;
 		status = "okay";
 	};
@@ -64,7 +80,54 @@ Example:
 
 usb30: usb@11270000 {
 	...
-	phys = <&phy_port0 PHY_TYPE_USB3>;
-	phy-names = "usb3-0";
+	phys = <&u2port0 PHY_TYPE_USB2>, <&u3port0 PHY_TYPE_USB3>;
+	phy-names = "usb2-0", "usb3-0";
 	...
 };
+
+
+Layout differences of banks between mt8173/mt2701 and mt2712
+-------------------------------------------------------------
+mt8173 and mt2701:
+port        offset    bank
+shared      0x0000    SPLLC
+            0x0100    FMREG
+u2 port0    0x0800    U2PHY_COM
+u3 port0    0x0900    U3PHYD
+            0x0a00    U3PHYD_BANK2
+            0x0b00    U3PHYA
+            0x0c00    U3PHYA_DA
+u2 port1    0x1000    U2PHY_COM
+u3 port1    0x1100    U3PHYD
+            0x1200    U3PHYD_BANK2
+            0x1300    U3PHYA
+            0x1400    U3PHYA_DA
+u2 port2    0x1800    U2PHY_COM
+            ...
+
+mt2712:
+port        offset    bank
+u2 port0    0x0000    MISC
+            0x0100    FMREG
+            0x0300    U2PHY_COM
+u3 port0    0x0700    SPLLC
+            0x0800    CHIP
+            0x0900    U3PHYD
+            0x0a00    U3PHYD_BANK2
+            0x0b00    U3PHYA
+            0x0c00    U3PHYA_DA
+u2 port1    0x1000    MISC
+            0x1100    FMREG
+            0x1300    U2PHY_COM
+u3 port1    0x1700    SPLLC
+            0x1800    CHIP
+            0x1900    U3PHYD
+            0x1a00    U3PHYD_BANK2
+            0x1b00    U3PHYA
+            0x1c00    U3PHYA_DA
+u2 port2    0x2000    MISC
+            ...
+
+    SPLLC shared by u3 ports and FMREG shared by u2 ports on
+mt8173/mt2701 are put back into each port; a new bank MISC for
+u2 ports and CHIP for u3 ports are added on mt2712.
-- 
1.7.9.5
