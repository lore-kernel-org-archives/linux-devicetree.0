From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH] dt-bindings: clock: Require #reset-cells in sdm845-videocc
Date: Tue, 27 Nov 2018 11:24:43 -0800
Message-ID: <20181127192443.136158-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Taniya Das <tdas@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The #reset-cells was listed as optional in the bindings for
qcom,sdm845-videocc.  There's no reason for it to be optional.  As per
Stephen [1]:

> We should update the binding to make it a required property. It
> doesn't make any sense why that property would be optional given
> that the hardware either has support for resets or it doesn't.

sdm845 support is still in its infancy so we shouldn't be affecting
any real device trees by modifying the bindings here.

[1] https://lkml.kernel.org/r/154330186815.88331.12720647562079303842@swboyd.mtv.corp.google.com

Fixes: 84b66b211603 ("dt-bindings: clock: Introduce QCOM Video clock bindings")
Suggested-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 Documentation/devicetree/bindings/clock/qcom,videocc.txt | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,videocc.txt b/Documentation/devicetree/bindings/clock/qcom,videocc.txt
index e7c035afa778..8a8622c65c5a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,videocc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,videocc.txt
@@ -6,8 +6,6 @@ Required properties :
 - reg : shall contain base register location and length
 - #clock-cells : from common clock binding, shall contain 1.
 - #power-domain-cells : from generic power domain binding, shall contain 1.
-
-Optional properties :
 - #reset-cells : from common reset binding, shall contain 1.
 
 Example:
@@ -16,4 +14,5 @@ Example:
 		reg = <0xab00000 0x10000>;
 		#clock-cells = <1>;
 		#power-domain-cells = <1>;
+		#reset-cells = <1>;
 	};
-- 
2.20.0.rc0.387.gc7a69e6b6c-goog
