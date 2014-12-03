From: vishnupatekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/3] ARM:dts:sun7i:ps2 added nodes for Sun7i A20
 PS2 controller. 	added ps2 nodes in lime2 board dts.
Date: Thu,  4 Dec 2014 04:36:03 +0530
Message-ID: <1417647963-28077-1-git-send-email-VishnuPatekar0510@gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBD64TFVR3YIBB55O72RQKGQEE5X5L6A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, inux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vishnupatekar <VishnuPatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

---
 arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts |   10 ++++++++
 arch/arm/boot/dts/sun7i-a20.dtsi                |   30 ++++++++++++++++++++++-
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts b/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts
index ed364d5..374897b 100644
--- a/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts
+++ b/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts
@@ -112,6 +112,16 @@
 			pinctrl-0 = <&uart0_pins_a>;
 			status = "okay";
 		};
+		ps20: ps2@0x01c2a000 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&ps2_0_pins>;
+			status = "okay";
+		};
+		ps21: ps2@0x01c2a400 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&ps2_1_pins>;
+			status = "okay";
+		};
 
 		i2c0: i2c@01c2ac00 {
 			pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index 8605f2b..c77635d 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -357,7 +357,7 @@
 
 		usb_clk: clk@01c200cc {
 			#clock-cells = <1>;
-		        #reset-cells = <1>;
+			#reset-cells = <1>;
 			compatible = "allwinner,sun4i-a10-usb-clk";
 			reg = <0x01c200cc 0x4>;
 			clocks = <&pll6 1>;
@@ -852,6 +852,19 @@
 				    allwinner,drive = <0>;
 				    allwinner,pull = <0>;
 			};
+			ps2_0_pins: ps2_0@0 {
+				    allwinner,pins = "PI20","PI21";
+				    allwinner,function = "ps2";
+				    allwinner,drive = <0>;
+				    allwinner,pull = <0>;
+			};
+			ps2_1_pins: ps2_1@0 {
+				    allwinner,pins = "PH12","PH13";
+				    allwinner,function = "ps2";
+				    allwinner,drive = <0>;
+				    allwinner,pull = <0>;
+			};
+
 		};
 
 		timer@01c20c00 {
@@ -1079,5 +1092,20 @@
 			#interrupt-cells = <3>;
 			interrupts = <1 9 0xf04>;
 		};
+		ps20: ps2@0x01c2a000 {
+			compatible = "allwinner,sun7i-a20-ps2";
+			reg = <0x01c2a000 0x400>;
+			interrupts = <0 62 4>;
+			clocks = <&apb1_gates 6>;
+			status = "disabled";
+		};
+		ps21: ps2@0x01c2a400 {
+			compatible = "allwinner,sun7i-a20-ps2";
+			reg = <0x01c2a400 0x400>;
+			interrupts = <0 63 4>;
+			clocks = <&apb1_gates 7>;
+			status = "disabled";
+		};
+
 	};
 };
-- 
1.7.9.5
