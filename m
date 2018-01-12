From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: [PATCH 1/2] dts: ARM: Aspeed-g5: Add missing USB clock and pinmux
Date: Fri, 12 Jan 2018 17:02:01 +1100
Message-ID: <1515736921.31850.92.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joel Stanley <joel.stanley-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds the clock and pinmux default references to
the Aspeed G5 SoC base device-tree for USB. The clk and
pinmux drivers already know about these.

Signed-off-by: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
---
 arch/arm/boot/dts/aspeed-g5.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 8b3986a941f5..3c5c9b952ba8 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -142,6 +142,7 @@
 			compatible = "aspeed,ast2500-ehci", "generic-ehci";
 			reg = <0x1e6a1000 0x100>;
 			interrupts = <5>;
+			clocks = <&syscon ASPEED_CLK_GATE_USBPORT1CLK>;
 			status = "disabled";
 		};
 
@@ -149,6 +150,7 @@
 			compatible = "aspeed,ast2500-ehci", "generic-ehci";
 			reg = <0x1e6a3000 0x100>;
 			interrupts = <13>;
+			clocks = <&syscon ASPEED_CLK_GATE_USBPORT2CLK>;
 			status = "disabled";
 		};
 
@@ -157,6 +159,7 @@
 			reg = <0x1e6b0000 0x100>;
 			interrupts = <14>;
 			#ports = <2>;
+			clocks = <&syscon ASPEED_CLK_GATE_USBUHCICLK>;
 			status = "disabled";
 		};
 
@@ -1387,6 +1390,21 @@
 		groups = "USBCKI";
 	};
 
+	pinctrl_usb2ah_default: usb2ah_default {
+		function = "USB2AH";
+		groups = "USB2AH";
+	};
+
+	pinctrl_usb11bhid_default: usb11bhid_default {
+		function = "USB11BHID";
+		groups = "USB11BHID";
+	};
+
+	pinctrl_usb2bh_default: usb2bh_default {
+		function = "USB2BH";
+		groups = "USB2BH";
+	};
+
 	pinctrl_vgabiosrom_default: vgabiosrom_default {
 		function = "VGABIOSROM";
 		groups = "VGABIOSROM";
-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
