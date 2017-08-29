From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 3/9] devicetree: bindings: Remove sh7372 CMT binding
Date: Tue, 29 Aug 2017 11:34:21 +0200
Message-ID: <1503999271-15712-3-git-send-email-daniel.lezcano@linaro.org>
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

Remove the sh7372 CMT compat string to reduce maintenance burden.

It should be fine to break DT compatibility because:
1) The sh7372 SoC support has been removed from upstream
2) The sh7372 CMT DT binding was never part of upstream DTS
3) The CMT driver never matches on the sh7372 binding

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 Documentation/devicetree/bindings/timer/renesas,cmt.txt | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/renesas,cmt.txt b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
index 1a05c1b..961c0b6 100644
--- a/Documentation/devicetree/bindings/timer/renesas,cmt.txt
+++ b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
@@ -14,32 +14,26 @@ Required Properties:
   - compatible: must contain one or more of the following:
     - "renesas,cmt-32-r8a7740" for the r8a7740 32-bit CMT
 		(CMT0)
-    - "renesas,cmt-32-sh7372" for the sh7372 32-bit CMT
-		(CMT0)
     - "renesas,cmt-32-sh73a0" for the sh73a0 32-bit CMT
 		(CMT0)
     - "renesas,cmt-32" for all 32-bit CMT without fast clock support
-		(CMT0 on sh7372, sh73a0 and r8a7740)
+		(CMT0 on sh73a0 and r8a7740)
 		This is a fallback for the above renesas,cmt-32-* entries.
 
     - "renesas,cmt-32-fast-r8a7740" for the r8a7740 32-bit CMT with fast
 		clock support (CMT[234])
-    - "renesas,cmt-32-fast-sh7372" for the sh7372 32-bit CMT with fast
-		clock support (CMT[234])
     - "renesas,cmt-32-fast-sh73a0" for the sh73A0 32-bit CMT with fast
 		clock support (CMT[234])
     - "renesas,cmt-32-fast" for all 32-bit CMT with fast clock support
-		(CMT[234] on sh7372, sh73a0 and r8a7740)
+		(CMT[234] on sh73a0 and r8a7740)
 		This is a fallback for the above renesas,cmt-32-fast-* entries.
 
-    - "renesas,cmt-48-sh7372" for the sh7372 48-bit CMT
-		(CMT1)
     - "renesas,cmt-48-sh73a0" for the sh73A0 48-bit CMT
 		(CMT1)
     - "renesas,cmt-48-r8a7740" for the r8a7740 48-bit CMT
 		(CMT1)
     - "renesas,cmt-48" for all non-second generation 48-bit CMT
-		(CMT1 on sh7372, sh73a0 and r8a7740)
+		(CMT1 on sh73a0 and r8a7740)
 		This is a fallback for the above renesas,cmt-48-* entries.
 
     - "renesas,cmt-48-r8a73a4" for the r8a73a4 48-bit CMT
-- 
2.7.4
