From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/4] clk: renesas: cpg-mssr: Document r8a7796 support
Date: Mon, 30 May 2016 18:28:54 +0200
Message-ID: <1464625737-6646-2-git-send-email-geert+renesas@glider.be>
References: <1464625737-6646-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1464625737-6646-1-git-send-email-geert+renesas@glider.be>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <damm+renesas@opensource.se>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Rob Herring <robh@kernel.org>
Tested-by: Simon Horman <horms+renesas@verge.net.au>
---
v2:
  - Add Acked-by, Tested-by.
---
 Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
index fefb8023020f1a54..394d725ac7e0baa3 100644
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
@@ -13,7 +13,8 @@ They provide the following functionalities:
 
 Required Properties:
   - compatible: Must be one of:
-      - "renesas,r8a7795-cpg-mssr" for the r8a7795 SoC
+      - "renesas,r8a7795-cpg-mssr" for the r8a7795 SoC (R-Car H3)
+      - "renesas,r8a7796-cpg-mssr" for the r8a7796 SoC (R-Car M3-W)
 
   - reg: Base address and length of the memory resource used by the CPG/MSSR
     block
@@ -21,8 +22,8 @@ Required Properties:
   - clocks: References to external parent clocks, one entry for each entry in
     clock-names
   - clock-names: List of external parent clock names. Valid names are:
-      - "extal" (r8a7795)
-      - "extalr" (r8a7795)
+      - "extal" (r8a7795, r8a7796)
+      - "extalr" (r8a7795, r8a7796)
 
   - #clock-cells: Must be 2
       - For CPG core clocks, the two clock specifier cells must be "CPG_CORE"
-- 
1.9.1

