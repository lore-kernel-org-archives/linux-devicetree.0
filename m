From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 5/9] devicetree: bindings: r8a73a4 and R-Car Gen2 CMT bindings
Date: Tue, 29 Aug 2017 11:34:23 +0200
Message-ID: <1503999271-15712-5-git-send-email-daniel.lezcano@linaro.org>
References: <20170829093354.GA2572@mai>
 <1503999271-15712-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1503999271-15712-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, Magnus Damm <damm+renesas@opensource.se>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Update SoC-specific bindings for r8a73a4 and R-Car Gen2 CMT0 and CMT1.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 .../devicetree/bindings/timer/renesas,cmt.txt      | 24 +++++++++++++---------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/renesas,cmt.txt b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
index 2583aeb..e81e0d2 100644
--- a/Documentation/devicetree/bindings/timer/renesas,cmt.txt
+++ b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
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
-- 
2.7.4
