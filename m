From: Sarangdhar Joshi <spjoshi@codeaurora.org>
Subject: [PATCH v2 4/4] arm64: dts: msm8996: Add SMP2P and APCS nodes
Date: Thu, 20 Oct 2016 16:12:19 -0700
Message-ID: <1477005139-15564-5-git-send-email-spjoshi@codeaurora.org>
References: <1477005139-15564-1-git-send-email-spjoshi@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1477005139-15564-1-git-send-email-spjoshi@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Sarangdhar Joshi <spjoshi@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Trilok Soni <tsoni@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add SMP2P and APCS DT nodes required for Qualcomm ADSP
Peripheral Image Loader.

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Sarangdhar Joshi <spjoshi@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index abc1089..26c4827 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -175,6 +175,30 @@
 		method = "smc";
 	};
 
+	adsp-smp2p {
+		compatible = "qcom,smp2p";
+		qcom,smem = <443>, <429>;
+
+		interrupts = <0 158 IRQ_TYPE_EDGE_RISING>;
+
+		qcom,ipc = <&apcs 16 10>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <2>;
+
+		adsp_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,state-cells = <1>;
+		};
+
+		adsp_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	smem {
 		compatible = "qcom,smem";
 
@@ -205,6 +229,11 @@
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		apcs: syscon@9820000 {
+			compatible = "syscon";
+			reg = <0x9820000 0x1000>;
+		};
+
 		gcc: clock-controller@300000 {
 			compatible = "qcom,gcc-msm8996";
 			#clock-cells = <1>;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
