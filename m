From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH v2 11/15] clk: shmobile: r8a7793: document DIV6 clock bindings
Date: Thu, 30 Apr 2015 16:19:00 +0200
Message-ID: <1430403544-26742-12-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1430403544-26742-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1430403544-26742-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: geert@linux-m68k.org, horms@verge.net.au, linux-sh@vger.kernel.org
Cc: magnus.damm@gmail.com, laurent.pinchart+renesas@ideasonboard.com, kuninori.morimoto.gx@renesas.com, linus.walleij@linaro.org, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Acked-by: Simon Horman <horms+renesas@verge.net.au>
Cc: devicetree@vger.kernel.org
---
 Documentation/devicetree/bindings/clock/renesas,cpg-div6-clocks.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-div6-clocks.txt b/Documentation/devicetree/bindings/clock/renesas,cpg-div6-clocks.txt
index 054f65f..b0a3a11 100644
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-div6-clocks.txt
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-div6-clocks.txt
@@ -10,7 +10,8 @@ Required Properties:
     - "renesas,r8a73a4-div6-clock" for R8A73A4 (R-Mobile APE6) DIV6 clocks
     - "renesas,r8a7740-div6-clock" for R8A7740 (R-Mobile A1) DIV6 clocks
     - "renesas,r8a7790-div6-clock" for R8A7790 (R-Car H2) DIV6 clocks
-    - "renesas,r8a7791-div6-clock" for R8A7791 (R-Car M2) DIV6 clocks
+    - "renesas,r8a7791-div6-clock" for R8A7791 (R-Car M2-W) DIV6 clocks
+    - "renesas,r8a7793-div6-clock" for R8A7793 (R-Car M2-N) DIV6 clocks
     - "renesas,sh73a0-div6-clock" for SH73A0 (SH-Mobile AG5) DIV6 clocks
     - "renesas,cpg-div6-clock" for generic DIV6 clocks
   - reg: Base address and length of the memory resource used by the DIV6 clock
-- 
2.3.5

