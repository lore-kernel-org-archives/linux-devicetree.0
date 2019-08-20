From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v7 5/5] DO NOT MERGE: ARM: dts: bananapi: Add Camera support
Date: Tue, 20 Aug 2019 13:24:36 +0200
Message-ID: <44a0d31330ea355b44e744f9b63cc96ae645e8db.1566300265.git-series.maxime.ripard@bootlin.com>
References: <cover.b695c63cf668192aff5574a3005d483c601e77f6.1566300265.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.b695c63cf668192aff5574a3005d483c601e77f6.1566300265.git-series.maxime.ripard@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hans.verkuil@cisco.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Maxime Ripard <maxime.ripard@bootlin.com>
List-Id: devicetree@vger.kernel.org

From: Maxime Ripard <maxime.ripard@bootlin.com>

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 arch/arm/boot/dts/sun7i-a20-bananapi.dts | 87 +++++++++++++++++++++++++-
 1 file changed, 87 insertions(+)

diff --git a/arch/arm/boot/dts/sun7i-a20-bananapi.dts b/arch/arm/boot/dts/sun7i-a20-bananapi.dts
index c5730b30a15d..d3f23ce041b2 100644
--- a/arch/arm/boot/dts/sun7i-a20-bananapi.dts
+++ b/arch/arm/boot/dts/sun7i-a20-bananapi.dts
@@ -54,6 +54,9 @@
 	compatible = "lemaker,bananapi", "allwinner,sun7i-a20";
 
 	aliases {
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
 		serial0 = &uart0;
 		serial1 = &uart3;
 		serial2 = &uart7;
@@ -63,6 +66,41 @@
 		stdout-path = "serial0:115200n8";
 	};
 
+	reg_cam: cam {
+		compatible = "regulator-fixed";
+		regulator-name = "cam";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&reg_vcc5v0>;
+		gpio = <&pio 7 16 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+        reg_cam_avdd: cam-avdd {
+                compatible = "regulator-fixed";
+                regulator-name = "cam500b-avdd";
+                regulator-min-microvolt = <2800000>;
+                regulator-max-microvolt = <2800000>;
+                vin-supply = <&reg_cam>;
+        };
+
+        reg_cam_dovdd: cam-dovdd {
+                compatible = "regulator-fixed";
+                regulator-name = "cam500b-dovdd";
+                regulator-min-microvolt = <1800000>;
+                regulator-max-microvolt = <1800000>;
+                vin-supply = <&reg_cam>;
+        };
+
+        reg_cam_dvdd: cam-dvdd {
+                compatible = "regulator-fixed";
+                regulator-name = "cam500b-dvdd";
+                regulator-min-microvolt = <1500000>;
+                regulator-max-microvolt = <1500000>;
+                vin-supply = <&reg_cam>;
+        };
+
 	hdmi-connector {
 		compatible = "hdmi-connector";
 		type = "a";
@@ -116,6 +154,23 @@
 		>;
 };
 
+&csi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&csi0_8bits_pins>;
+	status = "okay";
+
+	port {
+		csi_from_ov5640: endpoint {
+                        remote-endpoint = <&ov5640_to_csi>;
+                        bus-width = <8>;
+                        hsync-active = <1>; /* Active high */
+                        vsync-active = <0>; /* Active low */
+                        data-active = <1>;  /* Active high */
+                        pclk-sample = <1>;  /* Rising */
+                };
+	};
+};
+
 &de {
 	status = "okay";
 };
@@ -161,6 +216,38 @@
 	};
 };
 
+&i2c1 {
+	status = "okay";
+
+	camera: camera@21 {
+		compatible = "ovti,ov5640";
+		reg = <0x21>;
+		clocks = <&ccu CLK_CSI0>;
+		clock-names = "xclk";
+		assigned-clocks = <&ccu CLK_CSI0>;
+		assigned-clock-rates = <24000000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&csi0_clk_pin>;
+
+		reset-gpios = <&pio 7 14 GPIO_ACTIVE_LOW>;
+		powerdown-gpios = <&pio 7 19 GPIO_ACTIVE_HIGH>;
+		AVDD-supply = <&reg_cam_avdd>;
+		DOVDD-supply = <&reg_cam_dovdd>;
+		DVDD-supply = <&reg_cam_dvdd>;
+
+		port {
+			ov5640_to_csi: endpoint {
+				remote-endpoint = <&csi_from_ov5640>;
+				bus-width = <8>;
+				hsync-active = <1>; /* Active high */
+				vsync-active = <0>; /* Active low */
+				data-active = <1>;  /* Active high */
+				pclk-sample = <1>;  /* Rising */
+			};
+		};
+	};
+};
+
 &i2c2 {
 	status = "okay";
 };
-- 
git-series 0.9.1
