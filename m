From: Alexandre Bailon <abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 4/4] ARM: dts: da850: Add the usb otg device node
Date: Wed, 26 Oct 2016 17:03:57 +0200
Message-ID: <1477494237-22831-5-git-send-email-abailon@baylibre.com>
References: <1477494237-22831-1-git-send-email-abailon@baylibre.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477494237-22831-1-git-send-email-abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, b-liu-l0cyMroinI0@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Alexandre Bailon <abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds the device tree node for the usb otg
controller present in the da850 family of SoC's.
This also enables the otg usb controller for the lcdk board.

Signed-off-by: Alexandre Bailon <abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/da850-lcdk.dts |  8 ++++++++
 arch/arm/boot/dts/da850.dtsi     | 15 +++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/da850-lcdk.dts b/arch/arm/boot/dts/da850-lcdk.dts
index 7b8ab21..9f5040c 100644
--- a/arch/arm/boot/dts/da850-lcdk.dts
+++ b/arch/arm/boot/dts/da850-lcdk.dts
@@ -158,6 +158,14 @@
 	rx-num-evt = <32>;
 };
 
+&usb_phy {
+	status = "okay";
+	};
+
+&usb0 {
+	status = "okay";
+};
+
 &aemif {
 	pinctrl-names = "default";
 	pinctrl-0 = <&nand_pins>;
diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
index f79e1b9..322a31a 100644
--- a/arch/arm/boot/dts/da850.dtsi
+++ b/arch/arm/boot/dts/da850.dtsi
@@ -372,6 +372,21 @@
 					>;
 			status = "disabled";
 		};
+		usb_phy: usb-phy {
+			compatible = "ti,da830-usb-phy";
+			#phy-cells = <1>;
+			status = "disabled";
+		};
+		usb0: usb@200000 {
+			compatible = "ti,da830-musb";
+			reg = <0x200000 0x10000>;
+			interrupts = <58>;
+			interrupt-names = "mc";
+			dr_mode = "otg";
+			phys = <&usb_phy 0>;
+			phy-names = "usb-phy";
+			status = "disabled";
+		};
 		gpio: gpio@226000 {
 			compatible = "ti,dm6441-gpio";
 			gpio-controller;
-- 
2.7.3

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
