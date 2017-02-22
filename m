From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 6/8] arm64: dts: mt8173: split usb SuperSpeed port into two ports
Date: Wed, 22 Feb 2017 16:55:03 +0800
Message-ID: <1487753705-6745-6-git-send-email-chunfeng.yun@mediatek.com>
References: <1487753705-6745-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1487753705-6745-1-git-send-email-chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

split the old SuperSpeed port node into a HighSpeed one and a new
SuperSpeed one.

Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi |   19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 12e7027..12c90e5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -724,8 +724,9 @@
 			      <0 0x11280700 0 0x0100>;
 			reg-names = "mac", "ippc";
 			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_LOW>;
-			phys = <&phy_port0 PHY_TYPE_USB3>,
-			       <&phy_port1 PHY_TYPE_USB2>;
+			phys = <&u2port0 PHY_TYPE_USB2>,
+			       <&u3port0 PHY_TYPE_USB3>,
+			       <&u2port1 PHY_TYPE_USB2>;
 			power-domains = <&scpsys MT8173_POWER_DOMAIN_USB>;
 			clocks = <&topckgen CLK_TOP_USB30_SEL>,
 				 <&pericfg CLK_PERI_USB0>,
@@ -761,14 +762,20 @@
 			ranges;
 			status = "okay";
 
-			phy_port0: port@11290800 {
-				reg = <0 0x11290800 0 0x800>;
+			u2port0: usb-phy@11290800 {
+				reg = <0 0x11290800 0 0x100>;
 				#phy-cells = <1>;
 				status = "okay";
 			};
 
-			phy_port1: port@11291000 {
-				reg = <0 0x11291000 0 0x800>;
+			u3port0: usb-phy@11290900 {
+				reg = <0 0x11290900 0 0x700>;
+				#phy-cells = <1>;
+				status = "okay";
+			};
+
+			u2port1: usb-phy@11291000 {
+				reg = <0 0x11291000 0 0x100>;
 				#phy-cells = <1>;
 				status = "okay";
 			};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
