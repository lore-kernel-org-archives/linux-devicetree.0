From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] ARM: shmobile: fix SILK board name
Date: Sat, 03 Oct 2015 00:53:38 +0300
Message-ID: <6818713.ulHphNVRsJ@wasted.cogentembedded.com>
References: <201404250239.39150.sergei.shtylyov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <201404250239.39150.sergei.shtylyov@cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
Cc: linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Unfortunately, the SILK board bindings were not quite correct, as the  board
name should be all caps.  Fix that,  adding the board model #  in parens and
removing stray semicolon.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 Documentation/devicetree/bindings/arm/shmobile.txt |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Index: renesas/Documentation/devicetree/bindings/arm/shmobile.txt
===================================================================
--- renesas.orig/Documentation/devicetree/bindings/arm/shmobile.txt
+++ renesas/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -57,5 +57,5 @@ Boards:
     compatible = "renesas,marzen", "renesas,r8a7779"
   - Porter (M2-LCDP)
     compatible = "renesas,porter", "renesas,r8a7791"
-  - Silk
-    compatible = "renesas,silk", "renesas,r8a7794";
+  - SILK (RTP0RC7794LCB00011S)
+    compatible = "renesas,silk", "renesas,r8a7794"

