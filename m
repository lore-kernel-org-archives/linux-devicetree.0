From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 9/9] ARM: sunxi: Convert pinctrl nodes to generic bindings
Date: Mon,  3 Oct 2016 12:21:07 +0200
Message-ID: <1f67fc945364c4347108d5c82e50de3d2abe4e8d.1475489558.git-series.maxime.ripard@free-electrons.com>
References: <cover.26c6f76b361d146fb079d744251f020ef6d2db7d.1475489558.git-series.maxime.ripard@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.26c6f76b361d146fb079d744251f020ef6d2db7d.1475489558.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
In-Reply-To: <cover.26c6f76b361d146fb079d744251f020ef6d2db7d.1475489558.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
References: <cover.26c6f76b361d146fb079d744251f020ef6d2db7d.1475489558.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Now that we can handle the generic pinctrl bindings, convert our DT to it.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/boot/dts/ntc-gr8-evb.dts                        |  16 +-
 arch/arm/boot/dts/ntc-gr8.dtsi                           |  76 +--
 arch/arm/boot/dts/sun4i-a10-a1000.dts                    |   8 +-
 arch/arm/boot/dts/sun4i-a10-ba10-tvbox.dts               |   2 +-
 arch/arm/boot/dts/sun4i-a10-chuwi-v7-cw0825.dts          |  12 +-
 arch/arm/boot/dts/sun4i-a10-cubieboard.dts               |  12 +-
 arch/arm/boot/dts/sun4i-a10-dserve-dsrv9703c.dts         |  28 +-
 arch/arm/boot/dts/sun4i-a10-gemei-g9.dts                 |   4 +-
 arch/arm/boot/dts/sun4i-a10-hackberry.dts                |   8 +-
 arch/arm/boot/dts/sun4i-a10-hyundai-a7hd.dts             |  14 +-
 arch/arm/boot/dts/sun4i-a10-inet1.dts                    |  20 +-
 arch/arm/boot/dts/sun4i-a10-inet97fv2.dts                |  12 +-
 arch/arm/boot/dts/sun4i-a10-inet9f-rev03.dts             |  26 +-
 arch/arm/boot/dts/sun4i-a10-jesurun-q5.dts               |   8 +-
 arch/arm/boot/dts/sun4i-a10-marsboard.dts                |  10 +-
 arch/arm/boot/dts/sun4i-a10-mini-xplus.dts               |   2 +-
 arch/arm/boot/dts/sun4i-a10-mk802.dts                    |  12 +-
 arch/arm/boot/dts/sun4i-a10-olinuxino-lime.dts           |  22 +-
 arch/arm/boot/dts/sun4i-a10-pcduino.dts                  |  14 +-
 arch/arm/boot/dts/sun4i-a10-pcduino2.dts                 |   4 +-
 arch/arm/boot/dts/sun4i-a10-pov-protab2-ips9.dts         |  24 +-
 arch/arm/boot/dts/sun4i-a10.dtsi                         | 120 ++---
 arch/arm/boot/dts/sun5i-a10s-auxtek-t003.dts             |  16 +-
 arch/arm/boot/dts/sun5i-a10s-auxtek-t004.dts             |  24 +-
 arch/arm/boot/dts/sun5i-a10s-mk802.dts                   |  14 +-
 arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts         |  30 +-
 arch/arm/boot/dts/sun5i-a10s-r7-tv-dongle.dts            |  16 +-
 arch/arm/boot/dts/sun5i-a10s-wobo-i5.dts                 |  16 +-
 arch/arm/boot/dts/sun5i-a10s.dtsi                        |  48 +-
 arch/arm/boot/dts/sun5i-a13-empire-electronix-d709.dts   |  20 +-
 arch/arm/boot/dts/sun5i-a13-hsg-h702.dts                 |  18 +-
 arch/arm/boot/dts/sun5i-a13-olinuxino-micro.dts          |  32 +-
 arch/arm/boot/dts/sun5i-a13-olinuxino.dts                |  30 +-
 arch/arm/boot/dts/sun5i-a13-utoo-p66.dts                 |  14 +-
 arch/arm/boot/dts/sun5i-a13.dtsi                         |  18 +-
 arch/arm/boot/dts/sun5i-r8-chip.dts                      |   8 +-
 arch/arm/boot/dts/sun5i-reference-design-tablet.dtsi     |  26 +-
 arch/arm/boot/dts/sun5i.dtsi                             |  44 +-
 arch/arm/boot/dts/sun6i-a31-app4-evb1.dts                |   4 +-
 arch/arm/boot/dts/sun6i-a31-colombus.dts                 |  18 +-
 arch/arm/boot/dts/sun6i-a31-hummingbird.dts              |  18 +-
 arch/arm/boot/dts/sun6i-a31-i7.dts                       |  14 +-
 arch/arm/boot/dts/sun6i-a31-m9.dts                       |  14 +-
 arch/arm/boot/dts/sun6i-a31-mele-a1000g-quad.dts         |  14 +-
 arch/arm/boot/dts/sun6i-a31.dtsi                         | 116 ++---
 arch/arm/boot/dts/sun6i-a31s-primo81.dts                 |  16 +-
 arch/arm/boot/dts/sun6i-a31s-sina31s.dts                 |  10 +-
 arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts         |  22 +-
 arch/arm/boot/dts/sun6i-a31s-yones-toptech-bs1078-v2.dts |   8 +-
 arch/arm/boot/dts/sun6i-reference-design-tablet.dtsi     |  12 +-
 arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts         |  20 +-
 arch/arm/boot/dts/sun7i-a20-bananapi.dts                 |  20 +-
 arch/arm/boot/dts/sun7i-a20-bananapro.dts                |  26 +-
 arch/arm/boot/dts/sun7i-a20-cubieboard2.dts              |  10 +-
 arch/arm/boot/dts/sun7i-a20-cubietruck.dts               |  26 +-
 arch/arm/boot/dts/sun7i-a20-hummingbird.dts              |  16 +-
 arch/arm/boot/dts/sun7i-a20-i12-tvbox.dts                |  18 +-
 arch/arm/boot/dts/sun7i-a20-itead-ibox.dts               |   6 +-
 arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts                |  24 +-
 arch/arm/boot/dts/sun7i-a20-m3.dts                       |   4 +-
 arch/arm/boot/dts/sun7i-a20-mk808c.dts                   |   8 +-
 arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts           |  24 +-
 arch/arm/boot/dts/sun7i-a20-olinuxino-lime.dts           |  22 +-
 arch/arm/boot/dts/sun7i-a20-olinuxino-lime2-emmc.dts     |   4 +-
 arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts          |  26 +-
 arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts          |  24 +-
 arch/arm/boot/dts/sun7i-a20-orangepi-mini.dts            |  34 +-
 arch/arm/boot/dts/sun7i-a20-orangepi.dts                 |  28 +-
 arch/arm/boot/dts/sun7i-a20-pcduino3-nano.dts            |  18 +-
 arch/arm/boot/dts/sun7i-a20-pcduino3.dts                 |  16 +-
 arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts           |  18 +-
 arch/arm/boot/dts/sun7i-a20-wits-pro-a20-dkt.dts         |  10 +-
 arch/arm/boot/dts/sun7i-a20.dtsi                         | 204 ++++----
 arch/arm/boot/dts/sun8i-a23-a33.dtsi                     |  78 +--
 arch/arm/boot/dts/sun8i-a23-evb.dts                      |   6 +-
 arch/arm/boot/dts/sun8i-a23-polaroid-mid2407pxe03.dts    |   6 +-
 arch/arm/boot/dts/sun8i-a23-polaroid-mid2809pxe04.dts    |   6 +-
 arch/arm/boot/dts/sun8i-a33-inet-d978-rev2.dts           |   8 +-
 arch/arm/boot/dts/sun8i-a33-olinuxino.dts                |  12 +-
 arch/arm/boot/dts/sun8i-a33-sinlinx-sina33.dts           |  10 +-
 arch/arm/boot/dts/sun8i-a33.dtsi                         |   4 +-
 arch/arm/boot/dts/sun8i-a83t.dtsi                        |  16 +-
 arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts          |  12 +-
 arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts                |   8 +-
 arch/arm/boot/dts/sun8i-h3-orangepi-2.dts                |  18 +-
 arch/arm/boot/dts/sun8i-h3-orangepi-lite.dts             |  12 +-
 arch/arm/boot/dts/sun8i-h3-orangepi-one.dts              |  12 +-
 arch/arm/boot/dts/sun8i-h3-orangepi-pc-plus.dts          |   4 +-
 arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts               |  12 +-
 arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts             |   8 +-
 arch/arm/boot/dts/sun8i-h3.dtsi                          |  70 +--
 arch/arm/boot/dts/sun8i-q8-common.dtsi                   |   8 +-
 arch/arm/boot/dts/sun8i-r16-parrot.dts                   |  28 +-
 arch/arm/boot/dts/sun8i-reference-design-tablet.dtsi     |  20 +-
 arch/arm/boot/dts/sun9i-a80-cubieboard4.dts              |  12 +-
 arch/arm/boot/dts/sun9i-a80-optimus.dts                  |  24 +-
 arch/arm/boot/dts/sun9i-a80.dtsi                         |  44 +-
 arch/arm/boot/dts/sunxi-common-regulators.dtsi           |  16 +-
 98 files changed, 1077 insertions(+), 1077 deletions(-)

diff --git a/arch/arm/boot/dts/ntc-gr8-evb.dts b/arch/arm/boot/dts/ntc-gr8-evb.dts
index 5a97dea32f98..8441acb50a5c 100644
--- a/arch/arm/boot/dts/ntc-gr8-evb.dts
+++ b/arch/arm/boot/dts/ntc-gr8-evb.dts
@@ -226,23 +226,23 @@
 
 &pio {
 	mmc0_cd_pin_gr8_evb: mmc0-cd-pin@0 {
-		allwinner,pins = "PG0";
-		allwinner,function = "gpio_in";
+		pins = "PG0";
+		function = "gpio_in";
 	};
 
 	usb0_id_pin_gr8_evb: usb0-id-pin@0 {
-		allwinner,pins = "PG2";
-		allwinner,function = "gpio_in";
+		pins = "PG2";
+		function = "gpio_in";
 	};
 
 	usb0_vbus_det_pin_gr8_evb: usb0-vbus-det-pin@0 {
-		allwinner,pins = "PG1";
-		allwinner,function = "gpio_in";
+		pins = "PG1";
+		function = "gpio_in";
 	};
 
 	usb1_vbus_pin_gr8_evb: usb1-vbus-pin@0 {
-		allwinner,pins = "PG13";
-		allwinner,function = "gpio_out";
+		pins = "PG13";
+		function = "gpio_out";
 	};
 };
 
diff --git a/arch/arm/boot/dts/ntc-gr8.dtsi b/arch/arm/boot/dts/ntc-gr8.dtsi
index 1c46cd38d999..bbda3f78e6bd 100644
--- a/arch/arm/boot/dts/ntc-gr8.dtsi
+++ b/arch/arm/boot/dts/ntc-gr8.dtsi
@@ -764,87 +764,87 @@
 			#gpio-cells = <3>;
 
 			i2c0_pins_a: i2c0@0 {
-				allwinner,pins = "PB0", "PB1";
-				allwinner,function = "i2c0";
+				pins = "PB0", "PB1";
+				function = "i2c0";
 			};
 
 			i2c1_pins_a: i2c1@0 {
-				allwinner,pins = "PB15", "PB16";
-				allwinner,function = "i2c1";
+				pins = "PB15", "PB16";
+				function = "i2c1";
 			};
 
 			i2c2_pins_a: i2c2@0 {
-				allwinner,pins = "PB17", "PB18";
-				allwinner,function = "i2c2";
+				pins = "PB17", "PB18";
+				function = "i2c2";
 			};
 
 			i2s0_data_pins_a: i2s0-data@0 {
-				allwinner,pins = "PB6", "PB7", "PB8", "PB9";
-				allwinner,function = "i2s0";
+				pins = "PB6", "PB7", "PB8", "PB9";
+				function = "i2s0";
 			};
 
 			i2s0_mclk_pins_a: i2s0-mclk@0 {
-				allwinner,pins = "PB6", "PB7", "PB8", "PB9";
-				allwinner,function = "i2s0";
+				pins = "PB6", "PB7", "PB8", "PB9";
+				function = "i2s0";
 			};
 
 			ir0_rx_pins_a: ir0@0 {
-				allwinner,pins = "PB4";
-				allwinner,function = "ir0";
+				pins = "PB4";
+				function = "ir0";
 			};
 
 			lcd_rgb666_pins: lcd-rgb666@0 {
-				allwinner,pins = "PD2", "PD3", "PD4", "PD5", "PD6", "PD7",
-						 "PD10", "PD11", "PD12", "PD13", "PD14", "PD15",
-						 "PD18", "PD19", "PD20", "PD21", "PD22", "PD23",
-						 "PD24", "PD25", "PD26", "PD27";
-				allwinner,function = "lcd0";
+				pins = "PD2", "PD3", "PD4", "PD5", "PD6", "PD7",
+				       "PD10", "PD11", "PD12", "PD13", "PD14", "PD15",
+				       "PD18", "PD19", "PD20", "PD21", "PD22", "PD23",
+				       "PD24", "PD25", "PD26", "PD27";
+				function = "lcd0";
 			};
 
 			mmc0_pins_a: mmc0@0 {
-				allwinner,pins = "PF0", "PF1", "PF2", "PF3",
+				pins = "PF0", "PF1", "PF2", "PF3",
 						 "PF4", "PF5";
-				allwinner,function = "mmc0";
-				allwinner,drive = <SUN4I_PINCTRL_30_MA>;
+				function = "mmc0";
+				drive-strength = <30>;
 			};
 
 			nand_pins_a: nand-base0@0 {
-				allwinner,pins = "PC0", "PC1", "PC2",
-						"PC5", "PC8", "PC9", "PC10",
-						"PC11", "PC12", "PC13", "PC14",
-						"PC15";
-				allwinner,function = "nand0";
+				pins = "PC0", "PC1", "PC2",
+				       "PC5", "PC8", "PC9", "PC10",
+				       "PC11", "PC12", "PC13", "PC14",
+				       "PC15";
+				function = "nand0";
 			};
 
 			nand_cs0_pins_a: nand-cs@0 {
-				allwinner,pins = "PC4";
-				allwinner,function = "nand0";
+				pins = "PC4";
+				function = "nand0";
 			};
 
 			nand_rb0_pins_a: nand-rb@0 {
-				allwinner,pins = "PC6";
-				allwinner,function = "nand0";
+				pins = "PC6";
+				function = "nand0";
 			};
 
 			pwm0_pins_a: pwm0@0 {
-				allwinner,pins = "PB2";
-				allwinner,function = "pwm0";
+				pins = "PB2";
+				function = "pwm0";
 			};
 
 			spdif_tx_pins_a: spdif@0 {
-				allwinner,pins = "PB10";
-				allwinner,function = "spdif";
-				allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+				pins = "PB10";
+				function = "spdif";
+				bias-pull-up;
 			};
 
 			uart1_pins_a: uart1@1 {
-				allwinner,pins = "PG3", "PG4";
-				allwinner,function = "uart1";
+				pins = "PG3", "PG4";
+				function = "uart1";
 			};
 
 			uart1_cts_rts_pins_a: uart1-cts-rts@0 {
-				allwinner,pins = "PG5", "PG6";
-				allwinner,function = "uart1";
+				pins = "PG5", "PG6";
+				function = "uart1";
 			};
 		};
 
