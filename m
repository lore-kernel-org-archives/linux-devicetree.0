From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH v2 3/5] arm64: dts: sprd: Add SC2731 charger device
Date: Wed, 13 Feb 2019 20:32:47 +0800
Message-ID: <ecfa4740cd1255f358b307af946cb059f7776090.1550060544.git.baolin.wang@linaro.org>
References: <cover.1550060543.git.baolin.wang@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1550060543.git.baolin.wang@linaro.org>
In-Reply-To: <cover.1550060543.git.baolin.wang@linaro.org>
References: <cover.1550060543.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, arnd@arndb.de
Cc: olof@lixom.net, orsonzhai@gmail.com, zhang.lyra@gmail.com, devicetree@vger.kernel.org, arm@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, broonie@kernel.org, baolin.wang@linaro.org
List-Id: devicetree@vger.kernel.org

Add charger device node and related battery node for SC2731 PMIC.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 arch/arm64/boot/dts/sprd/sc2731.dtsi      |    6 ++++++
 arch/arm64/boot/dts/sprd/sp9860g-1h10.dts |   16 ++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/sprd/sc2731.dtsi b/arch/arm64/boot/dts/sprd/sc2731.dtsi
index a2edc25..dbf6242 100644
--- a/arch/arm64/boot/dts/sprd/sc2731.dtsi
+++ b/arch/arm64/boot/dts/sprd/sc2731.dtsi
@@ -17,6 +17,12 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		charger@0 {
+			compatible = "sprd,sc2731-charger";
+			reg = <0x0>;
+			monitored-battery = <&bat>;
+		};
+
 		led-controller@200 {
 			compatible = "sprd,sc27xx-bltc", "sprd,sc2731-bltc";
 			reg = <0x200>;
diff --git a/arch/arm64/boot/dts/sprd/sp9860g-1h10.dts b/arch/arm64/boot/dts/sprd/sp9860g-1h10.dts
index 3bd18e3..2a963bd 100644
--- a/arch/arm64/boot/dts/sprd/sp9860g-1h10.dts
+++ b/arch/arm64/boot/dts/sprd/sp9860g-1h10.dts
@@ -41,6 +41,22 @@
 		#size-cells = <2>;
 		ranges;
 	};
+
+	bat: battery {
+		compatible = "simple-battery";
+		charge-full-design-microamp-hours = <1900000>;
+		charge-term-current-microamp = <120000>;
+		constant_charge_voltage_max_microvolt = <4350000>;
+		internal-resistance-micro-ohms = <250000>;
+		ocv-capacity-celsius = <20>;
+		ocv-capacity-table-0 = <4185000 100>, <4113000 95>, <4066000 90>,
+			<4022000 85>, <3983000 80>, <3949000 75>,
+			<3917000 70>, <3889000 65>, <3864000 60>,
+			<3835000 55>, <3805000 50>, <3787000 45>,
+			<3777000 40>, <3773000 35>, <3770000 30>,
+			<3765000 25>, <3752000 20>, <3724000 15>,
+			<3680000 10>, <3605000 5>, <3400000 0>;
+	};
 };
 
 &uart0 {
-- 
1.7.9.5
