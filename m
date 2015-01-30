From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 2/2] clk: qcom: gcc bindings: Update to add child node support.
Date: Fri, 30 Jan 2015 10:18:50 +0000
Message-ID: <1422613130-29950-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1422613004-29802-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1422613004-29802-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, edubezval@gmail.com, nrajan@codeaurora.com, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

This patch adds note in the bindings about the optional child nodes
which are currently possible with SOCs like MSM8960, APQ8064.
These child device nodes are typically for drivers like thermal sensor
which fall under the memory-map of gcc.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,gcc.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.txt b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
index aba3d25..c79225b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
@@ -17,6 +17,11 @@ Required properties :
 - #clock-cells : shall contain 1
 - #reset-cells : shall contain 1
 
+Optional child nodes:
+	Child nodes could be any device nodes with its own bindings which
+	fall inside the memory-map of the Clock controller, for example
+	thermal sensor driver.
+
 Example:
 	clock-controller@900000 {
 		compatible = "qcom,gcc-msm8960";
-- 
1.9.1
