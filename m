From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 1/2] clk: renesas: rcar-gen2: document R8A7792 support
Date: Fri, 03 Jun 2016 23:58:03 +0300
Message-ID: <4065352.p9EIad1BPG@wasted.cogentembedded.com>
References: <2432690.FBaBKRolRm@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <2432690.FBaBKRolRm@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: mturquette@baylibre.com, linux-clk@vger.kernel.org, sboyd@codeaurora.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Renesas R8A7792 SoC is a member of the R-Car gen2 family and so has CPG...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Acked-by: Simon Horman <horms+renesas@verge.net.au>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Rob Herring <robh@kernel.org>

---
Changes in version 2:
- added Simon's, Geert's, and Rob's ACKs;
- renamed the patch.

 Documentation/devicetree/bindings/clock/renesas,rcar-gen2-cpg-clocks.txt |    1 +
 1 file changed, 1 insertion(+)

Index: linux/Documentation/devicetree/bindings/clock/renesas,rcar-gen2-cpg-clocks.txt
===================================================================
--- linux.orig/Documentation/devicetree/bindings/clock/renesas,rcar-gen2-cpg-clocks.txt
+++ linux/Documentation/devicetree/bindings/clock/renesas,rcar-gen2-cpg-clocks.txt
@@ -10,6 +10,7 @@ Required Properties:
   - compatible: Must be one of
     - "renesas,r8a7790-cpg-clocks" for the r8a7790 CPG
     - "renesas,r8a7791-cpg-clocks" for the r8a7791 CPG
+    - "renesas,r8a7792-cpg-clocks" for the r8a7792 CPG
     - "renesas,r8a7793-cpg-clocks" for the r8a7793 CPG
     - "renesas,r8a7794-cpg-clocks" for the r8a7794 CPG
     and "renesas,rcar-gen2-cpg-clocks" as a fallback.
