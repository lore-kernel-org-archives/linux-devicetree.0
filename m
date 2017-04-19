From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/5 v2] clk: qcom: Update DT bindings for the MSM8660/APQ8060 RPMCC
Date: Wed, 19 Apr 2017 11:13:22 +0200
Message-ID: <20170419091326.11226-1-linus.walleij@linaro.org>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

These compatible strings need to be added to extend support
for the RPM CC to cover MSM8660/APQ8060. We also need to add
enumberators to the include file for a few clocks that were
missing.

Cc: devicetree@vger.kernel.org
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Collect Rob's ACK
---
 Documentation/devicetree/bindings/clock/qcom,rpmcc.txt | 2 ++
 include/dt-bindings/clock/qcom,rpmcc.h                 | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
index a7235e9e1c97..d470a0187035 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
@@ -10,6 +10,8 @@ Required properties :
 - compatible : shall contain only one of the following. The generic
                compatible "qcom,rpmcc" should be also included.
 
+			"qcom,rpmcc-msm8660", "qcom,rpmcc"
+			"qcom,rpmcc-apq8060", "qcom,rpmcc"
 			"qcom,rpmcc-msm8916", "qcom,rpmcc"
 			"qcom,rpmcc-msm8974", "qcom,rpmcc"
 			"qcom,rpmcc-apq8064", "qcom,rpmcc"
diff --git a/include/dt-bindings/clock/qcom,rpmcc.h b/include/dt-bindings/clock/qcom,rpmcc.h
index 96b63c00249e..44358562a031 100644
--- a/include/dt-bindings/clock/qcom,rpmcc.h
+++ b/include/dt-bindings/clock/qcom,rpmcc.h
@@ -37,6 +37,10 @@
 #define RPM_SYS_FABRIC_A_CLK			19
 #define RPM_SFPB_CLK				20
 #define RPM_SFPB_A_CLK				21
+#define RPM_PLL4_CLK				22
+#define RPM_PLL4_A_CLK				23
+#define RPM_SMI_CLK				24
+#define RPM_SMI_A_CLK				25
 
 /* SMD RPM clocks */
 #define RPM_SMD_XO_CLK_SRC				0
-- 
2.9.3

