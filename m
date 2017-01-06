From: David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 1/3] dt-bindings: gpio: Add binding documentation for gpio-thunderx
Date: Fri,  6 Jan 2017 15:22:58 -0800
Message-ID: <1483744980-25898-2-git-send-email-ddaney.cavm@gmail.com>
References: <1483744980-25898-1-git-send-email-ddaney.cavm@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1483744980-25898-1-git-send-email-ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>

Signed-off-by: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
