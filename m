From: Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH 2/3] usb: add DT bindings for farady fotg2 host controller
Date: Wed,  8 Feb 2017 21:00:09 +0100
Message-ID: <20170208200010.21522-3-ulli.kroll@googlemail.com>
References: <20170208200010.21522-1-ulli.kroll@googlemail.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170208200010.21522-1-ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds DT bindings for the Faraday FOTG2 host controller.

Signed-off-by: Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/fotg2-host.txt | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/fotg2-host.txt

diff --git a/Documentation/devicetree/bindings/usb/fotg2-host.txt b/Documentation/devicetree/bindings/usb/fotg2-host.txt
new file mode 100644
index 000000000000..4c07566a4bf5
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/fotg2-host.txt
@@ -0,0 +1,15 @@
+Faraday FOTG Host controller
+
+Required properties:
+
+- compatible: should be "faraday,fotg210-hcd"
+- reg: should contain one register range i.e. start and length
+- interrupts: description of the interrupt line
+
+Example for Gemini:
+
+usb@68000000 {
+	compatible = "faraday,fotg210-hcd";
+	reg = <0x68000000 0x1000>;
+	interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
+};
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
