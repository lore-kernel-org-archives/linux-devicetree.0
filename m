From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/5 v2] clk: qcom: Elaborate on "active" clocks in the RPM clock bindings
Date: Wed, 19 Apr 2017 11:13:23 +0200
Message-ID: <20170419091326.11226-2-linus.walleij@linaro.org>
References: <20170419091326.11226-1-linus.walleij@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20170419091326.11226-1-linus.walleij@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The concept of "active" clocks is just explained in a bried comment in the
device driver, let's explain it a bit more in the device tree bindings
so everyone understands this.

Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Reword slighty in accordance with Stephens feedback.
---
 Documentation/devicetree/bindings/clock/qcom,rpmcc.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
index d470a0187035..833a89f06ae0 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
@@ -18,6 +18,14 @@ Required properties :
 
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
2.9.3
