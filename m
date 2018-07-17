Return-Path: <SRS0=u8po=KB=cogentembedded.com=sergei.shtylyov@kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] DT: irqchip: renesas-irqc: document R8A77980 support
Message-ID: <71e2be51-5699-1b26-c2a1-fca7897817d1@cogentembedded.com>
Date: Tue, 17 Jul 2018 22:23:17 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>
Cc: linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Document R-Car V3H (AKA R8A77980) SoC bindings.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt |    1 +
 1 file changed, 1 insertion(+)

Index: renesas/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
===================================================================
--- renesas.orig/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
+++ renesas/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
@@ -16,6 +16,7 @@ Required properties:
     - "renesas,intc-ex-r8a7796" (R-Car M3-W)
     - "renesas,intc-ex-r8a77965" (R-Car M3-N)
     - "renesas,intc-ex-r8a77970" (R-Car V3M)
+    - "renesas,intc-ex-r8a77980" (R-Car V3H)
     - "renesas,intc-ex-r8a77995" (R-Car D3)
 - #interrupt-cells: has to be <2>: an interrupt index and flags, as defined in
   interrupts.txt in this directory
