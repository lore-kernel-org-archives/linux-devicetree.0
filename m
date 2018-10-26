Return-Path: <SRS0=NOhz=NG=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH] dt-bindings: timer: renesas, cmt: Document r8a7796 CMT support
Date: Fri, 26 Oct 2018 09:01:44 +0100
Message-Id: <1540540904-26131-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Document SoC specific bindings for R-Car M3-W (r8a7796) SoC.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
This patch is tested against linu-next
---
 Documentation/devicetree/bindings/timer/renesas,cmt.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/renesas,cmt.txt b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
index 3399267..6de27b6 100644
--- a/Documentation/devicetree/bindings/timer/renesas,cmt.txt
+++ b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
@@ -36,6 +36,8 @@ Required Properties:
     - "renesas,r8a7793-cmt1" for the 48-bit CMT1 device included in r8a7793.
     - "renesas,r8a7794-cmt0" for the 32-bit CMT0 device included in r8a7794.
     - "renesas,r8a7794-cmt1" for the 48-bit CMT1 device included in r8a7794.
+    - "renesas,r8a7796-cmt0" for the 32-bit CMT0 device included in r8a7796.
+    - "renesas,r8a7796-cmt1" for the 48-bit CMT1 device included in r8a7796.
     - "renesas,r8a77970-cmt0" for the 32-bit CMT0 device included in r8a77970.
     - "renesas,r8a77970-cmt1" for the 48-bit CMT1 device included in r8a77970.
     - "renesas,r8a77980-cmt0" for the 32-bit CMT0 device included in r8a77980.
-- 
2.7.4
