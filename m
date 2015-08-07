From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/3] ARM: dts: sun6i: Columbus: Add i2c
 controller for communicating with the LCD
Date: Fri,  7 Aug 2015 17:22:35 +0200
Message-ID: <1438960955-6551-3-git-send-email-hdegoede@redhat.com>
References: <1438960955-6551-1-git-send-email-hdegoede@redhat.com>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBQM2SOXAKGQENTZ5FNA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1438960955-6551-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Colombus development kit uses an optional 2048x1536 edp panel using
an anx9804 parallel lcd to edp convertor. The anx9804 chip is controlled
via an i2c bus which is connected to 2 regular gpio pins.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun6i-a31-colombus.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/sun6i-a31-colombus.dts b/arch/arm/boot/dts/sun6i-a31-colombus.dts
index 0d0b6f2..0e51249 100644
--- a/arch/arm/boot/dts/sun6i-a31-colombus.dts
+++ b/arch/arm/boot/dts/sun6i-a31-colombus.dts
@@ -60,6 +60,16 @@
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	i2c_lcd: i2c@0 {
+		/* The lcd panel i2c interface is hooked up via gpios */
+		compatible = "i2c-gpio";
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2c_lcd_pins>;
+		gpios = <&pio 0 23 GPIO_ACTIVE_HIGH>, /* PA23, sda */
+			<&pio 0 24 GPIO_ACTIVE_HIGH>; /* PA24, scl */
+		i2c-gpio,delay-us = <5>;
+	};
 };
 
 &ehci1 {
@@ -124,6 +134,13 @@
 		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
+
+	i2c_lcd_pins: i2c_lcd_pin@0 {
+		allwinner,pins = "PA23", "PA24";
+		allwinner,function = "gpio_out";
+		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
+		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+	};
 };
 
 &reg_usb2_vbus {
-- 
2.4.3
