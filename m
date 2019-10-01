From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 2/7] dt-bindings: interrupt-controller: Add brcm,bcm7211-armctrl-ic binding
Date: Tue,  1 Oct 2019 15:48:37 -0700
Message-ID: <20191001224842.9382-3-f.fainelli@gmail.com>
References: <20191001224842.9382-1-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191001224842.9382-1-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, "maintainer:BROADCOM
        BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:BROADCOM BCM2835
        ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, "moderated list:BROADCOM BCM2835
        ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

BCM7211 features a second level interrupt controller similar in nature
to BCM2836, with a few modifications to the register offsets, document
that specific compatible string.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 .../interrupt-controller/brcm,bcm2835-armctrl-ic.txt        | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt
index 0f1af5a1c12e..0b07845b46e4 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt
@@ -12,7 +12,8 @@ interrupt there indicates that the ARMCTRL has an interrupt to handle.
 Required properties:
 
 - compatible : should be "brcm,bcm2835-armctrl-ic" or
-                 "brcm,bcm2836-armctrl-ic"
+                 "brcm,bcm2836-armctrl-ic" or
+		 "brcm,bcm7211-armctrl-ic"
 - reg : Specifies base physical address and size of the registers.
 - interrupt-controller : Identifies the node as an interrupt controller
 - #interrupt-cells : Specifies the number of cells needed to encode an
@@ -25,7 +26,8 @@ Required properties:
   The 2nd cell contains the interrupt number within the bank. Valid values
   are 0..7 for bank 0, and 0..31 for bank 1.
 
-Additional required properties for brcm,bcm2836-armctrl-ic:
+Additional required properties for brcm,bcm2836-armctrl-ic and
+brcm,bcm7211-armctrl-ic:
 - interrupts : Specifies the interrupt on the parent for this interrupt
   controller to handle.
 
-- 
2.17.1
