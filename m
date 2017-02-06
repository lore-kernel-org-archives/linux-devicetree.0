From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 12/13] dt-bindings: auxdisplay: Add bindings for Hitachi HD44780
Date: Mon,  6 Feb 2017 15:38:14 +0100
Message-ID: <1486391895-9554-13-git-send-email-geert@linux-m68k.org>
References: <1486391895-9554-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1486391895-9554-1-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Willy Tarreau <willy@haproxy.com>, Ksenija Stanojevic <ksenija.stanojevic@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add DT bindings for an Hitachi HD44780 Character LCD Controller where
its M6800 bus interface is connected to GPIOs.

Memory-mapped configurations are not yet supported.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
---
 .../devicetree/bindings/auxdisplay/hit,hd44780.txt | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/auxdisplay/hit,hd44780.txt

diff --git a/Documentation/devicetree/bindings/auxdisplay/hit,hd44780.txt b/Documentation/devicetree/bindings/auxdisplay/hit,hd44780.txt
new file mode 100644
index 0000000000000000..ee4054da458d412f
--- /dev/null
+++ b/Documentation/devicetree/bindings/auxdisplay/hit,hd44780.txt
@@ -0,0 +1,44 @@
+DT bindings for the Hitachi HD44780 Character LCD Controller
+
+The Hitachi HD44780 Character LCD Controller is commonly used on character LCDs
+that can display one or more lines of text. It exposes an M6800 bus interface,
+which can be used in either 4-bit or 8-bit mode.
+
+Required properties:
+  - compatible: Must contain "hit,hd44780",
+  - data-gpios: Must contain an array of either 4 or 8 GPIO specifiers,
+    referring to the GPIO pins connected to the data signal lines DB0-DB7
+    (8-bit mode) or DB4-DB7 (4-bit mode) of the LCD Controller's bus interface,
+  - enable-gpios: Must contain a GPIO specifier, referring to the GPIO pin
+    connected to the "E" (Enable) signal line of the LCD Controller's bus
+    interface,
+  - rs-gpios: Must contain a GPIO specifier, referring to the GPIO pin
+    connected to the "RS" (Register Select) signal line of the LCD Controller's
+    bus interface,
+  - display-height: Height of the display, in character cells,
+  - display-width: Width of the display, in character cells.
+
+Optional properties:
+  - rw-gpios: Must contain a GPIO specifier, referring to the GPIO pin
+    connected to the "RW" (Read/Write) signal line of the LCD Controller's bus
+    interface,
+  - backlight-gpios: Must contain a GPIO specifier, referring to the GPIO pin
+    used for enabling the LCD's backlight,
+  - internal-buffer-width: Internal buffer width (default is 40 for displays
+    with 1 or 2 lines, and display-width for displays with more than 2 lines).
+
+Example:
+
+	auxdisplay {
+		compatible = "hit,hd44780";
+
+		data-gpios = <&hc595 0 GPIO_ACTIVE_HIGH>,
+			     <&hc595 1 GPIO_ACTIVE_HIGH>,
+			     <&hc595 2 GPIO_ACTIVE_HIGH>,
+			     <&hc595 3 GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&hc595 4 GPIO_ACTIVE_HIGH>;
+		rs-gpios = <&hc595 5 GPIO_ACTIVE_HIGH>;
+
+		display-height = <2>;
+		display-width = <16>;
+	};
-- 
1.9.1
