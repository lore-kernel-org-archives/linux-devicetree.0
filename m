From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 7/9] devicetree: bindings: Remove unused 32-bit CMT bindings
Date: Tue, 29 Aug 2017 11:34:25 +0200
Message-ID: <1503999271-15712-7-git-send-email-daniel.lezcano@linaro.org>
References: <20170829093354.GA2572@mai>
 <1503999271-15712-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1503999271-15712-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, Magnus Damm <damm+renesas@opensource.se>, Rob Herring <robh@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Remove the 32-bit CMT compat strings to reduce maintenance burden.

It should be fine to break DT compatibility because the 32-bit
CMT DT binding was never part of any upstream DTS file.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 Documentation/devicetree/bindings/timer/renesas,cmt.txt | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/renesas,cmt.txt b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
index 8fb7c93..d79293a 100644
--- a/Documentation/devicetree/bindings/timer/renesas,cmt.txt
+++ b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
@@ -12,22 +12,6 @@ datasheets.
 Required Properties:
 
   - compatible: must contain one or more of the following:
-    - "renesas,cmt-32-r8a7740" for the r8a7740 32-bit CMT
-		(CMT0)
-    - "renesas,cmt-32-sh73a0" for the sh73a0 32-bit CMT
-		(CMT0)
-    - "renesas,cmt-32" for all 32-bit CMT without fast clock support
-		(CMT0 on sh73a0 and r8a7740)
-		This is a fallback for the above renesas,cmt-32-* entries.
-
-    - "renesas,cmt-32-fast-r8a7740" for the r8a7740 32-bit CMT with fast
-		clock support (CMT[234])
-    - "renesas,cmt-32-fast-sh73a0" for the sh73A0 32-bit CMT with fast
-		clock support (CMT[234])
-    - "renesas,cmt-32-fast" for all 32-bit CMT with fast clock support
-		(CMT[234] on sh73a0 and r8a7740)
-		This is a fallback for the above renesas,cmt-32-fast-* entries.
-
     - "renesas,cmt-48-sh73a0" for the sh73A0 48-bit CMT
 		(CMT1)
     - "renesas,cmt-48-r8a7740" for the r8a7740 48-bit CMT
-- 
2.7.4
