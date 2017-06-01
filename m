From: Chunyan Zhang <zhang.chunyan@linaro.org>
Subject: [PATCH] Documentation: clock: address more for clock-cells property
Date: Thu,  1 Jun 2017 16:46:41 +0800
Message-ID: <1496306801-19239-1-git-send-email-zhang.chunyan@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, zhang.lyra@gmail.com
List-Id: devicetree@vger.kernel.org

The value of property 'clock-cells' is not determined only by the number of
clock outputs in one clock node, it is actually determined by whether the
clock output in this node can be referenced directly without index.  If
the output clock has to be referenced by a index, the clock-cell of this
clock node can't be defined 0.

Signed-off-by: Chunyan Zhang <zhang.chunyan@linaro.org>
---
 Documentation/devicetree/bindings/clock/clock-bindings.txt | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.txt b/Documentation/devicetree/bindings/clock/clock-bindings.txt
index 2ec489e..cef3db5 100644
--- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
+++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
@@ -15,8 +15,14 @@ value of a #clock-cells property in the clock provider node.
 
 Required properties:
 #clock-cells:	   Number of cells in a clock specifier; Typically 0 for nodes
-		   with a single clock output and 1 for nodes with multiple
-		   clock outputs.
+		   with a single clock output and it must be able to be
+		   referenced without index, and 1 for nodes with single or
+		   multiple clock outputs which have to be referenced by index.
+
+		   Please note that if a node with a single clock output
+		   but it has "clock-indices" property (see bellow), it has
+		   to be referenced by index, its "#clock-cells" cannot be
+		   defined 0.
 
 Optional properties:
 clock-output-names: Recommended to be a list of strings of clock output signal
-- 
2.7.4
