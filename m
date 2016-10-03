From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH 7/9] ARM: sunxi: Remove useless allwinner,drive property
Date: Mon,  3 Oct 2016 12:21:05 +0200
Message-ID: <01cd77ccced851276fcb3625b3d7805f5260fb59.1475489558.git-series.maxime.ripard@free-electrons.com>
References: <cover.26c6f76b361d146fb079d744251f020ef6d2db7d.1475489558.git-series.maxime.ripard@free-electrons.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <cover.26c6f76b361d146fb079d744251f020ef6d2db7d.1475489558.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.26c6f76b361d146fb079d744251f020ef6d2db7d.1475489558.git-series.maxime.ripard@free-electrons.com>
References: <cover.26c6f76b361d146fb079d744251f020ef6d2db7d.1475489558.git-series.maxime.ripard@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The allwinner,drive property set to 10mA was really considered as our
default. Remove all those properties entirely to make that obvious.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 arch/arm/boot/dts/ntc-gr8-evb.dts                        |  4 +-
 arch/arm/boot/dts/ntc-gr8.dtsi                           | 14 +----
 arch/arm/boot/dts/sun4i-a10-a1000.dts                    |  2 +-
 arch/arm/boot/dts/sun4i-a10-chuwi-v7-cw0825.dts          |  2 +-
 arch/arm/boot/dts/sun4i-a10-cubieboard.dts               |  1 +-
 arch/arm/boot/dts/sun4i-a10-dserve-dsrv9703c.dts         |  6 +--
 arch/arm/boot/dts/sun4i-a10-gemei-g9.dts                 |  1 +-
 arch/arm/boot/dts/sun4i-a10-hackberry.dts                |  2 +-
 arch/arm/boot/dts/sun4i-a10-hyundai-a7hd.dts             |  2 +-
 arch/arm/boot/dts/sun4i-a10-inet1.dts                    |  4 +-
 arch/arm/boot/dts/sun4i-a10-inet97fv2.dts                |  2 +-
 arch/arm/boot/dts/sun4i-a10-inet9f-rev03.dts             |  3 +-
 arch/arm/boot/dts/sun4i-a10-jesurun-q5.dts               |  2 +-
 arch/arm/boot/dts/sun4i-a10-marsboard.dts                |  2 +-
 arch/arm/boot/dts/sun4i-a10-mk802.dts                    |  3 +-
 arch/arm/boot/dts/sun4i-a10-olinuxino-lime.dts           |  3 +-
 arch/arm/boot/dts/sun4i-a10-pcduino.dts                  |  3 +-
 arch/arm/boot/dts/sun4i-a10-pcduino2.dts                 |  1 +-
 arch/arm/boot/dts/sun4i-a10-pov-protab2-ips9.dts         |  5 +-
 arch/arm/boot/dts/sun4i-a10.dtsi                         | 25 +------
 arch/arm/boot/dts/sun5i-a10s-auxtek-t003.dts             |  1 +-
 arch/arm/boot/dts/sun5i-a10s-auxtek-t004.dts             |  3 +-
 arch/arm/boot/dts/sun5i-a10s-mk802.dts                   |  3 +-
 arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts         |  4 +-
 arch/arm/boot/dts/sun5i-a10s-r7-tv-dongle.dts            |  2 +-
 arch/arm/boot/dts/sun5i-a10s-wobo-i5.dts                 |  3 +-
 arch/arm/boot/dts/sun5i-a10s.dtsi                        |  6 +--
 arch/arm/boot/dts/sun5i-a13-empire-electronix-d709.dts   |  3 +-
 arch/arm/boot/dts/sun5i-a13-hsg-h702.dts                 |  3 +-
 arch/arm/boot/dts/sun5i-a13-olinuxino-micro.dts          |  5 +-
 arch/arm/boot/dts/sun5i-a13-olinuxino.dts                |  4 +-
 arch/arm/boot/dts/sun5i-a13-utoo-p66.dts                 |  2 +-
 arch/arm/boot/dts/sun5i-a13.dtsi                         |  3 +-
 arch/arm/boot/dts/sun5i-r8-chip.dts                      |  2 +-
 arch/arm/boot/dts/sun5i-reference-design-tablet.dtsi     |  5 +-
 arch/arm/boot/dts/sun5i.dtsi                             |  6 +--
 arch/arm/boot/dts/sun6i-a31-app4-evb1.dts                |  1 +-
 arch/arm/boot/dts/sun6i-a31-colombus.dts                 |  3 +-
 arch/arm/boot/dts/sun6i-a31-hummingbird.dts              |  3 +-
 arch/arm/boot/dts/sun6i-a31-i7.dts                       |  3 +-
 arch/arm/boot/dts/sun6i-a31-m9.dts                       |  3 +-
 arch/arm/boot/dts/sun6i-a31-mele-a1000g-quad.dts         |  3 +-
 arch/arm/boot/dts/sun6i-a31.dtsi                         |  7 +--
 arch/arm/boot/dts/sun6i-a31s-primo81.dts                 |  3 +-
 arch/arm/boot/dts/sun6i-a31s-sina31s.dts                 |  2 +-
 arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts         |  4 +-
 arch/arm/boot/dts/sun6i-a31s-yones-toptech-bs1078-v2.dts |  1 +-
 arch/arm/boot/dts/sun6i-reference-design-tablet.dtsi     |  2 +-
 arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts         |  4 +-
 arch/arm/boot/dts/sun7i-a20-bananapi.dts                 |  4 +-
 arch/arm/boot/dts/sun7i-a20-bananapro.dts                |  6 +--
 arch/arm/boot/dts/sun7i-a20-cubieboard2.dts              |  2 +-
 arch/arm/boot/dts/sun7i-a20-cubietruck.dts               |  6 +--
 arch/arm/boot/dts/sun7i-a20-hummingbird.dts              |  4 +-
 arch/arm/boot/dts/sun7i-a20-i12-tvbox.dts                |  4 +-
 arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts                |  4 +-
 arch/arm/boot/dts/sun7i-a20-m3.dts                       |  1 +-
 arch/arm/boot/dts/sun7i-a20-mk808c.dts                   |  2 +-
 arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts           |  4 +-
 arch/arm/boot/dts/sun7i-a20-olinuxino-lime.dts           |  3 +-
 arch/arm/boot/dts/sun7i-a20-olinuxino-lime2-emmc.dts     |  1 +-
 arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts          |  4 +-
 arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts          |  3 +-
 arch/arm/boot/dts/sun7i-a20-orangepi-mini.dts            |  7 +--
 arch/arm/boot/dts/sun7i-a20-orangepi.dts                 |  6 +--
 arch/arm/boot/dts/sun7i-a20-pcduino3-nano.dts            |  4 +-
 arch/arm/boot/dts/sun7i-a20-pcduino3.dts                 |  3 +-
 arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts           |  4 +-
 arch/arm/boot/dts/sun7i-a20-wits-pro-a20-dkt.dts         |  2 +-
 arch/arm/boot/dts/sun7i-a20.dtsi                         | 36 +---------
 arch/arm/boot/dts/sun8i-a23-a33.dtsi                     |  7 +--
 arch/arm/boot/dts/sun8i-a23-evb.dts                      |  1 +-
 arch/arm/boot/dts/sun8i-a23-polaroid-mid2407pxe03.dts    |  1 +-
 arch/arm/boot/dts/sun8i-a23-polaroid-mid2809pxe04.dts    |  1 +-
 arch/arm/boot/dts/sun8i-a33-olinuxino.dts                |  3 +-
 arch/arm/boot/dts/sun8i-a33-sinlinx-sina33.dts           |  1 +-
 arch/arm/boot/dts/sun8i-a33.dtsi                         |  1 +-
 arch/arm/boot/dts/sun8i-a83t.dtsi                        |  2 +-
 arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts          |  3 +-
 arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts                |  2 +-
 arch/arm/boot/dts/sun8i-h3-orangepi-2.dts                |  4 +-
 arch/arm/boot/dts/sun8i-h3-orangepi-lite.dts             |  3 +-
 arch/arm/boot/dts/sun8i-h3-orangepi-one.dts              |  3 +-
 arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts               |  3 +-
 arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts             |  1 +-
 arch/arm/boot/dts/sun8i-h3.dtsi                          | 10 +---
 arch/arm/boot/dts/sun8i-q8-common.dtsi                   |  1 +-
 arch/arm/boot/dts/sun8i-r16-parrot.dts                   |  5 +-
 arch/arm/boot/dts/sun8i-reference-design-tablet.dtsi     |  4 +-
 arch/arm/boot/dts/sun9i-a80-cubieboard4.dts              |  2 +-
 arch/arm/boot/dts/sun9i-a80-optimus.dts                  |  5 +-
 arch/arm/boot/dts/sun9i-a80.dtsi                         |  4 +-
 arch/arm/boot/dts/sunxi-common-regulators.dtsi           |  4 +-
 93 files changed, 0 insertions(+), 362 deletions(-)

