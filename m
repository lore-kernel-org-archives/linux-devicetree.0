From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/3] clk: versatile add DT bindings for the ICST CM variants
Date: Wed, 10 Aug 2016 11:09:32 +0200
Message-ID: <1470820172-12840-1-git-send-email-linus.walleij@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Integrator/AP and Integrator/CP core modules have special
versions of the ICST525 interface hardcoding some bits. Create
special compatible strings to identify these variants, also
explain a bit what is going on.

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/clock/arm-syscon-icst.txt  | 35 ++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/arm-syscon-icst.txt b/Documentation/devicetree/bindings/clock/arm-syscon-icst.txt
index 8b7177cecb36..48886490591a 100644
--- a/Documentation/devicetree/bindings/clock/arm-syscon-icst.txt
+++ b/Documentation/devicetree/bindings/clock/arm-syscon-icst.txt
@@ -5,20 +5,51 @@ Technology (IDT). ARM integrated these oscillators deeply into their
 reference designs by adding special control registers that manage such
 oscillators to their system controllers.
 
-The ARM system controller contains logic to serialize and initialize
+The ARM system controllers contains logic to serialize and initialize
 an ICST clock request after a write to the 32 bit register at an offset
 into the system controller. Furthermore, to even be able to alter one of
 these frequencies, the system controller must first be unlocked by
 writing a special token to another offset in the system controller.
 
+The ARM Integrator/AP and Integrator/CP core modules and baseboard contain
+special versions of the serial interface that only connects the low 8 bits
+of the VDW (missing one bit), hardwires RDW to different values and sometimes
+als hardwire the output divider. They therefore have special compatible
+strings as per this table (the OD value is the value on the pins, not the
+resulting output divider):
+
+Integrator variant:      RDW     OD          VDW
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
