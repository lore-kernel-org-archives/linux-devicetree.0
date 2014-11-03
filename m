From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH v6 2/2] clk: shmobile: document DIV6 clock parent bindings
Date: Mon,  3 Nov 2014 17:01:36 +0100
Message-ID: <1415030496-26054-3-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1415030496-26054-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1415030496-26054-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: horms@verge.net.au, mturquette@linaro.org, geert@linux-m68k.org, laurent.pinchart+renesas@ideasonboard.com
Cc: linux-sh@vger.kernel.org, magnus.damm@gmail.com, devicetree@vger.kernel.org, mark.rutland@arm.com, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
List-Id: devicetree@vger.kernel.org

Describes how to specify the parents for clocks with EXSRC bits.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 .../bindings/clock/renesas,cpg-div6-clocks.txt        | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-div6-clocks.txt b/Documentation/devicetree/bindings/clock/renesas,cpg-div6-clocks.txt
index 952e373..750550ca 100644
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-div6-clocks.txt
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-div6-clocks.txt
@@ -7,11 +7,17 @@ to 64.
 Required Properties:
 
   - compatible: Must be one of the following
+    - "renesas,r8a73a4-div6-clock" for R8A73A4 (R-Mobile APE6) DIV6 clocks
+    - "renesas,r8a7740-div6-clock" for R8A7740 (R-Mobile A1) DIV6 clocks
     - "renesas,r8a7790-div6-clock" for R8A7790 (R-Car H2) DIV6 clocks
     - "renesas,r8a7791-div6-clock" for R8A7791 (R-Car M2) DIV6 clocks
+    - "renesas,sh73a0-div6-clock" for SH73A0 (SH-Mobile AG5) DIV6 clocks
     - "renesas,cpg-div6-clock" for generic DIV6 clocks
   - reg: Base address and length of the memory resource used by the DIV6 clock
-  - clocks: Reference to the parent clock
+  - clocks: Reference to the parent clock(s); if there are multiple parent
+    clocks, one must be specified for each possible parent clock setting
+    in the clock register. Invalid settings must be specified as "<0>".
+    Trailing invalid settings may be omitted.
   - #clock-cells: Must be 0
   - clock-output-names: The name of the clock as a free-form string
 
@@ -19,10 +25,11 @@ Required Properties:
 Example
 -------
 
-	sd2_clk: sd2_clk@e6150078 {
-		compatible = "renesas,r8a7790-div6-clock", "renesas,cpg-div6-clock";
-		reg = <0 0xe6150078 0 4>;
-		clocks = <&pll1_div2_clk>;
+	sdhi2_clk: sdhi2_clk@e615007c {
+		compatible = "renesas,r8a73a4-div6-clock", "renesas,cpg-div6-clock";
+		reg = <0 0xe615007c 0 4>;
+		clocks = <&pll1_div2_clk>, <&cpg_clocks R8A73A4_CLK_PLL2S>,
+			 <0>, <&extal2_clk>;
 		#clock-cells = <0>;
-		clock-output-names = "sd2";
+		clock-output-names = "sdhi2ck";
 	};
-- 
1.8.4.5

