From: Stephen Boyd <sboyd@codeaurora.org>
Subject: [PATCH 7/7] devicetree: bindings: Document qcom,lcc
Date: Wed, 19 Nov 2014 16:10:45 -0800
Message-ID: <1416442245-21967-8-git-send-email-sboyd@codeaurora.org>
References: <1416442245-21967-1-git-send-email-sboyd@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1416442245-21967-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: Rajendra Nayak <rnayak@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kenneth Westfield <kwestfie@codeaurora.org>, Josh Cartwright <joshc@codeaurora.org>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Rajendra Nayak <rnayak@codeaurora.org>

Document the LPASS (low power audio subsystem) clock controller
found on Qualcomm devices.

Cc: <devicetree@vger.kernel.org>
Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
Signed-off-by: Kumar Gala <galak@codeaurora.org>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 .../devicetree/bindings/clock/qcom,lcc.txt          | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,lcc.txt

diff --git a/Documentation/devicetree/bindings/clock/qcom,lcc.txt b/Documentation/devicetree/bindings/clock/qcom,lcc.txt
new file mode 100644
index 000000000000..734e5766ca4a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,lcc.txt
@@ -0,0 +1,21 @@
+Qualcomm LPASS Clock & Reset Controller Binding
+------------------------------------------------
+
+Required properties :
+- compatible : shall contain only one of the following:
+
+			"qcom,lcc-msm8960"
+			"qcom,lcc-apq8064"
+			"qcom,lcc-ipq8064"
+
+- reg : shall contain base register location and length
+- #clock-cells : shall contain 1
+- #reset-cells : shall contain 1
+
+Example:
+	clock-controller@900000 {
+		compatible = "qcom,lcc-ipq8064";
+		reg = <0x28000000 0x1000>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+	};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
