From: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Subject: [PATCH 3/7] ARM: dts: qcom: Add PMA8084 functions device nodes
Date: Wed,  1 Apr 2015 18:05:11 +0300
Message-ID: <1427900715-26273-4-git-send-email-ivan.ivanov@linaro.org>
References: <1427900715-26273-1-git-send-email-ivan.ivanov@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1427900715-26273-1-git-send-email-ivan.ivanov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

* GPIO block, with 22 pins
* MPP block, with 8 pins
* Volatage ADC (VADC), with multiple inputs
* Thermal sensor device, which is using on chip VADC
  channel report PMIC die temperature.
* RTC device

Signed-off-by: Ivan T. Ivanov <ivan.ivanov@linaro.org>
---
 arch/arm/boot/dts/qcom-pma8084.dtsi | 70 +++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-pma8084.dtsi b/arch/arm/boot/dts/qcom-pma8084.dtsi
index a5a4fe6..9092c2e 100644
--- a/arch/arm/boot/dts/qcom-pma8084.dtsi
+++ b/arch/arm/boot/dts/qcom-pma8084.dtsi
@@ -1,3 +1,5 @@
+#include <dt-bindings/iio/qcom,spmi-vadc.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>

 &spmi_bus {
@@ -7,6 +9,74 @@
 		reg = <0x0 SPMI_USID>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+
+		rtc@6000 {
+			compatible = "qcom,pm8941-rtc";
+			reg = <0x6000 0x100>,
+			      <0x6100 0x100>;
+			reg-names = "rtc", "alarm";
+			interrupts = <0x0 0x61 0x1 IRQ_TYPE_EDGE_RISING>;
+		};
+
+		pma8084_gpios: gpios@c000 {
+			compatible = "qcom,pma8084-gpio";
+			reg = <0xc000 0x1600>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupts = <0 0xc0 0 0>, <0 0xc1 0 0>, <0 0xc2 0 0>, <0 0xc3 0 0>,
+				     <0 0xc4 0 0>, <0 0xc5 0 0>, <0 0xc6 0 0>, <0 0xc7 0 0>,
+				     <0 0xc8 0 0>, <0 0xc9 0 0>, <0 0xca 0 0>, <0 0xcb 0 0>,
+				     <0 0xcc 0 0>, <0 0xcd 0 0>, <0 0xce 0 0>, <0 0xcf 0 0>,
+				     <0 0xd0 0 0>, <0 0xd1 0 0>, <0 0xd2 0 0>, <0 0xd3 0 0>,
+				     <0 0xd4 0 0>, <0 0xd5 0 0>;
+		};
+
+		pma8084_mpps: mpps@a000 {
+			compatible = "qcom,pma8084-mpp";
+			reg = <0xa000 0x800>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupts = <0 0xa0 0 0>, <0 0xa1 0 0>, <0 0xa2 0 0>, <0 0xa3 0 0>,
+				     <0 0xa4 0 0>, <0 0xa5 0 0>, <0 0xa6 0 0>, <0 0xa7 0 0>;
+		};
+
+		pma8084_temp: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400 0x100>;
+			interrupts = <0 0x24 0 IRQ_TYPE_EDGE_RISING>;
+			#thermal-sensor-cells = <0>;
+			io-channels = <&pma8084_vadc VADC_DIE_TEMP>;
+			io-channel-names = "thermal";
+		};
+
+		pma8084_vadc: vadc@3100 {
+			compatible = "qcom,spmi-vadc";
+			reg = <0x3100 0x100>;
+			interrupts = <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#io-channel-cells = <1>;
+			io-channel-ranges;
+
+			die_temp {
+				reg = <VADC_DIE_TEMP>;
+			};
+			ref_625mv {
+				reg = <VADC_REF_625MV>;
+			};
+			ref_1250v {
+				reg = <VADC_REF_1250MV>;
+			};
+			ref_buf_625mv {
+				reg = <VADC_SPARE1>;
+			};
+			ref_gnd {
+				reg = <VADC_GND_REF>;
+			};
+			ref_vdd {
+				reg = <VADC_VDD_VADC>;
+			};
+		};
 	};

 	usid1: pma8084@1 {
--
1.9.1
