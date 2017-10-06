From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: irqchip: renesas-irqc: Document R-Car M3-W, V3M, D3 support
Date: Fri,  6 Oct 2017 13:51:32 +0200
Message-ID: <1507290692-23062-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Document support for the Interrupt Controller for Externel Devices
(INTC-EX) in the Renesas M3-W (r8a7796), V3M (r8a77970), and D3
(r8a77995) SoCs.

No driver update is needed.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/interrupt-controller/renesas,irqc.txt          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
index e3f052d8c11a24c3..33c9a10fdc91a1dc 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
@@ -13,6 +13,9 @@ Required properties:
     - "renesas,irqc-r8a7793" (R-Car M2-N)
     - "renesas,irqc-r8a7794" (R-Car E2)
     - "renesas,intc-ex-r8a7795" (R-Car H3)
+    - "renesas,intc-ex-r8a7796" (R-Car M3-W)
+    - "renesas,intc-ex-r8a77970" (R-Car V3M)
+    - "renesas,intc-ex-r8a77995" (R-Car D3)
 - #interrupt-cells: has to be <2>: an interrupt index and flags, as defined in
   interrupts.txt in this directory
 - clocks: Must contain a reference to the functional clock.
-- 
2.7.4
