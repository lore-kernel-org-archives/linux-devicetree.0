From: <thloh@altera.com>
Subject: [PATCH v9 1/2] drivers/gpio: Altera soft IP GPIO driver device tree binding
Date: Mon, 5 Jan 2015 18:19:32 -0800
Message-ID: <1420510773-24605-2-git-send-email-thloh@altera.com>
References: <1420510773-24605-1-git-send-email-thloh@altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1420510773-24605-1-git-send-email-thloh@altera.com>
Sender: linux-gpio-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linus.walleij@linaro.org, gnurou@gmail.com, grant.likely@linaro.org, akpm@linux-foundation.org, davem@davemloft.net, gregkh@linuxfoundation.org, joe@perches.com, mchehab@osg.samsung.com, crope@iki.fi, linux-gpio@vger.kernel.org
Cc: thloh.linux@gmail.com, thloh@altera.com
List-Id: devicetree@vger.kernel.org

From: Tien Hock Loh <thloh@altera.com>

Adds a new driver device tree binding for Altera soft GPIO IP

Signed-off-by: Tien Hock Loh <thloh@altera.com>
---
 .../devicetree/bindings/gpio/gpio-altera.txt       | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-altera.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-altera.txt b/Documentation/devicetree/bindings/gpio/gpio-altera.txt
new file mode 100644
index 0000000..0af2f7c
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-altera.txt
@@ -0,0 +1,43 @@
+Altera GPIO controller bindings
+
+Required properties:
+- compatible:
+  - "altr,pio-1.0"
+- reg: Physical base address and length of the controller's registers.
+- #gpio-cells : Should be 2
+  - The first cell is the gpio offset number.
+  - The second cell is reserved and is currently unused.
+- gpio-controller : Marks the device node as a GPIO controller.
+- interrupt-controller: Mark the device node as an interrupt controller
+- #interrupt-cells : Should be 1. The interrupt type is fixed in the hardware.
+  - The first cell is the GPIO offset number within the GPIO controller.
+- interrupts: Specify the interrupt.
+- altr,interrupt-trigger: Specifies the interrupt trigger type the GPIO
+  hardware is synthesized. This field is required if the Altera GPIO controller
+  used has IRQ enabled as the interrupt type is not software controlled,
+  but hardware synthesized. Required if GPIO is used as an interrupt
+  controller. The value is defined in <dt-bindings/interrupt-controller/irq.h>
+  Only the following flags are supported:
+    IRQ_TYPE_EDGE_RISING
+    IRQ_TYPE_EDGE_FALLING
+    IRQ_TYPE_EDGE_BOTH
+    IRQ_TYPE_LEVEL_HIGH
+
+Optional properties:
+- altr,ngpio: Width of the GPIO bank. This defines how many pins the
+  GPIO device has. Ranges between 1-32. Optional and defaults to 32 if not
+  specified.
+
+Example:
+
+gpio_altr: gpio@0xff200000 {
+	compatible = "altr,pio-1.0";
+	reg = <0xff200000 0x10>;
+	interrupts = <0 45 4>;
+	altr,ngpio = <32>;
+	altr,interrupt-trigger = <IRQ_TYPE_EDGE_RISING>;
+	#gpio-cells = <1>;
+	gpio-controller;
+	#interrupt-cells = <1>;
+	interrupt-controller;
+};
-- 
1.7.11.GIT

