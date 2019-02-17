From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH v2 2/4] dt-bindings: clock: Add support for the MSM8998 mmcc
Date: Sat, 16 Feb 2019 21:32:14 -0700
Message-ID: <1550377934-11377-1-git-send-email-jhugo@codeaurora.org>
References: <1550377885-10618-1-git-send-email-jhugo@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550377885-10618-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: marc.w.gonzalez@free.fr, andy.gross@linaro.org, david.brown@linaro.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Document the multimedia clock controller found on MSM8998

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
---
 .../devicetree/bindings/clock/qcom,mmcc.txt   | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.txt b/Documentation/devicetree/bindings/clock/qcom,mmcc.txt
index 8b0f7841af8d..a92f3cbc9736 100644
--- a/Documentation/devicetree/bindings/clock/qcom,mmcc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,mmcc.txt
@@ -10,11 +10,32 @@ Required properties :
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
+	- clock-names: "xo" for the xo clock.
+		       "gpll0" for the global pll 0 clock.
+		       "dsi0dsi" for the dsi0 pll dsi clock (required if dsi is
+				enabled, optional otherwise).
+		       "dsi0byte" for the dsi0 pll byte clock (required if dsi
+				is enabled, optional otherwise).
+		       "dsi1dsi" for the dsi1 pll dsi clock (required if dsi is
+				enabled, optional otherwise).
+		       "dsi1byte" for the dsi1 pll byte clock (required if dsi
+				is enabled, optional otherwise).
+		       "hdmipll" for the hdmi pll clock (required if hdmi is
+				enabled, optional otherwise).
+		       "dpvco" for the displayport pll vco clock (required if
+				dp is enabled, optional otherwise).
+		       "dplink" for the displayport pll link clock (required if
+				dp is enabled, optional otherwise).
+
 Optional properties :
 - #power-domain-cells : shall contain 1
 
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
