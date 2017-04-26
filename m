From: Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH 1/9] usb: host: add DT bindings for faraday fotg2
Date: Wed, 26 Apr 2017 21:41:12 +0200
Message-ID: <20170426194120.26304-2-ulli.kroll@googlemail.com>
References: <20170426194120.26304-1-ulli.kroll@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170426194120.26304-1-ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm71jEKWMTb39w@public.gmane.org>
Cc: Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds device tree bindings for the Faraday FOTG2
dual-mode host controller.

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/usb/faraday,fotg210.txt    | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/faraday,fotg210.txt

diff --git a/Documentation/devicetree/bindings/usb/faraday,fotg210.txt b/Documentation/devicetree/bindings/usb/faraday,fotg210.txt
new file mode 100644
index 000000000000..dc2cdaf20d9f
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/faraday,fotg210.txt
@@ -0,0 +1,40 @@
+Faraday FOTG Dual role controller
+
+This OTG-capable host/device mode USB controller is found in Cortina Systems
+Gemini and other SoC products.
+On Gemini currently host mode is used
+
+Required properties:
+- compatible: should be one of:
+  "faraday,fotg210-dr"
+  "cortina,gemini-usb", "faraday,fotg210-dr"
+- reg: should contain one register range i.e. start and length
+- interrupts: description of the interrupt line
+
+Optional properties:
+- clocks: should contain the IP block clock
+- clock-names: should be "PCLK" for the IP block clock
+- dr_mode : indicates the working mode for "faraday,fotg210-dr" compatible
+   controllers.  Can be "host" or "peripheral"
+   Default to "host" if not defined for backward compatibility.
+
+
+Required properties for "cortina,gemini-usb" compatible:
+- syscon: a phandle to the system controller to access PHY registers
+
+Optional properties for "cortina,gemini-usb" compatible:
+- cortina,gemini-mini-b: boolean property that indicates that a Mini-B
+  OTH connector is in use
+- wakeup-source: see power/wakeup-source.txt
+
+Example for Gemini:
+
+usb@68000000 {
+	compatible = "cortina,gemini-usb", "faraday,fotg210-dr";
+	reg = <0x68000000 0x1000>;
+	interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
+	clocks = <&cc 12>;
+	clock-names = "PCLK";
+	syscon = <&syscon>;
+	wakeup-source;
+};
-- 
2.12.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
