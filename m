From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v4 14/18] arm64: dts: qcom: qcs404: Add remoteproc nodes
Date: Fri,  9 Nov 2018 00:10:05 +0530
Message-ID: <20181108184009.18430-15-vkoul@kernel.org>
References: <20181108184009.18430-1-vkoul@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181108184009.18430-1-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>
List-Id: devicetree@vger.kernel.org

From: Bjorn Andersson <bjorn.andersson@linaro.org>

Add the TrustZone based remoteproc nodes and their glink edges for
adsp, cdsp and wcss. Enable them for EVB common DTS.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 12 +++++
 arch/arm64/boot/dts/qcom/qcs404.dtsi     | 93 ++++++++++++++++++++++++++++++++
 2 files changed, 105 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index cc5dfb319af8..ef37ad8f0d4e 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -21,6 +21,18 @@
 	};
 };
 
+&remoteproc_adsp {
+	status = "ok";
+};
+
+&remoteproc_cdsp {
+	status = "ok";
+};
+
+&remoteproc_wcss {
+	status = "ok";
+};
+
 &rpm_requests {
 	pms405-regulators {
 		compatible = "qcom,rpm-pms405-regulators";
diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 373d514eb147..4805f66cd2cd 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -80,6 +80,99 @@
 		method = "smc";
 	};
 
+	remoteproc_adsp: remoteproc_adsp {
+		compatible = "qcom,qcs404-adsp-pas";
+
+		interrupts-extended = <&intc GIC_SPI 293 IRQ_TYPE_EDGE_RISING>,
+				      <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+				      <&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+				      <&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+				      <&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "wdog", "fatal", "ready",
+				  "handover", "stop-ack";
+
+		clocks = <&xo_board>;
+		clock-names = "xo";
+
+		memory-region = <&adsp_fw_mem>;
+
+		qcom,smem-states = <&adsp_smp2p_out 0>;
+		qcom,smem-state-names = "stop";
+
+		status = "disabled";
+
+		glink-edge {
+			interrupts = <GIC_SPI 289 IRQ_TYPE_EDGE_RISING>;
+
+			qcom,remote-pid = <2>;
+			mboxes = <&apcs_glb 8>;
+
+			label = "adsp";
+		};
+	};
+
+	remoteproc_cdsp: remoteproc_cdsp {
+		compatible = "qcom,qcs404-cdsp-pas";
+
+		interrupts-extended = <&intc GIC_SPI 229 IRQ_TYPE_EDGE_RISING>,
+				      <&cdsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+				      <&cdsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+				      <&cdsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+				      <&cdsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "wdog", "fatal", "ready",
+				  "handover", "stop-ack";
+
+		clocks = <&xo_board>;
+		clock-names = "xo";
+
+		memory-region = <&cdsp_fw_mem>;
+
+		qcom,smem-states = <&cdsp_smp2p_out 0>;
+		qcom,smem-state-names = "stop";
+
+		status = "disabled";
+
+		glink-edge {
+			interrupts = <GIC_SPI 141 IRQ_TYPE_EDGE_RISING>;
+
+			qcom,remote-pid = <5>;
+			mboxes = <&apcs_glb 12>;
+
+			label = "cdsp";
+		};
+	};
+
+	remoteproc_wcss: remoteproc_wcss {
+		compatible = "qcom,qcs404-wcss-pas";
+
+		interrupts-extended = <&intc GIC_SPI 153 IRQ_TYPE_EDGE_RISING>,
+				      <&wcss_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+				      <&wcss_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+				      <&wcss_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+				      <&wcss_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "wdog", "fatal", "ready",
+				  "handover", "stop-ack";
+
+		clocks = <&xo_board>;
+		clock-names = "xo";
+
+		memory-region = <&wlan_fw_mem>;
+
+		qcom,smem-states = <&wcss_smp2p_out 0>;
+		qcom,smem-state-names = "stop";
+
+		status = "disabled";
+
+		glink-edge {
+			interrupts = <GIC_SPI 156 IRQ_TYPE_EDGE_RISING>;
+
+			qcom,remote-pid = <1>;
+			mboxes = <&apcs_glb 16>;
+
+			label = "wcss";
+		};
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
-- 
2.14.4
