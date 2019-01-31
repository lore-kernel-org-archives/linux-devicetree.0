From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] arm64: dts: qcom: qcs404: Define APPS IOMMU
Date: Wed, 30 Jan 2019 16:00:06 -0800
Message-ID: <20190131000006.11145-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Thierry Escande <thierry.escande@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

The APPS IOMMU provides contexts for FastRPC, MDP and WLAN, among other
things. Define these.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 85 ++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index d90decd00f5c..c574e48c61d2 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -395,6 +395,91 @@
 			reg = <0x01905000 0x20000>;
 		};
 
+		apps_iommu: iommu@1e20000 {
+			compatible = "qcom,qcs404-iommu", "qcom,msm-iommu-v1";
+			clocks = <&gcc GCC_SMMU_CFG_CLK>,
+				 <&gcc GCC_APSS_TCU_CLK>;
+			clock-names = "iface", "bus";
+			qcom,iommu-secure-id = <17>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			#iommu-cells = <1>;
+
+			/* Define ranges such that the first bank is at 0x1000 */
+			ranges = <0 0x01e20000 0x40000>;
+
+			/* Bank 5: CDSP compute bank 1 */
+			iommu-ctx@5000 {
+				compatible = "qcom,msm-iommu-v1-ns";
+				reg = <0x5000 0x1000>;
+				interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			/* Bank 6: CDSP compute bank 2 */
+			iommu-ctx@6000 {
+				compatible = "qcom,msm-iommu-v1-ns";
+				reg = <0x6000 0x1000>;
+				interrupts = <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			/* Bank 7: CDSP compute bank 3 */
+			iommu-ctx@7000 {
+				compatible = "qcom,msm-iommu-v1-ns";
+				reg = <0x7000 0x1000>;
+				interrupts = <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			/* Bank 8: CDSP compute bank 4 */
+			iommu-ctx@8000 {
+				compatible = "qcom,msm-iommu-v1-ns";
+				reg = <0x8000 0x1000>;
+				interrupts = <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			/* Bank 9: CDSP compute bank 5 */
+			iommu-ctx@9000 {
+				compatible = "qcom,msm-iommu-v1-ns";
+				reg = <0x9000 0x1000>;
+				interrupts = <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			/* Bank 10: MDP */
+			iommu-ctx@a000 {
+				compatible = "qcom,msm-iommu-v1-ns";
+				reg = <0xa000 0x1000>;
+				interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			/* Bank 21: WLAN 0 */
+			iommu-ctx@15000 {
+				compatible = "qcom,msm-iommu-v1-ns";
+				reg = <0x15000 0x1000>;
+				interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			/* Bank 23: ADSP compute bank 2 */
+			iommu-ctx@17000 {
+				compatible = "qcom,msm-iommu-v1-ns";
+				reg = <0x17000 0x1000>;
+				interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			/* Bank 24: ADSP compute bank 3 */
+			iommu-ctx@18000 {
+				compatible = "qcom,msm-iommu-v1-ns";
+				reg = <0x18000 0x1000>;
+				interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			/* Bank 25: ADSP compute bank 4 */
+			iommu-ctx@19000 {
+				compatible = "qcom,msm-iommu-v1-ns";
+				reg = <0x19000 0x1000>;
+				interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
 		spmi_bus: spmi@200f000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg = <0x0200f000 0x001000>,
-- 
2.18.0
