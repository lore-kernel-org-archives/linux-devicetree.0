From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/2 v3] clk: qcom: Update DT bindings for the MSM8660/APQ8060 RPMCC
Date: Fri, 13 Oct 2017 13:59:16 +0200
Message-ID: <20171013115917.9318-1-linus.walleij@linaro.org>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

These compatible strings need to be added to extend support
for the RPM CC to cover MSM8660/APQ8060. We also need to add
enumberators to the include file for a few clocks that were
missing.

Cc: devicetree@vger.kernel.org
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Move PLL4 last, and do not provide an enumerator for the
  "active" variant, we don't do that on PLL4.
ChangeLog v1->v2:
- Collect Rob's ACK
---
 Documentation/devicetree/bindings/clock/qcom,rpmcc.txt | 2 ++
 include/dt-bindings/clock/qcom,rpmcc.h                 | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
index 32c6e9ce64c3..833a89f06ae0 100644
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
index 96b63c00249e..29dad206a74b 100644
--- a/include/dt-bindings/clock/qcom,rpmcc.h
+++ b/include/dt-bindings/clock/qcom,rpmcc.h
@@ -37,6 +37,9 @@
 #define RPM_SYS_FABRIC_A_CLK			19
 #define RPM_SFPB_CLK				20
 #define RPM_SFPB_A_CLK				21
+#define RPM_SMI_CLK				22
+#define RPM_SMI_A_CLK				23
+#define RPM_PLL4_CLK				24
 
 /* SMD RPM clocks */
 #define RPM_SMD_XO_CLK_SRC				0
-- 
2.13.5

