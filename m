From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 05/13] DT: clock: rcar-gen2-cpg-clocks: document R8A7792 support
Date: Wed, 01 Jun 2016 01:20:11 +0300
Message-ID: <4688920.9Ektl04hDh@wasted.cogentembedded.com>
References: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Renesas R8A7792 SoC is a member of the R-Car gen2 family and so has CPG...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 Documentation/devicetree/bindings/clock/renesas,rcar-gen2-cpg-clocks.txt |    1 +
 1 file changed, 1 insertion(+)

Index: renesas/Documentation/devicetree/bindings/clock/renesas,rcar-gen2-cpg-clocks.txt
===================================================================
--- renesas.orig/Documentation/devicetree/bindings/clock/renesas,rcar-gen2-cpg-clocks.txt
+++ renesas/Documentation/devicetree/bindings/clock/renesas,rcar-gen2-cpg-clocks.txt
@@ -10,6 +10,7 @@ Required Properties:
   - compatible: Must be one of
     - "renesas,r8a7790-cpg-clocks" for the r8a7790 CPG
     - "renesas,r8a7791-cpg-clocks" for the r8a7791 CPG
+    - "renesas,r8a7792-cpg-clocks" for the r8a7792 CPG
     - "renesas,r8a7793-cpg-clocks" for the r8a7793 CPG
     - "renesas,r8a7794-cpg-clocks" for the r8a7794 CPG
     and "renesas,rcar-gen2-cpg-clocks" as a fallback.
