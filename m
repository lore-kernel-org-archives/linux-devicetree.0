From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/3 v2] clk: versatile add DT bindings for the ICST CM variants
Date: Mon, 22 Aug 2016 11:19:32 +0200
Message-ID: <1471857574-13125-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>
List-Id: devicetree@vger.kernel.org

The Integrator/AP and Integrator/CP core modules have special
versions of the ICST525 interface hardcoding some bits. Create
special compatible strings to identify these variants, also
explain a bit what is going on.

Cc: devicetree@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Fix spelling mistakes.
- Try to be less specific and more general about the ARM system
  controllers so we do not need to edit the text again for the
  next variant we discover.
---
 .../devicetree/bindings/clock/arm-syscon-icst.txt  | 34 ++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/arm-syscon-icst.txt b/Documentation/devicetree/bindings/clock/arm-syscon-icst.txt
index 8b7177cecb36..27468119fd94 100644
--- a/Documentation/devicetree/bindings/clock/arm-syscon-icst.txt
+++ b/Documentation/devicetree/bindings/clock/arm-syscon-icst.txt
@@ -5,20 +5,50 @@ Technology (IDT). ARM integrated these oscillators deeply into their
 reference designs by adding special control registers that manage such
 oscillators to their system controllers.
 
-The ARM system controller contains logic to serialize and initialize
+The various ARM system controllers contain logic to serialize and initialize
 an ICST clock request after a write to the 32 bit register at an offset
 into the system controller. Furthermore, to even be able to alter one of
 these frequencies, the system controller must first be unlocked by
 writing a special token to another offset in the system controller.
 
+Some ARM hardware contain special versions of the serial interface that only
+connects the low 8 bits of the VDW (missing one bit), hardwires RDW to
+different values and sometimes also hardwire the output divider. They
+therefore have special compatible strings as per this table (the OD value is
+the value on the pins, not the resulting output divider):
+
+Hardware variant:        RDW     OD          VDW
+
+Integrator/AP            22      1           Bit 8 0, rest variable
+integratorap-cm
+
+Integrator/AP            46      3           Bit 8 0, rest variable
+integratorap-sys
+
+Integrator/AP            22 or   1           17 or (33 or 25 MHz)
+integratorap-pci         14      1           14
+
+Integrator/CP            22      variable    Bit 8 0, rest variable
+integratorcp-cm-core
+
+Integrator/CP            22      variable    Bit 8 0, rest variable
+integratorcp-cm-mem
+
 The ICST oscillator must be provided inside a system controller node.
 
 Required properties:
+- compatible: must be one of
+  "arm,syscon-icst525"
+  "arm,syscon-icst307"
+  "arm,syscon-icst525-integratorap-cm"
+  "arm,syscon-icst525-integratorap-sys"
+  "arm,syscon-icst525-integratorap-pci"
+  "arm,syscon-icst525-integratorcp-cm-core"
+  "arm,syscon-icst525-integratorcp-cm-mem"
 - lock-offset: the offset address into the system controller where the
   unlocking register is located
 - vco-offset: the offset address into the system controller where the
   ICST control register is located (even 32 bit address)
-- compatible: must be one of "arm,syscon-icst525" or "arm,syscon-icst307"
 - #clock-cells: must be <0>
 - clocks: parent clock, since the ICST needs a parent clock to derive its
   frequency from, this attribute is compulsory.
-- 
2.7.4

