From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH v4 2/6] arm64: dts: msm8998: Add xo clock to gcc node
Date: Tue, 21 May 2019 08:47:19 -0600
Message-ID: <1558450039-20941-1-git-send-email-jhugo@codeaurora.org>
References: <1558449843-19971-1-git-send-email-jhugo@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1558449843-19971-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: agross@kernel.org, bjorn.andersson@linaro.org, david.brown@linaro.org
Cc: marc.w.gonzalez@free.fr, mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>
List-Id: devicetree@vger.kernel.org

GCC is a consumer of the xo clock.  Add a reference to the clock supplier
to the gcc node.

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 574be78..141488e 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -709,6 +709,8 @@
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
 			reg = <0x100000 0xb0000>;
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "xo";
 		};
 
 		tlmm: pinctrl@3400000 {
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
