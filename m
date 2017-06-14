From: Phil Elwell <phil@raspberrypi.org>
Subject: [PATCH v3 2/4] dt: bindings: Add bindings for bcm2835-aux-intc
Date: Wed, 14 Jun 2017 17:29:08 +0100
Message-ID: <1497457750-35585-3-git-send-email-phil@raspberrypi.org>
References: <4ceb6c92-f752-180e-6a6e-a94dcd120737@raspberrypi.org>
 <1497457750-35585-1-git-send-email-phil@raspberrypi.org>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1497457750-35585-1-git-send-email-phil@raspberrypi.org>
Sender: linux-clk-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Stefan Wahren <stefan.wahren@i2se.com>, Eric Anholt <eric@anholt.net>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Cc: Phil Elwell <phil@raspberrypi.org>
List-Id: devicetree@vger.kernel.org

Add bindings documentation for brcm,bcm2835-aux-intc and human-readable
declarations for the BCM2835 AUX IRQs.

Signed-off-by: Phil Elwell <phil@raspberrypi.org>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
---
 .../interrupt-controller/brcm,bcm2835-aux-intc.txt | 27 ++++++++++++++++++++++
 .../interrupt-controller/bcm2835-aux-intc.h        | 20 ++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-aux-intc.txt
 create mode 100644 include/dt-bindings/interrupt-controller/bcm2835-aux-intc.h

diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-aux-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-aux-intc.txt
new file mode 100644
index 0000000..9cbbab6
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-aux-intc.txt
@@ -0,0 +1,27 @@
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
+  include/dt-bindings/interrupt-controller/bcm2835-aux-intc.h.
+
+Example:
+
+	auxintc: interrupt-controller@7e215000 {
+		compatible = "brcm,bcm2835-aux-intc";
+		reg = <0x7e215000 0x4>;
+		interrupts = <1 29>;
+		interrupt-controller;
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

