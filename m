Return-Path: <SRS0=QSCE=RW=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH RESEND] dt-bindings: irqchip: renesas-irqc: Document r8a774c0 support
Date: Tue, 19 Mar 2019 11:02:01 +0000
Message-Id: <1552993321-19646-1-git-send-email-fabrizio.castro@bp.renesas.com>
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jason Cooper <jason@lakedaemon.net>, Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Document RZ/G2E (R8A774C0) SoC bindings.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Hello Marc,

I am resending this patch as per our discussion on here:
https://patchwork.kernel.org/patch/10729743/

Thanks,
Fab

 Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
index 8de96a4..f977ea7 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
@@ -16,6 +16,7 @@ Required properties:
     - "renesas,irqc-r8a7793" (R-Car M2-N)
     - "renesas,irqc-r8a7794" (R-Car E2)
     - "renesas,intc-ex-r8a774a1" (RZ/G2M)
+    - "renesas,intc-ex-r8a774c0" (RZ/G2E)
     - "renesas,intc-ex-r8a7795" (R-Car H3)
     - "renesas,intc-ex-r8a7796" (R-Car M3-W)
     - "renesas,intc-ex-r8a77965" (R-Car M3-N)
-- 
2.7.4
