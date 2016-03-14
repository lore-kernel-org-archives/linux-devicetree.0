From: Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v4 05/06] devicetree: bindings: Remove unused 32-bit CMT bindings
Date: Mon, 14 Mar 2016 23:24:34 +0900
Message-ID: <20160314142434.17180.92245.sendpatchset@little-apple>
References: <20160314142342.17180.21352.sendpatchset@little-apple>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160314142342.17180.21352.sendpatchset@little-apple>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be, robh@kernel.org, daniel.lezcano@linaro.org, linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>, tglx@linutronix.de
List-Id: devicetree@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Remove the 32-bit CMT compat strings to reduce maintenance burden.

It should be fine to break DT compatibility because the 32-bit
32-bit CMT DT binding was never part of any upstream DTS file.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

 Changes since V3:
 - None

 Changes since V2:
 - Added Acked-by from Rob
 - Added Acked-by from Geert

 Changes since V1:
 - New patch

 Documentation/devicetree/bindings/timer/renesas,cmt.txt |   16 ---------------
 1 file changed, 16 deletions(-)

--- 0008/Documentation/devicetree/bindings/timer/renesas,cmt.txt
+++ work/Documentation/devicetree/bindings/timer/renesas,cmt.txt	2016-03-14 22:42:01.190513000 +0900
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