diff --git a/arch/arm/boot/dts/sun4i-a10-a1000.dts b/arch/arm/boot/dts/sun4i-a10-a1000.dts
index 4d8164afc671..68c6bdb2cf7c 100644
--- a/arch/arm/boot/dts/sun4i-a10-a1000.dts
+++ b/arch/arm/boot/dts/sun4i-a10-a1000.dts
@@ -186,13 +186,13 @@
 
 &pio {
 	emac_power_pin_a1000: emac_power_pin@0 {
-		allwinner,pins = "PH15";
-		allwinner,function = "gpio_out";
+		pins = "PH15";
+		function = "gpio_out";
 	};
 
 	led_pins_a1000: led_pins@0 {
-		allwinner,pins = "PH10", "PH20";
-		allwinner,function = "gpio_out";
+		pins = "PH10", "PH20";
+		function = "gpio_out";
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun4i-a10-ba10-tvbox.dts b/arch/arm/boot/dts/sun4i-a10-ba10-tvbox.dts
index 5f98582232d6..942d739a4384 100644
--- a/arch/arm/boot/dts/sun4i-a10-ba10-tvbox.dts
+++ b/arch/arm/boot/dts/sun4i-a10-ba10-tvbox.dts
@@ -127,7 +127,7 @@
 
 &pio {
 	usb2_vbus_pin_a: usb2_vbus_pin@0 {
-		allwinner,pins = "PH12";
+		pins = "PH12";
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun4i-a10-chuwi-v7-cw0825.dts b/arch/arm/boot/dts/sun4i-a10-chuwi-v7-cw0825.dts
index e9d839bc8562..17f8c5ec011c 100644
--- a/arch/arm/boot/dts/sun4i-a10-chuwi-v7-cw0825.dts
+++ b/arch/arm/boot/dts/sun4i-a10-chuwi-v7-cw0825.dts
@@ -142,15 +142,15 @@
 
 &pio {
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
-		allwinner,pins = "PH4";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PH4";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
-		allwinner,pins = "PH5";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_DOWN>;
+		pins = "PH5";
+		function = "gpio_in";
+		bias-pull-down;
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun4i-a10-cubieboard.dts b/arch/arm/boot/dts/sun4i-a10-cubieboard.dts
index e7188d2fb303..04e040e6233d 100644
--- a/arch/arm/boot/dts/sun4i-a10-cubieboard.dts
+++ b/arch/arm/boot/dts/sun4i-a10-cubieboard.dts
@@ -165,15 +165,15 @@
 
 &pio {
 	led_pins_cubieboard: led_pins@0 {
-		allwinner,pins = "PH20", "PH21";
-		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_20_MA>;
+		pins = "PH20", "PH21";
+		function = "gpio_out";
+		drive-strength = <20>;
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
-		allwinner,pins = "PH4";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PH4";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun4i-a10-dserve-dsrv9703c.dts b/arch/arm/boot/dts/sun4i-a10-dserve-dsrv9703c.dts
index b4b829d6008d..8317fbfeec4a 100644
--- a/arch/arm/boot/dts/sun4i-a10-dserve-dsrv9703c.dts
+++ b/arch/arm/boot/dts/sun4i-a10-dserve-dsrv9703c.dts
@@ -178,35 +178,35 @@
 
 &pio {
 	bl_en_pin_dsrv9703c: bl_en_pin@0 {
-		allwinner,pins = "PH7";
-		allwinner,function = "gpio_out";
+		pins = "PH7";
+		function = "gpio_out";
 	};
 
 	codec_pa_pin: codec_pa_pin@0 {
-		allwinner,pins = "PH15";
-		allwinner,function = "gpio_out";
+		pins = "PH15";
+		function = "gpio_out";
 	};
 
 	motor_pins: motor_pins@0 {
-		allwinner,pins = "PB3";
-		allwinner,function = "gpio_out";
+		pins = "PB3";
+		function = "gpio_out";
 	};
 
 	touchscreen_pins: touchscreen_pins@0 {
-		allwinner,pins = "PB13";
-		allwinner,function = "gpio_out";
+		pins = "PB13";
+		function = "gpio_out";
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
-		allwinner,pins = "PH4";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PH4";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
-		allwinner,pins = "PH5";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_DOWN>;
+		pins = "PH5";
+		function = "gpio_in";
+		bias-pull-down;
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun4i-a10-gemei-g9.dts b/arch/arm/boot/dts/sun4i-a10-gemei-g9.dts
index 57496a38b94a..9616cdecce93 100644
--- a/arch/arm/boot/dts/sun4i-a10-gemei-g9.dts
+++ b/arch/arm/boot/dts/sun4i-a10-gemei-g9.dts
@@ -156,8 +156,8 @@
 
 &pio {
 	codec_pa_pin: codec_pa_pin@0 {
-		allwinner,pins = "PH15";
-		allwinner,function = "gpio_out";
+		pins = "PH15";
+		function = "gpio_out";
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun4i-a10-hackberry.dts b/arch/arm/boot/dts/sun4i-a10-hackberry.dts
index de10ae48c6f6..a48b46474417 100644
--- a/arch/arm/boot/dts/sun4i-a10-hackberry.dts
+++ b/arch/arm/boot/dts/sun4i-a10-hackberry.dts
@@ -129,13 +129,13 @@
 	pinctrl-0 = <&hackberry_hogs>;
 
 	hackberry_hogs: hogs@0 {
-		allwinner,pins = "PH19";
-		allwinner,function = "gpio_out";
+		pins = "PH19";
+		function = "gpio_out";
 	};
 
 	usb2_vbus_pin_hackberry: usb2_vbus_pin@0 {
-		allwinner,pins = "PH12";
-		allwinner,function = "gpio_out";
+		pins = "PH12";
+		function = "gpio_out";
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun4i-a10-hyundai-a7hd.dts b/arch/arm/boot/dts/sun4i-a10-hyundai-a7hd.dts
index f3f8b90fb9c8..85dcf81ab64e 100644
--- a/arch/arm/boot/dts/sun4i-a10-hyundai-a7hd.dts
+++ b/arch/arm/boot/dts/sun4i-a10-hyundai-a7hd.dts
@@ -93,15 +93,15 @@
 
 &pio {
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
-		allwinner,pins = "PH4";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PH4";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
-		allwinner,pins = "PH5";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_DOWN>;
+		pins = "PH5";
+		function = "gpio_in";
+		bias-pull-down;
 	};
 };
 
@@ -121,7 +121,7 @@
 };
 
 &usb2_vbus_pin_a {
-	allwinner,pins = "PH6";
+	pins = "PH6";
 };
 
 &usb_otg {
diff --git a/arch/arm/boot/dts/sun4i-a10-inet1.dts b/arch/arm/boot/dts/sun4i-a10-inet1.dts
index f78c17a9a298..f3092703a1a6 100644
--- a/arch/arm/boot/dts/sun4i-a10-inet1.dts
+++ b/arch/arm/boot/dts/sun4i-a10-inet1.dts
@@ -180,25 +180,25 @@
 
 &pio {
 	bl_en_pin_inet: bl_en_pin@0 {
-		allwinner,pins = "PH7";
-		allwinner,function = "gpio_out";
+		pins = "PH7";
+		function = "gpio_out";
 	};
 
 	touchscreen_wake_pin: touchscreen_wake_pin@0 {
-		allwinner,pins = "PB13";
-		allwinner,function = "gpio_out";
+		pins = "PB13";
+		function = "gpio_out";
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
-		allwinner,pins = "PH4";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PH4";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
-		allwinner,pins = "PH5";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_DOWN>;
+		pins = "PH5";
+		function = "gpio_in";
+		bias-pull-down;
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun4i-a10-inet97fv2.dts b/arch/arm/boot/dts/sun4i-a10-inet97fv2.dts
index 5ba4cd4b2aca..a1a2bbb3f9d3 100644
--- a/arch/arm/boot/dts/sun4i-a10-inet97fv2.dts
+++ b/arch/arm/boot/dts/sun4i-a10-inet97fv2.dts
@@ -161,15 +161,15 @@
 
 &pio {
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
-		allwinner,pins = "PH4";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PH4";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
-		allwinner,pins = "PH5";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_DOWN>;
+		pins = "PH5";
+		function = "gpio_in";
+		bias-pull-down;
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun4i-a10-inet9f-rev03.dts b/arch/arm/boot/dts/sun4i-a10-inet9f-rev03.dts
index 5ea154f08364..4ef2a60a8cd4 100644
--- a/arch/arm/boot/dts/sun4i-a10-inet9f-rev03.dts
+++ b/arch/arm/boot/dts/sun4i-a10-inet9f-rev03.dts
@@ -320,25 +320,25 @@
 
 &pio {
 	key_pins_inet9f: key_pins@0 {
-		allwinner,pins = "PA0", "PA1", "PA3", "PA4",
-				 "PA5", "PA6", "PA8", "PA9",
-				 "PA11", "PA12", "PA13",
-				 "PA14", "PA15", "PA16", "PA17",
-				 "PH22", "PH23", "PH24", "PH25", "PH26";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PA0", "PA1", "PA3", "PA4",
+		       "PA5", "PA6", "PA8", "PA9",
+		       "PA11", "PA12", "PA13",
+		       "PA14", "PA15", "PA16", "PA17",
+		       "PH22", "PH23", "PH24", "PH25", "PH26";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
-		allwinner,pins = "PH4";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PH4";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
-		allwinner,pins = "PH5";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_DOWN>;
+		pins = "PH5";
+		function = "gpio_in";
+		bias-pull-down;
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun4i-a10-jesurun-q5.dts b/arch/arm/boot/dts/sun4i-a10-jesurun-q5.dts
index e6ffaefed42d..fc4d4d49e2e2 100644
--- a/arch/arm/boot/dts/sun4i-a10-jesurun-q5.dts
+++ b/arch/arm/boot/dts/sun4i-a10-jesurun-q5.dts
@@ -163,13 +163,13 @@
 
 &pio {
 	emac_power_pin_q5: emac_power_pin@0 {
-		allwinner,pins = "PH19";
-		allwinner,function = "gpio_out";
+		pins = "PH19";
+		function = "gpio_out";
 	};
 
 	led_pins_q5: led_pins@0 {
-		allwinner,pins = "PH20";
-		allwinner,function = "gpio_out";
+		pins = "PH20";
+		function = "gpio_out";
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun4i-a10-marsboard.dts b/arch/arm/boot/dts/sun4i-a10-marsboard.dts
index 001656eb9171..a2885039d5f1 100644
--- a/arch/arm/boot/dts/sun4i-a10-marsboard.dts
+++ b/arch/arm/boot/dts/sun4i-a10-marsboard.dts
@@ -164,14 +164,14 @@
 
 &pio {
 	led_pins_marsboard: led_pins@0 {
-		allwinner,pins = "PB5", "PB6", "PB7", "PB8";
-		allwinner,function = "gpio_out";
+		pins = "PB5", "PB6", "PB7", "PB8";
+		function = "gpio_out";
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
-		allwinner,pins = "PH4";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PH4";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun4i-a10-mini-xplus.dts b/arch/arm/boot/dts/sun4i-a10-mini-xplus.dts
index a7dd86d30fa2..af42ebb3a97b 100644
--- a/arch/arm/boot/dts/sun4i-a10-mini-xplus.dts
+++ b/arch/arm/boot/dts/sun4i-a10-mini-xplus.dts
@@ -93,7 +93,7 @@
 
 &ir0_rx_pins_a {
 	/* The ir receiver is not always populated */
-	allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+	bias-pull-up;
 };
 
 &mmc0 {
diff --git a/arch/arm/boot/dts/sun4i-a10-mk802.dts b/arch/arm/boot/dts/sun4i-a10-mk802.dts
index 9ce39f75188e..9c1afd4277d7 100644
--- a/arch/arm/boot/dts/sun4i-a10-mk802.dts
+++ b/arch/arm/boot/dts/sun4i-a10-mk802.dts
@@ -91,18 +91,18 @@
 
 &pio {
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
-		allwinner,pins = "PH4";
-		allwinner,function = "gpio_in";
+		pins = "PH4";
+		function = "gpio_in";
 	};
 
 	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
-		allwinner,pins = "PH5";
-		allwinner,function = "gpio_in";
+		pins = "PH5";
+		function = "gpio_in";
 	};
 
 	usb2_vbus_pin_mk802: usb2_vbus_pin@0 {
-		allwinner,pins = "PH12";
-		allwinner,function = "gpio_out";
+		pins = "PH12";
+		function = "gpio_out";
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun4i-a10-olinuxino-lime.dts b/arch/arm/boot/dts/sun4i-a10-olinuxino-lime.dts
index 203d399f0f7b..214a5accfe93 100644
--- a/arch/arm/boot/dts/sun4i-a10-olinuxino-lime.dts
+++ b/arch/arm/boot/dts/sun4i-a10-olinuxino-lime.dts
@@ -168,26 +168,26 @@
 
 &pio {
 	ahci_pwr_pin_olinuxinolime: ahci_pwr_pin@1 {
-		allwinner,pins = "PC3";
-		allwinner,function = "gpio_out";
+		pins = "PC3";
+		function = "gpio_out";
 	};
 
 	led_pins_olinuxinolime: led_pins@0 {
-		allwinner,pins = "PH2";
-		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_20_MA>;
+		pins = "PH2";
+		function = "gpio_out";
+		drive-strength = <20>;
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
-		allwinner,pins = "PH4";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PH4";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
-		allwinner,pins = "PH5";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_DOWN>;
+		pins = "PH5";
+		function = "gpio_in";
+		bias-pull-down;
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun4i-a10-pcduino.dts b/arch/arm/boot/dts/sun4i-a10-pcduino.dts
index 94cdef53ac11..b0365d63ba70 100644
--- a/arch/arm/boot/dts/sun4i-a10-pcduino.dts
+++ b/arch/arm/boot/dts/sun4i-a10-pcduino.dts
@@ -170,19 +170,19 @@
 
 &pio {
 	led_pins_pcduino: led_pins@0 {
-		allwinner,pins = "PH15", "PH16";
-		allwinner,function = "gpio_out";
+		pins = "PH15", "PH16";
+		function = "gpio_out";
 	};
 
 	key_pins_pcduino: key_pins@0 {
-		allwinner,pins = "PH17", "PH18", "PH19";
-		allwinner,function = "gpio_in";
+		pins = "PH17", "PH18", "PH19";
+		function = "gpio_in";
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
-		allwinner,pins = "PH4";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PH4";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun4i-a10-pcduino2.dts b/arch/arm/boot/dts/sun4i-a10-pcduino2.dts
index 9656ec9b51ae..811d00ee2ade 100644
--- a/arch/arm/boot/dts/sun4i-a10-pcduino2.dts
+++ b/arch/arm/boot/dts/sun4i-a10-pcduino2.dts
@@ -57,8 +57,8 @@
 
 &pio {
 	usb2_vbus_pin_pcduino2: usb2_vbus_pin@0 {
-		allwinner,pins = "PD2";
-		allwinner,function = "gpio_out";
+		pins = "PD2";
+		function = "gpio_out";
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun4i-a10-pov-protab2-ips9.dts b/arch/arm/boot/dts/sun4i-a10-pov-protab2-ips9.dts
index 9dedd808bde8..bfa6bbdaab27 100644
--- a/arch/arm/boot/dts/sun4i-a10-pov-protab2-ips9.dts
+++ b/arch/arm/boot/dts/sun4i-a10-pov-protab2-ips9.dts
@@ -164,30 +164,30 @@
 
 &pio {
 	bl_en_pin_protab: bl_en_pin@0 {
-		allwinner,pins = "PH7";
-		allwinner,function = "gpio_out";
+		pins = "PH7";
+		function = "gpio_out";
 	};
 
 	codec_pa_pin: codec_pa_pin@0 {
-		allwinner,pins = "PH15";
-		allwinner,function = "gpio_out";
+		pins = "PH15";
+		function = "gpio_out";
 	};
 
 	touchscreen_pins: touchscreen_pins@0 {
-		allwinner,pins = "PA5", "PB13";
-		allwinner,function = "gpio_out";
+		pins = "PA5", "PB13";
+		function = "gpio_out";
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
-		allwinner,pins = "PH4";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PH4";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
-		allwinner,pins = "PH5";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_DOWN>;
+		pins = "PH5";
+		function = "gpio_in";
+		bias-pull-down;
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun4i-a10.dtsi b/arch/arm/boot/dts/sun4i-a10.dtsi
index 36f3416c4c32..7ac72ceebcbc 100644
--- a/arch/arm/boot/dts/sun4i-a10.dtsi
+++ b/arch/arm/boot/dts/sun4i-a10.dtsi
@@ -974,141 +974,141 @@
 			#gpio-cells = <3>;
 
 			emac_pins_a: emac0@0 {
-				allwinner,pins = "PA0", "PA1", "PA2",
-						"PA3", "PA4", "PA5", "PA6",
-						"PA7", "PA8", "PA9", "PA10",
-						"PA11", "PA12", "PA13", "PA14",
-						"PA15", "PA16";
-				allwinner,function = "emac";
+				pins = "PA0", "PA1", "PA2",
+				       "PA3", "PA4", "PA5", "PA6",
+				       "PA7", "PA8", "PA9", "PA10",
+				       "PA11", "PA12", "PA13", "PA14",
+				       "PA15", "PA16";
+				function = "emac";
 			};
 
 			i2c0_pins_a: i2c0@0 {
-				allwinner,pins = "PB0", "PB1";
-				allwinner,function = "i2c0";
+				pins = "PB0", "PB1";
+				function = "i2c0";
 			};
 
 			i2c1_pins_a: i2c1@0 {
-				allwinner,pins = "PB18", "PB19";
-				allwinner,function = "i2c1";
+				pins = "PB18", "PB19";
+				function = "i2c1";
 			};
 
 			i2c2_pins_a: i2c2@0 {
-				allwinner,pins = "PB20", "PB21";
-				allwinner,function = "i2c2";
+				pins = "PB20", "PB21";
+				function = "i2c2";
 			};
 
 			ir0_rx_pins_a: ir0@0 {
-				allwinner,pins = "PB4";
-				allwinner,function = "ir0";
+				pins = "PB4";
+				function = "ir0";
 			};
 
 			ir0_tx_pins_a: ir0@1 {
-				allwinner,pins = "PB3";
-				allwinner,function = "ir0";
+				pins = "PB3";
+				function = "ir0";
 			};
 
 			ir1_rx_pins_a: ir1@0 {
-				allwinner,pins = "PB23";
-				allwinner,function = "ir1";
+				pins = "PB23";
+				function = "ir1";
 			};
 
 			ir1_tx_pins_a: ir1@1 {
-				allwinner,pins = "PB22";
-				allwinner,function = "ir1";
+				pins = "PB22";
+				function = "ir1";
 			};
 
 			mmc0_pins_a: mmc0@0 {
-				allwinner,pins = "PF0", "PF1", "PF2",
-						 "PF3", "PF4", "PF5";
-				allwinner,function = "mmc0";
-				allwinner,drive = <SUN4I_PINCTRL_30_MA>;
+				pins = "PF0", "PF1", "PF2",
+				       "PF3", "PF4", "PF5";
+				function = "mmc0";
+				drive-strength = <30>;
 			};
 
 			mmc0_cd_pin_reference_design: mmc0_cd_pin@0 {
-				allwinner,pins = "PH1";
-				allwinner,function = "gpio_in";
-				allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+				pins = "PH1";
+				function = "gpio_in";
+				bias-pull-up;
 			};
 
 			ps20_pins_a: ps20@0 {
-				allwinner,pins = "PI20", "PI21";
-				allwinner,function = "ps2";
+				pins = "PI20", "PI21";
+				function = "ps2";
 			};
 
 			ps21_pins_a: ps21@0 {
-				allwinner,pins = "PH12", "PH13";
-				allwinner,function = "ps2";
+				pins = "PH12", "PH13";
+				function = "ps2";
 			};
 
 			pwm0_pins_a: pwm0@0 {
-				allwinner,pins = "PB2";
-				allwinner,function = "pwm";
+				pins = "PB2";
+				function = "pwm";
 			};
 
 			pwm1_pins_a: pwm1@0 {
-				allwinner,pins = "PI3";
-				allwinner,function = "pwm";
+				pins = "PI3";
+				function = "pwm";
 			};
 
 			spdif_tx_pins_a: spdif@0 {
-				allwinner,pins = "PB13";
-				allwinner,function = "spdif";
-				allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+				pins = "PB13";
+				function = "spdif";
+				bias-pull-up;
 			};
 
 			spi0_pins_a: spi0@0 {
-				allwinner,pins = "PI11", "PI12", "PI13";
-				allwinner,function = "spi0";
+				pins = "PI11", "PI12", "PI13";
+				function = "spi0";
 			};
 
 			spi0_cs0_pins_a: spi0_cs0@0 {
-				allwinner,pins = "PI10";
-				allwinner,function = "spi0";
+				pins = "PI10";
+				function = "spi0";
 			};
 
 			spi1_pins_a: spi1@0 {
-				allwinner,pins = "PI17", "PI18", "PI19";
-				allwinner,function = "spi1";
+				pins = "PI17", "PI18", "PI19";
+				function = "spi1";
 			};
 
 			spi1_cs0_pins_a: spi1_cs0@0 {
-				allwinner,pins = "PI16";
-				allwinner,function = "spi1";
+				pins = "PI16";
+				function = "spi1";
 			};
 
 			spi2_pins_a: spi2@0 {
-				allwinner,pins = "PC20", "PC21", "PC22";
-				allwinner,function = "spi2";
+				pins = "PC20", "PC21", "PC22";
+				function = "spi2";
 			};
 
 			spi2_pins_b: spi2@1 {
-				allwinner,pins = "PB15", "PB16", "PB17";
-				allwinner,function = "spi2";
+				pins = "PB15", "PB16", "PB17";
+				function = "spi2";
 			};
 
 			spi2_cs0_pins_a: spi2_cs0@0 {
-				allwinner,pins = "PC19";
-				allwinner,function = "spi2";
+				pins = "PC19";
+				function = "spi2";
 			};
 
 			spi2_cs0_pins_b: spi2_cs0@1 {
-				allwinner,pins = "PB14";
-				allwinner,function = "spi2";
+				pins = "PB14";
+				function = "spi2";
 			};
 
 			uart0_pins_a: uart0@0 {
-				allwinner,pins = "PB22", "PB23";
-				allwinner,function = "uart0";
+				pins = "PB22", "PB23";
+				function = "uart0";
 			};
 
 			uart0_pins_b: uart0@1 {
-				allwinner,pins = "PF2", "PF4";
-				allwinner,function = "uart0";
+				pins = "PF2", "PF4";
+				function = "uart0";
 			};
 
 			uart1_pins_a: uart1@0 {
-				allwinner,pins = "PA10", "PA11";
-				allwinner,function = "uart1";
+				pins = "PA10", "PA11";
+				function = "uart1";
 			};
 		};
 
diff --git a/arch/arm/boot/dts/sun5i-a10s-auxtek-t003.dts b/arch/arm/boot/dts/sun5i-a10s-auxtek-t003.dts
index 8d1e414c0a3a..a539b72ce093 100644
--- a/arch/arm/boot/dts/sun5i-a10s-auxtek-t003.dts
+++ b/arch/arm/boot/dts/sun5i-a10s-auxtek-t003.dts
@@ -109,15 +109,15 @@
 
 &pio {
 	mmc0_cd_pin_t003: mmc0_cd_pin@0 {
-		allwinner,pins = "PG1";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PG1";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	led_pins_t003: led_pins@0 {
-		allwinner,pins = "PB2";
-		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_20_MA>;
+		pins = "PB2";
+		function = "gpio_out";
+		drive-strength = <20>;
 	};
 };
 
@@ -138,11 +138,11 @@
 };
 
 &usb0_vbus_pin_a {
-	allwinner,pins = "PG13";
+	pins = "PG13";
 };
 
 &usb1_vbus_pin_a {
-	allwinner,pins = "PB10";
+	pins = "PB10";
 };
 
 &usb_otg {
diff --git a/arch/arm/boot/dts/sun5i-a10s-auxtek-t004.dts b/arch/arm/boot/dts/sun5i-a10s-auxtek-t004.dts
index e3438a685c71..e1b5e8a446fe 100644
--- a/arch/arm/boot/dts/sun5i-a10s-auxtek-t004.dts
+++ b/arch/arm/boot/dts/sun5i-a10s-auxtek-t004.dts
@@ -130,26 +130,26 @@
 
 &pio {
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
-		allwinner,pins = "PG12";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PG12";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	mmc0_cd_pin_t004: mmc0_cd_pin@0 {
-		allwinner,pins = "PG1";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PG1";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	mmc1_vcc_en_pin_t004: mmc1_vcc_en_pin@0 {
-		allwinner,pins = "PB18";
-		allwinner,function = "gpio_out";
+		pins = "PB18";
+		function = "gpio_out";
 	};
 
 	led_pins_t004: led_pins@0 {
-		allwinner,pins = "PB2";
-		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_20_MA>;
+		pins = "PB2";
+		function = "gpio_out";
+		drive-strength = <20>;
 	};
 };
 
@@ -170,7 +170,7 @@
 };
 
 &usb1_vbus_pin_a {
-	allwinner,pins = "PG13";
+	pins = "PG13";
 };
 
 &usbphy {
diff --git a/arch/arm/boot/dts/sun5i-a10s-mk802.dts b/arch/arm/boot/dts/sun5i-a10s-mk802.dts
index 405c1d519301..020aa9d6c31d 100644
--- a/arch/arm/boot/dts/sun5i-a10s-mk802.dts
+++ b/arch/arm/boot/dts/sun5i-a10s-mk802.dts
@@ -116,19 +116,19 @@
 
 &pio {
 	led_pins_mk802: led_pins@0 {
-		allwinner,pins = "PB2";
-		allwinner,function = "gpio_out";
+		pins = "PB2";
+		function = "gpio_out";
 	};
 
 	mmc0_cd_pin_mk802: mmc0_cd_pin@0 {
-		allwinner,pins = "PG1";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PG1";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	usb1_vbus_pin_mk802: usb1_vbus_pin@0 {
-		allwinner,pins = "PB10";
-		allwinner,function = "gpio_out";
+		pins = "PB10";
+		function = "gpio_out";
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts b/arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts
index 125243305525..55b4cbbb43fd 100644
--- a/arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts
+++ b/arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts
@@ -202,32 +202,32 @@
 
 &pio {
 	mmc0_cd_pin_olinuxino_micro: mmc0_cd_pin@0 {
-		allwinner,pins = "PG1";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PG1";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	mmc1_cd_pin_olinuxino_micro: mmc1_cd_pin@0 {
-		allwinner,pins = "PG13";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PG13";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	led_pins_olinuxino: led_pins@0 {
-		allwinner,pins = "PE3";
-		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_20_MA>;
+		pins = "PE3";
+		function = "gpio_out";
+		drive-strength = <20>;
 	};
 
 	usb1_vbus_pin_olinuxino_m: usb1_vbus_pin@0 {
-		allwinner,pins = "PB10";
-		allwinner,function = "gpio_out";
+		pins = "PB10";
+		function = "gpio_out";
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
-		allwinner,pins = "PG12";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PG12";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 };
 
@@ -273,7 +273,7 @@
 };
 
 &usb0_vbus_pin_a {
-	allwinner,pins = "PG11";
+	pins = "PG11";
 };
 
 &usbphy {
diff --git a/arch/arm/boot/dts/sun5i-a10s-r7-tv-dongle.dts b/arch/arm/boot/dts/sun5i-a10s-r7-tv-dongle.dts
index e2dceda4889b..51371f9b1cf0 100644
--- a/arch/arm/boot/dts/sun5i-a10s-r7-tv-dongle.dts
+++ b/arch/arm/boot/dts/sun5i-a10s-r7-tv-dongle.dts
@@ -101,20 +101,20 @@
 
 &pio {
 	mmc0_cd_pin_r7: mmc0_cd_pin@0 {
-		allwinner,pins = "PG1";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PG1";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	led_pins_r7: led_pins@0 {
-		allwinner,pins = "PB2";
-		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_20_MA>;
+		pins = "PB2";
+		function = "gpio_out";
+		drive-strength = <20>;
 	};
 
 	usb1_vbus_pin_r7: usb1_vbus_pin@0 {
-		allwinner,pins = "PG13";
-		allwinner,function = "gpio_out";
+		pins = "PG13";
+		function = "gpio_out";
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun5i-a10s-wobo-i5.dts b/arch/arm/boot/dts/sun5i-a10s-wobo-i5.dts
index f40451bffb84..2b8adda0deda 100644
--- a/arch/arm/boot/dts/sun5i-a10s-wobo-i5.dts
+++ b/arch/arm/boot/dts/sun5i-a10s-wobo-i5.dts
@@ -146,19 +146,19 @@
 
 &pio {
 	led_pins_wobo_i5: led_pins@0 {
-		allwinner,pins = "PB2";
-		allwinner,function = "gpio_out";
+		pins = "PB2";
+		function = "gpio_out";
 	};
 
 	mmc0_cd_pin_wobo_i5: mmc0_cd_pin@0 {
-		allwinner,pins = "PB3";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PB3";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	emac_power_pin_wobo: emac_power_pin@0 {
-		allwinner,pins = "PA02";
-		allwinner,function = "gpio_out";
+		pins = "PA02";
+		function = "gpio_out";
 	};
 };
 
@@ -218,7 +218,7 @@
 };
 
 &usb1_vbus_pin_a {
-	allwinner,pins = "PG12";
+	pins = "PG12";
 };
 
 &usbphy {
diff --git a/arch/arm/boot/dts/sun5i-a10s.dtsi b/arch/arm/boot/dts/sun5i-a10s.dtsi
index 4e014cb11e81..6717f6e6b375 100644
--- a/arch/arm/boot/dts/sun5i-a10s.dtsi
+++ b/arch/arm/boot/dts/sun5i-a10s.dtsi
@@ -200,48 +200,48 @@
 	compatible = "allwinner,sun5i-a10s-pinctrl";
 
 	uart0_pins_a: uart0@0 {
-		allwinner,pins = "PB19", "PB20";
-		allwinner,function = "uart0";
+		pins = "PB19", "PB20";
+		function = "uart0";
 	};
 
 	uart2_pins_a: uart2@0 {
-		allwinner,pins = "PC18", "PC19";
-		allwinner,function = "uart2";
+		pins = "PC18", "PC19";
+		function = "uart2";
 	};
 
 	emac_pins_a: emac0@0 {
-		allwinner,pins = "PA0", "PA1", "PA2",
-				"PA3", "PA4", "PA5", "PA6",
-				"PA7", "PA8", "PA9", "PA10",
-				"PA11", "PA12", "PA13", "PA14",
-				"PA15", "PA16";
-		allwinner,function = "emac";
+		pins = "PA0", "PA1", "PA2",		       
+		       "PA3", "PA4", "PA5", "PA6",
+		       "PA7", "PA8", "PA9", "PA10",
+		       "PA11", "PA12", "PA13", "PA14",
+		       "PA15", "PA16";
+		function = "emac";
 	};
 
 	emac_pins_b: emac0@1 {
-		allwinner,pins = "PD6", "PD7", "PD10",
-				"PD11", "PD12", "PD13", "PD14",
-				"PD15", "PD18", "PD19", "PD20",
-				"PD21", "PD22", "PD23", "PD24",
-				"PD25", "PD26", "PD27";
-		allwinner,function = "emac";
+		pins = "PD6", "PD7", "PD10",
+		       "PD11", "PD12", "PD13", "PD14",
+		       "PD15", "PD18", "PD19", "PD20",
+		       "PD21", "PD22", "PD23", "PD24",
+		       "PD25", "PD26", "PD27";
+		function = "emac";
 	};
 
 	mmc1_pins_a: mmc1@0 {
-		allwinner,pins = "PG3", "PG4", "PG5",
-				 "PG6", "PG7", "PG8";
-		allwinner,function = "mmc1";
-		allwinner,drive = <SUN4I_PINCTRL_30_MA>;
+		pins = "PG3", "PG4", "PG5",
+		       "PG6", "PG7", "PG8";
+		function = "mmc1";
+		drive-strength = <30>;
 	};
 
 	spi2_pins_a: spi2@0 {
-		allwinner,pins = "PB12", "PB13", "PB14";
-		allwinner,function = "spi2";
+		pins = "PB12", "PB13", "PB14";
+		function = "spi2";
 	};
 
 	spi2_cs0_pins_a: spi2_cs0@0 {
-		allwinner,pins = "PB11";
-		allwinner,function = "spi2";
+		pins = "PB11";
+		function = "spi2";
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun5i-a13-empire-electronix-d709.dts b/arch/arm/boot/dts/sun5i-a13-empire-electronix-d709.dts
index 693be366ab9c..42435454acef 100644
--- a/arch/arm/boot/dts/sun5i-a13-empire-electronix-d709.dts
+++ b/arch/arm/boot/dts/sun5i-a13-empire-electronix-d709.dts
@@ -137,21 +137,21 @@
 
 &pio {
 	mmc0_cd_pin_d709: mmc0_cd_pin@0 {
-		allwinner,pins = "PG0";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PG0";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
-		allwinner,pins = "PG1";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_DOWN>;
+		pins = "PG1";
+		function = "gpio_in";
+		bias-pull-down;
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
-		allwinner,pins = "PG2";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PG2";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 };
 
@@ -209,7 +209,7 @@
 };
 
 &usb0_vbus_pin_a {
-	allwinner,pins = "PG12";
+	pins = "PG12";
 };
 
 &usbphy {
diff --git a/arch/arm/boot/dts/sun5i-a13-hsg-h702.dts b/arch/arm/boot/dts/sun5i-a13-hsg-h702.dts
index f5d1a04f3a16..5879a75cf97a 100644
--- a/arch/arm/boot/dts/sun5i-a13-hsg-h702.dts
+++ b/arch/arm/boot/dts/sun5i-a13-hsg-h702.dts
@@ -136,20 +136,20 @@
 
 &pio {
 	mmc0_cd_pin_h702: mmc0_cd_pin@0 {
-		allwinner,pins = "PG0";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PG0";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
-		allwinner,pins = "PG2";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PG2";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
-		allwinner,pins = "PG1";
-		allwinner,function = "gpio_in";
+		pins = "PG1";
+		function = "gpio_in";
 	};
 };
 
@@ -204,7 +204,7 @@
 };
 
 &usb0_vbus_pin_a {
-	allwinner,pins = "PG12";
+	pins = "PG12";
 };
 
 &usbphy {
diff --git a/arch/arm/boot/dts/sun5i-a13-olinuxino-micro.dts b/arch/arm/boot/dts/sun5i-a13-olinuxino-micro.dts
index df9315e5c850..60e393e28783 100644
--- a/arch/arm/boot/dts/sun5i-a13-olinuxino-micro.dts
+++ b/arch/arm/boot/dts/sun5i-a13-olinuxino-micro.dts
@@ -115,37 +115,37 @@
 
 &pio {
 	mmc0_cd_pin_olinuxinom: mmc0_cd_pin@0 {
-		allwinner,pins = "PG0";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PG0";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	led_pins_olinuxinom: led_pins@0 {
-		allwinner,pins = "PG9";
-		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_20_MA>;
+		pins = "PG9";
+		function = "gpio_out";
+		drive-strength = <20>;
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
-		allwinner,pins = "PG2";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PG2";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
-		allwinner,pins = "PG1";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_DOWN>;
+		pins = "PG1";
+		function = "gpio_in";
+		bias-pull-down;
 	};
 
 	usb0_vbus_pin_olinuxinom: usb0_vbus_pin@0 {
-		allwinner,pins = "PG12";
-		allwinner,function = "gpio_out";
+		pins = "PG12";
+		function = "gpio_out";
 	};
 
 	usb1_vbus_pin_olinuxinom: usb1_vbus_pin@0 {
-		allwinner,pins = "PG11";
-		allwinner,function = "gpio_out";
+		pins = "PG11";
+		function = "gpio_out";
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun5i-a13-olinuxino.dts b/arch/arm/boot/dts/sun5i-a13-olinuxino.dts
index 0f035adfbc57..7c0ff53b14cc 100644
--- a/arch/arm/boot/dts/sun5i-a13-olinuxino.dts
+++ b/arch/arm/boot/dts/sun5i-a13-olinuxino.dts
@@ -165,32 +165,32 @@
 
 &pio {
 	mmc0_cd_pin_olinuxino: mmc0_cd_pin@0 {
-		allwinner,pins = "PG0";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PG0";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	led_pins_olinuxino: led_pins@0 {
-		allwinner,pins = "PG9";
-		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_20_MA>;
+		pins = "PG9";
+		function = "gpio_out";
+		drive-strength = <20>;
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
-		allwinner,pins = "PG2";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PG2";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
-		allwinner,pins = "PG1";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_DOWN>;
+		pins = "PG1";
+		function = "gpio_in";
+		bias-pull-down;
 	};
 
 	usb1_vbus_pin_olinuxino: usb1_vbus_pin@0 {
-		allwinner,pins = "PG11";
-		allwinner,function = "gpio_out";
+		pins = "PG11";
+		function = "gpio_out";
 	};
 };
 
@@ -217,7 +217,7 @@
 };
 
 &usb0_vbus_pin_a {
-	allwinner,pins = "PG12";
+	pins = "PG12";
 };
 
 &usbphy {
diff --git a/arch/arm/boot/dts/sun5i-a13-utoo-p66.dts b/arch/arm/boot/dts/sun5i-a13-utoo-p66.dts
index 3b7f2097824d..51e7bbbba4c3 100644
--- a/arch/arm/boot/dts/sun5i-a13-utoo-p66.dts
+++ b/arch/arm/boot/dts/sun5i-a13-utoo-p66.dts
@@ -80,7 +80,7 @@
 };
 
 &codec_pa_pin {
-	allwinner,pins = "PG3";
+	pins = "PG3";
 };
 
 &i2c1 {
@@ -116,14 +116,14 @@
 
 &pio {
 	i2c_lcd_pins: i2c_lcd_pin@0 {
-		allwinner,pins = "PG10", "PG12";
-		allwinner,function = "gpio_out";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PG10", "PG12";
+		function = "gpio_out";
+		bias-pull-up;
 	};
 
 	ts_wake_pin_p66: ts_wake_pin@0 {
-		allwinner,pins = "PB3";
-		allwinner,function = "gpio_out";
+		pins = "PB3";
+		function = "gpio_out";
 	};
 
 };
@@ -138,5 +138,5 @@
 };
 
 &usb0_vbus_pin_a {
-	allwinner,pins = "PB4";
+	pins = "PB4";
 };
diff --git a/arch/arm/boot/dts/sun5i-a13.dtsi b/arch/arm/boot/dts/sun5i-a13.dtsi
index 1f4c5f773226..4131ab44558b 100644
--- a/arch/arm/boot/dts/sun5i-a13.dtsi
+++ b/arch/arm/boot/dts/sun5i-a13.dtsi
@@ -350,20 +350,20 @@
 	compatible = "allwinner,sun5i-a13-pinctrl";
 
 	lcd_rgb666_pins: lcd_rgb666@0 {
-		allwinner,pins = "PD2", "PD3", "PD4", "PD5", "PD6", "PD7",
-				 "PD10", "PD11", "PD12", "PD13", "PD14", "PD15",
-				 "PD18", "PD19", "PD20", "PD21", "PD22", "PD23",
-				 "PD24", "PD25", "PD26", "PD27";
-		allwinner,function = "lcd0";
+		pins = "PD2", "PD3", "PD4", "PD5", "PD6", "PD7",
+		       "PD10", "PD11", "PD12", "PD13", "PD14", "PD15",
+		       "PD18", "PD19", "PD20", "PD21", "PD22", "PD23",
+		       "PD24", "PD25", "PD26", "PD27";
+		function = "lcd0";
 	};
 
 	uart1_pins_a: uart1@0 {
-		allwinner,pins = "PE10", "PE11";
-		allwinner,function = "uart1";
+		pins = "PE10", "PE11";
+		function = "uart1";
 	};
 
 	uart1_pins_b: uart1@1 {
-		allwinner,pins = "PG3", "PG4";
-		allwinner,function = "uart1";
+		pins = "PG3", "PG4";
+		function = "uart1";
 	};
 };
diff --git a/arch/arm/boot/dts/sun5i-r8-chip.dts b/arch/arm/boot/dts/sun5i-r8-chip.dts
index 8f7f01bf1f0c..4d6a0cd30e86 100644
--- a/arch/arm/boot/dts/sun5i-r8-chip.dts
+++ b/arch/arm/boot/dts/sun5i-r8-chip.dts
@@ -150,13 +150,13 @@
 
 &pio {
 	chip_vbus_pin: chip_vbus_pin@0 {
-		allwinner,pins = "PB10";
-		allwinner,function = "gpio_out";
+		pins = "PB10";
+		function = "gpio_out";
 	};
 
 	chip_id_det_pin: chip_id_det_pin@0 {
-		allwinner,pins = "PG2";
-		allwinner,function = "gpio_in";
+		pins = "PG2";
+		function = "gpio_in";
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun5i-reference-design-tablet.dtsi b/arch/arm/boot/dts/sun5i-reference-design-tablet.dtsi
index b29c4d1fad40..2a09113f5784 100644
--- a/arch/arm/boot/dts/sun5i-reference-design-tablet.dtsi
+++ b/arch/arm/boot/dts/sun5i-reference-design-tablet.dtsi
@@ -112,31 +112,31 @@
 
 &pio {
 	codec_pa_pin: codec_pa_pin@0 {
-		allwinner,pins = "PG10";
-		allwinner,function = "gpio_out";
+		pins = "PG10";
+		function = "gpio_out";
 	};
 
 	mmc0_cd_pin: mmc0_cd_pin@0 {
-		allwinner,pins = "PG0";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PG0";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
-		allwinner,pins = "PG1";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_DOWN>;
+		pins = "PG1";
+		function = "gpio_in";
+		bias-pull-down;
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
-		allwinner,pins = "PG2";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PG2";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	usb0_vbus_pin_a: usb0_vbus_pin@0 {
-		allwinner,pins = "PG12";
-		allwinner,function = "gpio_out";
+		pins = "PG12";
+		function = "gpio_out";
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun5i.dtsi b/arch/arm/boot/dts/sun5i.dtsi
index 76b696944514..68e0c334fc94 100644
--- a/arch/arm/boot/dts/sun5i.dtsi
+++ b/arch/arm/boot/dts/sun5i.dtsi
@@ -554,49 +554,49 @@
 			#gpio-cells = <3>;
 
 			i2c0_pins_a: i2c0@0 {
-				allwinner,pins = "PB0", "PB1";
-				allwinner,function = "i2c0";
+				pins = "PB0", "PB1";
+				function = "i2c0";
 			};
 
 			i2c1_pins_a: i2c1@0 {
-				allwinner,pins = "PB15", "PB16";
-				allwinner,function = "i2c1";
+				pins = "PB15", "PB16";
+				function = "i2c1";
 			};
 
 			i2c2_pins_a: i2c2@0 {
-				allwinner,pins = "PB17", "PB18";
-				allwinner,function = "i2c2";
+				pins = "PB17", "PB18";
+				function = "i2c2";
 			};
 
 			mmc0_pins_a: mmc0@0 {
-				allwinner,pins = "PF0", "PF1", "PF2", "PF3",
-						 "PF4", "PF5";
-				allwinner,function = "mmc0";
-				allwinner,drive = <SUN4I_PINCTRL_30_MA>;
+				pins = "PF0", "PF1", "PF2", "PF3",
+				       "PF4", "PF5";
+				function = "mmc0";
+				drive-strength = <30>;
 			};
 
 			mmc2_pins_a: mmc2@0 {
-				allwinner,pins = "PC6", "PC7", "PC8", "PC9",
-					"PC10", "PC11", "PC12", "PC13",
-					"PC14", "PC15";
-				allwinner,function = "mmc2";
-				allwinner,drive = <SUN4I_PINCTRL_30_MA>;
-				allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+				pins = "PC6", "PC7", "PC8", "PC9",
+				       "PC10", "PC11", "PC12", "PC13",
+				       "PC14", "PC15";
+				function = "mmc2";
+				drive-strength = <30>;
+				bias-pull-up;
 			};
 
 			uart3_pins_a: uart3@0 {
-				allwinner,pins = "PG9", "PG10";
-				allwinner,function = "uart3";
+				pins = "PG9", "PG10";
+				function = "uart3";
 			};
 
 			uart3_pins_cts_rts_a: uart3-cts-rts@0 {
-				allwinner,pins = "PG11", "PG12";
-				allwinner,function = "uart3";
+				pins = "PG11", "PG12";
+				function = "uart3";
 			};
 
 			pwm0_pins: pwm0 {
-				allwinner,pins = "PB2";
-				allwinner,function = "pwm";
+				pins = "PB2";
+				function = "pwm";
 			};
 		};
 
diff --git a/arch/arm/boot/dts/sun6i-a31-app4-evb1.dts b/arch/arm/boot/dts/sun6i-a31-app4-evb1.dts
index cbc99ce6ab1a..effbdc766938 100644
--- a/arch/arm/boot/dts/sun6i-a31-app4-evb1.dts
+++ b/arch/arm/boot/dts/sun6i-a31-app4-evb1.dts
@@ -68,8 +68,8 @@
 
 &pio {
 	usb1_vbus_pin_a: usb1_vbus_pin@0 {
-		allwinner,pins = "PH27";
-		allwinner,function = "gpio_out";
+		pins = "PH27";
+		function = "gpio_out";
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun6i-a31-colombus.dts b/arch/arm/boot/dts/sun6i-a31-colombus.dts
index 24909c8c1186..f5ececd45bc0 100644
--- a/arch/arm/boot/dts/sun6i-a31-colombus.dts
+++ b/arch/arm/boot/dts/sun6i-a31-colombus.dts
@@ -124,25 +124,25 @@
 };
 
 &mmc0_pins_a {
-	allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+	bias-pull-up;
 };
 
 &pio {
 	mmc0_cd_pin_colombus: mmc0_cd_pin@0 {
-		allwinner,pins = "PA8";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PA8";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	usb2_vbus_pin_colombus: usb2_vbus_pin@0 {
-		allwinner,pins = "PH24";
-		allwinner,function = "gpio_out";
+		pins = "PH24";
+		function = "gpio_out";
 	};
 
 	i2c_lcd_pins: i2c_lcd_pin@0 {
-		allwinner,pins = "PA23", "PA24";
-		allwinner,function = "gpio_out";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PA23", "PA24";
+		function = "gpio_out";
+		bias-pull-up;
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun6i-a31-hummingbird.dts b/arch/arm/boot/dts/sun6i-a31-hummingbird.dts
index 7ec5f5fcdaac..087a712f4e8b 100644
--- a/arch/arm/boot/dts/sun6i-a31-hummingbird.dts
+++ b/arch/arm/boot/dts/sun6i-a31-hummingbird.dts
@@ -134,7 +134,7 @@
 
 &mmc0_pins_a {
 	/* external pull-ups missing for some pins */
-	allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+	bias-pull-up;
 };
 
 &mmc1 {
@@ -153,19 +153,19 @@
 
 &pio {
 	gmac_phy_reset_pin_hummingbird: gmac_phy_reset_pin@0 {
-		allwinner,pins = "PA21";
-		allwinner,function = "gpio_out";
+		pins = "PA21";
+		function = "gpio_out";
 	};
 
 	mmc0_cd_pin_hummingbird: mmc0_cd_pin@0 {
-		allwinner,pins = "PA8";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PA8";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	wifi_reset_pin_hummingbird: wifi_reset_pin@0 {
-		allwinner,pins = "PG10";
-		allwinner,function = "gpio_out";
+		pins = "PG10";
+		function = "gpio_out";
 	};
 };
 
@@ -248,7 +248,7 @@
 
 &usb1_vbus_pin_a {
 	/* different pin from sunxi-common-regulators */
-	allwinner,pins = "PH24";
+	pins = "PH24";
 };
 
 &usbphy {
diff --git a/arch/arm/boot/dts/sun6i-a31-i7.dts b/arch/arm/boot/dts/sun6i-a31-i7.dts
index 61e3ef4528ec..f3468a14596e 100644
--- a/arch/arm/boot/dts/sun6i-a31-i7.dts
+++ b/arch/arm/boot/dts/sun6i-a31-i7.dts
@@ -109,19 +109,19 @@
 
 &pio {
 	led_pins_i7: led_pins@0 {
-		allwinner,pins = "PH13";
-		allwinner,function = "gpio_out";
+		pins = "PH13";
+		function = "gpio_out";
 	};
 
 	mmc0_cd_pin_i7: mmc0_cd_pin@0 {
-		allwinner,pins = "PH22";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PH22";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	usb1_vbus_pin_i7: usb1_vbus_pin@0 {
-		allwinner,pins = "PC27";
-		allwinner,function = "gpio_out";
+		pins = "PC27";
+		function = "gpio_out";
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun6i-a31-m9.dts b/arch/arm/boot/dts/sun6i-a31-m9.dts
index 96ad1fe9bbc8..8af5b667a46d 100644
--- a/arch/arm/boot/dts/sun6i-a31-m9.dts
+++ b/arch/arm/boot/dts/sun6i-a31-m9.dts
@@ -128,19 +128,19 @@
 
 &pio {
 	led_pins_m9: led_pins@0 {
-		allwinner,pins = "PH13";
-		allwinner,function = "gpio_out";
+		pins = "PH13";
+		function = "gpio_out";
 	};
 
 	mmc0_cd_pin_m9: mmc0_cd_pin@0 {
-		allwinner,pins = "PH22";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PH22";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	usb1_vbus_pin_m9: usb1_vbus_pin@0 {
-		allwinner,pins = "PC27";
-		allwinner,function = "gpio_out";
+		pins = "PC27";
+		function = "gpio_out";
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun6i-a31-mele-a1000g-quad.dts b/arch/arm/boot/dts/sun6i-a31-mele-a1000g-quad.dts
index a29ea186b964..bf0f5831126f 100644
--- a/arch/arm/boot/dts/sun6i-a31-mele-a1000g-quad.dts
+++ b/arch/arm/boot/dts/sun6i-a31-mele-a1000g-quad.dts
@@ -128,19 +128,19 @@
 
 &pio {
 	led_pins_m9: led_pins@0 {
-		allwinner,pins = "PH13";
-		allwinner,function = "gpio_out";
+		pins = "PH13";
+		function = "gpio_out";
 	};
 
 	mmc0_cd_pin_m9: mmc0_cd_pin@0 {
-		allwinner,pins = "PH22";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PH22";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	usb1_vbus_pin_m9: usb1_vbus_pin@0 {
-		allwinner,pins = "PC27";
-		allwinner,function = "gpio_out";
+		pins = "PC27";
+		function = "gpio_out";
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi b/arch/arm/boot/dts/sun6i-a31.dtsi
index f754a255ca7d..27fc7a62f8ed 100644
--- a/arch/arm/boot/dts/sun6i-a31.dtsi
+++ b/arch/arm/boot/dts/sun6i-a31.dtsi
@@ -435,101 +435,101 @@
 			#gpio-cells = <3>;
 
 			uart0_pins_a: uart0@0 {
-				allwinner,pins = "PH20", "PH21";
-				allwinner,function = "uart0";
+				pins = "PH20", "PH21";
+				function = "uart0";
 			};
 
 			i2c0_pins_a: i2c0@0 {
-				allwinner,pins = "PH14", "PH15";
-				allwinner,function = "i2c0";
+				pins = "PH14", "PH15";
+				function = "i2c0";
 			};
 
 			i2c1_pins_a: i2c1@0 {
-				allwinner,pins = "PH16", "PH17";
-				allwinner,function = "i2c1";
+				pins = "PH16", "PH17";
+				function = "i2c1";
 			};
 
 			i2c2_pins_a: i2c2@0 {
-				allwinner,pins = "PH18", "PH19";
-				allwinner,function = "i2c2";
+				pins = "PH18", "PH19";
+				function = "i2c2";
 			};
 
 			mmc0_pins_a: mmc0@0 {
-				allwinner,pins = "PF0", "PF1", "PF2",
-						 "PF3", "PF4", "PF5";
-				allwinner,function = "mmc0";
-				allwinner,drive = <SUN4I_PINCTRL_30_MA>;
+				pins = "PF0", "PF1", "PF2",
+				       "PF3", "PF4", "PF5";
+				function = "mmc0";
+				drive-strength = <30>;
 			};
 
 			mmc1_pins_a: mmc1@0 {
-				allwinner,pins = "PG0", "PG1", "PG2", "PG3",
-						 "PG4", "PG5";
-				allwinner,function = "mmc1";
-				allwinner,drive = <SUN4I_PINCTRL_30_MA>;
+				pins = "PG0", "PG1", "PG2", "PG3",
+				       "PG4", "PG5";
+				function = "mmc1";
+				drive-strength = <30>;
 			};
 
 			mmc2_pins_a: mmc2@0 {
-				allwinner,pins = "PC6", "PC7", "PC8", "PC9",
-						 "PC10", "PC11";
-				allwinner,function = "mmc2";
-				allwinner,drive = <SUN4I_PINCTRL_30_MA>;
-				allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+				pins = "PC6", "PC7", "PC8", "PC9",
+				       "PC10", "PC11";
+				function = "mmc2";
+				drive-strength = <30>;
+				bias-pull-up;
 			};
 
 			mmc2_8bit_emmc_pins: mmc2@1 {
-				allwinner,pins = "PC6", "PC7", "PC8", "PC9",
-						 "PC10", "PC11", "PC12",
-						 "PC13", "PC14", "PC15",
-						 "PC24";
-				allwinner,function = "mmc2";
-				allwinner,drive = <SUN4I_PINCTRL_30_MA>;
+				pins = "PC6", "PC7", "PC8", "PC9",
+				       "PC10", "PC11", "PC12",
+				       "PC13", "PC14", "PC15",
+				       "PC24";
+				function = "mmc2";
+				drive-strength = <30>;
 			};
 
 			mmc3_8bit_emmc_pins: mmc3@1 {
-				allwinner,pins = "PC6", "PC7", "PC8", "PC9",
-						 "PC10", "PC11", "PC12",
-						 "PC13", "PC14", "PC15",
-						 "PC24";
-				allwinner,function = "mmc3";
-				allwinner,drive = <SUN4I_PINCTRL_40_MA>;
+				pins = "PC6", "PC7", "PC8", "PC9",
+				       "PC10", "PC11", "PC12",
+				       "PC13", "PC14", "PC15",
+				       "PC24";
+				function = "mmc3";
+				drive-strength = <40>;
 			};
 
 			gmac_pins_mii_a: gmac_mii@0 {
-				allwinner,pins = "PA0", "PA1", "PA2", "PA3",
-						"PA8", "PA9", "PA11",
-						"PA12", "PA13", "PA14", "PA19",
-						"PA20", "PA21", "PA22", "PA23",
-						"PA24", "PA26", "PA27";
-				allwinner,function = "gmac";
+				pins = "PA0", "PA1", "PA2", "PA3",
+				       "PA8", "PA9", "PA11",
+				       "PA12", "PA13", "PA14", "PA19",
+				       "PA20", "PA21", "PA22", "PA23",
+				       "PA24", "PA26", "PA27";
+				function = "gmac";
 			};
 
 			gmac_pins_gmii_a: gmac_gmii@0 {
-				allwinner,pins = "PA0", "PA1", "PA2", "PA3",
-						"PA4", "PA5", "PA6", "PA7",
-						"PA8", "PA9", "PA10", "PA11",
-						"PA12", "PA13", "PA14",	"PA15",
-						"PA16", "PA17", "PA18", "PA19",
-						"PA20", "PA21", "PA22", "PA23",
-						"PA24", "PA25", "PA26", "PA27";
-				allwinner,function = "gmac";
+				pins = "PA0", "PA1", "PA2", "PA3",
+				       "PA4", "PA5", "PA6", "PA7",
+				       "PA8", "PA9", "PA10", "PA11",
+				       "PA12", "PA13", "PA14",	"PA15",
+				       "PA16", "PA17", "PA18", "PA19",
+				       "PA20", "PA21", "PA22", "PA23",
+				       "PA24", "PA25", "PA26", "PA27";
+				function = "gmac";
 				/*
 				 * data lines in GMII mode run at 125MHz and
 				 * might need a higher signal drive strength
 				 */
-				allwinner,drive = <SUN4I_PINCTRL_30_MA>;
+				drive-strength = <30>;
 			};
 
 			gmac_pins_rgmii_a: gmac_rgmii@0 {
-				allwinner,pins = "PA0", "PA1", "PA2", "PA3",
-						"PA9", "PA10", "PA11",
-						"PA12", "PA13", "PA14", "PA19",
-						"PA20", "PA25", "PA26", "PA27";
-				allwinner,function = "gmac";
+				pins = "PA0", "PA1", "PA2", "PA3",
+				       "PA9", "PA10", "PA11",
+				       "PA12", "PA13", "PA14", "PA19",
+				       "PA20", "PA25", "PA26", "PA27";
+				function = "gmac";
 				/*
 				 * data lines in RGMII mode use DDR mode
 				 * and need a higher signal drive strength
 				 */
-				allwinner,drive = <SUN4I_PINCTRL_40_MA>;
+				drive-strength = <40>;
 			};
 		};
 
@@ -879,13 +879,13 @@
 			#gpio-cells = <3>;
 
 			ir_pins_a: ir@0 {
-				allwinner,pins = "PL4";
-				allwinner,function = "s_ir";
+				pins = "PL4";
+				function = "s_ir";
 			};
 
 			p2wi_pins: p2wi {
-				allwinner,pins = "PL0", "PL1";
-				allwinner,function = "s_p2wi";
+				pins = "PL0", "PL1";
+				function = "s_p2wi";
 			};
 		};
 
diff --git a/arch/arm/boot/dts/sun6i-a31s-primo81.dts b/arch/arm/boot/dts/sun6i-a31s-primo81.dts
index f511aa0e250d..2238eda318f6 100644
--- a/arch/arm/boot/dts/sun6i-a31s-primo81.dts
+++ b/arch/arm/boot/dts/sun6i-a31s-primo81.dts
@@ -134,20 +134,20 @@
 
 &pio {
 	gt911_int_primo81: gt911_int_pin@0 {
-		allwinner,pins = "PA3";
-		allwinner,function = "gpio_in";
+		pins = "PA3";
+		function = "gpio_in";
 	};
 
 	mma8452_int_primo81: mma8452_int_pin@0 {
-		allwinner,pins = "PA9";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PA9";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	mmc0_cd_pin_primo81: mmc0_cd_pin@0 {
-		allwinner,pins = "PA8";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PA8";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun6i-a31s-sina31s.dts b/arch/arm/boot/dts/sun6i-a31s-sina31s.dts
index 2beb867d095a..b4a3c2aa30b4 100644
--- a/arch/arm/boot/dts/sun6i-a31s-sina31s.dts
+++ b/arch/arm/boot/dts/sun6i-a31s-sina31s.dts
@@ -128,14 +128,14 @@
 
 &pio {
 	led_pin_sina31s: led_pin@0 {
-		allwinner,pins = "PH13";
-		allwinner,function = "gpio_out";
+		pins = "PH13";
+		function = "gpio_out";
 	};
 
 	mmc0_cd_pin_sina31s: mmc0_cd_pin@0 {
-		allwinner,pins = "PA4";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PA4";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts b/arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts
index 3731cf22abc1..3bd862bf82a9 100644
--- a/arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts
+++ b/arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts
@@ -122,7 +122,7 @@
 };
 
 &mmc0_pins_a {
-	allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+	bias-pull-up;
 };
 
 &mmc2 {
@@ -144,7 +144,7 @@
 };
 
 &mmc2_pins_a {
-	allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+	bias-pull-up;
 };
 
 &ohci0 {
@@ -153,26 +153,26 @@
 
 &pio {
 	gmac_phy_reset_pin_bpi_m2: gmac_phy_reset_pin@0 {
-		allwinner,pins = "PA21";
-		allwinner,function = "gpio_out";
+		pins = "PA21";
+		function = "gpio_out";
 	};
 
 	led_pins_bpi_m2: led_pins@0 {
-		allwinner,pins = "PG5", "PG10", "PG11";
-		allwinner,function = "gpio_out";
+		pins = "PG5", "PG10", "PG11";
+		function = "gpio_out";
 	};
 
 	mmc0_cd_pin_bpi_m2: mmc0_cd_pin@0 {
-		allwinner,pins = "PA4";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PA4";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 };
 
 &r_pio {
 	mmc2_pwrseq_pin_bpi_m2: mmc2_pwrseq_pin@0 {
-		allwinner,pins = "PL8";
-		allwinner,function = "gpio_out";
+		pins = "PL8";
+		function = "gpio_out";
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun6i-a31s-yones-toptech-bs1078-v2.dts b/arch/arm/boot/dts/sun6i-a31s-yones-toptech-bs1078-v2.dts
index 832392125b8e..154ebf5082ed 100644
--- a/arch/arm/boot/dts/sun6i-a31s-yones-toptech-bs1078-v2.dts
+++ b/arch/arm/boot/dts/sun6i-a31s-yones-toptech-bs1078-v2.dts
@@ -92,9 +92,9 @@
 
 &pio {
 	mmc0_cd_pin_bs1078v2: mmc0_cd_pin@0 {
-		allwinner,pins = "PA8";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PA8";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 };
 
@@ -109,7 +109,7 @@
 };
 
 &mmc0_pins_a {
-	allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+	bias-pull-up;
 };
 
 &p2wi {
diff --git a/arch/arm/boot/dts/sun6i-reference-design-tablet.dtsi b/arch/arm/boot/dts/sun6i-reference-design-tablet.dtsi
index 2e7443fc1790..edaba5f904fd 100644
--- a/arch/arm/boot/dts/sun6i-reference-design-tablet.dtsi
+++ b/arch/arm/boot/dts/sun6i-reference-design-tablet.dtsi
@@ -77,15 +77,15 @@
 
 &pio {
 	mmc0_cd_pin_e708_q1: mmc0_cd_pin@0 {
-		allwinner,pins = "PA8";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PA8";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
-		allwinner,pins = "PA15";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PA15";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts b/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts
index 2018f074ff05..017bfe1965c1 100644
--- a/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts
+++ b/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts
@@ -181,7 +181,7 @@
 
 &mmc3_pins_a {
 	/* AP6210 requires pull-up */
-	allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+	bias-pull-up;
 };
 
 &ohci0 {
@@ -194,24 +194,24 @@
 
 &pio {
 	gmac_power_pin_bpi_m1p: gmac_power_pin@0 {
-		allwinner,pins = "PH23";
-		allwinner,function = "gpio_out";
+		pins = "PH23";
+		function = "gpio_out";
 	};
 
 	led_pins_bpi_m1p: led_pins@0 {
-		allwinner,pins = "PH24", "PH25";
-		allwinner,function = "gpio_out";
+		pins = "PH24", "PH25";
+		function = "gpio_out";
 	};
 
 	mmc0_cd_pin_bpi_m1p: mmc0_cd_pin@0 {
-		allwinner,pins = "PH10";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PH10";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	mmc3_pwrseq_pin_bpi_m1p: mmc3_pwrseq_pin@0 {
-		allwinner,pins = "PH22";
-		allwinner,function = "gpio_out";
+		pins = "PH22";
+		function = "gpio_out";
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun7i-a20-bananapi.dts b/arch/arm/boot/dts/sun7i-a20-bananapi.dts
index 7cd6a74d104c..91f2e5f9efcb 100644
--- a/arch/arm/boot/dts/sun7i-a20-bananapi.dts
+++ b/arch/arm/boot/dts/sun7i-a20-bananapi.dts
@@ -179,25 +179,25 @@
 
 &pio {
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
-		allwinner,pins = "PH4";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PH4";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	mmc0_cd_pin_bananapi: mmc0_cd_pin@0 {
-		allwinner,pins = "PH10";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PH10";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	gmac_power_pin_bananapi: gmac_power_pin@0 {
-		allwinner,pins = "PH23";
-		allwinner,function = "gpio_out";
+		pins = "PH23";
+		function = "gpio_out";
 	};
 
 	led_pins_bananapi: led_pins@0 {
-		allwinner,pins = "PH24";
-		allwinner,function = "gpio_out";
+		pins = "PH24";
+		function = "gpio_out";
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun7i-a20-bananapro.dts b/arch/arm/boot/dts/sun7i-a20-bananapro.dts
index 366636451e7e..19d63d4049de 100644
--- a/arch/arm/boot/dts/sun7i-a20-bananapro.dts
+++ b/arch/arm/boot/dts/sun7i-a20-bananapro.dts
@@ -182,34 +182,34 @@
 
 &pio {
 	gmac_power_pin_bananapro: gmac_power_pin@0 {
-		allwinner,pins = "PH23";
-		allwinner,function = "gpio_out";
+		pins = "PH23";
+		function = "gpio_out";
 	};
 
 	led_pins_bananapro: led_pins@0 {
-		allwinner,pins = "PH24", "PG2";
-		allwinner,function = "gpio_out";
+		pins = "PH24", "PG2";
+		function = "gpio_out";
 	};
 
 	mmc0_cd_pin_bananapro: mmc0_cd_pin@0 {
-		allwinner,pins = "PH10";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PH10";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	usb1_vbus_pin_bananapro: usb1_vbus_pin@0 {
-		allwinner,pins = "PH0";
-		allwinner,function = "gpio_out";
+		pins = "PH0";
+		function = "gpio_out";
 	};
 
 	usb2_vbus_pin_bananapro: usb2_vbus_pin@0 {
-		allwinner,pins = "PH1";
-		allwinner,function = "gpio_out";
+		pins = "PH1";
+		function = "gpio_out";
 	};
 
 	vmmc3_pin_bananapro: vmmc3_pin@0 {
-		allwinner,pins = "PH22";
-		allwinner,function = "gpio_out";
+		pins = "PH22";
+		function = "gpio_out";
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts b/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts
index e635dd6ac47d..4dc1e10f88c4 100644
--- a/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts
+++ b/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts
@@ -160,14 +160,14 @@
 
 &pio {
 	led_pins_cubieboard2: led_pins@0 {
-		allwinner,pins = "PH20", "PH21";
-		allwinner,function = "gpio_out";
+		pins = "PH20", "PH21";
+		function = "gpio_out";
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
-		allwinner,pins = "PH4";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PH4";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun7i-a20-cubietruck.dts b/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
index be8fa4879453..f019aa3fe96d 100644
--- a/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
+++ b/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
@@ -207,7 +207,7 @@
 
 &mmc3_pins_a {
 	/* AP6210 requires pull-up */
-	allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+	bias-pull-up;
 };
 
 &ohci0 {
@@ -224,33 +224,33 @@
 
 &pio {
 	ahci_pwr_pin_cubietruck: ahci_pwr_pin@1 {
-		allwinner,pins = "PH12";
-		allwinner,function = "gpio_out";
+		pins = "PH12";
+		function = "gpio_out";
 	};
 
 	led_pins_cubietruck: led_pins@0 {
-		allwinner,pins = "PH7", "PH11", "PH20", "PH21";
-		allwinner,function = "gpio_out";
+		pins = "PH7", "PH11", "PH20", "PH21";
+		function = "gpio_out";
 	};
 
 	mmc3_pwrseq_pin_cubietruck: mmc3_pwrseq_pin@0 {
-		allwinner,pins = "PH9";
-		allwinner,function = "gpio_out";
+		pins = "PH9";
+		function = "gpio_out";
 	};
 
 	usb0_vbus_pin_a: usb0_vbus_pin@0 {
-		allwinner,pins = "PH17";
-		allwinner,function = "gpio_out";
+		pins = "PH17";
+		function = "gpio_out";
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
-		allwinner,pins = "PH19";
-		allwinner,function = "gpio_in";
+		pins = "PH19";
+		function = "gpio_in";
 	};
 
 	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
-		allwinner,pins = "PH22";
-		allwinner,function = "gpio_in";
+		pins = "PH22";
+		function = "gpio_in";
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun7i-a20-hummingbird.dts b/arch/arm/boot/dts/sun7i-a20-hummingbird.dts
index 6719c701a45f..e921ba42f170 100644
--- a/arch/arm/boot/dts/sun7i-a20-hummingbird.dts
+++ b/arch/arm/boot/dts/sun7i-a20-hummingbird.dts
@@ -188,23 +188,23 @@
 
 &pio {
 	ahci_pwr_pin_a20_hummingbird: ahci_pwr_pin@0 {
-		allwinner,pins = "PH15";
-		allwinner,function = "gpio_out";
+		pins = "PH15";
+		function = "gpio_out";
 	};
 
 	usb1_vbus_pin_a20_hummingbird: usb1_vbus_pin@0 {
-		allwinner,pins = "PH2";
-		allwinner,function = "gpio_out";
+		pins = "PH2";
+		function = "gpio_out";
 	};
 
 	mmc3_vdd_pin_a20_hummingbird: mmc3_vdd_pin@0 {
-		allwinner,pins = "PH9";
-		allwinner,function = "gpio_out";
+		pins = "PH9";
+		function = "gpio_out";
 	};
 
 	gmac_vdd_pin_a20_hummingbird: gmac_vdd_pin@0 {
-		allwinner,pins = "PH16";
-		allwinner,function = "gpio_out";
+		pins = "PH16";
+		function = "gpio_out";
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun7i-a20-i12-tvbox.dts b/arch/arm/boot/dts/sun7i-a20-i12-tvbox.dts
index d64c11134dd7..385fd8232ae0 100644
--- a/arch/arm/boot/dts/sun7i-a20-i12-tvbox.dts
+++ b/arch/arm/boot/dts/sun7i-a20-i12-tvbox.dts
@@ -185,7 +185,7 @@
 
 &mmc3_pins_a {
 	/* AP6210 / AP6330 requires pull-up */
-	allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+	bias-pull-up;
 };
 
 &ohci0 {
@@ -198,23 +198,23 @@
 
 &pio {
 	vmmc3_pin_i12_tvbox: vmmc3_pin@0 {
-		allwinner,pins = "PH2";
-		allwinner,function = "gpio_out";
+		pins = "PH2";
+		function = "gpio_out";
 	};
 
 	vmmc3_io_pin_i12_tvbox: vmmc3_io_pin@0 {
-		allwinner,pins = "PH12";
-		allwinner,function = "gpio_out";
+		pins = "PH12";
+		function = "gpio_out";
 	};
 
 	gmac_power_pin_i12_tvbox: gmac_power_pin@0 {
-		allwinner,pins = "PH21";
-		allwinner,function = "gpio_out";
+		pins = "PH21";
+		function = "gpio_out";
 	};
 
 	led_pins_i12_tvbox: led_pins@0 {
-		allwinner,pins = "PH9", "PH20";
-		allwinner,function = "gpio_out";
+		pins = "PH9", "PH20";
+		function = "gpio_out";
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun7i-a20-itead-ibox.dts b/arch/arm/boot/dts/sun7i-a20-itead-ibox.dts
index 44f09642c893..d52222c82cb8 100644
--- a/arch/arm/boot/dts/sun7i-a20-itead-ibox.dts
+++ b/arch/arm/boot/dts/sun7i-a20-itead-ibox.dts
@@ -131,9 +131,9 @@
 
 &pio {
 	led_pins_itead_core: led_pins@0 {
-		allwinner,pins = "PH20","PH21";
-		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_20_MA>;
+		pins = "PH20","PH21";
+		function = "gpio_out";
+		drive-strength = <20>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts b/arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts
index 79cee00a85de..72ec0d5ae052 100644
--- a/arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts
+++ b/arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts
@@ -87,7 +87,7 @@
 };
 
 &ahci_pwr_pin_a {
-	allwinner,pins = "PB3";
+	pins = "PB3";
 };
 
 &ahci {
@@ -222,25 +222,25 @@
 
 &pio {
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
-		allwinner,pins = "PH4";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PH4";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	mmc0_cd_pin_lamobo_r1: mmc0_cd_pin@0 {
-		allwinner,pins = "PH10";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PH10";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	gmac_power_pin_lamobo_r1: gmac_power_pin@0 {
-		allwinner,pins = "PH23";
-		allwinner,function = "gpio_out";
+		pins = "PH23";
+		function = "gpio_out";
 	};
 
 	led_pins_lamobo_r1: led_pins@0 {
-		allwinner,pins = "PH24";
-		allwinner,function = "gpio_out";
+		pins = "PH24";
+		function = "gpio_out";
 	};
 };
 
@@ -321,7 +321,7 @@
 };
 
 &usb2_vbus_pin_a {
-	allwinner,pins = "PH12";
+	pins = "PH12";
 };
 
 &usbphy {
diff --git a/arch/arm/boot/dts/sun7i-a20-m3.dts b/arch/arm/boot/dts/sun7i-a20-m3.dts
index 97ce27da445f..0e074bd0e8c9 100644
--- a/arch/arm/boot/dts/sun7i-a20-m3.dts
+++ b/arch/arm/boot/dts/sun7i-a20-m3.dts
@@ -145,8 +145,8 @@
 
 &pio {
 	led_pins_m3: led_pins@0 {
-		allwinner,pins = "PH20";
-		allwinner,function = "gpio_out";
+		pins = "PH20";
+		function = "gpio_out";
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun7i-a20-mk808c.dts b/arch/arm/boot/dts/sun7i-a20-mk808c.dts
index c5890617382c..97d7a8b65a03 100644
--- a/arch/arm/boot/dts/sun7i-a20-mk808c.dts
+++ b/arch/arm/boot/dts/sun7i-a20-mk808c.dts
@@ -132,13 +132,13 @@
 
 &pio {
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
-		allwinner,pins = "PH4";
-		allwinner,function = "gpio_in";
+		pins = "PH4";
+		function = "gpio_in";
 	};
 
 	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
-		allwinner,pins = "PH5";
-		allwinner,function = "gpio_in";
+		pins = "PH5";
+		function = "gpio_in";
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts b/arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts
index de2863651b44..fe0d57d89e78 100644
--- a/arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts
+++ b/arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts
@@ -204,30 +204,30 @@
 
 &pio {
 	ahci_pwr_pin_olimex_som_evb: ahci_pwr_pin@1 {
-		allwinner,pins = "PC3";
-		allwinner,function = "gpio_out";
+		pins = "PC3";
+		function = "gpio_out";
 	};
 
 	led_pins_olimex_som_evb: led_pins@0 {
-		allwinner,pins = "PH2";
-		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_20_MA>;
+		pins = "PH2";
+		function = "gpio_out";
+		drive-strength = <20>;
 	};
 
 	mmc3_cd_pin_olimex_som_evb: mmc3_cd_pin@0 {
-		allwinner,pins = "PH0";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PH0";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
-		allwinner,pins = "PH4";
-		allwinner,function = "gpio_in";
+		pins = "PH4";
+		function = "gpio_in";
 	};
 
 	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
-		allwinner,pins = "PH5";
-		allwinner,function = "gpio_in";
+		pins = "PH5";
+		function = "gpio_in";
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun7i-a20-olinuxino-lime.dts b/arch/arm/boot/dts/sun7i-a20-olinuxino-lime.dts
index 21946497789e..1297432c2802 100644
--- a/arch/arm/boot/dts/sun7i-a20-olinuxino-lime.dts
+++ b/arch/arm/boot/dts/sun7i-a20-olinuxino-lime.dts
@@ -153,26 +153,26 @@
 
 &pio {
 	ahci_pwr_pin_olinuxinolime: ahci_pwr_pin@1 {
-		allwinner,pins = "PC3";
-		allwinner,function = "gpio_out";
+		pins = "PC3";
+		function = "gpio_out";
 	};
 
 	led_pins_olinuxinolime: led_pins@0 {
-		allwinner,pins = "PH2";
-		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_20_MA>;
+		pins = "PH2";
+		function = "gpio_out";
+		drive-strength = <20>;
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
-		allwinner,pins = "PH4";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PH4";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
-		allwinner,pins = "PH5";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_DOWN>;
+		pins = "PH5";
+		function = "gpio_in";
+		bias-pull-down;
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2-emmc.dts b/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2-emmc.dts
index 6858d6aafea3..6efd915b00ee 100644
--- a/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2-emmc.dts
+++ b/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2-emmc.dts
@@ -57,8 +57,8 @@
 
 &pio {
 	mmc2_pins_nrst: mmc2@0 {
-		allwinner,pins = "PC16";
-		allwinner,function = "gpio_out";
+		pins = "PC16";
+		function = "gpio_out";
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts b/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts
index 3dcd745126a9..b421d5170e0a 100644
--- a/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts
+++ b/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts
@@ -202,31 +202,31 @@
 
 &pio {
 	ahci_pwr_pin_olinuxinolime: ahci_pwr_pin@1 {
-		allwinner,pins = "PC3";
-		allwinner,function = "gpio_out";
+		pins = "PC3";
+		function = "gpio_out";
 	};
 
 	led_pins_olinuxinolime: led_pins@0 {
-		allwinner,pins = "PH2";
-		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_20_MA>;
+		pins = "PH2";
+		function = "gpio_out";
+		drive-strength = <20>;
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
-		allwinner,pins = "PH4";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PH4";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
-		allwinner,pins = "PH5";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_DOWN>;
+		pins = "PH5";
+		function = "gpio_in";
+		bias-pull-down;
 	};
 
 	usb0_vbus_pin_lime2: usb0_vbus_pin@0 {
-		allwinner,pins = "PC17";
-		allwinner,function = "gpio_out";
+		pins = "PC17";
+		function = "gpio_out";
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts b/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts
index 3773926df96e..223fbd9f7c62 100644
--- a/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts
+++ b/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts
@@ -227,27 +227,27 @@
 
 &pio {
 	mmc3_cd_pin_olinuxinom: mmc3_cd_pin@0 {
-		allwinner,pins = "PH11";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PH11";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	led_pins_olinuxino: led_pins@0 {
-		allwinner,pins = "PH2";
-		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_20_MA>;
+		pins = "PH2";
+		function = "gpio_out";
+		drive-strength = <20>;
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
-		allwinner,pins = "PH4";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PH4";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
-		allwinner,pins = "PH5";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_DOWN>;
+		pins = "PH5";
+		function = "gpio_in";
+		bias-pull-down;
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun7i-a20-orangepi-mini.dts b/arch/arm/boot/dts/sun7i-a20-orangepi-mini.dts
index 8e05256f7c1b..a74265749227 100644
--- a/arch/arm/boot/dts/sun7i-a20-orangepi-mini.dts
+++ b/arch/arm/boot/dts/sun7i-a20-orangepi-mini.dts
@@ -166,41 +166,41 @@
 
 &pio {
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
-		allwinner,pins = "PH4";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PH4";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	mmc0_cd_pin_orangepi: mmc0_cd_pin@0 {
-		allwinner,pins = "PH10";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PH10";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	mmc3_cd_pin_orangepi: mmc3_cd_pin@0 {
-		allwinner,pins = "PH11";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PH11";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	usb2_vbus_pin_bananapro: usb2_vbus_pin@0 {
-		allwinner,pins = "PH22";
-		allwinner,function = "gpio_out";
+		pins = "PH22";
+		function = "gpio_out";
 	};
 
 	gmac_power_pin_orangepi: gmac_power_pin@0 {
-		allwinner,pins = "PH23";
-		allwinner,function = "gpio_out";
+		pins = "PH23";
+		function = "gpio_out";
 	};
 
 	led_pins_orangepi: led_pins@0 {
-		allwinner,pins = "PH24", "PH25";
-		allwinner,function = "gpio_out";
+		pins = "PH24", "PH25";
+		function = "gpio_out";
 	};
 
 	usb1_vbus_pin_bananapro: usb1_vbus_pin@0 {
-		allwinner,pins = "PH26";
-		allwinner,function = "gpio_out";
+		pins = "PH26";
+		function = "gpio_out";
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun7i-a20-orangepi.dts b/arch/arm/boot/dts/sun7i-a20-orangepi.dts
index d168b8f08e30..3de980c8f8ff 100644
--- a/arch/arm/boot/dts/sun7i-a20-orangepi.dts
+++ b/arch/arm/boot/dts/sun7i-a20-orangepi.dts
@@ -147,35 +147,35 @@
 
 &pio {
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
-		allwinner,pins = "PH4";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PH4";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	mmc0_cd_pin_orangepi: mmc0_cd_pin@0 {
-		allwinner,pins = "PH10";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PH10";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	usb2_vbus_pin_bananapro: usb2_vbus_pin@0 {
-		allwinner,pins = "PH22";
-		allwinner,function = "gpio_out";
+		pins = "PH22";
+		function = "gpio_out";
 	};
 
 	gmac_power_pin_orangepi: gmac_power_pin@0 {
-		allwinner,pins = "PH23";
-		allwinner,function = "gpio_out";
+		pins = "PH23";
+		function = "gpio_out";
 	};
 
 	led_pins_orangepi: led_pins@0 {
-		allwinner,pins = "PH24";
-		allwinner,function = "gpio_out";
+		pins = "PH24";
+		function = "gpio_out";
 	};
 
 	usb1_vbus_pin_bananapro: usb1_vbus_pin@0 {
-		allwinner,pins = "PH26";
-		allwinner,function = "gpio_out";
+		pins = "PH26";
+		function = "gpio_out";
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun7i-a20-pcduino3-nano.dts b/arch/arm/boot/dts/sun7i-a20-pcduino3-nano.dts
index cdcbee74274e..f47a5c46bc20 100644
--- a/arch/arm/boot/dts/sun7i-a20-pcduino3-nano.dts
+++ b/arch/arm/boot/dts/sun7i-a20-pcduino3-nano.dts
@@ -152,24 +152,24 @@
 
 &pio {
 	ahci_pwr_pin_pcduino3_nano: ahci_pwr_pin@0 {
-		allwinner,pins = "PH2";
-		allwinner,function = "gpio_out";
+		pins = "PH2";
+		function = "gpio_out";
 	};
 
 	led_pins_pcduino3_nano: led_pins@0 {
-		allwinner,pins = "PH16", "PH15";
-		allwinner,function = "gpio_out";
+		pins = "PH16", "PH15";
+		function = "gpio_out";
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
-		allwinner,pins = "PH4";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PH4";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	usb1_vbus_pin_pcduino3_nano: usb1_vbus_pin@0 {
-		allwinner,pins = "PD2";
-		allwinner,function = "gpio_out";
+		pins = "PD2";
+		function = "gpio_out";
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun7i-a20-pcduino3.dts b/arch/arm/boot/dts/sun7i-a20-pcduino3.dts
index fd2b4b8af9ea..4599f98a3aee 100644
--- a/arch/arm/boot/dts/sun7i-a20-pcduino3.dts
+++ b/arch/arm/boot/dts/sun7i-a20-pcduino3.dts
@@ -108,7 +108,7 @@
 };
 
 &ahci_pwr_pin_a {
-	allwinner,pins = "PH2";
+	pins = "PH2";
 };
 
 &codec {
@@ -183,19 +183,19 @@
 
 &pio {
 	led_pins_pcduino3: led_pins@0 {
-		allwinner,pins = "PH15", "PH16";
-		allwinner,function = "gpio_out";
+		pins = "PH15", "PH16";
+		function = "gpio_out";
 	};
 
 	key_pins_pcduino3: key_pins@0 {
-		allwinner,pins = "PH17", "PH18", "PH19";
-		allwinner,function = "gpio_in";
+		pins = "PH17", "PH18", "PH19";
+		function = "gpio_in";
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
-		allwinner,pins = "PH4";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PH4";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts b/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts
index 688f75ceab58..e19f17177755 100644
--- a/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts
+++ b/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts
@@ -173,24 +173,24 @@
 
 &pio {
 	bl_enable_pin: bl_enable_pin@0 {
-		allwinner,pins = "PH7";
-		allwinner,function = "gpio_out";
+		pins = "PH7";
+		function = "gpio_out";
 	};
 
 	codec_pa_pin: codec_pa_pin@0 {
-		allwinner,pins = "PH15";
-		allwinner,function = "gpio_out";
+		pins = "PH15";
+		function = "gpio_out";
 	};
 
 	ts_reset_pin: ts_reset_pin@0 {
-		allwinner,pins = "PB13";
-		allwinner,function = "gpio_out";
+		pins = "PB13";
+		function = "gpio_out";
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
-		allwinner,pins = "PH4";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PH4";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun7i-a20-wits-pro-a20-dkt.dts b/arch/arm/boot/dts/sun7i-a20-wits-pro-a20-dkt.dts
index b12493350ee3..c3078d4f1093 100644
--- a/arch/arm/boot/dts/sun7i-a20-wits-pro-a20-dkt.dts
+++ b/arch/arm/boot/dts/sun7i-a20-wits-pro-a20-dkt.dts
@@ -160,14 +160,14 @@
 
 &pio {
 	vmmc3_pin_ap6xxx_wl_regon: vmmc3_pin@0 {
-		allwinner,pins = "PH9";
-		allwinner,function = "gpio_out";
+		pins = "PH9";
+		function = "gpio_out";
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
-		allwinner,pins = "PH4";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PH4";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index 35dd9680ce3d..c1b540e2329f 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -1092,229 +1092,229 @@
 			#gpio-cells = <3>;
 
 			clk_out_a_pins_a: clk_out_a@0 {
-				allwinner,pins = "PI12";
-				allwinner,function = "clk_out_a";
+				pins = "PI12";
+				function = "clk_out_a";
 			};
 
 			clk_out_b_pins_a: clk_out_b@0 {
-				allwinner,pins = "PI13";
-				allwinner,function = "clk_out_b";
+				pins = "PI13";
+				function = "clk_out_b";
 			};
 
 			emac_pins_a: emac0@0 {
-				allwinner,pins = "PA0", "PA1", "PA2",
-						"PA3", "PA4", "PA5", "PA6",
-						"PA7", "PA8", "PA9", "PA10",
-						"PA11", "PA12", "PA13", "PA14",
-						"PA15", "PA16";
-				allwinner,function = "emac";
+				pins = "PA0", "PA1", "PA2",
+				       "PA3", "PA4", "PA5", "PA6",
+				       "PA7", "PA8", "PA9", "PA10",
+				       "PA11", "PA12", "PA13", "PA14",
+				       "PA15", "PA16";
+				function = "emac";
 			};
 
 			gmac_pins_mii_a: gmac_mii@0 {
-				allwinner,pins = "PA0", "PA1", "PA2",
-						"PA3", "PA4", "PA5", "PA6",
-						"PA7", "PA8", "PA9", "PA10",
-						"PA11", "PA12", "PA13", "PA14",
-						"PA15", "PA16";
-				allwinner,function = "gmac";
+				pins = "PA0", "PA1", "PA2",
+				       "PA3", "PA4", "PA5", "PA6",
+				       "PA7", "PA8", "PA9", "PA10",
+				       "PA11", "PA12", "PA13", "PA14",
+				       "PA15", "PA16";
+				function = "gmac";
 			};
 
 			gmac_pins_rgmii_a: gmac_rgmii@0 {
-				allwinner,pins = "PA0", "PA1", "PA2",
-						"PA3", "PA4", "PA5", "PA6",
-						"PA7", "PA8", "PA10",
-						"PA11", "PA12", "PA13",
-						"PA15", "PA16";
-				allwinner,function = "gmac";
+				pins = "PA0", "PA1", "PA2",
+				       "PA3", "PA4", "PA5", "PA6",
+				        "PA7", "PA8", "PA10",
+				       "PA11", "PA12", "PA13",
+				       "PA15", "PA16";
+				function = "gmac";
 				/*
 				 * data lines in RGMII mode use DDR mode
 				 * and need a higher signal drive strength
 				 */
-				allwinner,drive = <SUN4I_PINCTRL_40_MA>;
+				drive-strength = <40>;
 			};
 
 			i2c0_pins_a: i2c0@0 {
-				allwinner,pins = "PB0", "PB1";
-				allwinner,function = "i2c0";
+				pins = "PB0", "PB1";
+				function = "i2c0";
 			};
 
 			i2c1_pins_a: i2c1@0 {
-				allwinner,pins = "PB18", "PB19";
-				allwinner,function = "i2c1";
+				pins = "PB18", "PB19";
+				function = "i2c1";
 			};
 
 			i2c2_pins_a: i2c2@0 {
-				allwinner,pins = "PB20", "PB21";
-				allwinner,function = "i2c2";
+				pins = "PB20", "PB21";
+				function = "i2c2";
 			};
 
 			i2c3_pins_a: i2c3@0 {
-				allwinner,pins = "PI0", "PI1";
-				allwinner,function = "i2c3";
+				pins = "PI0", "PI1";
+				function = "i2c3";
 			};
 
 			ir0_rx_pins_a: ir0@0 {
-				    allwinner,pins = "PB4";
-				    allwinner,function = "ir0";
+				pins = "PB4";
+				function = "ir0";
 			};
 
 			ir0_tx_pins_a: ir0@1 {
-				    allwinner,pins = "PB3";
-				    allwinner,function = "ir0";
+				pins = "PB3";
+				function = "ir0";
 			};
 
 			ir1_rx_pins_a: ir1@0 {
-				    allwinner,pins = "PB23";
-				    allwinner,function = "ir1";
+				pins = "PB23";
+				function = "ir1";
 			};
 
 			ir1_tx_pins_a: ir1@1 {
-				    allwinner,pins = "PB22";
-				    allwinner,function = "ir1";
+				pins = "PB22";
+				function = "ir1";
 			};
 
 			mmc0_pins_a: mmc0@0 {
-				allwinner,pins = "PF0", "PF1", "PF2",
-						 "PF3", "PF4", "PF5";
-				allwinner,function = "mmc0";
-				allwinner,drive = <SUN4I_PINCTRL_30_MA>;
+				pins = "PF0", "PF1", "PF2",
+				       "PF3", "PF4", "PF5";
+				function = "mmc0";
+				drive-strength = <30>;
 			};
 
 			mmc0_cd_pin_reference_design: mmc0_cd_pin@0 {
-				allwinner,pins = "PH1";
-				allwinner,function = "gpio_in";
-				allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+				pins = "PH1";
+				function = "gpio_in";
+				bias-pull-up;
 			};
 
 			mmc2_pins_a: mmc2@0 {
-				allwinner,pins = "PC6", "PC7", "PC8",
-						 "PC9", "PC10", "PC11";
-				allwinner,function = "mmc2";
-				allwinner,drive = <SUN4I_PINCTRL_30_MA>;
-				allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+				pins = "PC6", "PC7", "PC8",
+				       "PC9", "PC10", "PC11";
+				function = "mmc2";
+				drive-strength = <30>;
+				bias-pull-up;
 			};
 
 			mmc3_pins_a: mmc3@0 {
-				allwinner,pins = "PI4", "PI5", "PI6",
-						 "PI7", "PI8", "PI9";
-				allwinner,function = "mmc3";
-				allwinner,drive = <SUN4I_PINCTRL_30_MA>;
+				pins = "PI4", "PI5", "PI6",
+				       "PI7", "PI8", "PI9";
+				function = "mmc3";
+				drive-strength = <30>;
 			};
 
 			ps20_pins_a: ps20@0 {
-				allwinner,pins = "PI20", "PI21";
-				allwinner,function = "ps2";
+				pins = "PI20", "PI21";
+				function = "ps2";
 			};
 
 			ps21_pins_a: ps21@0 {
-				allwinner,pins = "PH12", "PH13";
-				allwinner,function = "ps2";
+				pins = "PH12", "PH13";
+				function = "ps2";
 			};
 
 			pwm0_pins_a: pwm0@0 {
-				allwinner,pins = "PB2";
-				allwinner,function = "pwm";
+				pins = "PB2";
+				function = "pwm";
 			};
 
 			pwm1_pins_a: pwm1@0 {
-				allwinner,pins = "PI3";
-				allwinner,function = "pwm";
+				pins = "PI3";
+				function = "pwm";
 			};
 
 			spdif_tx_pins_a: spdif@0 {
-				allwinner,pins = "PB13";
-				allwinner,function = "spdif";
-				allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+				pins = "PB13";
+				function = "spdif";
+				bias-pull-up;
 			};
 
 			spi0_pins_a: spi0@0 {
-				allwinner,pins = "PI11", "PI12", "PI13";
-				allwinner,function = "spi0";
+				pins = "PI11", "PI12", "PI13";
+				function = "spi0";
 			};
 
 			spi0_cs0_pins_a: spi0_cs0@0 {
-				allwinner,pins = "PI10";
-				allwinner,function = "spi0";
+				pins = "PI10";
+				function = "spi0";
 			};
 
 			spi0_cs1_pins_a: spi0_cs1@0 {
-				allwinner,pins = "PI14";
-				allwinner,function = "spi0";
+				pins = "PI14";
+				function = "spi0";
 			};
 
 			spi1_pins_a: spi1@0 {
-				allwinner,pins = "PI17", "PI18", "PI19";
-				allwinner,function = "spi1";
+				pins = "PI17", "PI18", "PI19";
+				function = "spi1";
 			};
 
 			spi1_cs0_pins_a: spi1_cs0@0 {
-				allwinner,pins = "PI16";
-				allwinner,function = "spi1";
+				pins = "PI16";
+				function = "spi1";
 			};
 
 			spi2_pins_a: spi2@0 {
-				allwinner,pins = "PC20", "PC21", "PC22";
-				allwinner,function = "spi2";
+				pins = "PC20", "PC21", "PC22";
+				function = "spi2";
 			};
 
 			spi2_pins_b: spi2@1 {
-				allwinner,pins = "PB15", "PB16", "PB17";
-				allwinner,function = "spi2";
+				pins = "PB15", "PB16", "PB17";
+				function = "spi2";
 			};
 
 			spi2_cs0_pins_a: spi2_cs0@0 {
-				allwinner,pins = "PC19";
-				allwinner,function = "spi2";
+				pins = "PC19";
+				function = "spi2";
 			};
 
 			spi2_cs0_pins_b: spi2_cs0@1 {
-				allwinner,pins = "PB14";
-				allwinner,function = "spi2";
+				pins = "PB14";
+				function = "spi2";
 			};
 
 			uart0_pins_a: uart0@0 {
-				allwinner,pins = "PB22", "PB23";
-				allwinner,function = "uart0";
+				pins = "PB22", "PB23";
+				function = "uart0";
 			};
 
 			uart2_pins_a: uart2@0 {
-				allwinner,pins = "PI16", "PI17", "PI18", "PI19";
-				allwinner,function = "uart2";
+				pins = "PI16", "PI17", "PI18", "PI19";
+				function = "uart2";
 			};
 
 			uart3_pins_a: uart3@0 {
-				allwinner,pins = "PG6", "PG7", "PG8", "PG9";
-				allwinner,function = "uart3";
+				pins = "PG6", "PG7", "PG8", "PG9";
+				function = "uart3";
 			};
 
 			uart3_pins_b: uart3@1 {
-				allwinner,pins = "PH0", "PH1";
-				allwinner,function = "uart3";
+				pins = "PH0", "PH1";
+				function = "uart3";
 			};
 
 			uart4_pins_a: uart4@0 {
-				allwinner,pins = "PG10", "PG11";
-				allwinner,function = "uart4";
+				pins = "PG10", "PG11";
+				function = "uart4";
 			};
 
 			uart4_pins_b: uart4@1 {
-				allwinner,pins = "PH4", "PH5";
-				allwinner,function = "uart4";
+				pins = "PH4", "PH5";
+				function = "uart4";
 			};
 
 			uart5_pins_a: uart5@0 {
-				allwinner,pins = "PI10", "PI11";
-				allwinner,function = "uart5";
+				pins = "PI10", "PI11";
+				function = "uart5";
 			};
 
 			uart6_pins_a: uart6@0 {
-				allwinner,pins = "PI12", "PI13";
-				allwinner,function = "uart6";
+				pins = "PI12", "PI13";
+				function = "uart6";
 			};
 
 			uart7_pins_a: uart7@0 {
-				allwinner,pins = "PI20", "PI21";
-				allwinner,function = "uart7";
+				pins = "PI20", "PI21";
+				function = "uart7";
 			};
 		};
 
diff --git a/arch/arm/boot/dts/sun8i-a23-a33.dtsi b/arch/arm/boot/dts/sun8i-a23-a33.dtsi
index 294f00a95559..0afb36e6a428 100644
--- a/arch/arm/boot/dts/sun8i-a23-a33.dtsi
+++ b/arch/arm/boot/dts/sun8i-a23-a33.dtsi
@@ -273,69 +273,69 @@
 			#gpio-cells = <3>;
 
 			uart0_pins_a: uart0@0 {
-				allwinner,pins = "PF2", "PF4";
-				allwinner,function = "uart0";
+				pins = "PF2", "PF4";
+				function = "uart0";
 			};
 
 			uart1_pins_a: uart1@0 {
-				allwinner,pins = "PG6", "PG7";
-				allwinner,function = "uart1";
+				pins = "PG6", "PG7";
+				function = "uart1";
 			};
 
 			uart1_pins_cts_rts_a: uart1-cts-rts@0 {
-				allwinner,pins = "PG8", "PG9";
-				allwinner,function = "uart1";
+				pins = "PG8", "PG9";
+				function = "uart1";
 			};
 
 			mmc0_pins_a: mmc0@0 {
-				allwinner,pins = "PF0", "PF1", "PF2",
-						 "PF3", "PF4", "PF5";
-				allwinner,function = "mmc0";
-				allwinner,drive = <SUN4I_PINCTRL_30_MA>;
+				pins = "PF0", "PF1", "PF2",
+				       "PF3", "PF4", "PF5";
+				function = "mmc0";
+				drive-strength = <30>;
 			};
 
 			mmc1_pins_a: mmc1@0 {
-				allwinner,pins = "PG0", "PG1", "PG2",
-						 "PG3", "PG4", "PG5";
-				allwinner,function = "mmc1";
-				allwinner,drive = <SUN4I_PINCTRL_30_MA>;
+				pins = "PG0", "PG1", "PG2",
+				       "PG3", "PG4", "PG5";
+				function = "mmc1";
+				drive-strength = <30>;
 			};
 
 			mmc2_8bit_pins: mmc2_8bit {
-				allwinner,pins = "PC5", "PC6", "PC8",
-						 "PC9", "PC10", "PC11",
-						 "PC12", "PC13", "PC14",
-						 "PC15", "PC16";
-				allwinner,function = "mmc2";
-				allwinner,drive = <SUN4I_PINCTRL_30_MA>;
+				pins = "PC5", "PC6", "PC8",
+				       "PC9", "PC10", "PC11",
+				       "PC12", "PC13", "PC14",
+				       "PC15", "PC16";
+				function = "mmc2";
+				drive-strength = <30>;
 			};
 
 			pwm0_pins: pwm0 {
-				allwinner,pins = "PH0";
-				allwinner,function = "pwm0";
+				pins = "PH0";
+				function = "pwm0";
 			};
 
 			i2c0_pins_a: i2c0@0 {
-				allwinner,pins = "PH2", "PH3";
-				allwinner,function = "i2c0";
+				pins = "PH2", "PH3";
+				function = "i2c0";
 			};
 
 			i2c1_pins_a: i2c1@0 {
-				allwinner,pins = "PH4", "PH5";
-				allwinner,function = "i2c1";
+				pins = "PH4", "PH5";
+				function = "i2c1";
 			};
 
 			i2c2_pins_a: i2c2@0 {
-				allwinner,pins = "PE12", "PE13";
-				allwinner,function = "i2c2";
+				pins = "PE12", "PE13";
+				function = "i2c2";
 			};
 
 			lcd_rgb666_pins: lcd-rgb666@0 {
-				allwinner,pins = "PD2", "PD3", "PD4", "PD5", "PD6", "PD7",
-						 "PD10", "PD11", "PD12", "PD13", "PD14", "PD15",
-			                         "PD18", "PD19", "PD20", "PD21", "PD22", "PD23",
-			                         "PD24", "PD25", "PD26", "PD27";
-				allwinner,function = "lcd0";
+				pins = "PD2", "PD3", "PD4", "PD5", "PD6", "PD7",
+				       "PD10", "PD11", "PD12", "PD13", "PD14", "PD15",
+				       "PD18", "PD19", "PD20", "PD21", "PD22", "PD23",
+				       "PD24", "PD25", "PD26", "PD27";
+				function = "lcd0";
 			};
 		};
 
@@ -566,15 +566,15 @@
 			#gpio-cells = <3>;
 
 			r_rsb_pins: r_rsb {
-				allwinner,pins = "PL0", "PL1";
-				allwinner,function = "s_rsb";
-				allwinner,drive = <SUN4I_PINCTRL_20_MA>;
-				allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+				pins = "PL0", "PL1";
+				function = "s_rsb";
+				drive-strength = <20>;
+				bias-pull-up;
 			};
 
 			r_uart_pins_a: r_uart@0 {
-				allwinner,pins = "PL2", "PL3";
-				allwinner,function = "s_uart";
+				pins = "PL2", "PL3";
+				function = "s_uart";
 			};
 		};
 
diff --git a/arch/arm/boot/dts/sun8i-a23-evb.dts b/arch/arm/boot/dts/sun8i-a23-evb.dts
index 490a5a6da50f..c21f5b1b255e 100644
--- a/arch/arm/boot/dts/sun8i-a23-evb.dts
+++ b/arch/arm/boot/dts/sun8i-a23-evb.dts
@@ -115,9 +115,9 @@
 
 &pio {
 	mmc0_cd_pin_evb: mmc0_cd_pin@0 {
-		allwinner,pins = "PB4";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PB4";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun8i-a23-polaroid-mid2407pxe03.dts b/arch/arm/boot/dts/sun8i-a23-polaroid-mid2407pxe03.dts
index 89f68a78ab32..0a55844baec5 100644
--- a/arch/arm/boot/dts/sun8i-a23-polaroid-mid2407pxe03.dts
+++ b/arch/arm/boot/dts/sun8i-a23-polaroid-mid2407pxe03.dts
@@ -86,13 +86,13 @@
 };
 
 &mmc1_pins_a {
-	allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+	bias-pull-up;
 };
 
 &r_pio {
 	wifi_pwrseq_pin_mid2407: wifi_pwrseq_pin@0 {
-		allwinner,pins = "PL6";
-		allwinner,function = "gpio_out";
+		pins = "PL6";
+		function = "gpio_out";
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun8i-a23-polaroid-mid2809pxe04.dts b/arch/arm/boot/dts/sun8i-a23-polaroid-mid2809pxe04.dts
index e8367deaa587..6b3bcae089f2 100644
--- a/arch/arm/boot/dts/sun8i-a23-polaroid-mid2809pxe04.dts
+++ b/arch/arm/boot/dts/sun8i-a23-polaroid-mid2809pxe04.dts
@@ -79,13 +79,13 @@
 };
 
 &mmc1_pins_a {
-	allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+	bias-pull-up;
 };
 
 &r_pio {
 	wifi_pwrseq_pin_mid2809: wifi_pwrseq_pin@0 {
-		allwinner,pins = "PL6";
-		allwinner,function = "gpio_out";
+		pins = "PL6";
+		function = "gpio_out";
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun8i-a33-inet-d978-rev2.dts b/arch/arm/boot/dts/sun8i-a33-inet-d978-rev2.dts
index 442db91b943a..3e05959104f1 100644
--- a/arch/arm/boot/dts/sun8i-a33-inet-d978-rev2.dts
+++ b/arch/arm/boot/dts/sun8i-a33-inet-d978-rev2.dts
@@ -71,7 +71,7 @@
 };
 
 &mmc1_pins_a {
-	allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+	bias-pull-up;
 };
 
 &mmc1 {
@@ -89,9 +89,9 @@
 
 &r_pio {
 	led_pin_d978: led_pin_d978@0 {
-		allwinner,pins = "PL5";
-		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_20_MA>;
+		pins = "PL5";
+		function = "gpio_out";
+		drive-strength = <20>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun8i-a33-olinuxino.dts b/arch/arm/boot/dts/sun8i-a33-olinuxino.dts
index 59a64d2d695c..231d115d1997 100644
--- a/arch/arm/boot/dts/sun8i-a33-olinuxino.dts
+++ b/arch/arm/boot/dts/sun8i-a33-olinuxino.dts
@@ -92,18 +92,18 @@
 
 &pio {
 	led_pin_olinuxino: led_pins@0 {
-		allwinner,pins = "PB7";
-		allwinner,function = "gpio_out";
+		pins = "PB7";
+		function = "gpio_out";
 	};
 
 	mmc0_cd_pin_olinuxino: mmc0_cd_pin@0 {
-		allwinner,pins = "PB4";
-		allwinner,function = "gpio_in";
+		pins = "PB4";
+		function = "gpio_in";
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
-		allwinner,pins = "PB3";
-		allwinner,function = "gpio_in";
+		pins = "PB3";
+		function = "gpio_in";
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun8i-a33-sinlinx-sina33.dts b/arch/arm/boot/dts/sun8i-a33-sinlinx-sina33.dts
index 51b4b6c75397..564cfef5a6fa 100644
--- a/arch/arm/boot/dts/sun8i-a33-sinlinx-sina33.dts
+++ b/arch/arm/boot/dts/sun8i-a33-sinlinx-sina33.dts
@@ -115,9 +115,9 @@
 
 &mmc2_8bit_pins {
 	/* Increase drive strength for DDR modes */
-	allwinner,drive = <SUN4I_PINCTRL_40_MA>;
+	drive-strength = <40>;
 	/* eMMC is missing pull-ups */
-	allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+	bias-pull-up;
 };
 
 &ohci0 {
@@ -126,9 +126,9 @@
 
 &pio {
 	mmc0_cd_pin_sina33: mmc0_cd_pin@0 {
-		allwinner,pins = "PB4";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PB4";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun8i-a33.dtsi b/arch/arm/boot/dts/sun8i-a33.dtsi
index 310a38cf7f18..63d5181ffff8 100644
--- a/arch/arm/boot/dts/sun8i-a33.dtsi
+++ b/arch/arm/boot/dts/sun8i-a33.dtsi
@@ -238,8 +238,8 @@
 		     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
 
 	uart0_pins_b: uart0@1 {
-		allwinner,pins = "PB0", "PB1";
-		allwinner,function = "uart0";
+		pins = "PB0", "PB1";
+		function = "uart0";
 	};
 
 };
diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
index cec6bfc2d3c9..656cdb5f7a88 100644
--- a/arch/arm/boot/dts/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -167,20 +167,20 @@
 			#gpio-cells = <3>;
 
 			mmc0_pins_a: mmc0@0 {
-				allwinner,pins = "PF0", "PF1", "PF2",
-						 "PF3", "PF4", "PF5";
-				allwinner,function = "mmc0";
-				allwinner,drive = <SUN4I_PINCTRL_30_MA>;
+				pins = "PF0", "PF1", "PF2",
+				       "PF3", "PF4", "PF5";
+				function = "mmc0";
+				drive-strength = <30>;
 			};
 
 			uart0_pins_a: uart0@0 {
-				allwinner,pins = "PF2", "PF4";
-				allwinner,function = "uart0";
+				pins = "PF2", "PF4";
+				function = "uart0";
 			};
 
 			uart0_pins_b: uart0@1 {
-				allwinner,pins = "PB9", "PB10";
-				allwinner,function = "uart0";
+				pins = "PB9", "PB10";
+				function = "uart0";
 			};
 		};
 
diff --git a/arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts b/arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts
index 49194c38d56b..c0c49dd4d3b2 100644
--- a/arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts
+++ b/arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts
@@ -156,18 +156,18 @@
 
 &r_pio {
 	pwr_led_bpi_m2p: led_pins@0 {
-		allwinner,pins = "PL10";
-		allwinner,function = "gpio_out";
+		pins = "PL10";
+		function = "gpio_out";
 	};
 
 	sw_r_bpi_m2p: key_pins@0 {
-		allwinner,pins = "PL3";
-		allwinner,function = "gpio_in";
+		pins = "PL3";
+		function = "gpio_in";
 	};
 
 	wifi_en_bpi_m2p: wifi_en_pin {
-		allwinner,pins = "PL7";
-		allwinner,function = "gpio_out";
+		pins = "PL7";
+		function = "gpio_out";
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts b/arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts
index 1c6e96e8ec98..c364b64ef309 100644
--- a/arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts
+++ b/arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts
@@ -97,15 +97,15 @@
 
 &pio {
 	leds_opc: led-pins {
-		allwinner,pins = "PA10";
-		allwinner,function = "gpio_out";
+		pins = "PA10";
+		function = "gpio_out";
 	};
 };
 
 &r_pio {
 	leds_r_opc: led-pins {
-		allwinner,pins = "PL10";
-		allwinner,function = "gpio_out";
+		pins = "PL10";
+		function = "gpio_out";
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts
index dfd9bc2008fd..047e9e1c6093 100644
--- a/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts
+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts
@@ -145,25 +145,25 @@
 
 &pio {
 	leds_opc: led_pins@0 {
-		allwinner,pins = "PA15";
-		allwinner,function = "gpio_out";
+		pins = "PA15";
+		function = "gpio_out";
 	};
 };
 
 &r_pio {
 	leds_r_opc: led_pins@0 {
-		allwinner,pins = "PL10";
-		allwinner,function = "gpio_out";
+		pins = "PL10";
+		function = "gpio_out";
 	};
 
 	sw_r_opc: key_pins@0 {
-		allwinner,pins = "PL3", "PL4";
-		allwinner,function = "gpio_in";
+		pins = "PL3", "PL4";
+		function = "gpio_in";
 	};
 
 	wifi_pwrseq_pin_orangepi: wifi_pwrseq_pin@0 {
-		allwinner,pins = "PL7";
-		allwinner,function = "gpio_out";
+		pins = "PL7";
+		function = "gpio_out";
 	};
 };
 
@@ -197,7 +197,7 @@
 };
 
 &usb1_vbus_pin_a {
-	allwinner,pins = "PG13";
+	pins = "PG13";
 };
 
 &usbphy {
diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-lite.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-lite.dts
index 77d29bae7739..22b99b407019 100644
--- a/arch/arm/boot/dts/sun8i-h3-orangepi-lite.dts
+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-lite.dts
@@ -143,20 +143,20 @@
 
 &pio {
 	leds_opc: led_pins@0 {
-		allwinner,pins = "PA15";
-		allwinner,function = "gpio_out";
+		pins = "PA15";
+		function = "gpio_out";
 	};
 };
 
 &r_pio {
 	leds_r_opc: led_pins@0 {
-		allwinner,pins = "PL10";
-		allwinner,function = "gpio_out";
+		pins = "PL10";
+		function = "gpio_out";
 	};
 
 	sw_r_opc: key_pins@0 {
-		allwinner,pins = "PL3";
-		allwinner,function = "gpio_in";
+		pins = "PL3";
+		function = "gpio_in";
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
index 49529d9ca26d..34da853ee037 100644
--- a/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
@@ -110,20 +110,20 @@
 
 &pio {
 	leds_opc: led_pins@0 {
-		allwinner,pins = "PA15";
-		allwinner,function = "gpio_out";
+		pins = "PA15";
+		function = "gpio_out";
 	};
 };
 
 &r_pio {
 	leds_r_opc: led_pins@0 {
-		allwinner,pins = "PL10";
-		allwinner,function = "gpio_out";
+		pins = "PL10";
+		function = "gpio_out";
 	};
 
 	sw_r_opc: key_pins@0 {
-		allwinner,pins = "PL3";
-		allwinner,function = "gpio_in";
+		pins = "PL3";
+		function = "gpio_in";
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-pc-plus.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-pc-plus.dts
index 851fd2c2cc8c..8b93f5c781a7 100644
--- a/arch/arm/boot/dts/sun8i-h3-orangepi-pc-plus.dts
+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-pc-plus.dts
@@ -82,7 +82,7 @@
 
 &mmc2_8bit_pins {
 	/* Increase drive strength for DDR modes */
-	allwinner,drive = <SUN4I_PINCTRL_40_MA>;
+	drive-strength = <40>;
 	/* eMMC is missing pull-ups */
-	allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+	bias-pull-up;
 };
diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
index 0d56d33d43ea..98b85be61e17 100644
--- a/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
@@ -132,20 +132,20 @@
 
 &pio {
 	leds_opc: led_pins@0 {
-		allwinner,pins = "PA15";
-		allwinner,function = "gpio_out";
+		pins = "PA15";
+		function = "gpio_out";
 	};
 };
 
 &r_pio {
 	leds_r_opc: led_pins@0 {
-		allwinner,pins = "PL10";
-		allwinner,function = "gpio_out";
+		pins = "PL10";
+		function = "gpio_out";
 	};
 
 	sw_r_opc: key_pins@0 {
-		allwinner,pins = "PL3";
-		allwinner,function = "gpio_in";
+		pins = "PL3";
+		function = "gpio_in";
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts
index ab8593d1d3df..8c40ab7bfa72 100644
--- a/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts
+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts
@@ -76,15 +76,15 @@
 
 &mmc2_8bit_pins {
 	/* Increase drive strength for DDR modes */
-	allwinner,drive = <SUN4I_PINCTRL_40_MA>;
+	drive-strength = <40>;
 	/* eMMC is missing pull-ups */
-	allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+	bias-pull-up;
 };
 
 &pio {
 	usb3_vbus_pin_a: usb3_vbus_pin@0 {
-		allwinner,pins = "PG11";
-		allwinner,function = "gpio_out";
+		pins = "PG11";
+		function = "gpio_out";
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3.dtsi
index cd02058dc8db..a1695ca88f7a 100644
--- a/arch/arm/boot/dts/sun8i-h3.dtsi
+++ b/arch/arm/boot/dts/sun8i-h3.dtsi
@@ -328,72 +328,72 @@
 			#interrupt-cells = <3>;
 
 			i2c0_pins: i2c0 {
-				allwinner,pins = "PA11", "PA12";
-				allwinner,function = "i2c0";
+				pins = "PA11", "PA12";
+				function = "i2c0";
 			};
 
 			i2c1_pins: i2c1 {
-				allwinner,pins = "PA18", "PA19";
-				allwinner,function = "i2c1";
+				pins = "PA18", "PA19";
+				function = "i2c1";
 			};
 
 			i2c2_pins: i2c2 {
-				allwinner,pins = "PE12", "PE13";
-				allwinner,function = "i2c2";
+				pins = "PE12", "PE13";
+				function = "i2c2";
 			};
 
 			mmc0_pins_a: mmc0@0 {
-				allwinner,pins = "PF0", "PF1", "PF2", "PF3",
-						 "PF4", "PF5";
-				allwinner,function = "mmc0";
-				allwinner,drive = <SUN4I_PINCTRL_30_MA>;
+				pins = "PF0", "PF1", "PF2", "PF3",
+				       "PF4", "PF5";
+				function = "mmc0";
+				drive-strength = <30>;
 			};
 
 			mmc0_cd_pin: mmc0_cd_pin@0 {
-				allwinner,pins = "PF6";
-				allwinner,function = "gpio_in";
-				allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+				pins = "PF6";
+				function = "gpio_in";
+				bias-pull-up;
 			};
 
 			mmc1_pins_a: mmc1@0 {
-				allwinner,pins = "PG0", "PG1", "PG2", "PG3",
-						 "PG4", "PG5";
-				allwinner,function = "mmc1";
-				allwinner,drive = <SUN4I_PINCTRL_30_MA>;
+				pins = "PG0", "PG1", "PG2", "PG3",
+				       "PG4", "PG5";
+				function = "mmc1";
+				drive-strength = <30>;
 			};
 
 			mmc2_8bit_pins: mmc2_8bit {
-				allwinner,pins = "PC5", "PC6", "PC8",
-						 "PC9", "PC10", "PC11",
-						 "PC12", "PC13", "PC14",
-						 "PC15", "PC16";
-				allwinner,function = "mmc2";
-				allwinner,drive = <SUN4I_PINCTRL_30_MA>;
+				pins = "PC5", "PC6", "PC8",
+				       "PC9", "PC10", "PC11",
+				       "PC12", "PC13", "PC14",
+				       "PC15", "PC16";
+				function = "mmc2";
+				drive-strength = <30>;
 			};
 
 			uart0_pins_a: uart0@0 {
-				allwinner,pins = "PA4", "PA5";
-				allwinner,function = "uart0";
+				pins = "PA4", "PA5";
+				function = "uart0";
 			};
 
 			uart1_pins: uart1 {
-				allwinner,pins = "PG6", "PG7";
-				allwinner,function = "uart1";
+				pins = "PG6", "PG7";
+				function = "uart1";
 			};
 
 			uart1_rts_cts_pins: uart1_rts_cts {
-				allwinner,pins = "PG8", "PG9";
-				allwinner,function = "uart1";
+				pins = "PG8", "PG9";
+				function = "uart1";
 			};
 
 			uart2_pins: uart2 {
-				allwinner,pins = "PA0", "PA1";
-				allwinner,function = "uart2";
+				pins = "PA0", "PA1";
+				function = "uart2";
 			};
 
 			uart3_pins: uart3 {
-				allwinner,pins = "PG13", "PG14";
-				allwinner,function = "uart3";
+				pins = "PG13", "PG14";
+				function = "uart3";
 			};
 		};
 
@@ -556,8 +556,8 @@
 			#interrupt-cells = <3>;
 
 			ir_pins_a: ir@0 {
-				allwinner,pins = "PL11";
-				allwinner,function = "s_cir_rx";
+				pins = "PL11";
+				function = "s_cir_rx";
 			};
 		};
 	};
diff --git a/arch/arm/boot/dts/sun8i-q8-common.dtsi b/arch/arm/boot/dts/sun8i-q8-common.dtsi
index 0f680b7f5e03..c676940a96da 100644
--- a/arch/arm/boot/dts/sun8i-q8-common.dtsi
+++ b/arch/arm/boot/dts/sun8i-q8-common.dtsi
@@ -83,14 +83,14 @@
 };
 
 &mmc1_pins_a {
-	allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+	bias-pull-up;
 };
 
 &r_pio {
 	wifi_pwrseq_pin_q8: wifi_pwrseq_pin@0 {
-		allwinner,pins = "PL6", "PL7", "PL11";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PL6", "PL7", "PL11";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun8i-r16-parrot.dts b/arch/arm/boot/dts/sun8i-r16-parrot.dts
index 0588fceb0636..6e42adbde60b 100644
--- a/arch/arm/boot/dts/sun8i-r16-parrot.dts
+++ b/arch/arm/boot/dts/sun8i-r16-parrot.dts
@@ -149,8 +149,8 @@
 };
 
 &mmc2_8bit_pins {
-	allwinner,drive = <SUN4I_PINCTRL_40_MA>;
-	allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+	drive-strength = <40>;
+	bias-pull-up;
 };
 
 &ohci0 {
@@ -159,32 +159,32 @@
 
 &pio {
 	mmc0_cd_pin_parrot: mmc0_cd_pin@0 {
-		allwinner,pins = "PD14";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PD14";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	led_pins_parrot: led_pins@0 {
-		allwinner,pins = "PE16", "PE17";
-		allwinner,function = "gpio_out";
+		pins = "PE16", "PE17";
+		function = "gpio_out";
 	};
 
 	usb0_id_det: usb0_id_detect_pin@0 {
-		allwinner,pins = "PD10";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PD10";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	usb1_vbus_pin_parrot: usb1_vbus_pin@0 {
-		allwinner,pins = "PD12";
-		allwinner,function = "gpio_out";
+		pins = "PD12";
+		function = "gpio_out";
 	};
 };
 
 &r_pio {
 	wifi_reset_pin_parrot: wifi_reset_pin@0 {
-		allwinner,pins = "PL6";
-		allwinner,function = "gpio_out";
+		pins = "PL6";
+		function = "gpio_out";
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun8i-reference-design-tablet.dtsi b/arch/arm/boot/dts/sun8i-reference-design-tablet.dtsi
index dea852b2a4f3..6d9daab30be4 100644
--- a/arch/arm/boot/dts/sun8i-reference-design-tablet.dtsi
+++ b/arch/arm/boot/dts/sun8i-reference-design-tablet.dtsi
@@ -94,25 +94,25 @@
 
 &pio {
 	bl_en_pin: bl_en_pin@0 {
-		allwinner,pins = "PH6";
-		allwinner,function = "gpio_in";
+		pins = "PH6";
+		function = "gpio_in";
 	};
 
 	mmc0_cd_pin: mmc0_cd_pin@0 {
-		allwinner,pins = "PB4";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PB4";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	ts_power_pin: ts_power_pin@0 {
-		allwinner,pins = "PH1";
-		allwinner,function = "gpio_out";
+		pins = "PH1";
+		function = "gpio_out";
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
-		allwinner,pins = "PH8";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PH8";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts b/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts
index e0ae76088f7e..5b76266df1cd 100644
--- a/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts
+++ b/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts
@@ -100,7 +100,7 @@
 
 &mmc2_8bit_pins {
 	/* Increase drive strength for DDR modes */
-	allwinner,drive = <SUN4I_PINCTRL_40_MA>;
+	drive-strength = <40>;
 };
 
 &osc32k {
@@ -110,14 +110,14 @@
 
 &pio {
 	led_pins_cubieboard4: led-pins@0 {
-		allwinner,pins = "PH6", "PH17";
-		allwinner,function = "gpio_out";
+		pins = "PH6", "PH17";
+		function = "gpio_out";
 	};
 
 	mmc0_cd_pin_cubieboard4: mmc0_cd_pin@0 {
-		allwinner,pins = "PH18";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PH18";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun9i-a80-optimus.dts b/arch/arm/boot/dts/sun9i-a80-optimus.dts
index a2e540fc5725..127f23f56717 100644
--- a/arch/arm/boot/dts/sun9i-a80-optimus.dts
+++ b/arch/arm/boot/dts/sun9i-a80-optimus.dts
@@ -142,7 +142,7 @@
 
 &mmc2_8bit_pins {
 	/* Increase drive strength for DDR modes */
-	allwinner,drive = <SUN4I_PINCTRL_40_MA>;
+	drive-strength = <40>;
 };
 
 &ohci0 {
@@ -160,24 +160,24 @@
 
 &pio {
 	led_pins_optimus: led-pins@0 {
-		allwinner,pins = "PH0", "PH1";
-		allwinner,function = "gpio_out";
+		pins = "PH0", "PH1";
+		function = "gpio_out";
 	};
 
 	mmc0_cd_pin_optimus: mmc0_cd_pin@0 {
-		allwinner,pins = "PH18";
-		allwinner,function = "gpio_in";
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+		pins = "PH18";
+		function = "gpio_in";
+		bias-pull-up;
 	};
 
 	usb1_vbus_pin_optimus: usb1_vbus_pin@1 {
-		allwinner,pins = "PH4";
-		allwinner,function = "gpio_out";
+		pins = "PH4";
+		function = "gpio_out";
 	};
 
 	usb3_vbus_pin_optimus: usb3_vbus_pin@1 {
-		allwinner,pins = "PH5";
-		allwinner,function = "gpio_out";
+		pins = "PH5";
+		function = "gpio_out";
 	};
 };
 
@@ -187,8 +187,8 @@
 
 &r_pio {
 	led_r_pins_optimus: led-pins@1 {
-		allwinner,pins = "PM15";
-		allwinner,function = "gpio_out";
+		pins = "PM15";
+		function = "gpio_out";
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun9i-a80.dtsi b/arch/arm/boot/dts/sun9i-a80.dtsi
index d03f7481401c..617c8a709de7 100644
--- a/arch/arm/boot/dts/sun9i-a80.dtsi
+++ b/arch/arm/boot/dts/sun9i-a80.dtsi
@@ -686,34 +686,34 @@
 			#gpio-cells = <3>;
 
 			i2c3_pins_a: i2c3@0 {
-				allwinner,pins = "PG10", "PG11";
-				allwinner,function = "i2c3";
+				pins = "PG10", "PG11";
+				function = "i2c3";
 			};
 
 			mmc0_pins: mmc0 {
-				allwinner,pins = "PF0", "PF1" ,"PF2", "PF3",
-						 "PF4", "PF5";
-				allwinner,function = "mmc0";
-				allwinner,drive = <SUN4I_PINCTRL_30_MA>;
+				pins = "PF0", "PF1" ,"PF2", "PF3",
+				       "PF4", "PF5";
+				function = "mmc0";
+				drive-strength = <30>;
 			};
 
 			mmc2_8bit_pins: mmc2_8bit {
-				allwinner,pins = "PC6", "PC7", "PC8", "PC9",
-						 "PC10", "PC11", "PC12",
-						 "PC13", "PC14", "PC15",
-						 "PC16";
-				allwinner,function = "mmc2";
-				allwinner,drive = <SUN4I_PINCTRL_30_MA>;
+				pins = "PC6", "PC7", "PC8", "PC9",
+				       "PC10", "PC11", "PC12",
+				       "PC13", "PC14", "PC15",
+				       "PC16";
+				function = "mmc2";
+				drive-strength = <30>;
 			};
 
 			uart0_pins_a: uart0@0 {
-				allwinner,pins = "PH12", "PH13";
-				allwinner,function = "uart0";
+				pins = "PH12", "PH13";
+				function = "uart0";
 			};
 
 			uart4_pins_a: uart4@0 {
-				allwinner,pins = "PG12", "PG13", "PG14", "PG15";
-				allwinner,function = "uart4";
+				pins = "PG12", "PG13", "PG14", "PG15";
+				function = "uart4";
 			};
 		};
 
@@ -894,15 +894,15 @@
 			#gpio-cells = <3>;
 
 			r_ir_pins: r_ir {
-				allwinner,pins = "PL6";
-				allwinner,function = "s_cir_rx";
+				pins = "PL6";
+				function = "s_cir_rx";
 			};
 
 			r_rsb_pins: r_rsb {
-				allwinner,pins = "PN0", "PN1";
-				allwinner,function = "s_rsb";
-				allwinner,drive = <SUN4I_PINCTRL_20_MA>;
-				allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+				pins = "PN0", "PN1";
+				function = "s_rsb";
+				drive-strength = <20>;
+				bias-pull-up;
 			};
 		};
 
diff --git a/arch/arm/boot/dts/sunxi-common-regulators.dtsi b/arch/arm/boot/dts/sunxi-common-regulators.dtsi
index 358b8d9b4703..17c09fed9e84 100644
--- a/arch/arm/boot/dts/sunxi-common-regulators.dtsi
+++ b/arch/arm/boot/dts/sunxi-common-regulators.dtsi
@@ -47,23 +47,23 @@
 
 &pio {
 	ahci_pwr_pin_a: ahci_pwr_pin@0 {
-		allwinner,pins = "PB8";
-		allwinner,function = "gpio_out";
+		pins = "PB8";
+		function = "gpio_out";
 	};
 
 	usb0_vbus_pin_a: usb0_vbus_pin@0 {
-		allwinner,pins = "PB9";
-		allwinner,function = "gpio_out";
+		pins = "PB9";
+		function = "gpio_out";
 	};
 
 	usb1_vbus_pin_a: usb1_vbus_pin@0 {
-		allwinner,pins = "PH6";
-		allwinner,function = "gpio_out";
+		pins = "PH6";
+		function = "gpio_out";
 	};
 
 	usb2_vbus_pin_a: usb2_vbus_pin@0 {
-		allwinner,pins = "PH3";
-		allwinner,function = "gpio_out";
+		pins = "PH3";
+		function = "gpio_out";
 	};
 };
 
-- 
git-series 0.8.10
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
