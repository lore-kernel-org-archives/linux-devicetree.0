From: Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v4 03/06] devicetree: bindings: r8a73a4 and R-Car Gen2 CMT bindings
Date: Mon, 14 Mar 2016 23:24:13 +0900
Message-ID: <20160314142413.17180.32464.sendpatchset@little-apple>
References: <20160314142342.17180.21352.sendpatchset@little-apple>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160314142342.17180.21352.sendpatchset@little-apple>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be, robh@kernel.org, daniel.lezcano@linaro.org, linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>, tglx@linutronix.de
List-Id: devicetree@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Update SoC-specific bindings for r8a73a4 and R-Car Gen2 CMT0 and CMT1.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Rob Herring <robh@kernel.org>
---

 Changes since V3:
 - Fix trailing whitespace damage

 Changes since V2:
 - Added Acked-by from Rob
 - Removed Tested-by tag from DT binding patch - duh!

 Changes since V1:
 - Added Acked-by and Tested-by from Geert
 - Added Acked-by from Laurent

 Documentation/devicetree/bindings/timer/renesas,cmt.txt |   24 ++++++++-------
 1 file changed, 14 insertions(+), 10 deletions(-)

--- 0003/Documentation/devicetree/bindings/timer/renesas,cmt.txt
+++ work/Documentation/devicetree/bindings/timer/renesas,cmt.txt	2016-03-14 22:47:31.550513000 +0900
@@ -36,19 +36,23 @@ Required Properties:
 		(CMT1 on sh73a0 and r8a7740)
 		This is a fallback for the above renesas,cmt-48-* entries.
 
+    - "renesas,cmt0-r8a73a4" for the 32-bit CMT0 device included in r8a73a4.
+    - "renesas,cmt1-r8a73a4" for the 48-bit CMT1 device included in r8a73a4.
+    - "renesas,cmt0-r8a7790" for the 32-bit CMT0 device included in r8a7790.
+    - "renesas,cmt1-r8a7790" for the 48-bit CMT1 device included in r8a7790.
+    - "renesas,cmt0-r8a7791" for the 32-bit CMT0 device included in r8a7791.
+    - "renesas,cmt1-r8a7791" for the 48-bit CMT1 device included in r8a7791.
+    - "renesas,cmt0-r8a7793" for the 32-bit CMT0 device included in r8a7793.
+    - "renesas,cmt1-r8a7793" for the 48-bit CMT1 device included in r8a7793.
+    - "renesas,cmt0-r8a7794" for the 32-bit CMT0 device included in r8a7794.
+    - "renesas,cmt1-r8a7794" for the 48-bit CMT1 device included in r8a7794.
+
     - "renesas,rcar-gen2-cmt0" for 32-bit CMT0 devices included in R-Car Gen2.
     - "renesas,rcar-gen2-cmt1" for 48-bit CMT1 devices included in R-Car Gen2.
+		These are fallbacks for r8a73a4 and all the R-Car Gen2
+		entries	listed above.
 
-    - "renesas,cmt-48-r8a73a4" for the r8a73a4 48-bit CMT
-		(CMT[01])
-    - "renesas,cmt-48-r8a7790" for the r8a7790 48-bit CMT
-		(CMT[01])
-    - "renesas,cmt-48-r8a7791" for the r8a7791 48-bit CMT
-		(CMT[01])
-    - "renesas,cmt-48-gen2" for all second generation 48-bit CMT
-		(CMT[01] on r8a73a4, r8a7790 and r8a7791)
-		This is a fallback for the renesas,cmt-48-r8a73a4,
-		renesas,cmt-48-r8a7790 and renesas,cmt-48-r8a7791 entries.
+    - "renesas,cmt-48-gen2" is <deprecated>, use "renesas,cmt[01]-*" instead.
 
   - reg: base address and length of the registers block for the timer module.
   - interrupts: interrupt-specifier for the timer, one per channel.
