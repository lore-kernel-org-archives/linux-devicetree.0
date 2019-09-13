From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH v2 2/5] dt-bindings: Document brcm,irq-can-wake for brcm,bcm7038-l1-intc.txt
Date: Fri, 13 Sep 2019 12:15:39 -0700
Message-ID: <20190913191542.9908-3-f.fainelli@gmail.com>
References: <20190913191542.9908-1-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190913191542.9908-1-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Cernekee <cernekee@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:BROADCOM BMIPS MIPS
        ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, "open list:BROADCOM BMIPS MIPS ARCHITECTURE" <linux-mips@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

The BCM7038 L1 interrupt controller can be used as a wake-up interrupt
controller on MIPS and ARM-based systems, document the brcm,irq-can-wake
which has been "standardized" across Broadcom interrupt controllers.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 .../bindings/interrupt-controller/brcm,bcm7038-l1-intc.txt   | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm7038-l1-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm7038-l1-intc.txt
index 2117d4ac1ae5..4eb043270f5b 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm7038-l1-intc.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm7038-l1-intc.txt
@@ -31,6 +31,11 @@ Required properties:
 - interrupts: specifies the interrupt line(s) in the interrupt-parent controller
   node; valid values depend on the type of parent interrupt controller
 
+Optional properties:
+
+- brcm,irq-can-wake: If present, this means the L1 controller can be used as a
+  wakeup source for system suspend/resume.
+
 If multiple reg ranges and interrupt-parent entries are present on an SMP
 system, the driver will allow IRQ SMP affinity to be set up through the
 /proc/irq/ interface.  In the simplest possible configuration, only one
-- 
2.17.1
