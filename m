From: =?UTF-8?q?Gordan=20Marku=C5=A1?= <gordan.markus-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3] 2/2] input: keyboard: Add lm8333 devicetree bindings
Date: Thu, 29 Jun 2017 10:18:55 +0200
Message-ID: <20170629081855.16034-4-gordan.markus@gmail.com>
References: <20170629081855.16034-3-gordan.markus@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170629081855.16034-3-gordan.markus-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: =?UTF-8?q?Gordan=20Marku=C5=A1?= <gordan.markus-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds LM8333 devicetree bindings documentation.

Signed-off-by: Gordan Markuš <gordan.markus-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../devicetree/bindings/input/ti,lm8333.txt        | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/ti,lm8333.txt

diff --git a/Documentation/devicetree/bindings/input/ti,lm8333.txt b/Documentation/devicetree/bindings/input/ti,lm8333.txt
new file mode 100644
index 0000000..dda01e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/ti,lm8333.txt
@@ -0,0 +1,45 @@
+LM8333 Keypad
+
+Required properties:
+- compatible: Compatible property value should be "ti,lm8333".
+
+- reg: Physical base address of the peripheral and length of memory mapped
+  region.
+
+- interrupts: The interrupt number for the peripheral.
+
+- linux,keymap: The keymap to use
+	(see Documentation/devicetree/bindings/input/matrix-keymap.txt)
+
+Optional properties:
+- ti,active-time-ms: Specify the time during which the keypad is scanned after
+	the last key is released, before entering Halt mode.
+	The active time must be longer than the debounce time.
+	Default 500 ms.
+
+- debounce-delay-ms: Specify the keypad debounce time.
+	This can be used for reliable scanning of keyboards with noisy contacts.
+	Default 10 ms.
+
+Example:
+input {
+	compatible = "ti,lm8333";
+	reg = <0x51>;
+	interrupts = <5>;
+
+	ti,active-time-ms = <750>;
+	debounce-delay-ms = <20>;
+
+	linux,keymap = <
+			0x0001001e
+			0x00020030
+			0x0003002e
+			0x00040020
+			0x00050012
+			0x00060021
+			0x00070022
+			0x00080023
+			0x01010017
+			0x01020024
+			0x01030025>;
+};
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
