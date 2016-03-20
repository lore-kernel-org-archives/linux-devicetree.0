From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/8] ARM: dts: sun8i: Add usbphy and usb host
 controller nodes
Date: Sun, 20 Mar 2016 17:00:31 +0100
Message-ID: <1458489636-2825-4-git-send-email-hdegoede@redhat.com>
References: <1458489636-2825-1-git-send-email-hdegoede@redhat.com>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBOESXO3QKGQEI3GXRMA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1458489636-2825-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Krzysztof Adamski <k@japko.eu>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>

Add nodes describing the H3's usbphy and usb host controller nodes.

Signed-off-by: Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>
Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun8i-h3.dtsi | 101 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3.dtsi
index 3a2e6e2..4a4926b 100644
--- a/arch/arm/boot/dts/sun8i-h3.dtsi
+++ b/arch/arm/boot/dts/sun8i-h3.dtsi
@@ -389,6 +389,107 @@
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
+			resets = <&ahb_rst 25>, <&ahb_rst 29>;
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
+			resets = <&ahb_rst 29>, <&ahb_rst 25>;
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
+			resets = <&ahb_rst 26>, <&ahb_rst 30>;
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
+			resets = <&ahb_rst 30>, <&ahb_rst 26>;
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
+			resets = <&ahb_rst 27>, <&ahb_rst 31>;
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
+			resets = <&ahb_rst 31>, <&ahb_rst 27>;
+			phys = <&usbphy 3>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
 		pio: pinctrl@01c20800 {
 			compatible = "allwinner,sun8i-h3-pinctrl";
 			reg = <0x01c20800 0x400>;
-- 
2.7.3
