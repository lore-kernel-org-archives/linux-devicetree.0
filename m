Return-Path: <SRS0=c6Dm=MD=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 4/4] ARM: dts: iwg23s-sbc: Add uSD card support
Date: Fri, 21 Sep 2018 12:55:11 +0100
Message-Id: <1537530911-443-5-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1537530911-443-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1537530911-443-1-git-send-email-fabrizio.castro@bp.renesas.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Add uSD card support to the iwg23s single board computer powered
by the RZ/G1C SoC (a.k.a. r8a77470).

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Biju Das <biju.das@bp.renesas.com>
---
Hello Simon,

this patch can only be taken after patch "pinctrl: sh-pfc: r8a77470:
Add SDHI2 voltage switch" from this series appears on a release candidate
or a release.
Shall I re-send it at a later stage or are you happy to keep it around
and defer its application to when its dependency is sorted?

Thanks,
Fab

 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts | 49 +++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
index 22da819..cd9c3fc 100644
--- a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
+++ b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
@@ -6,6 +6,7 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/gpio/gpio.h>
 #include "r8a77470.dtsi"
 / {
 	model = "iWave iW-RainboW-G23S single board computer based on RZ/G1C";
@@ -25,6 +26,29 @@
 		device_type = "memory";
 		reg = <0 0x40000000 0 0x20000000>;
 	};
+
+	vcc_sdhi2: regulator-vcc-sdhi2 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "SDHI2 Vcc";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		enable-active-high;
+	};
+
+	vccq_sdhi2: regulator-vccq-sdhi2 {
+		compatible = "regulator-gpio";
+
+		regulator-name = "SDHI2 VccQ";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpios = <&gpio2 24 GPIO_ACTIVE_LOW>;
+		gpios-states = <1>;
+		states = <3300000 1
+			  1800000 0>;
+	};
 };
 
 &avb {
@@ -50,6 +74,18 @@
 		groups = "scif1_data_b";
 		function = "scif1";
 	};
+
+	sdhi2_pins: sd2 {
+		groups = "sdhi2_data4", "sdhi2_ctrl";
+		function = "sdhi2";
+		power-source = <3300>;
+	};
+
+	sdhi2_pins_uhs: sd2_uhs {
+		groups = "sdhi2_data4", "sdhi2_ctrl";
+		function = "sdhi2";
+		power-source = <1800>;
+	};
 };
 
 &scif1 {
@@ -58,3 +94,16 @@
 
 	status = "okay";
 };
+
+&sdhi2 {
+	pinctrl-0 = <&sdhi2_pins>;
+	pinctrl-1 = <&sdhi2_pins_uhs>;
+	pinctrl-names = "default", "state_uhs";
+
+	vmmc-supply = <&vcc_sdhi2>;
+	vqmmc-supply = <&vccq_sdhi2>;
+	bus-width = <4>;
+	cd-gpios = <&gpio4 20 GPIO_ACTIVE_LOW>;
+	sd-uhs-sdr50;
+	status = "okay";
+};
-- 
2.7.4
