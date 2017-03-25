From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: [PATCH v5 5/8] ARM: sunxi: h3/h5: add usb_otg and
 OHCI/EHCI for usbc0 on H3/H5
Date: Sat, 25 Mar 2017 22:50:12 +0800
Message-ID: <20170325145015.22076-6-icenowy@aosc.xyz>
References: <20170325145015.22076-1-icenowy@aosc.xyz>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBUMI3LDAKGQEK7Z4KQY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170325145015.22076-1-icenowy-ymACFijhrKM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Allwinner H3/H5 have a dual-routed USB PHY0 -- routed to either OHCI/EHCI
or MUSB controller.

Add device nodes for these controllers.

Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
---
Changes in v5:
- Change the size of &usb_otg address space from 0x0400 to 0x400.
Changes in v4:
- Add h5 to commit message.
Changes in v3:
- Add "h3:" to commit message.

 arch/arm/boot/dts/sunxi-h3-h5.dtsi | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
index 2494ea063cd4..6640ebfa6419 100644
--- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
+++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
@@ -144,6 +144,19 @@
 			#size-cells = <0>;
 		};
 
+		usb_otg: usb@01c19000 {
+			compatible = "allwinner,sun8i-h3-musb";
+			reg = <0x01c19000 0x400>;
+			clocks = <&ccu CLK_BUS_OTG>;
+			resets = <&ccu RST_BUS_OTG>;
+			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "mc";
+			phys = <&usbphy 0>;
+			phy-names = "usb";
+			extcon = <&usbphy 0>;
+			status = "disabled";
+		};
+
 		usbphy: phy@01c19400 {
 			compatible = "allwinner,sun8i-h3-usb-phy";
 			reg = <0x01c19400 0x2c>,
@@ -176,6 +189,25 @@
 			#phy-cells = <1>;
 		};
 
+		ehci0: usb@01c1a000 {
+			compatible = "allwinner,sun8i-h3-ehci", "generic-ehci";
+			reg = <0x01c1a000 0x100>;
+			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_EHCI0>, <&ccu CLK_BUS_OHCI0>;
+			resets = <&ccu RST_BUS_EHCI0>, <&ccu RST_BUS_OHCI0>;
+			status = "disabled";
+		};
+
+		ohci0: usb@01c1a400 {
+			compatible = "allwinner,sun8i-h3-ohci", "generic-ohci";
+			reg = <0x01c1a400 0x100>;
+			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_EHCI0>, <&ccu CLK_BUS_OHCI0>,
+				 <&ccu CLK_USB_OHCI0>;
+			resets = <&ccu RST_BUS_EHCI0>, <&ccu RST_BUS_OHCI0>;
+			status = "disabled";
+		};
+
 		ehci1: usb@01c1b000 {
 			compatible = "allwinner,sun8i-h3-ehci", "generic-ehci";
 			reg = <0x01c1b000 0x100>;
-- 
2.12.0
