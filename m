From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: Update R-Car Gen3 ULCB board part numbers
Date: Thu,  1 Jun 2017 12:34:29 +0200
Message-ID: <1496313269-27795-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Vladimir Barinov <vladimir.barinov@cogentembedded.com>, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

The board part numbers for the R-Car H3 and M3 ULCB boards corresponded
to versions predating mass production.  Update them for mass production.

Note that the H3 ULCB board can be equipped with either revision ES1.1
or ES2.0 of the R-Car H3 SoC.  While these have different board part
numbers, no new compatible values are needed, as the revision can be
detected at runtime using the PRR register.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
See also http://elinux.org/index.php?title=R-Car/Boards/H3SK

 Documentation/devicetree/bindings/arm/shmobile.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index 4b60ce21f4f3af5f..c80a0fd05d753a90 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -59,7 +59,8 @@ Boards:
     compatible = "renesas,gr-peach", "renesas,r7s72100"
   - Gose (RTP0RC7793SEB00010S)
     compatible = "renesas,gose", "renesas,r8a7793"
-  - H3ULCB (R-Car Starter Kit Premier, RTP0RC7795SKB00010S)
+  - H3ULCB (R-Car Starter Kit Premier, RTP0RC7795SKBX0010SA00 (H3 ES1.1))
+    H3ULCB (R-Car Starter Kit Premier, RTP0RC77951SKBX010SA00 (H3 ES2.0))
     compatible = "renesas,h3ulcb", "renesas,r8a7795";
   - Henninger
     compatible = "renesas,henninger", "renesas,r8a7791"
@@ -71,7 +72,7 @@ Boards:
     compatible = "renesas,kzm9g", "renesas,sh73a0"
   - Lager (RTP0RC7790SEB00010S)
     compatible = "renesas,lager", "renesas,r8a7790"
-  - M3ULCB (R-Car Starter Kit Pro, RTP0RC7796SKB00010S)
+  - M3ULCB (R-Car Starter Kit Pro, RTP0RC7796SKBX0010SA09 (M3 ES1.0))
     compatible = "renesas,m3ulcb", "renesas,r8a7796";
   - Marzen (R0P7779A00010S)
     compatible = "renesas,marzen", "renesas,r8a7779"
-- 
2.7.4
