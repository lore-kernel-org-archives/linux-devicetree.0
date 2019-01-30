From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH v1 2/4] dt-bindings: clock: Add support for the MSM8998 mmcc
Date: Wed, 30 Jan 2019 09:35:59 -0700
Message-ID: <1548866159-30304-1-git-send-email-jhugo@codeaurora.org>
References: <1548866102-30224-1-git-send-email-jhugo@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548866102-30224-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: marc.w.gonzalez@free.fr, andy.gross@linaro.org, david.brown@linaro.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Document the multimedia clock controller found on MSM8998

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
---
 Documentation/devicetree/bindings/clock/qcom,mmcc.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.txt b/Documentation/devicetree/bindings/clock/qcom,mmcc.txt
index 8b0f784..ae85bca 100644
--- a/Documentation/devicetree/bindings/clock/qcom,mmcc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,mmcc.txt
@@ -10,11 +10,18 @@ Required properties :
 			"qcom,mmcc-msm8960"
 			"qcom,mmcc-msm8974"
 			"qcom,mmcc-msm8996"
+			"qcom,mmcc-msm8998"
 
 - reg : shall contain base register location and length
 - #clock-cells : shall contain 1
 - #reset-cells : shall contain 1
 
+For MSM8998 only:
+	- clocks: a list of phandles and clock-specifier pairs,
+		  one for each entry in clock-names.
+	- clock-names: "xo" for the xo clock,
+		       "gpll0" for the global pll 0 clock.
+
 Optional properties :
 - #power-domain-cells : shall contain 1
 
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
