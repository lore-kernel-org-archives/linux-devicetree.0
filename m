From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 1/2] dt-bindings: clock: qcom: Fix the xo parent in gpucc example
Date: Wed, 28 Nov 2018 10:57:42 -0800
Message-ID: <20181128185743.75328-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, Andy Gross <andy.gross@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, Taniya Das <tdas@codeaurora.org>, "Kristian H . Kristensen" <hoegsberg@chromium.org>, Jordan Crouse <jcrouse@codeaurora.org>, Amit Nischal <anischal@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

In the bindings that landed for the gpucc we require that the XO clock
(one possible parent of the gpucc) be listed.  The code doesn't use
this yet--this is just to allow us to move toward the day when it does
use it.  What the code does do today is to hardcode the parent name to
"bi_tcxo".  That's all well and good.

...but the example in the bindings shows this clock mapping to the
clock "xo_board".  On the current sdm845.dtsi file the "xo_board"
clock is a fixed clock with an output name of "xo_board".  The clock
with the name "bi_tcxo" is actually provided by the RPMh Clock
Controller.  Presumably that's the one that was wanted.

Let's update the example to make this clearer.

Fixes: e431c92188a9 ("dt-bindings: clock: Introduce QCOM Graphics clock bindings")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 Documentation/devicetree/bindings/clock/qcom,gpucc.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc.txt b/Documentation/devicetree/bindings/clock/qcom,gpucc.txt
index 9d0358cc08b4..4e5215ef1acd 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gpucc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,gpucc.txt
@@ -17,6 +17,6 @@ Example:
 		#clock-cells = <1>;
 		#reset-cells = <1>;
 		#power-domain-cells = <1>;
-		clocks = <&xo_board>;
+		clocks = <&rpmhcc RPMH_CXO_CLK>;
 		clock-names = "xo";
 	};
-- 
2.20.0.rc0.387.gc7a69e6b6c-goog
