From: Alexandre GRIVEAUX <agriveaux@deutnet.info>
Subject: [PATCH v2 2/5] MIPS: CI20: DTS: Add I2C nodes
Date: Tue, 1 Oct 2019 21:09:00 +0200
Message-ID: <ceeb8d3316809672697f735b927cac77b449c70f.1569955865.git.agriveaux@deutnet.info>
References: <cover.1569955865.git.agriveaux@deutnet.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1569955865.git.agriveaux@deutnet.info>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, agriveaux@deutnet.info
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Adding missing I2C nodes and some peripheral:
- PMU
- RTC

Signed-off-by: Alexandre GRIVEAUX <agriveaux@deutnet.info>
---
 arch/mips/boot/dts/ingenic/ci20.dts | 147 ++++++++++++++++++++++++++++
 1 file changed, 147 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
index 2e9952311ecd..4a77fa30a9cd 100644
--- a/arch/mips/boot/dts/ingenic/ci20.dts
+++ b/arch/mips/boot/dts/ingenic/ci20.dts
@@ -87,6 +87,123 @@
 	pinctrl-0 = <&pins_uart4>;
 };
 
+&i2c0 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_i2c0>;
+
+	clock-frequency = <400000>;
+
+	act8600: act8600@5a {
+		compatible = "active-semi,act8600";
+		reg = <0x5a>;
+		status = "okay";
+
+		regulators {
+			vddcore: SUDCDC1 {
+				regulator-name = "VDDCORE";
+				regulator-min-microvolt = <1100000>;
+				regulator-max-microvolt = <1100000>;
+				regulator-always-on;
+			};
+			vddmem: SUDCDC2 {
+				regulator-name = "VDDMEM";
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <1500000>;
+				regulator-always-on;
+			};
+			vcc_33: SUDCDC3 {
+				regulator-name = "VCC33";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+			vcc_50: SUDCDC4 {
+				regulator-name = "VCC50";
+				regulator-min-microvolt = <5000000>;
+				regulator-max-microvolt = <5000000>;
+				regulator-always-on;
+			};
+			vcc_25: LDO_REG5 {
+				regulator-name = "VCC25";
+				regulator-min-microvolt = <2500000>;
+				regulator-max-microvolt = <2500000>;
+				regulator-always-on;
+			};
+			wifi_io: LDO_REG6 {
+				regulator-name = "WIFIIO";
+				regulator-min-microvolt = <2500000>;
+				regulator-max-microvolt = <2500000>;
+				regulator-always-on;
+			};
+			vcc_28: LDO_REG7 {
+				regulator-name = "VCC28";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-always-on;
+			};
+			vcc_15: LDO_REG8 {
+				regulator-name = "VCC15";
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <1500000>;
+				regulator-always-on;
+			};
+			vcc_18: LDO_REG9 {
+				regulator-name = "VCC18";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+			vcc_11: LDO_REG10 {
+				regulator-name = "VCC11";
+				regulator-min-microvolt = <1100000>;
+				regulator-max-microvolt = <1100000>;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+&i2c1 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_i2c1>;
+
+};
+
+&i2c2 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_i2c2>;
+
+};
+
+&i2c3 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_i2c3>;
+
+};
+
+&i2c4 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_i2c4>;
+
+	clock-frequency = <400000>;
+
+		rtc@51 {
+			compatible = "nxp,pcf8563";
+			reg = <0x51>;
+			interrupts = <110>;
+		};
+};
+
 &nemc {
 	status = "okay";
 
@@ -209,6 +326,36 @@
 		bias-disable;
 	};
 
+	pins_i2c0: i2c0 {
+		function = "i2c0";
+		groups = "i2c0-data";
+		bias-disable;
+	};
+
+	pins_i2c1: i2c1 {
+		function = "i2c1";
+		groups = "i2c1-data";
+		bias-disable;
+	};
+
+	pins_i2c2: i2c2 {
+		function = "i2c2";
+		groups = "i2c2-data";
+		bias-disable;
+	};
+
+	pins_i2c3: i2c3 {
+		function = "i2c3";
+		groups = "i2c3-data";
+		bias-disable;
+	};
+
+	pins_i2c4: i2c4 {
+		function = "i2c4";
+		groups = "i2c4-data-e";
+		bias-disable;
+	};
+
 	pins_nemc: nemc {
 		function = "nemc";
 		groups = "nemc-data", "nemc-cle-ale", "nemc-rd-we", "nemc-frd-fwe";
-- 
2.20.1