diff --git a/arch/arm/boot/dts/ntc-gr8-evb.dts b/arch/arm/boot/dts/ntc-gr8-evb.dts
index 4b622f3b5220..04a474471adc 100644
--- a/arch/arm/boot/dts/ntc-gr8-evb.dts
+++ b/arch/arm/boot/dts/ntc-gr8-evb.dts
@@ -228,28 +228,24 @@
 	mmc0_cd_pin_gr8_evb: mmc0-cd-pin@0 {
 		allwinner,pins = "PG0";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	usb0_id_pin_gr8_evb: usb0-id-pin@0 {
 		allwinner,pins = "PG2";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	usb0_vbus_det_pin_gr8_evb: usb0-vbus-det-pin@0 {
 		allwinner,pins = "PG1";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	usb1_vbus_pin_gr8_evb: usb1-vbus-pin@0 {
 		allwinner,pins = "PG13";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/ntc-gr8.dtsi b/arch/arm/boot/dts/ntc-gr8.dtsi
index ca54e03ef366..d6a499bfd795 100644
--- a/arch/arm/boot/dts/ntc-gr8.dtsi
+++ b/arch/arm/boot/dts/ntc-gr8.dtsi
@@ -766,42 +766,36 @@
 			i2c0_pins_a: i2c0@0 {
 				allwinner,pins = "PB0", "PB1";
 				allwinner,function = "i2c0";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			i2c1_pins_a: i2c1@0 {
 				allwinner,pins = "PB15", "PB16";
 				allwinner,function = "i2c1";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			i2c2_pins_a: i2c2@0 {
 				allwinner,pins = "PB17", "PB18";
 				allwinner,function = "i2c2";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			i2s0_data_pins_a: i2s0-data@0 {
 				allwinner,pins = "PB6", "PB7", "PB8", "PB9";
 				allwinner,function = "i2s0";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			i2s0_mclk_pins_a: i2s0-mclk@0 {
 				allwinner,pins = "PB6", "PB7", "PB8", "PB9";
 				allwinner,function = "i2s0";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			ir0_rx_pins_a: ir0@0 {
 				allwinner,pins = "PB4";
 				allwinner,function = "ir0";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
@@ -811,7 +805,6 @@
 						 "PD18", "PD19", "PD20", "PD21", "PD22", "PD23",
 						 "PD24", "PD25", "PD26", "PD27";
 				allwinner,function = "lcd0";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
@@ -829,49 +822,42 @@
 						"PC11", "PC12", "PC13", "PC14",
 						"PC15";
 				allwinner,function = "nand0";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			nand_cs0_pins_a: nand-cs@0 {
 				allwinner,pins = "PC4";
 				allwinner,function = "nand0";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			nand_rb0_pins_a: nand-rb@0 {
 				allwinner,pins = "PC6";
 				allwinner,function = "nand0";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			pwm0_pins_a: pwm0@0 {
 				allwinner,pins = "PB2";
 				allwinner,function = "pwm0";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			spdif_tx_pins_a: spdif@0 {
 				allwinner,pins = "PB10";
 				allwinner,function = "spdif";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 			};
 
 			uart1_pins_a: uart1@1 {
 				allwinner,pins = "PG3", "PG4";
 				allwinner,function = "uart1";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			uart1_cts_rts_pins_a: uart1-cts-rts@0 {
 				allwinner,pins = "PG5", "PG6";
 				allwinner,function = "uart1";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 		};
diff --git a/arch/arm/boot/dts/sun4i-a10-a1000.dts b/arch/arm/boot/dts/sun4i-a10-a1000.dts
index 39e368ec3428..035395a32212 100644
--- a/arch/arm/boot/dts/sun4i-a10-a1000.dts
+++ b/arch/arm/boot/dts/sun4i-a10-a1000.dts
@@ -188,14 +188,12 @@
 	emac_power_pin_a1000: emac_power_pin@0 {
 		allwinner,pins = "PH15";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	led_pins_a1000: led_pins@0 {
 		allwinner,pins = "PH10", "PH20";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun4i-a10-chuwi-v7-cw0825.dts b/arch/arm/boot/dts/sun4i-a10-chuwi-v7-cw0825.dts
index 023b03efa5ff..e9d839bc8562 100644
--- a/arch/arm/boot/dts/sun4i-a10-chuwi-v7-cw0825.dts
+++ b/arch/arm/boot/dts/sun4i-a10-chuwi-v7-cw0825.dts
@@ -144,14 +144,12 @@
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
 		allwinner,pins = "PH4";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
 		allwinner,pins = "PH5";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_DOWN>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun4i-a10-cubieboard.dts b/arch/arm/boot/dts/sun4i-a10-cubieboard.dts
index 710e2ef516a8..f11dcd82f468 100644
--- a/arch/arm/boot/dts/sun4i-a10-cubieboard.dts
+++ b/arch/arm/boot/dts/sun4i-a10-cubieboard.dts
@@ -174,7 +174,6 @@
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
 		allwinner,pins = "PH4";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun4i-a10-dserve-dsrv9703c.dts b/arch/arm/boot/dts/sun4i-a10-dserve-dsrv9703c.dts
index 893497e397da..e01bdd1f1b2b 100644
--- a/arch/arm/boot/dts/sun4i-a10-dserve-dsrv9703c.dts
+++ b/arch/arm/boot/dts/sun4i-a10-dserve-dsrv9703c.dts
@@ -180,42 +180,36 @@
 	bl_en_pin_dsrv9703c: bl_en_pin@0 {
 		allwinner,pins = "PH7";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	codec_pa_pin: codec_pa_pin@0 {
 		allwinner,pins = "PH15";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	motor_pins: motor_pins@0 {
 		allwinner,pins = "PB3";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	touchscreen_pins: touchscreen_pins@0 {
 		allwinner,pins = "PB13";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
 		allwinner,pins = "PH4";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
 		allwinner,pins = "PH5";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_DOWN>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun4i-a10-gemei-g9.dts b/arch/arm/boot/dts/sun4i-a10-gemei-g9.dts
index ac64781a0a9c..fbd02c7a5d43 100644
--- a/arch/arm/boot/dts/sun4i-a10-gemei-g9.dts
+++ b/arch/arm/boot/dts/sun4i-a10-gemei-g9.dts
@@ -158,7 +158,6 @@
 	codec_pa_pin: codec_pa_pin@0 {
 		allwinner,pins = "PH15";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun4i-a10-hackberry.dts b/arch/arm/boot/dts/sun4i-a10-hackberry.dts
index 6de83a6187d0..9b8134cb968d 100644
--- a/arch/arm/boot/dts/sun4i-a10-hackberry.dts
+++ b/arch/arm/boot/dts/sun4i-a10-hackberry.dts
@@ -131,14 +131,12 @@
 	hackberry_hogs: hogs@0 {
 		allwinner,pins = "PH19";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	usb2_vbus_pin_hackberry: usb2_vbus_pin@0 {
 		allwinner,pins = "PH12";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun4i-a10-hyundai-a7hd.dts b/arch/arm/boot/dts/sun4i-a10-hyundai-a7hd.dts
index 9103864fef90..f3f8b90fb9c8 100644
--- a/arch/arm/boot/dts/sun4i-a10-hyundai-a7hd.dts
+++ b/arch/arm/boot/dts/sun4i-a10-hyundai-a7hd.dts
@@ -95,14 +95,12 @@
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
 		allwinner,pins = "PH4";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
 		allwinner,pins = "PH5";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_DOWN>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun4i-a10-inet1.dts b/arch/arm/boot/dts/sun4i-a10-inet1.dts
index e09053bf5e1f..bb64e466c4e0 100644
--- a/arch/arm/boot/dts/sun4i-a10-inet1.dts
+++ b/arch/arm/boot/dts/sun4i-a10-inet1.dts
@@ -182,28 +182,24 @@
 	bl_en_pin_inet: bl_en_pin@0 {
 		allwinner,pins = "PH7";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	touchscreen_wake_pin: touchscreen_wake_pin@0 {
 		allwinner,pins = "PB13";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
 		allwinner,pins = "PH4";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
 		allwinner,pins = "PH5";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_DOWN>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun4i-a10-inet97fv2.dts b/arch/arm/boot/dts/sun4i-a10-inet97fv2.dts
index 04b0d2d1ae6c..5ba4cd4b2aca 100644
--- a/arch/arm/boot/dts/sun4i-a10-inet97fv2.dts
+++ b/arch/arm/boot/dts/sun4i-a10-inet97fv2.dts
@@ -163,14 +163,12 @@
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
 		allwinner,pins = "PH4";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
 		allwinner,pins = "PH5";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_DOWN>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun4i-a10-inet9f-rev03.dts b/arch/arm/boot/dts/sun4i-a10-inet9f-rev03.dts
index bba4f9cf9bf5..5ea154f08364 100644
--- a/arch/arm/boot/dts/sun4i-a10-inet9f-rev03.dts
+++ b/arch/arm/boot/dts/sun4i-a10-inet9f-rev03.dts
@@ -326,21 +326,18 @@
 				 "PA14", "PA15", "PA16", "PA17",
 				 "PH22", "PH23", "PH24", "PH25", "PH26";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
 		allwinner,pins = "PH4";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
 		allwinner,pins = "PH5";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_DOWN>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun4i-a10-jesurun-q5.dts b/arch/arm/boot/dts/sun4i-a10-jesurun-q5.dts
index e28f080b1fd5..65273bc7998c 100644
--- a/arch/arm/boot/dts/sun4i-a10-jesurun-q5.dts
+++ b/arch/arm/boot/dts/sun4i-a10-jesurun-q5.dts
@@ -165,14 +165,12 @@
 	emac_power_pin_q5: emac_power_pin@0 {
 		allwinner,pins = "PH19";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	led_pins_q5: led_pins@0 {
 		allwinner,pins = "PH20";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun4i-a10-marsboard.dts b/arch/arm/boot/dts/sun4i-a10-marsboard.dts
index 8e50723dbe02..c5916125bea8 100644
--- a/arch/arm/boot/dts/sun4i-a10-marsboard.dts
+++ b/arch/arm/boot/dts/sun4i-a10-marsboard.dts
@@ -166,14 +166,12 @@
 	led_pins_marsboard: led_pins@0 {
 		allwinner,pins = "PB5", "PB6", "PB7", "PB8";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
 		allwinner,pins = "PH4";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun4i-a10-mk802.dts b/arch/arm/boot/dts/sun4i-a10-mk802.dts
index ee46ea854832..204e2b68d09f 100644
--- a/arch/arm/boot/dts/sun4i-a10-mk802.dts
+++ b/arch/arm/boot/dts/sun4i-a10-mk802.dts
@@ -93,21 +93,18 @@
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
 		allwinner,pins = "PH4";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
 		allwinner,pins = "PH5";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	usb2_vbus_pin_mk802: usb2_vbus_pin@0 {
 		allwinner,pins = "PH12";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun4i-a10-olinuxino-lime.dts b/arch/arm/boot/dts/sun4i-a10-olinuxino-lime.dts
index b350448c7217..e8e14a53b764 100644
--- a/arch/arm/boot/dts/sun4i-a10-olinuxino-lime.dts
+++ b/arch/arm/boot/dts/sun4i-a10-olinuxino-lime.dts
@@ -170,7 +170,6 @@
 	ahci_pwr_pin_olinuxinolime: ahci_pwr_pin@1 {
 		allwinner,pins = "PC3";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
@@ -184,14 +183,12 @@
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
 		allwinner,pins = "PH4";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
 		allwinner,pins = "PH5";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_DOWN>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun4i-a10-pcduino.dts b/arch/arm/boot/dts/sun4i-a10-pcduino.dts
index 39034aa8e1ae..7e94334420af 100644
--- a/arch/arm/boot/dts/sun4i-a10-pcduino.dts
+++ b/arch/arm/boot/dts/sun4i-a10-pcduino.dts
@@ -172,21 +172,18 @@
 	led_pins_pcduino: led_pins@0 {
 		allwinner,pins = "PH15", "PH16";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	key_pins_pcduino: key_pins@0 {
 		allwinner,pins = "PH17", "PH18", "PH19";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
 		allwinner,pins = "PH4";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun4i-a10-pcduino2.dts b/arch/arm/boot/dts/sun4i-a10-pcduino2.dts
index de483a1bf36a..05de4050a831 100644
--- a/arch/arm/boot/dts/sun4i-a10-pcduino2.dts
+++ b/arch/arm/boot/dts/sun4i-a10-pcduino2.dts
@@ -59,7 +59,6 @@
 	usb2_vbus_pin_pcduino2: usb2_vbus_pin@0 {
 		allwinner,pins = "PD2";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun4i-a10-pov-protab2-ips9.dts b/arch/arm/boot/dts/sun4i-a10-pov-protab2-ips9.dts
index 918f97294b33..459c7a2dbee7 100644
--- a/arch/arm/boot/dts/sun4i-a10-pov-protab2-ips9.dts
+++ b/arch/arm/boot/dts/sun4i-a10-pov-protab2-ips9.dts
@@ -166,35 +166,30 @@
 	bl_en_pin_protab: bl_en_pin@0 {
 		allwinner,pins = "PH7";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	codec_pa_pin: codec_pa_pin@0 {
 		allwinner,pins = "PH15";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	touchscreen_pins: touchscreen_pins@0 {
 		allwinner,pins = "PA5", "PB13";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
 		allwinner,pins = "PH4";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
 		allwinner,pins = "PH5";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_DOWN>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun4i-a10.dtsi b/arch/arm/boot/dts/sun4i-a10.dtsi
index 7e7dfc2b43db..ae562272589c 100644
--- a/arch/arm/boot/dts/sun4i-a10.dtsi
+++ b/arch/arm/boot/dts/sun4i-a10.dtsi
@@ -980,56 +980,48 @@
 						"PA11", "PA12", "PA13", "PA14",
 						"PA15", "PA16";
 				allwinner,function = "emac";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			i2c0_pins_a: i2c0@0 {
 				allwinner,pins = "PB0", "PB1";
 				allwinner,function = "i2c0";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			i2c1_pins_a: i2c1@0 {
 				allwinner,pins = "PB18", "PB19";
 				allwinner,function = "i2c1";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			i2c2_pins_a: i2c2@0 {
 				allwinner,pins = "PB20", "PB21";
 				allwinner,function = "i2c2";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			ir0_rx_pins_a: ir0@0 {
 				allwinner,pins = "PB4";
 				allwinner,function = "ir0";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			ir0_tx_pins_a: ir0@1 {
 				allwinner,pins = "PB3";
 				allwinner,function = "ir0";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			ir1_rx_pins_a: ir1@0 {
 				allwinner,pins = "PB23";
 				allwinner,function = "ir1";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			ir1_tx_pins_a: ir1@1 {
 				allwinner,pins = "PB22";
 				allwinner,function = "ir1";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
@@ -1044,119 +1036,102 @@
 			mmc0_cd_pin_reference_design: mmc0_cd_pin@0 {
 				allwinner,pins = "PH1";
 				allwinner,function = "gpio_in";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 			};
 
 			ps20_pins_a: ps20@0 {
 				allwinner,pins = "PI20", "PI21";
 				allwinner,function = "ps2";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			ps21_pins_a: ps21@0 {
 				allwinner,pins = "PH12", "PH13";
 				allwinner,function = "ps2";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			pwm0_pins_a: pwm0@0 {
 				allwinner,pins = "PB2";
 				allwinner,function = "pwm";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			pwm1_pins_a: pwm1@0 {
 				allwinner,pins = "PI3";
 				allwinner,function = "pwm";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			spdif_tx_pins_a: spdif@0 {
 				allwinner,pins = "PB13";
 				allwinner,function = "spdif";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 			};
 
 			spi0_pins_a: spi0@0 {
 				allwinner,pins = "PI11", "PI12", "PI13";
 				allwinner,function = "spi0";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			spi0_cs0_pins_a: spi0_cs0@0 {
 				allwinner,pins = "PI10";
 				allwinner,function = "spi0";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			spi1_pins_a: spi1@0 {
 				allwinner,pins = "PI17", "PI18", "PI19";
 				allwinner,function = "spi1";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			spi1_cs0_pins_a: spi1_cs0@0 {
 				allwinner,pins = "PI16";
 				allwinner,function = "spi1";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			spi2_pins_a: spi2@0 {
 				allwinner,pins = "PC20", "PC21", "PC22";
 				allwinner,function = "spi2";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			spi2_pins_b: spi2@1 {
 				allwinner,pins = "PB15", "PB16", "PB17";
 				allwinner,function = "spi2";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			spi2_cs0_pins_a: spi2_cs0@0 {
 				allwinner,pins = "PC19";
 				allwinner,function = "spi2";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			spi2_cs0_pins_b: spi2_cs0@1 {
 				allwinner,pins = "PB14";
 				allwinner,function = "spi2";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			uart0_pins_a: uart0@0 {
 				allwinner,pins = "PB22", "PB23";
 				allwinner,function = "uart0";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			uart0_pins_b: uart0@1 {
 				allwinner,pins = "PF2", "PF4";
 				allwinner,function = "uart0";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			uart1_pins_a: uart1@0 {
 				allwinner,pins = "PA10", "PA11";
 				allwinner,function = "uart1";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 		};
diff --git a/arch/arm/boot/dts/sun5i-a10s-auxtek-t003.dts b/arch/arm/boot/dts/sun5i-a10s-auxtek-t003.dts
index d4ad02182353..813e18c011da 100644
--- a/arch/arm/boot/dts/sun5i-a10s-auxtek-t003.dts
+++ b/arch/arm/boot/dts/sun5i-a10s-auxtek-t003.dts
@@ -111,7 +111,6 @@
 	mmc0_cd_pin_t003: mmc0_cd_pin@0 {
 		allwinner,pins = "PG1";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
diff --git a/arch/arm/boot/dts/sun5i-a10s-auxtek-t004.dts b/arch/arm/boot/dts/sun5i-a10s-auxtek-t004.dts
index 2150e15e115a..3c79e3536521 100644
--- a/arch/arm/boot/dts/sun5i-a10s-auxtek-t004.dts
+++ b/arch/arm/boot/dts/sun5i-a10s-auxtek-t004.dts
@@ -132,21 +132,18 @@
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
 		allwinner,pins = "PG12";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	mmc0_cd_pin_t004: mmc0_cd_pin@0 {
 		allwinner,pins = "PG1";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	mmc1_vcc_en_pin_t004: mmc1_vcc_en_pin@0 {
 		allwinner,pins = "PB18";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
diff --git a/arch/arm/boot/dts/sun5i-a10s-mk802.dts b/arch/arm/boot/dts/sun5i-a10s-mk802.dts
index c84ac005342e..940139145fd5 100644
--- a/arch/arm/boot/dts/sun5i-a10s-mk802.dts
+++ b/arch/arm/boot/dts/sun5i-a10s-mk802.dts
@@ -118,21 +118,18 @@
 	led_pins_mk802: led_pins@0 {
 		allwinner,pins = "PB2";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	mmc0_cd_pin_mk802: mmc0_cd_pin@0 {
 		allwinner,pins = "PG1";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	usb1_vbus_pin_mk802: usb1_vbus_pin@0 {
 		allwinner,pins = "PB10";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts b/arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts
index aef91476f9ae..26d74958bd57 100644
--- a/arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts
+++ b/arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts
@@ -204,14 +204,12 @@
 	mmc0_cd_pin_olinuxino_micro: mmc0_cd_pin@0 {
 		allwinner,pins = "PG1";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	mmc1_cd_pin_olinuxino_micro: mmc1_cd_pin@0 {
 		allwinner,pins = "PG13";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
@@ -225,14 +223,12 @@
 	usb1_vbus_pin_olinuxino_m: usb1_vbus_pin@0 {
 		allwinner,pins = "PB10";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
 		allwinner,pins = "PG12";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun5i-a10s-r7-tv-dongle.dts b/arch/arm/boot/dts/sun5i-a10s-r7-tv-dongle.dts
index 3b057983c74a..84a3bf817c3b 100644
--- a/arch/arm/boot/dts/sun5i-a10s-r7-tv-dongle.dts
+++ b/arch/arm/boot/dts/sun5i-a10s-r7-tv-dongle.dts
@@ -103,7 +103,6 @@
 	mmc0_cd_pin_r7: mmc0_cd_pin@0 {
 		allwinner,pins = "PG1";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
@@ -117,7 +116,6 @@
 	usb1_vbus_pin_r7: usb1_vbus_pin@0 {
 		allwinner,pins = "PG13";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun5i-a10s-wobo-i5.dts b/arch/arm/boot/dts/sun5i-a10s-wobo-i5.dts
index b5de75f4c710..56a6982773a9 100644
--- a/arch/arm/boot/dts/sun5i-a10s-wobo-i5.dts
+++ b/arch/arm/boot/dts/sun5i-a10s-wobo-i5.dts
@@ -148,21 +148,18 @@
 	led_pins_wobo_i5: led_pins@0 {
 		allwinner,pins = "PB2";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	mmc0_cd_pin_wobo_i5: mmc0_cd_pin@0 {
 		allwinner,pins = "PB3";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	emac_power_pin_wobo: emac_power_pin@0 {
 		allwinner,pins = "PA02";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun5i-a10s.dtsi b/arch/arm/boot/dts/sun5i-a10s.dtsi
index c41a2ba34dde..9aa80630e00f 100644
--- a/arch/arm/boot/dts/sun5i-a10s.dtsi
+++ b/arch/arm/boot/dts/sun5i-a10s.dtsi
@@ -202,14 +202,12 @@
 	uart0_pins_a: uart0@0 {
 		allwinner,pins = "PB19", "PB20";
 		allwinner,function = "uart0";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	uart2_pins_a: uart2@0 {
 		allwinner,pins = "PC18", "PC19";
 		allwinner,function = "uart2";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
@@ -220,7 +218,6 @@
 				"PA11", "PA12", "PA13", "PA14",
 				"PA15", "PA16";
 		allwinner,function = "emac";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
@@ -231,7 +228,6 @@
 				"PD21", "PD22", "PD23", "PD24",
 				"PD25", "PD26", "PD27";
 		allwinner,function = "emac";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
@@ -246,14 +242,12 @@
 	spi2_pins_a: spi2@0 {
 		allwinner,pins = "PB12", "PB13", "PB14";
 		allwinner,function = "spi2";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	spi2_cs0_pins_a: spi2_cs0@0 {
 		allwinner,pins = "PB11";
 		allwinner,function = "spi2";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun5i-a13-empire-electronix-d709.dts b/arch/arm/boot/dts/sun5i-a13-empire-electronix-d709.dts
index 6efbba6d40a9..693be366ab9c 100644
--- a/arch/arm/boot/dts/sun5i-a13-empire-electronix-d709.dts
+++ b/arch/arm/boot/dts/sun5i-a13-empire-electronix-d709.dts
@@ -139,21 +139,18 @@
 	mmc0_cd_pin_d709: mmc0_cd_pin@0 {
 		allwinner,pins = "PG0";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
 		allwinner,pins = "PG1";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_DOWN>;
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
 		allwinner,pins = "PG2";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun5i-a13-hsg-h702.dts b/arch/arm/boot/dts/sun5i-a13-hsg-h702.dts
index 3724b988064e..aa4484ac50b2 100644
--- a/arch/arm/boot/dts/sun5i-a13-hsg-h702.dts
+++ b/arch/arm/boot/dts/sun5i-a13-hsg-h702.dts
@@ -138,21 +138,18 @@
 	mmc0_cd_pin_h702: mmc0_cd_pin@0 {
 		allwinner,pins = "PG0";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
 		allwinner,pins = "PG2";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
 		allwinner,pins = "PG1";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun5i-a13-olinuxino-micro.dts b/arch/arm/boot/dts/sun5i-a13-olinuxino-micro.dts
index 081329e2b80b..8aec90ac28a4 100644
--- a/arch/arm/boot/dts/sun5i-a13-olinuxino-micro.dts
+++ b/arch/arm/boot/dts/sun5i-a13-olinuxino-micro.dts
@@ -117,7 +117,6 @@
 	mmc0_cd_pin_olinuxinom: mmc0_cd_pin@0 {
 		allwinner,pins = "PG0";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
@@ -131,28 +130,24 @@
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
 		allwinner,pins = "PG2";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
 		allwinner,pins = "PG1";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_DOWN>;
 	};
 
 	usb0_vbus_pin_olinuxinom: usb0_vbus_pin@0 {
 		allwinner,pins = "PG12";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	usb1_vbus_pin_olinuxinom: usb1_vbus_pin@0 {
 		allwinner,pins = "PG11";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun5i-a13-olinuxino.dts b/arch/arm/boot/dts/sun5i-a13-olinuxino.dts
index b3c234c65ea1..86ae19ba70d4 100644
--- a/arch/arm/boot/dts/sun5i-a13-olinuxino.dts
+++ b/arch/arm/boot/dts/sun5i-a13-olinuxino.dts
@@ -167,7 +167,6 @@
 	mmc0_cd_pin_olinuxino: mmc0_cd_pin@0 {
 		allwinner,pins = "PG0";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
@@ -181,21 +180,18 @@
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
 		allwinner,pins = "PG2";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
 		allwinner,pins = "PG1";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_DOWN>;
 	};
 
 	usb1_vbus_pin_olinuxino: usb1_vbus_pin@0 {
 		allwinner,pins = "PG11";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun5i-a13-utoo-p66.dts b/arch/arm/boot/dts/sun5i-a13-utoo-p66.dts
index a8b0bcc04514..663cfa414dc2 100644
--- a/arch/arm/boot/dts/sun5i-a13-utoo-p66.dts
+++ b/arch/arm/boot/dts/sun5i-a13-utoo-p66.dts
@@ -118,14 +118,12 @@
 	i2c_lcd_pins: i2c_lcd_pin@0 {
 		allwinner,pins = "PG10", "PG12";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	ts_wake_pin_p66: ts_wake_pin@0 {
 		allwinner,pins = "PB3";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
diff --git a/arch/arm/boot/dts/sun5i-a13.dtsi b/arch/arm/boot/dts/sun5i-a13.dtsi
index a17ba0243db3..d79db1525448 100644
--- a/arch/arm/boot/dts/sun5i-a13.dtsi
+++ b/arch/arm/boot/dts/sun5i-a13.dtsi
@@ -355,21 +355,18 @@
 				 "PD18", "PD19", "PD20", "PD21", "PD22", "PD23",
 				 "PD24", "PD25", "PD26", "PD27";
 		allwinner,function = "lcd0";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	uart1_pins_a: uart1@0 {
 		allwinner,pins = "PE10", "PE11";
 		allwinner,function = "uart1";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	uart1_pins_b: uart1@1 {
 		allwinner,pins = "PG3", "PG4";
 		allwinner,function = "uart1";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun5i-r8-chip.dts b/arch/arm/boot/dts/sun5i-r8-chip.dts
index b68a12374b35..398a17a5d2e6 100644
--- a/arch/arm/boot/dts/sun5i-r8-chip.dts
+++ b/arch/arm/boot/dts/sun5i-r8-chip.dts
@@ -152,14 +152,12 @@
 	chip_vbus_pin: chip_vbus_pin@0 {
 		allwinner,pins = "PB10";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	chip_id_det_pin: chip_id_det_pin@0 {
 		allwinner,pins = "PG2";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun5i-reference-design-tablet.dtsi b/arch/arm/boot/dts/sun5i-reference-design-tablet.dtsi
index 20cc940f5f91..600bd3c0e231 100644
--- a/arch/arm/boot/dts/sun5i-reference-design-tablet.dtsi
+++ b/arch/arm/boot/dts/sun5i-reference-design-tablet.dtsi
@@ -114,35 +114,30 @@
 	codec_pa_pin: codec_pa_pin@0 {
 		allwinner,pins = "PG10";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	mmc0_cd_pin: mmc0_cd_pin@0 {
 		allwinner,pins = "PG0";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
 		allwinner,pins = "PG1";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_DOWN>;
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
 		allwinner,pins = "PG2";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	usb0_vbus_pin_a: usb0_vbus_pin@0 {
 		allwinner,pins = "PG12";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun5i.dtsi b/arch/arm/boot/dts/sun5i.dtsi
index e374f4fc8073..fe84703d3c14 100644
--- a/arch/arm/boot/dts/sun5i.dtsi
+++ b/arch/arm/boot/dts/sun5i.dtsi
@@ -556,21 +556,18 @@
 			i2c0_pins_a: i2c0@0 {
 				allwinner,pins = "PB0", "PB1";
 				allwinner,function = "i2c0";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			i2c1_pins_a: i2c1@0 {
 				allwinner,pins = "PB15", "PB16";
 				allwinner,function = "i2c1";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			i2c2_pins_a: i2c2@0 {
 				allwinner,pins = "PB17", "PB18";
 				allwinner,function = "i2c2";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
@@ -594,21 +591,18 @@
 			uart3_pins_a: uart3@0 {
 				allwinner,pins = "PG9", "PG10";
 				allwinner,function = "uart3";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			uart3_pins_cts_rts_a: uart3-cts-rts@0 {
 				allwinner,pins = "PG11", "PG12";
 				allwinner,function = "uart3";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			pwm0_pins: pwm0 {
 				allwinner,pins = "PB2";
 				allwinner,function = "pwm";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 		};
diff --git a/arch/arm/boot/dts/sun6i-a31-app4-evb1.dts b/arch/arm/boot/dts/sun6i-a31-app4-evb1.dts
index 2f8cfab771e2..e723dedeb614 100644
--- a/arch/arm/boot/dts/sun6i-a31-app4-evb1.dts
+++ b/arch/arm/boot/dts/sun6i-a31-app4-evb1.dts
@@ -70,7 +70,6 @@
 	usb1_vbus_pin_a: usb1_vbus_pin@0 {
 		allwinner,pins = "PH27";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun6i-a31-colombus.dts b/arch/arm/boot/dts/sun6i-a31-colombus.dts
index f9cf36888d93..4057e91c7cb5 100644
--- a/arch/arm/boot/dts/sun6i-a31-colombus.dts
+++ b/arch/arm/boot/dts/sun6i-a31-colombus.dts
@@ -131,21 +131,18 @@
 	mmc0_cd_pin_colombus: mmc0_cd_pin@0 {
 		allwinner,pins = "PA8";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	usb2_vbus_pin_colombus: usb2_vbus_pin@0 {
 		allwinner,pins = "PH24";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	i2c_lcd_pins: i2c_lcd_pin@0 {
 		allwinner,pins = "PA23", "PA24";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun6i-a31-hummingbird.dts b/arch/arm/boot/dts/sun6i-a31-hummingbird.dts
index 9a74637f677f..a82c4674a3fc 100644
--- a/arch/arm/boot/dts/sun6i-a31-hummingbird.dts
+++ b/arch/arm/boot/dts/sun6i-a31-hummingbird.dts
@@ -155,21 +155,18 @@
 	gmac_phy_reset_pin_hummingbird: gmac_phy_reset_pin@0 {
 		allwinner,pins = "PA21";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	mmc0_cd_pin_hummingbird: mmc0_cd_pin@0 {
 		allwinner,pins = "PA8";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	wifi_reset_pin_hummingbird: wifi_reset_pin@0 {
 		allwinner,pins = "PG10";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun6i-a31-i7.dts b/arch/arm/boot/dts/sun6i-a31-i7.dts
index e9185dad67ee..a2d6a92dac29 100644
--- a/arch/arm/boot/dts/sun6i-a31-i7.dts
+++ b/arch/arm/boot/dts/sun6i-a31-i7.dts
@@ -111,21 +111,18 @@
 	led_pins_i7: led_pins@0 {
 		allwinner,pins = "PH13";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	mmc0_cd_pin_i7: mmc0_cd_pin@0 {
 		allwinner,pins = "PH22";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	usb1_vbus_pin_i7: usb1_vbus_pin@0 {
 		allwinner,pins = "PC27";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun6i-a31-m9.dts b/arch/arm/boot/dts/sun6i-a31-m9.dts
index 29016a13a2c1..0ae5ab2f06fa 100644
--- a/arch/arm/boot/dts/sun6i-a31-m9.dts
+++ b/arch/arm/boot/dts/sun6i-a31-m9.dts
@@ -130,21 +130,18 @@
 	led_pins_m9: led_pins@0 {
 		allwinner,pins = "PH13";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	mmc0_cd_pin_m9: mmc0_cd_pin@0 {
 		allwinner,pins = "PH22";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	usb1_vbus_pin_m9: usb1_vbus_pin@0 {
 		allwinner,pins = "PC27";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun6i-a31-mele-a1000g-quad.dts b/arch/arm/boot/dts/sun6i-a31-mele-a1000g-quad.dts
index 5faeae429e2a..a551673aca68 100644
--- a/arch/arm/boot/dts/sun6i-a31-mele-a1000g-quad.dts
+++ b/arch/arm/boot/dts/sun6i-a31-mele-a1000g-quad.dts
@@ -130,21 +130,18 @@
 	led_pins_m9: led_pins@0 {
 		allwinner,pins = "PH13";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	mmc0_cd_pin_m9: mmc0_cd_pin@0 {
 		allwinner,pins = "PH22";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	usb1_vbus_pin_m9: usb1_vbus_pin@0 {
 		allwinner,pins = "PC27";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi b/arch/arm/boot/dts/sun6i-a31.dtsi
index 6a84fe7e9ab2..6fcd3cf5b3b9 100644
--- a/arch/arm/boot/dts/sun6i-a31.dtsi
+++ b/arch/arm/boot/dts/sun6i-a31.dtsi
@@ -437,28 +437,24 @@
 			uart0_pins_a: uart0@0 {
 				allwinner,pins = "PH20", "PH21";
 				allwinner,function = "uart0";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			i2c0_pins_a: i2c0@0 {
 				allwinner,pins = "PH14", "PH15";
 				allwinner,function = "i2c0";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			i2c1_pins_a: i2c1@0 {
 				allwinner,pins = "PH16", "PH17";
 				allwinner,function = "i2c1";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			i2c2_pins_a: i2c2@0 {
 				allwinner,pins = "PH18", "PH19";
 				allwinner,function = "i2c2";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
@@ -513,7 +509,6 @@
 						"PA20", "PA21", "PA22", "PA23",
 						"PA24", "PA26", "PA27";
 				allwinner,function = "gmac";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
@@ -897,14 +892,12 @@
 			ir_pins_a: ir@0 {
 				allwinner,pins = "PL4";
 				allwinner,function = "s_ir";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			p2wi_pins: p2wi {
 				allwinner,pins = "PL0", "PL1";
 				allwinner,function = "s_p2wi";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 		};
diff --git a/arch/arm/boot/dts/sun6i-a31s-primo81.dts b/arch/arm/boot/dts/sun6i-a31s-primo81.dts
index 73c133f5e79c..4332cde8d6ca 100644
--- a/arch/arm/boot/dts/sun6i-a31s-primo81.dts
+++ b/arch/arm/boot/dts/sun6i-a31s-primo81.dts
@@ -136,21 +136,18 @@
 	gt911_int_primo81: gt911_int_pin@0 {
 		allwinner,pins = "PA3";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	mma8452_int_primo81: mma8452_int_pin@0 {
 		allwinner,pins = "PA9";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	mmc0_cd_pin_primo81: mmc0_cd_pin@0 {
 		allwinner,pins = "PA8";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun6i-a31s-sina31s.dts b/arch/arm/boot/dts/sun6i-a31s-sina31s.dts
index 6ead2f5c847a..d0304f51a5c6 100644
--- a/arch/arm/boot/dts/sun6i-a31s-sina31s.dts
+++ b/arch/arm/boot/dts/sun6i-a31s-sina31s.dts
@@ -130,14 +130,12 @@
 	led_pin_sina31s: led_pin@0 {
 		allwinner,pins = "PH13";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	mmc0_cd_pin_sina31s: mmc0_cd_pin@0 {
 		allwinner,pins = "PA4";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts b/arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts
index db7fa13f5425..83e47a1c93bd 100644
--- a/arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts
+++ b/arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts
@@ -155,21 +155,18 @@
 	gmac_phy_reset_pin_bpi_m2: gmac_phy_reset_pin@0 {
 		allwinner,pins = "PA21";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	led_pins_bpi_m2: led_pins@0 {
 		allwinner,pins = "PG5", "PG10", "PG11";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	mmc0_cd_pin_bpi_m2: mmc0_cd_pin@0 {
 		allwinner,pins = "PA4";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 };
@@ -178,7 +175,6 @@
 	mmc2_pwrseq_pin_bpi_m2: mmc2_pwrseq_pin@0 {
 		allwinner,pins = "PL8";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun6i-a31s-yones-toptech-bs1078-v2.dts b/arch/arm/boot/dts/sun6i-a31s-yones-toptech-bs1078-v2.dts
index d6ad6196a768..832392125b8e 100644
--- a/arch/arm/boot/dts/sun6i-a31s-yones-toptech-bs1078-v2.dts
+++ b/arch/arm/boot/dts/sun6i-a31s-yones-toptech-bs1078-v2.dts
@@ -94,7 +94,6 @@
 	mmc0_cd_pin_bs1078v2: mmc0_cd_pin@0 {
 		allwinner,pins = "PA8";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun6i-reference-design-tablet.dtsi b/arch/arm/boot/dts/sun6i-reference-design-tablet.dtsi
index 0c434304e040..2e7443fc1790 100644
--- a/arch/arm/boot/dts/sun6i-reference-design-tablet.dtsi
+++ b/arch/arm/boot/dts/sun6i-reference-design-tablet.dtsi
@@ -79,14 +79,12 @@
 	mmc0_cd_pin_e708_q1: mmc0_cd_pin@0 {
 		allwinner,pins = "PA8";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
 		allwinner,pins = "PA15";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts b/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts
index ba5bca0fe997..e10630e59c05 100644
--- a/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts
+++ b/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts
@@ -196,28 +196,24 @@
 	gmac_power_pin_bpi_m1p: gmac_power_pin@0 {
 		allwinner,pins = "PH23";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	led_pins_bpi_m1p: led_pins@0 {
 		allwinner,pins = "PH24", "PH25";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	mmc0_cd_pin_bpi_m1p: mmc0_cd_pin@0 {
 		allwinner,pins = "PH10";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	mmc3_pwrseq_pin_bpi_m1p: mmc3_pwrseq_pin@0 {
 		allwinner,pins = "PH22";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun7i-a20-bananapi.dts b/arch/arm/boot/dts/sun7i-a20-bananapi.dts
index 67c8a7644b99..158ab889dce7 100644
--- a/arch/arm/boot/dts/sun7i-a20-bananapi.dts
+++ b/arch/arm/boot/dts/sun7i-a20-bananapi.dts
@@ -181,28 +181,24 @@
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
 		allwinner,pins = "PH4";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	mmc0_cd_pin_bananapi: mmc0_cd_pin@0 {
 		allwinner,pins = "PH10";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	gmac_power_pin_bananapi: gmac_power_pin@0 {
 		allwinner,pins = "PH23";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	led_pins_bananapi: led_pins@0 {
 		allwinner,pins = "PH24";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun7i-a20-bananapro.dts b/arch/arm/boot/dts/sun7i-a20-bananapro.dts
index 18fcc87f4621..4aaf137376de 100644
--- a/arch/arm/boot/dts/sun7i-a20-bananapro.dts
+++ b/arch/arm/boot/dts/sun7i-a20-bananapro.dts
@@ -184,42 +184,36 @@
 	gmac_power_pin_bananapro: gmac_power_pin@0 {
 		allwinner,pins = "PH23";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	led_pins_bananapro: led_pins@0 {
 		allwinner,pins = "PH24", "PG2";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	mmc0_cd_pin_bananapro: mmc0_cd_pin@0 {
 		allwinner,pins = "PH10";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	usb1_vbus_pin_bananapro: usb1_vbus_pin@0 {
 		allwinner,pins = "PH0";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	usb2_vbus_pin_bananapro: usb2_vbus_pin@0 {
 		allwinner,pins = "PH1";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	vmmc3_pin_bananapro: vmmc3_pin@0 {
 		allwinner,pins = "PH22";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts b/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts
index 1fa832d7b469..42779aeb7297 100644
--- a/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts
+++ b/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts
@@ -162,14 +162,12 @@
 	led_pins_cubieboard2: led_pins@0 {
 		allwinner,pins = "PH20", "PH21";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
 		allwinner,pins = "PH4";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun7i-a20-cubietruck.dts b/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
index 83f39b0362cb..a0b7ffb6196d 100644
--- a/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
+++ b/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
@@ -226,42 +226,36 @@
 	ahci_pwr_pin_cubietruck: ahci_pwr_pin@1 {
 		allwinner,pins = "PH12";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	led_pins_cubietruck: led_pins@0 {
 		allwinner,pins = "PH7", "PH11", "PH20", "PH21";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	mmc3_pwrseq_pin_cubietruck: mmc3_pwrseq_pin@0 {
 		allwinner,pins = "PH9";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	usb0_vbus_pin_a: usb0_vbus_pin@0 {
 		allwinner,pins = "PH17";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
 		allwinner,pins = "PH19";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
 		allwinner,pins = "PH22";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun7i-a20-hummingbird.dts b/arch/arm/boot/dts/sun7i-a20-hummingbird.dts
index 37f4a5497452..714a463e24ed 100644
--- a/arch/arm/boot/dts/sun7i-a20-hummingbird.dts
+++ b/arch/arm/boot/dts/sun7i-a20-hummingbird.dts
@@ -190,28 +190,24 @@
 	ahci_pwr_pin_a20_hummingbird: ahci_pwr_pin@0 {
 		allwinner,pins = "PH15";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	usb1_vbus_pin_a20_hummingbird: usb1_vbus_pin@0 {
 		allwinner,pins = "PH2";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	mmc3_vdd_pin_a20_hummingbird: mmc3_vdd_pin@0 {
 		allwinner,pins = "PH9";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	gmac_vdd_pin_a20_hummingbird: gmac_vdd_pin@0 {
 		allwinner,pins = "PH16";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun7i-a20-i12-tvbox.dts b/arch/arm/boot/dts/sun7i-a20-i12-tvbox.dts
index 1e6bd360dac0..4d1e102ea4b9 100644
--- a/arch/arm/boot/dts/sun7i-a20-i12-tvbox.dts
+++ b/arch/arm/boot/dts/sun7i-a20-i12-tvbox.dts
@@ -200,28 +200,24 @@
 	vmmc3_pin_i12_tvbox: vmmc3_pin@0 {
 		allwinner,pins = "PH2";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	vmmc3_io_pin_i12_tvbox: vmmc3_io_pin@0 {
 		allwinner,pins = "PH12";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	gmac_power_pin_i12_tvbox: gmac_power_pin@0 {
 		allwinner,pins = "PH21";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	led_pins_i12_tvbox: led_pins@0 {
 		allwinner,pins = "PH9", "PH20";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts b/arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts
index 73c05dab0a69..57c05e69d012 100644
--- a/arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts
+++ b/arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts
@@ -224,28 +224,24 @@
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
 		allwinner,pins = "PH4";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	mmc0_cd_pin_lamobo_r1: mmc0_cd_pin@0 {
 		allwinner,pins = "PH10";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	gmac_power_pin_lamobo_r1: gmac_power_pin@0 {
 		allwinner,pins = "PH23";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	led_pins_lamobo_r1: led_pins@0 {
 		allwinner,pins = "PH24";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun7i-a20-m3.dts b/arch/arm/boot/dts/sun7i-a20-m3.dts
index 8d9ea48dd98c..cfaa5b45b159 100644
--- a/arch/arm/boot/dts/sun7i-a20-m3.dts
+++ b/arch/arm/boot/dts/sun7i-a20-m3.dts
@@ -147,7 +147,6 @@
 	led_pins_m3: led_pins@0 {
 		allwinner,pins = "PH20";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun7i-a20-mk808c.dts b/arch/arm/boot/dts/sun7i-a20-mk808c.dts
index 90ff4a267025..edd397d796be 100644
--- a/arch/arm/boot/dts/sun7i-a20-mk808c.dts
+++ b/arch/arm/boot/dts/sun7i-a20-mk808c.dts
@@ -134,14 +134,12 @@
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
 		allwinner,pins = "PH4";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
 		allwinner,pins = "PH5";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts b/arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts
index 23aacce4d6c7..edf735c10b63 100644
--- a/arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts
+++ b/arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts
@@ -206,7 +206,6 @@
 	ahci_pwr_pin_olimex_som_evb: ahci_pwr_pin@1 {
 		allwinner,pins = "PC3";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
@@ -220,21 +219,18 @@
 	mmc3_cd_pin_olimex_som_evb: mmc3_cd_pin@0 {
 		allwinner,pins = "PH0";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
 		allwinner,pins = "PH4";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
 		allwinner,pins = "PH5";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun7i-a20-olinuxino-lime.dts b/arch/arm/boot/dts/sun7i-a20-olinuxino-lime.dts
index 35ad7006c53c..632ad580e09f 100644
--- a/arch/arm/boot/dts/sun7i-a20-olinuxino-lime.dts
+++ b/arch/arm/boot/dts/sun7i-a20-olinuxino-lime.dts
@@ -155,7 +155,6 @@
 	ahci_pwr_pin_olinuxinolime: ahci_pwr_pin@1 {
 		allwinner,pins = "PC3";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
@@ -169,14 +168,12 @@
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
 		allwinner,pins = "PH4";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
 		allwinner,pins = "PH5";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_DOWN>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2-emmc.dts b/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2-emmc.dts
index 5ea4915f6d75..a64c2b3a1125 100644
--- a/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2-emmc.dts
+++ b/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2-emmc.dts
@@ -59,7 +59,6 @@
 	mmc2_pins_nrst: mmc2@0 {
 		allwinner,pins = "PC16";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts b/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts
index d5c796c8d16f..b47b67765aec 100644
--- a/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts
+++ b/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts
@@ -204,7 +204,6 @@
 	ahci_pwr_pin_olinuxinolime: ahci_pwr_pin@1 {
 		allwinner,pins = "PC3";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
@@ -218,21 +217,18 @@
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
 		allwinner,pins = "PH4";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
 		allwinner,pins = "PH5";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_DOWN>;
 	};
 
 	usb0_vbus_pin_lime2: usb0_vbus_pin@0 {
 		allwinner,pins = "PC17";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts b/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts
index 7e3006f6a775..2dddbf148d8e 100644
--- a/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts
+++ b/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts
@@ -229,7 +229,6 @@
 	mmc3_cd_pin_olinuxinom: mmc3_cd_pin@0 {
 		allwinner,pins = "PH11";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
@@ -243,14 +242,12 @@
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
 		allwinner,pins = "PH4";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
 		allwinner,pins = "PH5";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_DOWN>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun7i-a20-orangepi-mini.dts b/arch/arm/boot/dts/sun7i-a20-orangepi-mini.dts
index 2be04c438b1e..69ad2345613f 100644
--- a/arch/arm/boot/dts/sun7i-a20-orangepi-mini.dts
+++ b/arch/arm/boot/dts/sun7i-a20-orangepi-mini.dts
@@ -168,49 +168,42 @@
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
 		allwinner,pins = "PH4";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	mmc0_cd_pin_orangepi: mmc0_cd_pin@0 {
 		allwinner,pins = "PH10";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	mmc3_cd_pin_orangepi: mmc3_cd_pin@0 {
 		allwinner,pins = "PH11";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	usb2_vbus_pin_bananapro: usb2_vbus_pin@0 {
 		allwinner,pins = "PH22";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	gmac_power_pin_orangepi: gmac_power_pin@0 {
 		allwinner,pins = "PH23";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	led_pins_orangepi: led_pins@0 {
 		allwinner,pins = "PH24", "PH25";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	usb1_vbus_pin_bananapro: usb1_vbus_pin@0 {
 		allwinner,pins = "PH26";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun7i-a20-orangepi.dts b/arch/arm/boot/dts/sun7i-a20-orangepi.dts
index 71125bf64575..d6608ed6cdf3 100644
--- a/arch/arm/boot/dts/sun7i-a20-orangepi.dts
+++ b/arch/arm/boot/dts/sun7i-a20-orangepi.dts
@@ -149,42 +149,36 @@
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
 		allwinner,pins = "PH4";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	mmc0_cd_pin_orangepi: mmc0_cd_pin@0 {
 		allwinner,pins = "PH10";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	usb2_vbus_pin_bananapro: usb2_vbus_pin@0 {
 		allwinner,pins = "PH22";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	gmac_power_pin_orangepi: gmac_power_pin@0 {
 		allwinner,pins = "PH23";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	led_pins_orangepi: led_pins@0 {
 		allwinner,pins = "PH24";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	usb1_vbus_pin_bananapro: usb1_vbus_pin@0 {
 		allwinner,pins = "PH26";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun7i-a20-pcduino3-nano.dts b/arch/arm/boot/dts/sun7i-a20-pcduino3-nano.dts
index ddac7328b852..4a292a12616d 100644
--- a/arch/arm/boot/dts/sun7i-a20-pcduino3-nano.dts
+++ b/arch/arm/boot/dts/sun7i-a20-pcduino3-nano.dts
@@ -154,28 +154,24 @@
 	ahci_pwr_pin_pcduino3_nano: ahci_pwr_pin@0 {
 		allwinner,pins = "PH2";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	led_pins_pcduino3_nano: led_pins@0 {
 		allwinner,pins = "PH16", "PH15";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
 		allwinner,pins = "PH4";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	usb1_vbus_pin_pcduino3_nano: usb1_vbus_pin@0 {
 		allwinner,pins = "PD2";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun7i-a20-pcduino3.dts b/arch/arm/boot/dts/sun7i-a20-pcduino3.dts
index 1a8b39be1d61..a416b3a47cee 100644
--- a/arch/arm/boot/dts/sun7i-a20-pcduino3.dts
+++ b/arch/arm/boot/dts/sun7i-a20-pcduino3.dts
@@ -185,21 +185,18 @@
 	led_pins_pcduino3: led_pins@0 {
 		allwinner,pins = "PH15", "PH16";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	key_pins_pcduino3: key_pins@0 {
 		allwinner,pins = "PH17", "PH18", "PH19";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
 		allwinner,pins = "PH4";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts b/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts
index 2f6b21adddd9..a10c4ccd741d 100644
--- a/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts
+++ b/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts
@@ -175,28 +175,24 @@
 	bl_enable_pin: bl_enable_pin@0 {
 		allwinner,pins = "PH7";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	codec_pa_pin: codec_pa_pin@0 {
 		allwinner,pins = "PH15";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	ts_reset_pin: ts_reset_pin@0 {
 		allwinner,pins = "PB13";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
 		allwinner,pins = "PH4";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun7i-a20-wits-pro-a20-dkt.dts b/arch/arm/boot/dts/sun7i-a20-wits-pro-a20-dkt.dts
index dc31d476ef81..87901259582b 100644
--- a/arch/arm/boot/dts/sun7i-a20-wits-pro-a20-dkt.dts
+++ b/arch/arm/boot/dts/sun7i-a20-wits-pro-a20-dkt.dts
@@ -162,14 +162,12 @@
 	vmmc3_pin_ap6xxx_wl_regon: vmmc3_pin@0 {
 		allwinner,pins = "PH9";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
 		allwinner,pins = "PH4";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index bd0c47660243..b6486fbfb48a 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -1094,14 +1094,12 @@
 			clk_out_a_pins_a: clk_out_a@0 {
 				allwinner,pins = "PI12";
 				allwinner,function = "clk_out_a";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			clk_out_b_pins_a: clk_out_b@0 {
 				allwinner,pins = "PI13";
 				allwinner,function = "clk_out_b";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
@@ -1112,7 +1110,6 @@
 						"PA11", "PA12", "PA13", "PA14",
 						"PA15", "PA16";
 				allwinner,function = "emac";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
@@ -1123,7 +1120,6 @@
 						"PA11", "PA12", "PA13", "PA14",
 						"PA15", "PA16";
 				allwinner,function = "gmac";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
@@ -1145,56 +1141,48 @@
 			i2c0_pins_a: i2c0@0 {
 				allwinner,pins = "PB0", "PB1";
 				allwinner,function = "i2c0";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			i2c1_pins_a: i2c1@0 {
 				allwinner,pins = "PB18", "PB19";
 				allwinner,function = "i2c1";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			i2c2_pins_a: i2c2@0 {
 				allwinner,pins = "PB20", "PB21";
 				allwinner,function = "i2c2";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			i2c3_pins_a: i2c3@0 {
 				allwinner,pins = "PI0", "PI1";
 				allwinner,function = "i2c3";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			ir0_rx_pins_a: ir0@0 {
 				    allwinner,pins = "PB4";
 				    allwinner,function = "ir0";
-				    allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				    allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			ir0_tx_pins_a: ir0@1 {
 				    allwinner,pins = "PB3";
 				    allwinner,function = "ir0";
-				    allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				    allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			ir1_rx_pins_a: ir1@0 {
 				    allwinner,pins = "PB23";
 				    allwinner,function = "ir1";
-				    allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				    allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			ir1_tx_pins_a: ir1@1 {
 				    allwinner,pins = "PB22";
 				    allwinner,function = "ir1";
-				    allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				    allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
@@ -1209,7 +1197,6 @@
 			mmc0_cd_pin_reference_design: mmc0_cd_pin@0 {
 				allwinner,pins = "PH1";
 				allwinner,function = "gpio_in";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 			};
 
@@ -1232,161 +1219,138 @@
 			ps20_pins_a: ps20@0 {
 				allwinner,pins = "PI20", "PI21";
 				allwinner,function = "ps2";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			ps21_pins_a: ps21@0 {
 				allwinner,pins = "PH12", "PH13";
 				allwinner,function = "ps2";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			pwm0_pins_a: pwm0@0 {
 				allwinner,pins = "PB2";
 				allwinner,function = "pwm";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			pwm1_pins_a: pwm1@0 {
 				allwinner,pins = "PI3";
 				allwinner,function = "pwm";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			spdif_tx_pins_a: spdif@0 {
 				allwinner,pins = "PB13";
 				allwinner,function = "spdif";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 			};
 
 			spi0_pins_a: spi0@0 {
 				allwinner,pins = "PI11", "PI12", "PI13";
 				allwinner,function = "spi0";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			spi0_cs0_pins_a: spi0_cs0@0 {
 				allwinner,pins = "PI10";
 				allwinner,function = "spi0";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			spi0_cs1_pins_a: spi0_cs1@0 {
 				allwinner,pins = "PI14";
 				allwinner,function = "spi0";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			spi1_pins_a: spi1@0 {
 				allwinner,pins = "PI17", "PI18", "PI19";
 				allwinner,function = "spi1";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			spi1_cs0_pins_a: spi1_cs0@0 {
 				allwinner,pins = "PI16";
 				allwinner,function = "spi1";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			spi2_pins_a: spi2@0 {
 				allwinner,pins = "PC20", "PC21", "PC22";
 				allwinner,function = "spi2";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			spi2_pins_b: spi2@1 {
 				allwinner,pins = "PB15", "PB16", "PB17";
 				allwinner,function = "spi2";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			spi2_cs0_pins_a: spi2_cs0@0 {
 				allwinner,pins = "PC19";
 				allwinner,function = "spi2";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			spi2_cs0_pins_b: spi2_cs0@1 {
 				allwinner,pins = "PB14";
 				allwinner,function = "spi2";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			uart0_pins_a: uart0@0 {
 				allwinner,pins = "PB22", "PB23";
 				allwinner,function = "uart0";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			uart2_pins_a: uart2@0 {
 				allwinner,pins = "PI16", "PI17", "PI18", "PI19";
 				allwinner,function = "uart2";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			uart3_pins_a: uart3@0 {
 				allwinner,pins = "PG6", "PG7", "PG8", "PG9";
 				allwinner,function = "uart3";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			uart3_pins_b: uart3@1 {
 				allwinner,pins = "PH0", "PH1";
 				allwinner,function = "uart3";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			uart4_pins_a: uart4@0 {
 				allwinner,pins = "PG10", "PG11";
 				allwinner,function = "uart4";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			uart4_pins_b: uart4@1 {
 				allwinner,pins = "PH4", "PH5";
 				allwinner,function = "uart4";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			uart5_pins_a: uart5@0 {
 				allwinner,pins = "PI10", "PI11";
 				allwinner,function = "uart5";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			uart6_pins_a: uart6@0 {
 				allwinner,pins = "PI12", "PI13";
 				allwinner,function = "uart6";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			uart7_pins_a: uart7@0 {
 				allwinner,pins = "PI20", "PI21";
 				allwinner,function = "uart7";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 		};
diff --git a/arch/arm/boot/dts/sun8i-a23-a33.dtsi b/arch/arm/boot/dts/sun8i-a23-a33.dtsi
index ea4082cd111b..c250c6d12f2f 100644
--- a/arch/arm/boot/dts/sun8i-a23-a33.dtsi
+++ b/arch/arm/boot/dts/sun8i-a23-a33.dtsi
@@ -275,7 +275,6 @@
 			uart0_pins_a: uart0@0 {
 				allwinner,pins = "PF2", "PF4";
 				allwinner,function = "uart0";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
@@ -318,28 +317,24 @@
 			pwm0_pins: pwm0 {
 				allwinner,pins = "PH0";
 				allwinner,function = "pwm0";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			i2c0_pins_a: i2c0@0 {
 				allwinner,pins = "PH2", "PH3";
 				allwinner,function = "i2c0";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			i2c1_pins_a: i2c1@0 {
 				allwinner,pins = "PH4", "PH5";
 				allwinner,function = "i2c1";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			i2c2_pins_a: i2c2@0 {
 				allwinner,pins = "PE12", "PE13";
 				allwinner,function = "i2c2";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
@@ -349,7 +344,6 @@
 			                         "PD18", "PD19", "PD20", "PD21", "PD22", "PD23",
 			                         "PD24", "PD25", "PD26", "PD27";
 				allwinner,function = "lcd0";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 		};
@@ -590,7 +584,6 @@
 			r_uart_pins_a: r_uart@0 {
 				allwinner,pins = "PL2", "PL3";
 				allwinner,function = "s_uart";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 		};
diff --git a/arch/arm/boot/dts/sun8i-a23-evb.dts b/arch/arm/boot/dts/sun8i-a23-evb.dts
index 610786e635fa..490a5a6da50f 100644
--- a/arch/arm/boot/dts/sun8i-a23-evb.dts
+++ b/arch/arm/boot/dts/sun8i-a23-evb.dts
@@ -117,7 +117,6 @@
 	mmc0_cd_pin_evb: mmc0_cd_pin@0 {
 		allwinner,pins = "PB4";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun8i-a23-polaroid-mid2407pxe03.dts b/arch/arm/boot/dts/sun8i-a23-polaroid-mid2407pxe03.dts
index a86cbedda34c..fea9db3ee9ad 100644
--- a/arch/arm/boot/dts/sun8i-a23-polaroid-mid2407pxe03.dts
+++ b/arch/arm/boot/dts/sun8i-a23-polaroid-mid2407pxe03.dts
@@ -93,7 +93,6 @@
 	wifi_pwrseq_pin_mid2407: wifi_pwrseq_pin@0 {
 		allwinner,pins = "PL6";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun8i-a23-polaroid-mid2809pxe04.dts b/arch/arm/boot/dts/sun8i-a23-polaroid-mid2809pxe04.dts
index 9955f85f9147..abcd94ea5e86 100644
--- a/arch/arm/boot/dts/sun8i-a23-polaroid-mid2809pxe04.dts
+++ b/arch/arm/boot/dts/sun8i-a23-polaroid-mid2809pxe04.dts
@@ -86,7 +86,6 @@
 	wifi_pwrseq_pin_mid2809: wifi_pwrseq_pin@0 {
 		allwinner,pins = "PL6";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun8i-a33-olinuxino.dts b/arch/arm/boot/dts/sun8i-a33-olinuxino.dts
index 9ea637e82b2d..7eaf610eabd7 100644
--- a/arch/arm/boot/dts/sun8i-a33-olinuxino.dts
+++ b/arch/arm/boot/dts/sun8i-a33-olinuxino.dts
@@ -94,21 +94,18 @@
 	led_pin_olinuxino: led_pins@0 {
 		allwinner,pins = "PB7";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	mmc0_cd_pin_olinuxino: mmc0_cd_pin@0 {
 		allwinner,pins = "PB4";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
 		allwinner,pins = "PB3";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun8i-a33-sinlinx-sina33.dts b/arch/arm/boot/dts/sun8i-a33-sinlinx-sina33.dts
index fef6abc0a703..51b4b6c75397 100644
--- a/arch/arm/boot/dts/sun8i-a33-sinlinx-sina33.dts
+++ b/arch/arm/boot/dts/sun8i-a33-sinlinx-sina33.dts
@@ -128,7 +128,6 @@
 	mmc0_cd_pin_sina33: mmc0_cd_pin@0 {
 		allwinner,pins = "PB4";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun8i-a33.dtsi b/arch/arm/boot/dts/sun8i-a33.dtsi
index fd1e1cddd4a8..e60c4c8c6976 100644
--- a/arch/arm/boot/dts/sun8i-a33.dtsi
+++ b/arch/arm/boot/dts/sun8i-a33.dtsi
@@ -240,7 +240,6 @@
 	uart0_pins_b: uart0@1 {
 		allwinner,pins = "PB0", "PB1";
 		allwinner,function = "uart0";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
index d3473f81b12f..c03d7f4cac83 100644
--- a/arch/arm/boot/dts/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -177,14 +177,12 @@
 			uart0_pins_a: uart0@0 {
 				allwinner,pins = "PF2", "PF4";
 				allwinner,function = "uart0";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			uart0_pins_b: uart0@1 {
 				allwinner,pins = "PB9", "PB10";
 				allwinner,function = "uart0";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 		};
diff --git a/arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts b/arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts
index 06fddaae8edd..e02314a2d643 100644
--- a/arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts
+++ b/arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts
@@ -158,21 +158,18 @@
 	pwr_led_bpi_m2p: led_pins@0 {
 		allwinner,pins = "PL10";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	sw_r_bpi_m2p: key_pins@0 {
 		allwinner,pins = "PL3";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	wifi_en_bpi_m2p: wifi_en_pin {
 		allwinner,pins = "PL7";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts b/arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts
index 3d64cafc1e90..277935e10543 100644
--- a/arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts
+++ b/arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts
@@ -99,7 +99,6 @@
 	leds_opc: led-pins {
 		allwinner,pins = "PA10";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
@@ -108,7 +107,6 @@
 	leds_r_opc: led-pins {
 		allwinner,pins = "PL10";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts
index e5bcaba3e87f..e44af3446514 100644
--- a/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts
+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts
@@ -147,7 +147,6 @@
 	leds_opc: led_pins@0 {
 		allwinner,pins = "PA15";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
@@ -156,21 +155,18 @@
 	leds_r_opc: led_pins@0 {
 		allwinner,pins = "PL10";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	sw_r_opc: key_pins@0 {
 		allwinner,pins = "PL3", "PL4";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	wifi_pwrseq_pin_orangepi: wifi_pwrseq_pin@0 {
 		allwinner,pins = "PL7";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-lite.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-lite.dts
index 1550fee1ec68..ce5b1086b580 100644
--- a/arch/arm/boot/dts/sun8i-h3-orangepi-lite.dts
+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-lite.dts
@@ -145,7 +145,6 @@
 	leds_opc: led_pins@0 {
 		allwinner,pins = "PA15";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
@@ -154,14 +153,12 @@
 	leds_r_opc: led_pins@0 {
 		allwinner,pins = "PL10";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	sw_r_opc: key_pins@0 {
 		allwinner,pins = "PL3";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
index 5c9b5bfa5c21..fbdd239175d4 100644
--- a/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
@@ -112,7 +112,6 @@
 	leds_opc: led_pins@0 {
 		allwinner,pins = "PA15";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
@@ -121,14 +120,12 @@
 	leds_r_opc: led_pins@0 {
 		allwinner,pins = "PL10";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	sw_r_opc: key_pins@0 {
 		allwinner,pins = "PL3";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
index 3ec971285aa3..638720c3d04e 100644
--- a/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
@@ -134,7 +134,6 @@
 	leds_opc: led_pins@0 {
 		allwinner,pins = "PA15";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
@@ -143,14 +142,12 @@
 	leds_r_opc: led_pins@0 {
 		allwinner,pins = "PL10";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	sw_r_opc: key_pins@0 {
 		allwinner,pins = "PL3";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts
index bb585918cf54..1236583caf64 100644
--- a/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts
+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts
@@ -85,7 +85,6 @@
 	usb3_vbus_pin_a: usb3_vbus_pin@0 {
 		allwinner,pins = "PG11";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3.dtsi
index 99e66404d3b8..4d10f8ad89da 100644
--- a/arch/arm/boot/dts/sun8i-h3.dtsi
+++ b/arch/arm/boot/dts/sun8i-h3.dtsi
@@ -330,21 +330,18 @@
 			i2c0_pins: i2c0 {
 				allwinner,pins = "PA11", "PA12";
 				allwinner,function = "i2c0";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			i2c1_pins: i2c1 {
 				allwinner,pins = "PA18", "PA19";
 				allwinner,function = "i2c1";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			i2c2_pins: i2c2 {
 				allwinner,pins = "PE12", "PE13";
 				allwinner,function = "i2c2";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
@@ -359,7 +356,6 @@
 			mmc0_cd_pin: mmc0_cd_pin@0 {
 				allwinner,pins = "PF6";
 				allwinner,function = "gpio_in";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 			};
 
@@ -384,35 +380,30 @@
 			uart0_pins_a: uart0@0 {
 				allwinner,pins = "PA4", "PA5";
 				allwinner,function = "uart0";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			uart1_pins: uart1 {
 				allwinner,pins = "PG6", "PG7";
 				allwinner,function = "uart1";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			uart1_rts_cts_pins: uart1_rts_cts {
 				allwinner,pins = "PG8", "PG9";
 				allwinner,function = "uart1";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			uart2_pins: uart2 {
 				allwinner,pins = "PA0", "PA1";
 				allwinner,function = "uart2";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			uart3_pins: uart3 {
 				allwinner,pins = "PG13", "PG14";
 				allwinner,function = "uart3";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 		};
@@ -578,7 +569,6 @@
 			ir_pins_a: ir@0 {
 				allwinner,pins = "PL11";
 				allwinner,function = "s_cir_rx";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 		};
diff --git a/arch/arm/boot/dts/sun8i-q8-common.dtsi b/arch/arm/boot/dts/sun8i-q8-common.dtsi
index 29f837a47771..0f680b7f5e03 100644
--- a/arch/arm/boot/dts/sun8i-q8-common.dtsi
+++ b/arch/arm/boot/dts/sun8i-q8-common.dtsi
@@ -90,7 +90,6 @@
 	wifi_pwrseq_pin_q8: wifi_pwrseq_pin@0 {
 		allwinner,pins = "PL6", "PL7", "PL11";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun8i-r16-parrot.dts b/arch/arm/boot/dts/sun8i-r16-parrot.dts
index 47553e522982..6161ec441df5 100644
--- a/arch/arm/boot/dts/sun8i-r16-parrot.dts
+++ b/arch/arm/boot/dts/sun8i-r16-parrot.dts
@@ -161,28 +161,24 @@
 	mmc0_cd_pin_parrot: mmc0_cd_pin@0 {
 		allwinner,pins = "PD14";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	led_pins_parrot: led_pins@0 {
 		allwinner,pins = "PE16", "PE17";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	usb0_id_det: usb0_id_detect_pin@0 {
 		allwinner,pins = "PD10";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	usb1_vbus_pin_parrot: usb1_vbus_pin@0 {
 		allwinner,pins = "PD12";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
@@ -191,7 +187,6 @@
 	wifi_reset_pin_parrot: wifi_reset_pin@0 {
 		allwinner,pins = "PL6";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun8i-reference-design-tablet.dtsi b/arch/arm/boot/dts/sun8i-reference-design-tablet.dtsi
index 08cd00143635..ae95e5969681 100644
--- a/arch/arm/boot/dts/sun8i-reference-design-tablet.dtsi
+++ b/arch/arm/boot/dts/sun8i-reference-design-tablet.dtsi
@@ -96,28 +96,24 @@
 	bl_en_pin: bl_en_pin@0 {
 		allwinner,pins = "PH6";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	mmc0_cd_pin: mmc0_cd_pin@0 {
 		allwinner,pins = "PB4";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	ts_power_pin: ts_power_pin@0 {
 		allwinner,pins = "PH1";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
 		allwinner,pins = "PH8";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts b/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts
index 439847acd41e..e1be9fca86c7 100644
--- a/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts
+++ b/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts
@@ -112,14 +112,12 @@
 	led_pins_cubieboard4: led-pins@0 {
 		allwinner,pins = "PH6", "PH17";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	mmc0_cd_pin_cubieboard4: mmc0_cd_pin@0 {
 		allwinner,pins = "PH18";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun9i-a80-optimus.dts b/arch/arm/boot/dts/sun9i-a80-optimus.dts
index ceb6ef15d669..0b2f7042bddf 100644
--- a/arch/arm/boot/dts/sun9i-a80-optimus.dts
+++ b/arch/arm/boot/dts/sun9i-a80-optimus.dts
@@ -162,28 +162,24 @@
 	led_pins_optimus: led-pins@0 {
 		allwinner,pins = "PH0", "PH1";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	mmc0_cd_pin_optimus: mmc0_cd_pin@0 {
 		allwinner,pins = "PH18";
 		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
 
 	usb1_vbus_pin_optimus: usb1_vbus_pin@1 {
 		allwinner,pins = "PH4";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	usb3_vbus_pin_optimus: usb3_vbus_pin@1 {
 		allwinner,pins = "PH5";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
@@ -196,7 +192,6 @@
 	led_r_pins_optimus: led-pins@1 {
 		allwinner,pins = "PM15";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
diff --git a/arch/arm/boot/dts/sun9i-a80.dtsi b/arch/arm/boot/dts/sun9i-a80.dtsi
index 3c5214cbe4e6..293b41ac8e37 100644
--- a/arch/arm/boot/dts/sun9i-a80.dtsi
+++ b/arch/arm/boot/dts/sun9i-a80.dtsi
@@ -688,7 +688,6 @@
 			i2c3_pins_a: i2c3@0 {
 				allwinner,pins = "PG10", "PG11";
 				allwinner,function = "i2c3";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
@@ -713,14 +712,12 @@
 			uart0_pins_a: uart0@0 {
 				allwinner,pins = "PH12", "PH13";
 				allwinner,function = "uart0";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
 			uart4_pins_a: uart4@0 {
 				allwinner,pins = "PG12", "PG13", "PG14", "PG15";
 				allwinner,function = "uart4";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 		};
@@ -904,7 +901,6 @@
 			r_ir_pins: r_ir {
 				allwinner,pins = "PL6";
 				allwinner,function = "s_cir_rx";
-				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
diff --git a/arch/arm/boot/dts/sunxi-common-regulators.dtsi b/arch/arm/boot/dts/sunxi-common-regulators.dtsi
index f1953b0c5059..7809e18d30bd 100644
--- a/arch/arm/boot/dts/sunxi-common-regulators.dtsi
+++ b/arch/arm/boot/dts/sunxi-common-regulators.dtsi
@@ -49,28 +49,24 @@
 	ahci_pwr_pin_a: ahci_pwr_pin@0 {
 		allwinner,pins = "PB8";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	usb0_vbus_pin_a: usb0_vbus_pin@0 {
 		allwinner,pins = "PB9";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	usb1_vbus_pin_a: usb1_vbus_pin@0 {
 		allwinner,pins = "PH6";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
 	usb2_vbus_pin_a: usb2_vbus_pin@0 {
 		allwinner,pins = "PH3";
 		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
-- 
git-series 0.8.10
