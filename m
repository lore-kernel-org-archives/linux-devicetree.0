From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] arm64: dts: msm8996: Transition smp2p and smd to mailbox
Date: Mon, 27 Aug 2018 22:37:05 -0700
Message-ID: <20180828053705.30882-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The smd and smp2p drivers now support accessing the APCS GLOBAL IPC
register through the mailbox framework, so migrate the msm8996 dts to
use this and remove the syscon based APCS node.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index cd3865e7a270..21057f957468 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -409,11 +409,6 @@
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		apcs: syscon@9820000 {
-			compatible = "syscon";
-			reg = <0x9820000 0x1000>;
-		};
-
 		apcs_glb: mailbox@9820000 {
 			compatible = "qcom,msm8996-apcs-hmss-global";
 			reg = <0x9820000 0x1000>;
@@ -1140,7 +1135,7 @@
 			interrupts = <GIC_SPI 156 IRQ_TYPE_EDGE_RISING>;
 
 			label = "lpass";
-			qcom,ipc = <&apcs 16 8>;
+			mboxes = <&apcs_glb 8>;
 			qcom,smd-edge = <1>;
 			qcom,remote-pid = <2>;
 		};
@@ -1152,7 +1147,7 @@
 
 		interrupts = <0 158 IRQ_TYPE_EDGE_RISING>;
 
-		qcom,ipc = <&apcs 16 10>;
+		mboxes = <&apcs_glb 10>;
 
 		qcom,local-pid = <0>;
 		qcom,remote-pid = <2>;
@@ -1176,7 +1171,7 @@
 
 		interrupts = <GIC_SPI 451 IRQ_TYPE_EDGE_RISING>;
 
-		qcom,ipc = <&apcs 16 14>;
+		mboxes = <&apcs_glb 14>;
 
 		qcom,local-pid = <0>;
 		qcom,remote-pid = <1>;
@@ -1200,7 +1195,7 @@
 
 		interrupts = <GIC_SPI 178 IRQ_TYPE_EDGE_RISING>;
 
-		qcom,ipc = <&apcs 16 26>;
+		mboxes = <&apcs_glb 26>;
 
 		qcom,local-pid = <0>;
 		qcom,remote-pid = <3>;
-- 
2.18.0
