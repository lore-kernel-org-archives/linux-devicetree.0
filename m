From: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Subject: [PATCH 5/7] arm64: dts: qcom: Add 8x16 chipset SPMI PMIC's nodes
Date: Wed,  1 Apr 2015 18:05:13 +0300
Message-ID: <1427900715-26273-6-git-send-email-ivan.ivanov@linaro.org>
References: <1427900715-26273-1-git-send-email-ivan.ivanov@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1427900715-26273-1-git-send-email-ivan.ivanov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

PM9816 has 2 SPMI devices per physical package. Add PMIC configuration
nodes including sub-function device nodes and include them in boards,
which are using 8x16 based chipset.

PM9816 sub-function devices include:

* GPIO block, with 4 pins
* MPP block, with 4 pins
* Volatage ADC (VADC), with multiple inputs
* Thermal sensor device, which is using on chip VADC
  channel report PMIC die temperature.
* Power key device, which is responsible for clean system
  reboot or shutdown
* RTC device

Signed-off-by: Ivan T. Ivanov <ivan.ivanov@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi |  1 +
 arch/arm64/boot/dts/qcom/msm8916-mtp.dtsi |  1 +
 arch/arm64/boot/dts/qcom/pm8916.dtsi      | 93 +++++++++++++++++++++++++++++++
 3 files changed, 95 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pm8916.dtsi

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 703a4f1..58f0055f 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -12,6 +12,7 @@
  */

 #include "msm8916.dtsi"
+#include "pm8916.dtsi"

 / {
 	aliases {
diff --git a/arch/arm64/boot/dts/qcom/msm8916-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8916-mtp.dtsi
index bea871b..a1aa0b2 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-mtp.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-mtp.dtsi
@@ -12,6 +12,7 @@
  */

 #include "msm8916.dtsi"
+#include "pm8916.dtsi"

 / {
 	aliases {
diff --git a/arch/arm64/boot/dts/qcom/pm8916.dtsi b/arch/arm64/boot/dts/qcom/pm8916.dtsi
new file mode 100644
index 0000000..2a5ad2c
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm8916.dtsi
@@ -0,0 +1,93 @@
+#include <dt-bindings/iio/qcom,spmi-vadc.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+&spmi_bus {
+
+	usid0: pm8916@0 {
+		compatible ="qcom,spmi-pmic";
+		reg = <0x0 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		rtc@6000 {
+			compatible = "qcom,pm8941-rtc";
+			reg = <0x6000 0x6100>;
+			reg-names = "rtc", "alarm";
+			interrupts = <0x0 0x61 0x1 IRQ_TYPE_EDGE_RISING>;
+		};
+
+		pwrkey@800 {
+			compatible = "qcom,pm8941-pwrkey";
+			reg = <0x800>;
+			interrupts = <0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
+			debounce = <15625>;
+			bias-pull-up;
+		};
+
+		pm8916_gpios: gpios@c000 {
+			compatible = "qcom,pm8916-gpio";
+			reg = <0xc000 0x400>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupts = <0 0xc0 0 0>, <0 0xc1 0 0>, <0 0xc2 0 0>, <0 0xc3 0 0>;
+		};
+
+		pm8916_mpps: mpps@a000 {
+			compatible = "qcom,pm8916-mpp";
+			reg = <0xa000 0x400>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupts = <0 0xa0 0 0>, <0 0xa1 0 0>, <0 0xa2 0 0>, <0 0xa3 0 0>;
+		};
+
+		pm8916_temp: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400 0x100>;
+			interrupts = <0 0x24 0 IRQ_TYPE_EDGE_RISING>;
+			io-channels = <&pm8916_vadc VADC_DIE_TEMP>;
+			io-channel-names = "thermal";
+			#thermal-sensor-cells = <0>;
+		};
+
+		pm8916_vadc: vadc@3100 {
+			compatible = "qcom,spmi-vadc";
+			reg = <0x3100 0x100>;
+			interrupts = <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#io-channel-cells = <1>;
+
+			usb_in {
+				reg = <VADC_USBIN>;
+				qcom,pre-scaling = <1 10>;
+			};
+			vph_pwr {
+				reg = <VADC_VSYS>;
+				qcom,pre-scaling = <1 3>;
+			};
+			die_temp {
+				reg = <VADC_DIE_TEMP>;
+			};
+			ref_625mv {
+				reg = <VADC_REF_625MV>;
+			};
+			ref_1250v {
+				reg = <VADC_REF_1250MV>;
+			};
+			ref_gnd {
+				reg = <VADC_GND_REF>;
+			};
+			ref_vdd {
+				reg = <VADC_VDD_VADC>;
+			};
+		};
+	};
+
+	usid1: pm8916@1 {
+		compatible ="qcom,spmi-pmic";
+		reg = <0x1 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+};
--
1.9.1
