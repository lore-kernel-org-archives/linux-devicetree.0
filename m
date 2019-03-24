Return-Path: <vkoul@kernel.org>
From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 5/6] arm64: dts: qcom: pms405: add spmi regulators
Date: Sun, 24 Mar 2019 22:02:08 +0530
Message-Id: <20190324163209.17312-6-vkoul@kernel.org>
In-Reply-To: <20190324163209.17312-1-vkoul@kernel.org>
References: <20190324163209.17312-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Andy Gross <andy.gross@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Khasim Syed Mohammed <khasim.mohammed@linaro.org>, Vinod Koul <vkoul@kernel.org>
List-ID: <devicetree@vger.kernel.org>

From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

The PMS405 sports 5 SMPS and 13 LDO regulators.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/pms405.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pms405.dtsi b/arch/arm64/boot/dts/qcom/pms405.dtsi
index 1bb836d1e8aa..8da4dee1db9b 100644
--- a/arch/arm64/boot/dts/qcom/pms405.dtsi
+++ b/arch/arm64/boot/dts/qcom/pms405.dtsi
@@ -131,4 +131,24 @@
 			interrupts = <0x0 0x61 0x1 IRQ_TYPE_NONE>;
 		};
 	};
+
+	pms405_1: pms405@1 {
+		compatible = "qcom,spmi-pmic";
+		reg = <0x1 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		regulators {
+			compatible = "qcom,pms405-regulators";
+			vdd_s3-supply = <&pms405_s3>;
+
+			pms405_s3: s3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-name = "vdd_cpu";
+				regulator-min-microvolt = <1048000>;
+				regulator-max-microvolt = <1352000>;
+			};
+		};
+	};
 };
-- 
2.20.1
