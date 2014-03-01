From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 05/19] ARM: sun5i: dt: Add USB host bindings
Date: Sat,  1 Mar 2014 20:26:24 +0100
Message-ID: <1393701998-3553-6-git-send-email-hdegoede@redhat.com>
References: <1393701998-3553-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDL4X2GMZUKRB7XIZCMAKGQEJ3UEGCI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
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
 arch/arm/boot/dts/sun5i-a10s.dtsi | 32 ++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/sun5i-a13.dtsi  | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 64 insertions(+)

diff --git a/arch/arm/boot/dts/sun5i-a10s.dtsi b/arch/arm/boot/dts/sun5i-a10s.dtsi
index a7198b6..9fc375a 100644
--- a/arch/arm/boot/dts/sun5i-a10s.dtsi
+++ b/arch/arm/boot/dts/sun5i-a10s.dtsi
@@ -338,6 +338,38 @@
 			#size-cells = <0>;
 		};
 
+		usbphy: phy@01c13400 {
+			#phy-cells = <1>;
+			compatible = "allwinner,sun5i-a13-usb-phy";
+			reg = <0x01c13400 0x10 0x01c14800 0x4>;
+			reg-names = "phy_ctrl", "pmu1";
+			clocks = <&usb_clk 8>;
+			clock-names = "usb_phy";
+			resets = <&usb_clk 1>;
+			reset-names = "usb1_reset";
+			status = "disabled";
+		};
+
+		ehci0: usb@01c14000 {
+			compatible = "allwinner,sun5i-a10s-ehci", "generic-ehci";
+			reg = <0x01c14000 0x100>;
+			interrupts = <39>;
+			clocks = <&ahb_gates 1>;
+			phys = <&usbphy 1>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
+		ohci0: usb@01c14400 {
+			compatible = "allwinner,sun5i-a10s-ohci", "generic-ohci";
+			reg = <0x01c14400 0x100>;
+			interrupts = <40>;
+			clocks = <&usb_clk 6>, <&ahb_gates 2>;
+			phys = <&usbphy 1>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
 		spi2: spi@01c17000 {
 			compatible = "allwinner,sun4i-a10-spi";
 			reg = <0x01c17000 0x1000>;
diff --git a/arch/arm/boot/dts/sun5i-a13.dtsi b/arch/arm/boot/dts/sun5i-a13.dtsi
index cda1d4b..8931c08 100644
--- a/arch/arm/boot/dts/sun5i-a13.dtsi
+++ b/arch/arm/boot/dts/sun5i-a13.dtsi
@@ -320,6 +320,38 @@
 			#size-cells = <0>;
 		};
 
+		usbphy: phy@01c13400 {
+			#phy-cells = <1>;
+			compatible = "allwinner,sun5i-a13-usb-phy";
+			reg = <0x01c13400 0x10 0x01c14800 0x4>;
+			reg-names = "phy_ctrl", "pmu1";
+			clocks = <&usb_clk 8>;
+			clock-names = "usb_phy";
+			resets = <&usb_clk 1>;
+			reset-names = "usb1_reset";
+			status = "disabled";
+		};
+
+		ehci0: usb@01c14000 {
+			compatible = "allwinner,sun5i-a13-ehci", "generic-ehci";
+			reg = <0x01c14000 0x100>;
+			interrupts = <39>;
+			clocks = <&ahb_gates 1>;
+			phys = <&usbphy 1>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
+		ohci0: usb@01c14400 {
+			compatible = "allwinner,sun5i-a13-ohci", "generic-ohci";
+			reg = <0x01c14400 0x100>;
+			interrupts = <40>;
+			clocks = <&usb_clk 6>, <&ahb_gates 2>;
+			phys = <&usbphy 1>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
 		spi2: spi@01c17000 {
 			compatible = "allwinner,sun4i-a10-spi";
 			reg = <0x01c17000 0x1000>;
-- 
1.9.0
