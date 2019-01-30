From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH v1 4/4] arm64: dts: qcom: msm8998: Add mmcc node
Date: Wed, 30 Jan 2019 09:36:24 -0700
Message-ID: <1548866184-30378-1-git-send-email-jhugo@codeaurora.org>
References: <1548866102-30224-1-git-send-email-jhugo@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548866102-30224-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, andy.gross@linaro.org, david.brown@linaro.org
Cc: marc.w.gonzalez@free.fr, mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add MSM8998 Multimedia Clock Controller DT node.

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 7136ab1..5673a65 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -814,6 +814,21 @@
 			status = "disabled";
 		};
 
+		mmcc: clock-controller@c8c0000 {
+			compatible = "qcom,mmcc-msm8998";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+			reg = <0x0c8c0000 0x40000>;
+
+			clock-names =
+				"xo",
+				"gpll0";
+			clocks =
+				<&rpmcc RPM_SMD_XO_CLK_SRC>,
+				<&gcc GPLL0_OUT_MAIN>;
+		};
+
 		timer@17920000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
