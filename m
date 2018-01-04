From: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v2 08/10] ARM: dts: keystone-k2g: Move usb-phy nodes out of soc0
Date: Thu, 4 Jan 2018 13:56:59 -0600
Message-ID: <20180104195701.4042-9-afd@ti.com>
References: <20180104195701.4042-1-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180104195701.4042-1-afd-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Andrew F . Davis" <afd-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The two usb-phy nodes are not memory-mapped devices on the
SoC but rather dummy phys for SoCs with transparent autonomous
NOP phys. Move these to outside soc0 to their own node like
done elsewhere.

Signed-off-by: Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org>
Acked-by: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
---
 arch/arm/boot/dts/keystone-k2g.dtsi | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/keystone-k2g.dtsi b/arch/arm/boot/dts/keystone-k2g.dtsi
index d83dbfe24b49..cdaf519721b1 100644
--- a/arch/arm/boot/dts/keystone-k2g.dtsi
+++ b/arch/arm/boot/dts/keystone-k2g.dtsi
@@ -69,6 +69,24 @@
 		interrupts = <GIC_SPI 4 IRQ_TYPE_EDGE_RISING>;
 	};
 
+	usbphy {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "simple-bus";
+
+		usb0_phy: usb-phy@0 {
+			compatible = "usb-nop-xceiv";
+			reg = <0>;
+			status = "disabled";
+		};
+
+		usb1_phy: usb-phy@1 {
+			compatible = "usb-nop-xceiv";
+			reg = <1>;
+			status = "disabled";
+		};
+	};
+
 	soc0: soc@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -465,11 +483,6 @@
 			status = "disabled";
 		};
 
-		usb0_phy: usb-phy@0 {
-			compatible = "usb-nop-xceiv";
-			status = "disabled";
-		};
-
 		keystone_usb0: keystone-dwc3@2680000 {
 			compatible = "ti,keystone-dwc3";
 			#address-cells = <1>;
@@ -493,11 +506,6 @@
 			};
 		};
 
-		usb1_phy: usb-phy@1 {
-			compatible = "usb-nop-xceiv";
-			status = "disabled";
-		};
-
 		keystone_usb1: keystone-dwc3@2580000 {
 			compatible = "ti,keystone-dwc3";
 			#address-cells = <1>;
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
