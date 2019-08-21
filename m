From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v4 3/8] arm64: dts: qcom: pm8150b: Add base dts file
Date: Thu, 22 Aug 2019 00:12:34 +0530
Message-ID: <20190821184239.12364-4-vkoul@kernel.org>
References: <20190821184239.12364-1-vkoul@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190821184239.12364-1-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <sboyd@kernel.org>, Sibi Sankar <sibis@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Niklas Cassel <niklas.cassel@linaro.org>
List-Id: devicetree@vger.kernel.org

PMIC pm8150b is a slave pmic and this adds base DTS file for pm8150b
with power-on, adc, and gpio nodes

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Niklas Cassel <niklas.cassel@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8150b.dtsi | 86 +++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pm8150b.dtsi

diff --git a/arch/arm64/boot/dts/qcom/pm8150b.dtsi b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
new file mode 100644
index 000000000000..322379d5c31f
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2019, Linaro Limited
+ */
+
+#include <dt-bindings/iio/qcom,spmi-vadc.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+&spmi_bus {
+	pmic@2 {
+		compatible = "qcom,pm8150b", "qcom,spmi-pmic";
+		reg = <0x2 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		power-on@800 {
+			compatible = "qcom,pm8916-pon";
+			reg = <0x0800>;
+
+			status = "disabled";
+		};
+
+		adc@3100 {
+			compatible = "qcom,spmi-adc5";
+			reg = <0x3100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#io-channel-cells = <1>;
+			interrupts = <0x2 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
+
+			status = "disabled";
+
+			ref-gnd@0 {
+				reg = <ADC5_REF_GND>;
+				qcom,pre-scaling = <1 1>;
+				label = "ref_gnd";
+			};
+
+			vref-1p25@1 {
+				reg = <ADC5_1P25VREF>;
+				qcom,pre-scaling = <1 1>;
+				label = "vref_1p25";
+			};
+
+			die-temp@6 {
+				reg = <ADC5_DIE_TEMP>;
+				qcom,pre-scaling = <1 1>;
+				label = "die_temp";
+			};
+
+			chg-temp@9 {
+				reg = <ADC5_CHG_TEMP>;
+				qcom,pre-scaling = <1 1>;
+				label = "chg_temp";
+			};
+		};
+
+		pm8150b_gpios: gpio@c000 {
+			compatible = "qcom,pm8150b-gpio";
+			reg = <0xc000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupts = <0x2 0xc0 0x0 IRQ_TYPE_NONE>,
+				     <0x2 0xc1 0x0 IRQ_TYPE_NONE>,
+				     <0x2 0xc2 0x0 IRQ_TYPE_NONE>,
+				     <0x2 0xc3 0x0 IRQ_TYPE_NONE>,
+				     <0x2 0xc4 0x0 IRQ_TYPE_NONE>,
+				     <0x2 0xc5 0x0 IRQ_TYPE_NONE>,
+				     <0x2 0xc6 0x0 IRQ_TYPE_NONE>,
+				     <0x2 0xc7 0x0 IRQ_TYPE_NONE>,
+				     <0x2 0xc8 0x0 IRQ_TYPE_NONE>,
+				     <0x2 0xc9 0x0 IRQ_TYPE_NONE>,
+				     <0x2 0xca 0x0 IRQ_TYPE_NONE>,
+				     <0x2 0xcb 0x0 IRQ_TYPE_NONE>;
+		};
+	};
+
+	pmic@3 {
+		compatible = "qcom,pm8150b", "qcom,spmi-pmic";
+		reg = <0x3 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+};
-- 
2.20.1
