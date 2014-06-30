From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 8/9] ARM: dts: sun4i: Add ir controller nodes
 and pinmux
Date: Mon, 30 Jun 2014 23:57:58 +0200
Message-ID: <1404165479-23785-9-git-send-email-hdegoede@redhat.com>
References: <1404165479-23785-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDRZXY4CYYORBBV3Y6OQKGQEXFU7TGY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1404165479-23785-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Zoltan HERPAI <wigyori-1V5s5g7wVVk@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun4i-a10.dtsi | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/sun4i-a10.dtsi b/arch/arm/boot/dts/sun4i-a10.dtsi
index ae6dd50..ec00030 100644
--- a/arch/arm/boot/dts/sun4i-a10.dtsi
+++ b/arch/arm/boot/dts/sun4i-a10.dtsi
@@ -593,6 +593,20 @@
 				allwinner,drive = <0>;
 				allwinner,pull = <1>;
 			};
+
+			ir0_pins_a: ir0@0 {
+				allwinner,pins = "PB3","PB4";
+				allwinner,function = "ir0";
+				allwinner,drive = <0>;
+				allwinner,pull = <0>;
+			};
+
+			ir1_pins_a: ir1@0 {
+				allwinner,pins = "PB22","PB23";
+				allwinner,function = "ir1";
+				allwinner,drive = <0>;
+				allwinner,pull = <0>;
+			};
 		};
 
 		timer@01c20c00 {
@@ -621,6 +635,24 @@
 			status = "disabled";
 		};
 
+		ir0: ir@01c21800 {
+			compatible = "allwinner,sun4i-a10-ir";
+			clocks = <&apb0_gates 6>, <&ir0_clk>;
+			clock-names = "apb", "ir";
+			interrupts = <5>;
+			reg = <0x01c21800 0x40>;
+			status = "disabled";
+		};
+
+		ir1: ir@01c21c00 {
+			compatible = "allwinner,sun4i-a10-ir";
+			clocks = <&apb0_gates 7>, <&ir1_clk>;
+			clock-names = "apb", "ir";
+			interrupts = <6>;
+			reg = <0x01c21c00 0x40>;
+			status = "disabled";
+		};
+
 		lradc: lradc@01c22800 {
 			compatible = "allwinner,sun4i-lradc-keys";
 			reg = <0x01c22800 0x100>;
-- 
2.0.0
