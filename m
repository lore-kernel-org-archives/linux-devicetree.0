Return-Path: <SRS0=eZkP=MH=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH] dt-bindings: irqchip: renesas-irqc: Document r8a7744 support
Date: Tue, 25 Sep 2018 17:56:34 +0100
Message-Id: <1537894594-54158-1-git-send-email-biju.das@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Document RZ/G1N (R8A7744) SoC bindings.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
---
 Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
index a046ed3..97a8c83 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
@@ -6,6 +6,7 @@ Required properties:
   Examples with soctypes are:
     - "renesas,irqc-r8a73a4" (R-Mobile APE6)
     - "renesas,irqc-r8a7743" (RZ/G1M)
+    - "renesas,irqc-r8a7744" (RZ/G1N)
     - "renesas,irqc-r8a7745" (RZ/G1E)
     - "renesas,irqc-r8a77470" (RZ/G1C)
     - "renesas,irqc-r8a7790" (R-Car H2)
-- 
2.7.4
