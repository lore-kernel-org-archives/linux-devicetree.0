From: David Daney <david.daney@cavium.com>
Subject: [PATCH v6 4/6] dt-bindings: gpio: Add binding documentation for gpio-thunderx
Date: Tue, 11 Apr 2017 10:21:07 -0700
Message-ID: <1491931269-15650-5-git-send-email-david.daney@cavium.com>
References: <1491931269-15650-1-git-send-email-david.daney@cavium.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1491931269-15650-1-git-send-email-david.daney@cavium.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: David Daney <david.daney@cavium.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/gpio/gpio-thunderx.txt     | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-thunderx.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-thunderx.txt b/Documentation/devicetree/bindings/gpio/gpio-thunderx.txt
new file mode 100644
index 0000000..3f883ae
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-thunderx.txt
@@ -0,0 +1,27 @@
+Cavium ThunderX/OCTEON-TX GPIO controller bindings
+
+Required Properties:
+- reg: The controller bus address.
+- gpio-controller: Marks the device node as a GPIO controller.
+- #gpio-cells: Must be 2.
+  - First cell is the GPIO pin number relative to the controller.
+  - Second cell is a standard generic flag bitfield as described in gpio.txt.
+
+Optional Properties:
+- compatible: "cavium,thunder-8890-gpio", unused as PCI driver binding is used.
+- interrupt-controller: Marks the device node as an interrupt controller.
+- #interrupt-cells: Must be present and have value of 2 if
+                    "interrupt-controller" is present.
+  - First cell is the GPIO pin number relative to the controller.
+  - Second cell is triggering flags as defined in interrupts.txt.
+
+Example:
+
+gpio_6_0: gpio@6,0 {
+	compatible = "cavium,thunder-8890-gpio";
+	reg = <0x3000 0 0 0 0>; /*  DEVFN = 0x30 (6:0) */
+	gpio-controller;
+	#gpio-cells = <2>;
+	interrupt-controller;
+	#interrupt-cells = <2>;
+};
-- 
1.8.3.1
