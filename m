From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH v2 2/5] arm64: dts: sprd: Add ADC calibration support
Date: Wed, 13 Feb 2019 20:32:46 +0800
Message-ID: <0213394a8e432e0ee0809f9032427d971ea9cde2.1550060544.git.baolin.wang@linaro.org>
References: <cover.1550060543.git.baolin.wang@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1550060543.git.baolin.wang@linaro.org>
In-Reply-To: <cover.1550060543.git.baolin.wang@linaro.org>
References: <cover.1550060543.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, arnd@arndb.de
Cc: olof@lixom.net, orsonzhai@gmail.com, zhang.lyra@gmail.com, devicetree@vger.kernel.org, arm@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, broonie@kernel.org, baolin.wang@linaro.org
List-Id: devicetree@vger.kernel.org

This patch adds phandles to the calibration cells provided by the Efuse
device, which is used to calibrate the ADC channel scales.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 arch/arm64/boot/dts/sprd/sc2731.dtsi |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/sprd/sc2731.dtsi b/arch/arm64/boot/dts/sprd/sc2731.dtsi
index f2f2aa5..a2edc25 100644
--- a/arch/arm64/boot/dts/sprd/sc2731.dtsi
+++ b/arch/arm64/boot/dts/sprd/sc2731.dtsi
@@ -63,6 +63,14 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			hwlocks = <&hwlock 12>;
+
+			adc_big_scale: calib@24 {
+				reg = <0x24 0x2>;
+			};
+
+			adc_small_scale: calib@26 {
+				reg = <0x26 0x2>;
+			};
 		};
 
 		pmic_adc: adc@480 {
@@ -72,6 +80,8 @@
 			interrupts = <0>;
 			#io-channel-cells = <1>;
 			hwlocks = <&hwlock 4>;
+			nvmem-cell-names = "big_scale_calib", "small_scale_calib";
+			nvmem-cells = <&adc_big_scale>, <&adc_small_scale>;
 		};
 
 		vibrator@ec8 {
-- 
1.7.9.5
