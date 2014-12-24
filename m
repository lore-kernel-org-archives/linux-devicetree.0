From: <thloh-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v8 1/2] drivers/gpio: Altera soft IP GPIO driver device tree binding
Date: Wed, 24 Dec 2014 00:22:24 -0800
Message-ID: <1419409345-8297-2-git-send-email-thloh@altera.com>
References: <1419409345-8297-1-git-send-email-thloh@altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1419409345-8297-1-git-send-email-thloh-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Antti Palosaari <crope-X3B1VOXEql0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, Tien Hock Loh <thloh-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Tien Hock Loh <thloh-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>

Adds a new driver device tree binding for Altera soft GPIO IP

Signed-off-by: Tien Hock Loh <thloh-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
---
 .../devicetree/bindings/gpio/gpio-altera.txt       |   43 ++++++++++++++++++++
 1 files changed, 43 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-altera.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-altera.txt b/Documentation/devicetree/bindings/gpio/gpio-altera.txt
new file mode 100644
index 0000000..649fa02
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
+  GPIO device has. Ranges between 1-32. Optional and defaults to 32 is not
+  specified.
+
+Example:
+
+gpio_altr: gpio@0xff200000 {
+	compatible = "altr,pio-1.0";
+	reg = <0xff200000 0x10>;
+	interrupts = <0 45 4>;
+	altr,ngpio = <32>;
+	altr,interrupt_trigger = <IRQ_TYPE_EDGE_RISING>;
+	#gpio-cells = <1>;
+	gpio-controller;
+	#interrupt-cells = <1>;
+	interrupt-controller;
+};
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
