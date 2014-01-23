From: Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>
Subject: [PATCH] serial: vt8500: Add missing binding document for arch-vt8500 serial driver.
Date: Thu, 23 Jan 2014 19:30:28 +1300
Message-ID: <1390458628-30152-1-git-send-email-linux@prisktech.co.nz>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The binding document for the vt8500/wm8xxx SoC UART driver is missing.
This patch adds the binding document.

Signed-off-by: Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>
---
 .../devicetree/bindings/serial/vt8500-uart.txt     |   26 ++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/vt8500-uart.txt

diff --git a/Documentation/devicetree/bindings/serial/vt8500-uart.txt b/Documentation/devicetree/bindings/serial/vt8500-uart.txt
new file mode 100644
index 0000000..795c393
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/vt8500-uart.txt
@@ -0,0 +1,26 @@
+* VIA VT8500 and WonderMedia WM8xxx UART Controller
+
+Required properties:
+- compatible: should be "via,vt8500-uart"
+
+- reg: base physical address of the controller and length of memory mapped
+	region.
+
+- interrupts: hardware interrupt number
+
+- clocks: shall be the input parent clock phandle for the clock. This should
+	be the 24Mhz reference clock.
+
+Aliases may be defined to ensure the correct ordering of the uarts.
+
+Example:
+	aliases {
+		serial0 = &uart0;
+	};
+
+	uart0: serial@d8200000 {
+		compatible = "via,vt8500-uart";
+		reg = <0xd8200000 0x1040>;
+		interrupts = <32>;
+		clocks = <&clkuart0>;
+	};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
