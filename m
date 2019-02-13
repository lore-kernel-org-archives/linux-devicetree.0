From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH v2 4/5] arm64: dts: sprd: Add SC27XX fuel gauge device
Date: Wed, 13 Feb 2019 20:32:48 +0800
Message-ID: <46be35679912ffa446d67bb9b81f0cee065c1ca2.1550060544.git.baolin.wang@linaro.org>
References: <cover.1550060543.git.baolin.wang@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1550060543.git.baolin.wang@linaro.org>
In-Reply-To: <cover.1550060543.git.baolin.wang@linaro.org>
References: <cover.1550060543.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, arnd@arndb.de
Cc: olof@lixom.net, orsonzhai@gmail.com, zhang.lyra@gmail.com, devicetree@vger.kernel.org, arm@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, broonie@kernel.org, baolin.wang@linaro.org
List-Id: devicetree@vger.kernel.org

Add Spreadtrum SC27XX fuel gauge device node to calculate the
battery capacity.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 arch/arm64/boot/dts/sprd/sc2731.dtsi |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/sprd/sc2731.dtsi b/arch/arm64/boot/dts/sprd/sc2731.dtsi
index dbf6242..4a79ddf 100644
--- a/arch/arm64/boot/dts/sprd/sc2731.dtsi
+++ b/arch/arm64/boot/dts/sprd/sc2731.dtsi
@@ -70,6 +70,11 @@
 			#size-cells = <1>;
 			hwlocks = <&hwlock 12>;
 
+			fgu_calib: calib@6 {
+				reg = <0x6 0x2>;
+				bits = <0 9>;
+			};
+
 			adc_big_scale: calib@24 {
 				reg = <0x24 0x2>;
 			};
@@ -90,6 +95,19 @@
 			nvmem-cells = <&adc_big_scale>, <&adc_small_scale>;
 		};
 
+		fgu@a00 {
+			compatible = "sprd,sc2731-fgu";
+			reg = <0xa00>;
+			bat-detect-gpio = <&pmic_eic 9 GPIO_ACTIVE_HIGH>;
+			io-channels = <&pmic_adc 3>, <&pmic_adc 6>;
+			io-channel-names = "bat-temp", "charge-vol";
+			monitored-battery = <&bat>;
+			nvmem-cell-names = "fgu_calib";
+			nvmem-cells = <&fgu_calib>;
+			interrupt-parent = <&sc2731_pmic>;
+			interrupts = <4>;
+		};
+
 		vibrator@ec8 {
 			compatible = "sprd,sc27xx-vibrator", "sprd,sc2731-vibrator";
 			reg = <0xec8>;
-- 
1.7.9.5
