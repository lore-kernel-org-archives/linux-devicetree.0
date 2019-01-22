From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v3 03/10] arm64: dts: sdm845: Introduce ADSP and CDSP PAS nodes
Date: Mon, 21 Jan 2019 21:51:05 -0800
Message-ID: <20190122055112.30943-4-bjorn.andersson@linaro.org>
References: <20190122055112.30943-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190122055112.30943-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Sibi Sankar <sibis@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the ADSP and CDSP nodes for PAS-based remoteproc, supporting booting
these cores on e.g. the MTP, and enable the same for the MTP.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- New patch

 arch/arm64/boot/dts/qcom/sdm845-mtp.dts |  8 ++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi    | 58 +++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index af8c6a2445a2..02b8357c8ce8 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -48,6 +48,10 @@
 	};
 };
 
+&adsp_pas {
+	status = "okay";
+};
+
 &apps_rsc {
 	pm8998-rpmh-regulators {
 		compatible = "qcom,pm8998-rpmh-regulators";
@@ -344,6 +348,10 @@
 	};
 };
 
+&cdsp_pas {
+	status = "okay";
+};
+
 &gcc {
 	protected-clocks = <GCC_QSPI_CORE_CLK>,
 			   <GCC_QSPI_CORE_CLK_SRC>,
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 64f57cc5c61a..1033b77856e6 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -319,6 +319,64 @@
 		};
 	};
 
+	adsp_pas: remoteproc-adsp {
+		compatible = "qcom,sdm845-adsp-pas";
+
+		interrupts-extended = <&intc GIC_SPI 162 IRQ_TYPE_EDGE_RISING>,
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
+		memory-region = <&adsp_mem>;
+
+		qcom,smem-states = <&adsp_smp2p_out 0>;
+		qcom,smem-state-names = "stop";
+
+		status = "disabled";
+
+		glink-edge {
+			interrupts = <GIC_SPI 156 IRQ_TYPE_EDGE_RISING>;
+			label = "lpass";
+			qcom,remote-pid = <2>;
+			mboxes = <&apss_shared 8>;
+		};
+	};
+
+	cdsp_pas: remoteproc-cdsp {
+		compatible = "qcom,sdm845-cdsp-pas";
+
+		interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
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
+		memory-region = <&cdsp_mem>;
+
+		qcom,smem-states = <&cdsp_smp2p_out 0>;
+		qcom,smem-state-names = "stop";
+
+		status = "disabled";
+
+		glink-edge {
+			interrupts = <GIC_SPI 574 IRQ_TYPE_EDGE_RISING>;
+			label = "turing";
+			qcom,remote-pid = <5>;
+			mboxes = <&apss_shared 4>;
+		};
+	};
+
 	tcsr_mutex: hwlock {
 		compatible = "qcom,tcsr-mutex";
 		syscon = <&tcsr_mutex_regs 0 0x1000>;
-- 
2.18.0
