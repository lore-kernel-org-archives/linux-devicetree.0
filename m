Return-Path: <SRS0=5h/M=GT=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH] dt-bindings: irqchip: renesas-irqc: Document r8a77470 support
Date: Thu, 29 Mar 2018 11:17:08 +0100
Message-Id: <1522318628-52821-1-git-send-email-biju.das@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Chris Paterson <chris.paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Renesas RZ/G SoC have the R-Car gen2 compatible IRQC interrupt
controllers. Document RZ/G1C (also known as R8A77470) SoC bindings.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
index 20f121d..1d5891a 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
@@ -7,6 +7,7 @@ Required properties:
     - "renesas,irqc-r8a73a4" (R-Mobile APE6)
     - "renesas,irqc-r8a7743" (RZ/G1M)
     - "renesas,irqc-r8a7745" (RZ/G1E)
+    - "renesas,irqc-r8a77470" (RZ/G1C)
     - "renesas,irqc-r8a7790" (R-Car H2)
     - "renesas,irqc-r8a7791" (R-Car M2-W)
     - "renesas,irqc-r8a7792" (R-Car V2H)
-- 
2.7.4
