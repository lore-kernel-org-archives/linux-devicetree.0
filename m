From: Gregory Fong <gregory.0xf0@gmail.com>
Subject: [PATCH v4 1/4] dt-bindings: brcmstb-gpio: document properties for wakeup
Date: Fri, 31 Jul 2015 18:17:42 -0700
Message-ID: <1438391865-7862-2-git-send-email-gregory.0xf0@gmail.com>
References: <1438391865-7862-1-git-send-email-gregory.0xf0@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438391865-7862-1-git-send-email-gregory.0xf0@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Gregory Fong <gregory.0xf0@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Brian Norris <computersforpeace@gmail.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>
List-Id: devicetree@vger.kernel.org

Some brcmstb GPIO controllers can be used to wake from suspend, so use
the de facto standard property 'wakeup-source' to mark the nodes of
controllers with that capability.

Also document interrupts-extended, which will be used for wakeup
handling because the interrupt parent for the wake IRQ is different
from the regular IRQ.

While we're at it, a few more fixes: We don't actually use the
"interrupt-names" property, so remove it from the listed optional
properties and from the examples.  And since we're modifying the
examples, also follow Brian's suggestions to:
- change #gpio-cells, #interrupt-cells, and brcm,gpio-bank-widths from
  hex to dec
- use phandles

Reviewed-by: Brian Norris <computersforpeace@gmail.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Gregory Fong <gregory.0xf0@gmail.com>
---
v4: no changes from v3

 .../devicetree/bindings/gpio/brcm,brcmstb-gpio.txt | 35 +++++++++++++++++-----
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.txt b/Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.txt
index 435f1bc..b405b44 100644
--- a/Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.txt
@@ -33,6 +33,13 @@ Optional properties:
 - interrupt-parent:
     phandle of the parent interrupt controller
 
+- interrupts-extended:
+    Alternate form of specifying interrupts and parents that allows for
+    multiple parents.  This takes precedence over 'interrupts' and
+    'interrupt-parent'.  Wakeup-capable GPIO controllers often route their
+    wakeup interrupt lines through a different interrupt controller than the
+    primary interrupt line, making this property necessary.
+
 - #interrupt-cells:
     Should be <2>.  The first cell is the GPIO number, the second should specify
     flags.  The following subset of flags is supported:
@@ -47,19 +54,33 @@ Optional properties:
 - interrupt-controller:
     Marks the device node as an interrupt controller
 
-- interrupt-names:
-    The name of the IRQ resource used by this controller
+- wakeup-source:
+    GPIOs for this controller can be used as a wakeup source
 
 Example:
 	upg_gio: gpio@f040a700 {
-		#gpio-cells = <0x2>;
-		#interrupt-cells = <0x2>;
+		#gpio-cells = <2>;
+		#interrupt-cells = <2>;
 		compatible = "brcm,bcm7445-gpio", "brcm,brcmstb-gpio";
 		gpio-controller;
 		interrupt-controller;
 		reg = <0xf040a700 0x80>;
-		interrupt-parent = <0xf>;
+		interrupt-parent = <&irq0_intc>;
+		interrupts = <0x6>;
+		brcm,gpio-bank-widths = <32 32 32 24>;
+	};
+
+	upg_gio_aon: gpio@f04172c0 {
+		#gpio-cells = <2>;
+		#interrupt-cells = <2>;
+		compatible = "brcm,bcm7445-gpio", "brcm,brcmstb-gpio";
+		gpio-controller;
+		interrupt-controller;
+		reg = <0xf04172c0 0x40>;
+		interrupt-parent = <&irq0_aon_intc>;
 		interrupts = <0x6>;
-		interrupt-names = "upg_gio";
-		brcm,gpio-bank-widths = <0x20 0x20 0x20 0x18>;
+		interrupts-extended = <&irq0_aon_intc 0x6>,
+			<&aon_pm_l2_intc 0x5>;
+		wakeup-source;
+		brcm,gpio-bank-widths = <18 4>;
 	};
-- 
1.9.1
