Return-Path: <SRS0=eZkP=MH=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH] dt-bindings: timer: renesas, cmt: Document r8a7744 CMT support
Date: Tue, 25 Sep 2018 18:18:16 +0100
Message-Id: <1537895896-25734-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Document SoC specific compatible strings for r8a7744. No driver change
is needed as the fallback strings will activate the right code.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
---
 Documentation/devicetree/bindings/timer/renesas,cmt.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/renesas,cmt.txt b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
index b40add2..0a89586 100644
--- a/Documentation/devicetree/bindings/timer/renesas,cmt.txt
+++ b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
@@ -24,6 +24,8 @@ Required Properties:
     - "renesas,r8a73a4-cmt1" for the 48-bit CMT1 device included in r8a73a4.
     - "renesas,r8a7743-cmt0" for the 32-bit CMT0 device included in r8a7743.
     - "renesas,r8a7743-cmt1" for the 48-bit CMT1 device included in r8a7743.
+    - "renesas,r8a7744-cmt0" for the 32-bit CMT0 device included in r8a7744.
+    - "renesas,r8a7744-cmt1" for the 48-bit CMT1 device included in r8a7744.
     - "renesas,r8a7745-cmt0" for the 32-bit CMT0 device included in r8a7745.
     - "renesas,r8a7745-cmt1" for the 48-bit CMT1 device included in r8a7745.
     - "renesas,r8a7790-cmt0" for the 32-bit CMT0 device included in r8a7790.
-- 
2.7.4
