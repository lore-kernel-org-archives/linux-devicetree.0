From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH 1/2] clk: shmobile: mstp: Update DT bindings to use clock-indices property
Date: Thu, 30 Oct 2014 00:35:32 +0200
Message-ID: <1414622133-27247-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: linux-sh@vger.kernel.org
Cc: devicetree@vger.kernel.org, Mike Turquette <mturquette@linaro.org>
List-Id: devicetree@vger.kernel.org

The renesas,clock-indices property got standardized, replace it with
clock-indices.

The MSTP clock driver supports both the old and new properties.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt         | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

Mike, can you please take this in your tree for v3.19 ?

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt b/Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt
index a5f52238c80d..2e18676bd4b5 100644
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt
@@ -26,11 +26,11 @@ Required Properties:
     must appear in the same order as the output clocks.
   - #clock-cells: Must be 1
   - clock-output-names: The name of the clocks as free-form strings
-  - renesas,clock-indices: Indices of the gate clocks into the group (0 to 31)
+  - clock-indices: Indices of the gate clocks into the group (0 to 31)
 
-The clocks, clock-output-names and renesas,clock-indices properties contain one
-entry per gate clock. The MSTP groups are sparsely populated. Unimplemented
-gate clocks must not be declared.
+The clocks, clock-output-names and clock-indices properties contain one entry
+per gate clock. The MSTP groups are sparsely populated. Unimplemented gate
+clocks must not be declared.
 
 
 Example
-- 
2.0.4

