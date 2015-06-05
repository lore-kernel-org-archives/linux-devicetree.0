From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 04/20] ARM: dts: sun7i: Add USB Dual Role Controller
Date: Fri,  5 Jun 2015 21:02:07 +0200
Message-ID: <1433530943-12599-5-git-send-email-hdegoede@redhat.com>
References: <1433530943-12599-1-git-send-email-hdegoede@redhat.com>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBSPEY6VQKGQEQAGVHXQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1433530943-12599-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Add a node for the otg/drc usb controller to sun7i-a20.dtsi

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun7i-a20.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index 6a63f30..7549f1b 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -699,6 +699,18 @@
 			#size-cells = <0>;
 		};
 
+		usb_otg: usb@01c13000 {
+			compatible = "allwinner,sun4i-a10-musb";
+			reg = <0x01c13000 0x0400>;
+			clocks = <&ahb_gates 0>;
+			interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "mc";
+			phys = <&usbphy 0>;
+			phy-names = "usb";
+			allwinner,sram = <&otg_sram 1>;
+			status = "disabled";
+		};
+
 		usbphy: phy@01c13400 {
 			#phy-cells = <1>;
 			compatible = "allwinner,sun7i-a20-usb-phy";
-- 
2.4.2
