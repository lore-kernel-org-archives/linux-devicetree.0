From: Chunyan Zhang <zhang.chunyan@linaro.org>
Subject: [PATCH v2] Documentation: clock: address more for clock-cells property
Date: Wed, 14 Jun 2017 17:21:44 +0800
Message-ID: <1497432104-22609-1-git-send-email-zhang.chunyan@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mturquette@baylibre.com, sboyd@codeaurora.org
Cc: mark.rutland@arm.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, zhang.lyra@gmail.com
List-Id: devicetree@vger.kernel.org

The value of property 'clock-cells' is not determined only by the number
of clock outputs in one clock node, it is determined by whether the clock
output in this node can be referenced directly without index. If the
output clock has to be referenced by a index, the clock-cell of this
clock node can't be defined 0.

Signed-off-by: Chunyan Zhang <zhang.chunyan@linaro.org>
---
 Documentation/devicetree/bindings/clock/clock-bindings.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.txt b/Documentation/devicetree/bindings/clock/clock-bindings.txt
index 2ec489e..e2b76b4 100644
--- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
+++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
@@ -18,6 +18,9 @@ Required properties:
 		   with a single clock output and 1 for nodes with multiple
 		   clock outputs.
 
+		   There's one exception, please see the description for
+		   clock-indices below.
+
 Optional properties:
 clock-output-names: Recommended to be a list of strings of clock output signal
 		    names indexed by the first cell in the clock specifier.
@@ -48,6 +51,13 @@ clock-indices:	   If the identifying number for the clocks in the node
 		   is not linear from zero, then this allows the mapping of
 		   identifiers into the clock-output-names array.
 
+		   This property not only servers for clocks with multiple
+		   clock outputs, but also for clocks with a single clock
+		   output whose identifying number is not zero.
+
+		   So long as clock-indices is set, clock-cells cannot be
+		   set zero.
+
 For example, if we have two clocks <&oscillator 1> and <&oscillator 3>:
 
 	oscillator {
-- 
2.7.4
