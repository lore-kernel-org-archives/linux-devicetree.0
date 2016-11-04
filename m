From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 09/11] ARM: shmobile: document SK-RZG1E board
Date: Sat, 05 Nov 2016 01:02:25 +0300
Message-ID: <4775558.KSi1d1GNCP@wasted.cogentembedded.com>
References: <2368353.xfo5beGC5E@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <2368353.xfo5beGC5E@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Document the SK-RZG1E device tree bindings, listing it as a supported board.

This allows to use checkpatch.pl to validate .dts files referring to the
SK-RZG1E board.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

---
Changes in version 2:
- fixed the subject;
- added Geert's tag.

 Documentation/devicetree/bindings/arm/shmobile.txt |    2 ++
 1 file changed, 2 insertions(+)

Index: renesas/Documentation/devicetree/bindings/arm/shmobile.txt
===================================================================
--- renesas.orig/Documentation/devicetree/bindings/arm/shmobile.txt
+++ renesas/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -77,6 +77,8 @@ Boards:
     compatible = "renesas,salvator-x", "renesas,r8a7796";
   - SILK (RTP0RC7794LCB00011S)
     compatible = "renesas,silk", "renesas,r8a7794"
+  - SK-RZG1E (YR8A77450S000BE)
+    compatible = "renesas,sk-rzg1e", "renesas,r8a7745"
   - SK-RZG1M (YR8A77430S000BE)
     compatible = "renesas,sk-rzg1m", "renesas,r8a7743"
   - Wheat
