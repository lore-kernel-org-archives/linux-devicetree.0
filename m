From: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Subject: [PATCH v2 2/4] dt: bindings: Add bindings for bcm2835-aux-intc
Date: Mon, 12 Jun 2017 15:25:16 +0100
Message-ID: <d097e5d9-0ee6-9ea4-184f-1dd997849892@raspberrypi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-GB
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add bindings documentation for brcm,bcm2835-aux-intc and human-readable
declarations for the BCM2835 AUX IRQs.

Signed-off-by: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
---
 .../interrupt-controller/brcm,bcm2835-aux-intc.txt | 28 ++++++++++++++++++++++
 .../interrupt-controller/bcm2835-aux-intc.h        | 20 ++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-aux-intc.txt
 create mode 100644 include/dt-bindings/interrupt-controller/bcm2835-aux-intc.h

diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-aux-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-aux-intc.txt
new file mode 100644
index 0000000..f3f895c
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-aux-intc.txt
@@ -0,0 +1,28 @@
+BCM2835 Auxiliary ("AUXIRQ") Interrupt Controller
+
+The BCM2835 family of SoCs multiplexes the interrupts for peripherals in
+the AUX block into a single IRQ. The AUXIRQ register shows the IRQ status
+of each of the peripherals. Note that there are no masking or clearing
+facilities - interrupts must be enabled and acknowledged in the
+individual peripherals.
+
+Required properties:
+- compatible :	     Should be "brcm,bcm2835-aux-intc".
+- reg :		     Specifies base physical address and size of the registers.
+- interrupts :	     The interrupt number - see
+		     bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt
+- interrupt-controller : Identifies the node as an interrupt controller
+- #interrupt-cells : Specifies the number of cells needed to encode an
+		     interrupt source. The value shall be 1.
+
+  The cell contains the interrupt specifier, as found in
+  include/dt-bindings/interrupt-controller/bcm2835-aux-intc.h. Valid values
+  are 0..2.
+
+Example:
+
+	auxintc: interrupt-controller@7e215000 {
+		compatible = "brcm,bcm2835-aux-intc";
+		reg = <0x7e215000 0x4>;
+		interrupts = <1 29>;
+		interrupt-controller;
+		#interrupt-cells = <1>;
+	};
diff --git a/include/dt-bindings/interrupt-controller/bcm2835-aux-intc.h b/include/dt-bindings/interrupt-controller/bcm2835-aux-intc.h
new file mode 100644
index 0000000..8b9fc12
--- /dev/null
+++ b/include/dt-bindings/interrupt-controller/bcm2835-aux-intc.h
@@ -0,0 +1,20 @@
+/*
+ * Copyright (C) 2017 Raspberry Pi (Trading) Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#define BCM2835_AUX_IRQ_UART	0
+#define BCM2835_AUX_IRQ_SPI1	1
+#define BCM2835_AUX_IRQ_SPI2	2
+#define BCM2835_AUX_IRQ_COUNT	3
-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
