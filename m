From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v3] clk: qcom: Elaborate on "active" clocks in the RPM clock bindings
Date: Fri, 13 Oct 2017 13:26:35 +0200
Message-ID: <20171013112635.32296-1-linus.walleij@linaro.org>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The concept of "active" clocks is just explained in a bried comment in the
device driver, let's explain it a bit more in the device tree bindings
so everyone understands this.

Cc: devicetree@vger.kernel.org
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Collect Rob's ACK.
ChangeLog v1->v2:
- Reword slighty in accordance with Stephens feedback.
---
 Documentation/devicetree/bindings/clock/qcom,rpmcc.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
index a7235e9e1c97..32c6e9ce64c3 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
@@ -16,6 +16,14 @@ Required properties :
 
 - #clock-cells : shall contain 1
 
+The clock enumerators are defined in <dt-bindings/clock/qcom,rpmcc.h>
+and come in pairs: FOO_CLK followed by FOO_A_CLK. The latter clock
+is an "active" clock, which means that the consumer only care that the
+clock is available when the apps CPU subsystem is active, i.e. not
+suspended or in deep idle. If it is important that the clock keeps running
+during system suspend, you need to specify the non-active clock, the one
+not containing *_A_* in the enumerator name.
+
 Example:
 	smd {
 		compatible = "qcom,smd";
-- 
2.13.5

