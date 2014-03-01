From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 06/19] ARM: sun7i: dt: Add USB host bindings
Date: Sat,  1 Mar 2014 20:26:25 +0100
Message-ID: <1393701998-3553-7-git-send-email-hdegoede@redhat.com>
References: <1393701998-3553-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDL4X2GMZUKRBAPJZCMAKGQEGTHHKXA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1393701998-3553-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Add nodes for the usb-phy and ehci- and ohci-usb-host controllers.

Signed-off-by: Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun7i-a20.dtsi | 52 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index 9952c1e..0db55ac 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -439,6 +439,38 @@
 			#size-cells = <0>;
 		};
 
+		usbphy: phy@01c13400 {
+			#phy-cells = <1>;
+			compatible = "allwinner,sun7i-a20-usb-phy";
+			reg = <0x01c13400 0x10 0x01c14800 0x4 0x01c1c800 0x4>;
+			reg-names = "phy_ctrl", "pmu1", "pmu2";
+			clocks = <&usb_clk 8>;
+			clock-names = "usb_phy";
+			resets = <&usb_clk 1>, <&usb_clk 2>;
+			reset-names = "usb1_reset", "usb2_reset";
+			status = "disabled";
+		};
+
+		ehci0: usb@01c14000 {
+			compatible = "allwinner,sun7i-a20-ehci", "generic-ehci";
+			reg = <0x01c14000 0x100>;
+			interrupts = <0 39 4>;
+			clocks = <&ahb_gates 1>;
+			phys = <&usbphy 1>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
+		ohci0: usb@01c14400 {
+			compatible = "allwinner,sun7i-a20-ohci", "generic-ohci";
+			reg = <0x01c14400 0x100>;
+			interrupts = <0 64 4>;
+			clocks = <&usb_clk 6>, <&ahb_gates 2>;
+			phys = <&usbphy 1>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
 		spi2: spi@01c17000 {
 			compatible = "allwinner,sun4i-a10-spi";
 			reg = <0x01c17000 0x1000>;
@@ -458,6 +490,26 @@
 			status = "disabled";
 		};
 
+		ehci1: usb@01c1c000 {
+			compatible = "allwinner,sun7i-a20-ehci", "generic-ehci";
+			reg = <0x01c1c000 0x100>;
+			interrupts = <0 40 4>;
+			clocks = <&ahb_gates 3>;
+			phys = <&usbphy 2>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
+		ohci1: usb@01c1c400 {
+			compatible = "allwinner,sun7i-a20-ohci", "generic-ohci";
+			reg = <0x01c1c400 0x100>;
+			interrupts = <0 65 4>;
+			clocks = <&usb_clk 7>, <&ahb_gates 4>;
+			phys = <&usbphy 2>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
 		spi3: spi@01c1f000 {
 			compatible = "allwinner,sun4i-a10-spi";
 			reg = <0x01c1f000 0x1000>;
-- 
1.9.0
