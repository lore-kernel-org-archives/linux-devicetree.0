From: Zoltan HERPAI <wigyori-1V5s5g7wVVk@public.gmane.org>
Subject: [PATCH v2] ARM: sun4i: dt: Add basic board support for
 LinkSprite pcDuino
Date: Mon, 13 Jan 2014 14:15:01 +0100 (CET)
Message-ID: <alpine.DEB.2.02.1401131406230.17739@trabant.deployis.eu>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; format=flowed; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDXMFKNVRQIRBWGNZ6LAKGQENUMJFRI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

>From b2cd1681fe988584028d280ca79249f4ebcb271c Mon Sep 17 00:00:00 2001
From: Zoltan HERPAI <wigyori-1V5s5g7wVVk@public.gmane.org>
Date: Mon, 13 Jan 2014 14:00:12 +0100
Subject: [PATCH v2] ARM: sun4i: dt: Add basic board support for LinkSprite pcDuino

This patch will add a basic board support DT for the
LinkSprite pcDuino board.

Signed-off-by: Zoltan HERPAI <wigyori-1V5s5g7wVVk@public.gmane.org>
---
  arch/arm/boot/dts/Makefile              |    1 +
  arch/arm/boot/dts/sun4i-a10-pcduino.dts |   48 +++++++++++++++++++++++++++++++
  2 files changed, 49 insertions(+), 0 deletions(-)
  create mode 100644 arch/arm/boot/dts/sun4i-a10-pcduino.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index b663ed7..a2e3620 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -253,6 +253,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += \
  	sun4i-a10-cubieboard.dtb \
  	sun4i-a10-mini-xplus.dtb \
  	sun4i-a10-hackberry.dtb \
+	sun4i-a10-pcduino.dtb \
  	sun5i-a10s-olinuxino-micro.dtb \
  	sun5i-a13-olinuxino.dtb \
  	sun5i-a13-olinuxino-micro.dtb \
diff --git a/arch/arm/boot/dts/sun4i-a10-pcduino.dts b/arch/arm/boot/dts/sun4i-a10-pcduino.dts
new file mode 100644
index 0000000..f5692a3
--- /dev/null
+++ b/arch/arm/boot/dts/sun4i-a10-pcduino.dts
@@ -0,0 +1,48 @@
+/*
+ * Copyright 2014 Zoltan HERPAI
+ * Zoltan HERPAI <wigyori-1V5s5g7wVVk@public.gmane.org>
+ *
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+
+/dts-v1/;
+/include/ "sun4i-a10.dtsi"
+
+/ {
+	model = "LinkSprite pcDuino";
+	compatible = "linksprite,a10-pcduino", "allwinner,sun4i-a10";
+
+	soc@01c00000 {
+		emac: ethernet@01c0b000 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&emac_pins_a>;
+			phy = <&phy1>;
+			status = "okay";
+		};
+
+		mdio@01c0b080 {
+			status = "okay";
+
+			phy1: ethernet-phy@1 {
+				reg = <1>;
+			};
+		};
+
+		uart0: serial@01c28000 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart0_pins_a>;
+			status = "okay";
+		};
+
+		i2c0: i2c@01c2ac00 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c0_pins_a>;
+			status = "okay";
+		};
+	};
+};
-- 
1.7.0.4
