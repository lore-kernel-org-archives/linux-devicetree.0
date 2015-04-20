From: "Ivan T. Ivanov" <ivan.ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 3/7] ARM: dts: qcom: Add PMA8084 functions device nodes
Date: Mon, 20 Apr 2015 10:45:37 +0300
Message-ID: <1429515941-15334-4-git-send-email-ivan.ivanov@linaro.org>
References: <1429515941-15334-1-git-send-email-ivan.ivanov@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429515941-15334-1-git-send-email-ivan.ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add configuration nodes for following devices:

* GPIO block, with 22 pins
* MPP block, with 8 pins
* Volatage ADC (VADC), with multiple inputs
* Thermal sensor device, which is using on chip VADC
  channel report PMIC die temperature.
* RTC device

Signed-off-by: Ivan T. Ivanov <ivan.ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/qcom-pma8084.dtsi | 92 +++++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-pma8084.dtsi b/arch/arm/boot/dts/qcom-pma8084.dtsi
index a5a4fe6..5e240cc 100644
--- a/arch/arm/boot/dts/qcom-pma8084.dtsi
+++ b/arch/arm/boot/dts/qcom-pma8084.dtsi
@@ -1,3 +1,5 @@
+#include <dt-bindings/iio/qcom,spmi-vadc.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>

 &spmi_bus {
@@ -7,6 +9,96 @@
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
+			interrupts = <0 0xc0 0 IRQ_TYPE_NONE>,
+				     <0 0xc1 0 IRQ_TYPE_NONE>,
+				     <0 0xc2 0 IRQ_TYPE_NONE>,
+				     <0 0xc3 0 IRQ_TYPE_NONE>,
+				     <0 0xc4 0 IRQ_TYPE_NONE>,
+				     <0 0xc5 0 IRQ_TYPE_NONE>,
+				     <0 0xc6 0 IRQ_TYPE_NONE>,
+				     <0 0xc7 0 IRQ_TYPE_NONE>,
+				     <0 0xc8 0 IRQ_TYPE_NONE>,
+				     <0 0xc9 0 IRQ_TYPE_NONE>,
+				     <0 0xca 0 IRQ_TYPE_NONE>,
+				     <0 0xcb 0 IRQ_TYPE_NONE>,
+				     <0 0xcc 0 IRQ_TYPE_NONE>,
+				     <0 0xcd 0 IRQ_TYPE_NONE>,
+				     <0 0xce 0 IRQ_TYPE_NONE>,
+				     <0 0xcf 0 IRQ_TYPE_NONE>,
+				     <0 0xd0 0 IRQ_TYPE_NONE>,
+				     <0 0xd1 0 IRQ_TYPE_NONE>,
+				     <0 0xd2 0 IRQ_TYPE_NONE>,
+				     <0 0xd3 0 IRQ_TYPE_NONE>,
+				     <0 0xd4 0 IRQ_TYPE_NONE>,
+				     <0 0xd5 0 IRQ_TYPE_NONE>;
+		};
+
+		pma8084_mpps: mpps@a000 {
+			compatible = "qcom,pma8084-mpp";
+			reg = <0xa000 0x800>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupts = <0 0xa0 0 IRQ_TYPE_NONE>,
+				     <0 0xa1 0 IRQ_TYPE_NONE>,
+				     <0 0xa2 0 IRQ_TYPE_NONE>,
+				     <0 0xa3 0 IRQ_TYPE_NONE>,
+				     <0 0xa4 0 IRQ_TYPE_NONE>,
+				     <0 0xa5 0 IRQ_TYPE_NONE>,
+				     <0 0xa6 0 IRQ_TYPE_NONE>,
+				     <0 0xa7 0 IRQ_TYPE_NONE>;
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
