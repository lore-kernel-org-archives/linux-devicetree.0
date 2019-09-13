From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH v2 4/5] dt-bindings: Document brcm,int-fwd-mask property for bcm7038-l1-intc
Date: Fri, 13 Sep 2019 12:15:41 -0700
Message-ID: <20190913191542.9908-5-f.fainelli@gmail.com>
References: <20190913191542.9908-1-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190913191542.9908-1-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Cernekee <cernekee@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:BROADCOM BMIPS MIPS
        ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, "open list:BROADCOM BMIPS MIPS ARCHITECTURE" <linux-mips@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Indicate that the brcm,int-fwd-mask property is optional and can be
optionaly set on platforms which require to leave specific interrupts
untouched from Linux and retain the firmware configuration.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 .../bindings/interrupt-controller/brcm,bcm7038-l1-intc.txt    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm7038-l1-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm7038-l1-intc.txt
index 4eb043270f5b..31d31af408c5 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm7038-l1-intc.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm7038-l1-intc.txt
@@ -36,6 +36,10 @@ Optional properties:
 - brcm,irq-can-wake: If present, this means the L1 controller can be used as a
   wakeup source for system suspend/resume.
 
+- brcm,int-fwd-mask: if present, a bit mask to indicate which interrupts
+  have already been configured by the firmware and should be left untouched.
+  This should have one 32-bit word per status/set/clear/mask group.
+
 If multiple reg ranges and interrupt-parent entries are present on an SMP
 system, the driver will allow IRQ SMP affinity to be set up through the
 /proc/irq/ interface.  In the simplest possible configuration, only one
-- 
2.17.1
