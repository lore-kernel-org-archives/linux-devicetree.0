Return-Path: <SRS0=HRCn=TA=renesas.com=prvs=40235708d9=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 7/7] ARM: dts: r7s9210-rza2mevb: Add SDHI support
Date: Tue, 30 Apr 2019 08:23:09 -0500
Message-ID: <20190430132309.12473-8-chris.brandt@renesas.com>
In-Reply-To: <20190430132309.12473-1-chris.brandt@renesas.com>
References: <20190430132309.12473-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark
Cc: devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

The RZ/A2M EVB supports 2 SD card slots. A micro SD slot on the CPU
board, and a full SD card slot on the sub board.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 arch/arm/boot/dts/r7s9210-rza2mevb.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/r7s9210-rza2mevb.dts b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
index df69746244fe..1eba37db7cdc 100644
--- a/arch/arm/boot/dts/r7s9210-rza2mevb.dts
+++ b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
@@ -90,6 +90,16 @@
 			 <RZA2_PINMUX(PORT3, 4, 1)>, /* ET1_MDIO */
 			 <RZA2_PINMUX(PORTL, 1, 5)>; /* IRQ5 */
 	};
+
+	sdhi0_pins: sdhi0 {
+		pinmux = <RZA2_PINMUX(PORT5, 0, 3)>,	/* SD0_CD */
+			 <RZA2_PINMUX(PORT5, 1, 3)>;	/* SD0_WP */
+	};
+
+	sdhi1_pins: sdhi1 {
+		pinmux = <RZA2_PINMUX(PORT5, 4, 3)>,	/* SD1_CD */
+			 <RZA2_PINMUX(PORT5, 5, 3)>;	/* SD1_WP */
+	};
 };
 
 /* High resolution System tick timers */
@@ -130,3 +140,17 @@
 		reg = <0>;
 	};
 };
+
+&sdhi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdhi0_pins>;
+	bus-width = <4>;
+	status = "okay";
+};
+
+&sdhi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdhi1_pins>;
+	bus-width = <4>;
+	status = "okay";
+};
-- 
2.16.1
