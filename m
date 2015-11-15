From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 4/5] ARM: dts: sun8i: Add usbphy and usb host controller nodes
Date: Sun, 15 Nov 2015 20:46:16 +0100
Message-ID: <1447616777-24660-4-git-send-email-hdegoede@redhat.com>
References: <1447616777-24660-1-git-send-email-hdegoede@redhat.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447616777-24660-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>

Add nodes describing the H3's usbphy and usb host controller nodes.

Signed-off-by: Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>
Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun8i-h3.dtsi | 101 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3.dtsi
index 22ff593..0faa38a 100644
--- a/arch/arm/boot/dts/sun8i-h3.dtsi
+++ b/arch/arm/boot/dts/sun8i-h3.dtsi
@@ -359,6 +359,107 @@
 			#size-cells = <0>;
 		};
 
+		usbphy: phy@01c19400 {
+			compatible = "allwinner,sun8i-h3-usb-phy";
+			reg = <0x01c19400 0x2c>,
+			      <0x01c1a800 0x4>,
+			      <0x01c1b800 0x4>,
+			      <0x01c1c800 0x4>,
+			      <0x01c1d800 0x4>;
+			reg-names = "phy_ctrl",
+				    "pmu0",
+				    "pmu1",
+				    "pmu2",
+				    "pmu3";
+			clocks = <&usb_clk 8>,
+				 <&usb_clk 9>,
+				 <&usb_clk 10>,
+				 <&usb_clk 11>;
+			clock-names = "usb0_phy",
+				      "usb1_phy",
+				      "usb2_phy",
+				      "usb3_phy";
+			resets = <&usb_clk 0>,
+				 <&usb_clk 1>,
+				 <&usb_clk 2>,
+				 <&usb_clk 3>;
+			reset-names = "usb0_reset",
+				      "usb1_reset",
+				      "usb2_reset",
+				      "usb3_reset";
+			status = "disabled";
+			#phy-cells = <1>;
+		};
+
+		ehci1: usb@01c1b000 {
+			compatible = "allwinner,sun8i-h3-ehci", "generic-ehci";
+			reg = <0x01c1b000 0x100>;
+			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&bus_gates 25>, <&bus_gates 29>;
+			resets = <&bus_rst 25>, <&bus_rst 29>;
+			phys = <&usbphy 1>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
+		ohci1: usb@01c1b400 {
+			compatible = "allwinner,sun8i-h3-ohci", "generic-ohci";
+			reg = <0x01c1b400 0x100>;
+			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&bus_gates 29>, <&bus_gates 25>,
+				 <&usb_clk 17>;
+			resets = <&bus_rst 29>, <&bus_rst 25>;
+			phys = <&usbphy 1>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
+		ehci2: usb@01c1c000 {
+			compatible = "allwinner,sun8i-h3-ehci", "generic-ehci";
+			reg = <0x01c1c000 0x100>;
+			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&bus_gates 26>, <&bus_gates 30>;
+			resets = <&bus_rst 26>, <&bus_rst 30>;
+			phys = <&usbphy 2>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
+		ohci2: usb@01c1c400 {
+			compatible = "allwinner,sun8i-h3-ohci", "generic-ohci";
+			reg = <0x01c1c400 0x100>;
+			interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&bus_gates 30>, <&bus_gates 26>,
+				 <&usb_clk 18>;
+			resets = <&bus_rst 30>, <&bus_rst 26>;
+			phys = <&usbphy 2>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
+		ehci3: usb@01c1d000 {
+			compatible = "allwinner,sun8i-h3-ehci", "generic-ehci";
+			reg = <0x01c1d000 0x100>;
+			interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&bus_gates 27>, <&bus_gates 31>;
+			resets = <&bus_rst 27>, <&bus_rst 31>;
+			phys = <&usbphy 3>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
+		ohci3: usb@01c1d400 {
+			compatible = "allwinner,sun8i-h3-ohci", "generic-ohci";
+			reg = <0x01c1d400 0x100>;
+			interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&bus_gates 31>, <&bus_gates 27>,
+				 <&usb_clk 19>;
+			resets = <&bus_rst 31>, <&bus_rst 27>;
+			phys = <&usbphy 3>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
 		pio: pinctrl@01c20800 {
 			compatible = "allwinner,sun8i-h3-pinctrl";
 			reg = <0x01c20800 0x400>;
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
