From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH 9/9] arm64: dts: m3ulcb: enable SDHI2
Date: Thu,  3 Nov 2016 21:08:20 +0300
Message-ID: <1478196500-1520-1-git-send-email-vladimir.barinov@cogentembedded.com>
References: <1478196375-1131-1-git-send-email-vladimir.barinov@cogentembedded.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1478196375-1131-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Vladimir Barinov <vladimir.barinov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

This supports SDHI2 for M3ULCB onboard eMMC

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
---
 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts | 43 ++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
index a244edb..e46687e 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
@@ -55,6 +55,24 @@
 		};
 	};
 
+	reg_1p8v: regulator0 {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_3p3v: regulator1 {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	vcc_sdhi0: regulator-vcc-sdhi0 {
 		compatible = "regulator-fixed";
 
@@ -113,6 +131,18 @@
 		function = "sdhi0";
 		power-source = <1800>;
 	};
+
+	sdhi2_pins_3v3: sd2_3v3 {
+		groups = "sdhi2_data8", "sdhi2_ctrl";
+		function = "sdhi2";
+		power-source = <3300>;
+	};
+
+	sdhi2_pins_1v8: sd2_1v8 {
+		groups = "sdhi2_data8", "sdhi2_ctrl";
+		function = "sdhi2";
+		power-source = <1800>;
+	};
 };
 
 &sdhi0 {
@@ -128,6 +158,19 @@
 	status = "okay";
 };
 
+&sdhi2 {
+	/* used for on-board 8bit eMMC */
+	pinctrl-0 = <&sdhi2_pins_3v3>;
+	pinctrl-1 = <&sdhi2_pins_1v8>;
+	pinctrl-names = "default", "state_uhs";
+
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&reg_1p8v>;
+	bus-width = <8>;
+	non-removable;
+	status = "okay";
+};
+
 &scif2 {
 	pinctrl-0 = <&scif2_pins>;
 	pinctrl-names = "default";
-- 
1.9.1
