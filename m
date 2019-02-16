Return-Path: <SRS0=gq5H=QX=codeaurora.org=govinds@kernel.org>
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH] arm64: dts: qcom: qcs404: Add non pas wcss remoteproc node
Date: Sat, 16 Feb 2019 15:39:37 +0530
Message-Id: <20190216100937.29010-1-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: andy.gross@linaro.org, bjorn.andersson@linaro.org
Cc: robh+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Govind Singh <govinds@codeaurora.org>
List-ID: <devicetree@vger.kernel.org>

Add the non pas based remoteproc nodes and their glink edges for
WDSP.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 73 ++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 4718fac68324..319ac6fbf3e1 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -5,6 +5,7 @@
 #include <dt-bindings/clock/qcom,gcc-qcs404.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
+#include <dt-bindings/clock/qcom,wcss-qcs404.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -541,6 +542,14 @@
 			assigned-clock-rates = <19200000>;
 		};
 
+		clock_wcsscc: clock-controller@7500000 {
+			compatible = "qcom,qcs404-wcsscc";
+			reg = <0x07500000 0x4e000>, <0x07550000 0x8012>, <0x07400000 0x104>;
+			reg-names = "wcss_q6sstop", "wcnss_tcsr", "wcss_qdsp6ss";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		tcsr_mutex_regs: syscon@1905000 {
 			compatible = "syscon";
 			reg = <0x01905000 0x20000>;
@@ -768,6 +777,65 @@
 			};
 		};
 
+		remoteproc_wcss_pil: remoteproc-wcss-pil {
+			compatible = "qcom,qcs404-wcss-pil";
+			reg = <0x07400000 0x00104>, <0x07500000 0x4e000>;
+			reg-names = "qdsp6", "q6stop";
+
+			interrupts-extended = <&intc GIC_SPI 153 IRQ_TYPE_EDGE_RISING>,
+					      <&wcss_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&wcss_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&wcss_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&wcss_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready",
+					  "handover", "stop-ack";
+
+			clocks = <&xo_board>,
+				 <&gcc GCC_WCSS_Q6_AHB_CLK>,
+				 <&gcc GCC_WCSS_Q6_AXIM_CLK>,
+				 <&clock_wcsscc WCSS_AHBFABRIC_CBCR_CLK>,
+				 <&clock_wcsscc WCSS_LCC_CBCR_CLK>,
+				 <&clock_wcsscc WCSS_AHBS_CBCR_CLK>,
+				 <&clock_wcsscc WCSS_TCM_CBCR_CLK>,
+				 <&clock_wcsscc WCSS_AHBM_CBCR_CLK>,
+				 <&clock_wcsscc WCSS_AXIM_CBCR_CLK>,
+				 <&clock_wcsscc WCSS_QDSP6SS_XO_CBCR_CLK>,
+				 <&clock_wcsscc WCSS_QDSP6SS_SLEEP_CBCR_CLK>,
+				 <&clock_wcsscc WCSS_QDSP6SS_GFMMUX_CLK>,
+				 <&clock_wcsscc WCSS_BCR_CBCR_CLK>;
+
+			clock-names = "xo", "gcc_abhs_cbcr", "gcc_axim_cbcr",
+				      "wcss_ahbfabric_cbcr", "wcnss_csr_cbcr",
+				      "wcnss_ahbs_cbcr", "wcnss_tcm_slave_cbcr",
+				      "wcnss_abhm_cbcr", "wcnss_axim_cbcr",
+				      "wcnss_qdsp6ss_xo_cbcr", "wcnss_sleep_cbcr",
+				      "wcnss_core_gfm", "wcss_bcr_cbcr";
+			resets = <&gcc GCC_WDSP_RESTART>,
+				 <&clock_wcsscc Q6SSTOP_QDSP6SS_RESET>,
+				 <&clock_wcsscc Q6SSTOP_QDSP6SS_CORE_RESET>,
+				 <&clock_wcsscc Q6SSTOP_QDSP6SS_BUS_RESET>,
+				 <&clock_wcsscc Q6SSTOP_BCR_RESET>;
+			reset-names = "wcss_reset", "wcss_q6_reset",
+				      "wcss_q6_core_reset", "wcss_q6_bus_reset",
+				      "wcss_q6_bcr_reset";
+
+			memory-region = <&wlan_fw_mem>;
+
+			qcom,smem-states = <&wcss_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+			qcom,halt-regs = <&tcsr_wlan_q6 0x18000>;
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 156 IRQ_TYPE_EDGE_RISING>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 16>;
+				label = "wcss";
+			};
+		};
+
 		wifi: wifi@a000000 {
 			compatible = "qcom,wcn3990-wifi";
 			reg = <0xa000000 0x800000>;
@@ -1020,6 +1088,11 @@
 			clock-names = "xo";
 		};
 
+		tcsr_wlan_q6: syscon@19C0000 {
+			compatible = "syscon";
+			reg = <0x1937000 0x00100000>;
+		};
+
 		timer@b120000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
