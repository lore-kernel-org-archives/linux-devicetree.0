From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/8] [RFC] dt-bindings: renesas: Document R-Car H3 and M3-W SiP DT bindings
Date: Wed, 19 Apr 2017 11:15:44 +0200
Message-ID: <1492593351-13835-2-git-send-email-geert+renesas@glider.be>
References: <1492593351-13835-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1492593351-13835-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Document the SiP ("System-in-Package") versions of the R-Car H3 and M3-W
SoCs, which contain an R-Car H3 or M3-W SoC, RAM, and HyperFlash.

Add their compatible values to all boards equipped with R-Car Gen3 SiPs.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Questions:
  - Do we need more compatible values, for different configurations?
    At least r8j7796 is available with either 2 GiB or 4 GiB of RAM,
    possibly using RAM parts from different vendors.
---
 Documentation/devicetree/bindings/arm/shmobile.txt | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index 170fe0562c637eab..8ca3f64fec21d8b0 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -41,6 +41,14 @@ SoCs:
     compatible = "renesas,r8a7796"
 
 
+SiPs:
+
+  - R-Car H3 SiP (R8J77950)
+    compatible = "renesas,r8j7795", "renesas,r8a7795"
+  - R-Car M3-W SiP (R8J77960)
+    compatible = "renesas,r8j7796", "renesas,r8a7796"
+
+
 Boards:
 
   - Alt (RTP0RC7794SEB00010S)
@@ -58,7 +66,7 @@ Boards:
   - Gose (RTP0RC7793SEB00010S)
     compatible = "renesas,gose", "renesas,r8a7793"
   - H3ULCB (R-Car Starter Kit Premier, RTP0RC7795SKB00010S)
-    compatible = "renesas,h3ulcb", "renesas,r8a7795";
+    compatible = "renesas,h3ulcb", "renesas,r8j7795", "renesas,r8a7795";
   - Henninger
     compatible = "renesas,henninger", "renesas,r8a7791"
   - Koelsch (RTP0RC7791SEB00010S)
@@ -70,7 +78,7 @@ Boards:
   - Lager (RTP0RC7790SEB00010S)
     compatible = "renesas,lager", "renesas,r8a7790"
   - M3ULCB (R-Car Starter Kit Pro, RTP0RC7796SKB00010S)
-    compatible = "renesas,m3ulcb", "renesas,r8a7796";
+    compatible = "renesas,m3ulcb", "renesas,r8j7796", "renesas,r8a7796";
   - Marzen (R0P7779A00010S)
     compatible = "renesas,marzen", "renesas,r8a7779"
   - Porter (M2-LCDP)
@@ -78,9 +86,9 @@ Boards:
   - RSKRZA1 (YR0K77210C000BE)
     compatible = "renesas,rskrza1", "renesas,r7s72100"
   - Salvator-X (RTP0RC7795SIPB0010S)
-    compatible = "renesas,salvator-x", "renesas,r8a7795";
+    compatible = "renesas,salvator-x", "renesas,r8j7795", "renesas,r8a7795";
   - Salvator-X (RTP0RC7796SIPB0011S)
-    compatible = "renesas,salvator-x", "renesas,r8a7796";
+    compatible = "renesas,salvator-x", "renesas,r8j7796", "renesas,r8a7796";
   - SILK (RTP0RC7794LCB00011S)
     compatible = "renesas,silk", "renesas,r8a7794"
   - SK-RZG1E (YR8A77450S000BE)
-- 
2.7.4
