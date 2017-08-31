From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: [PATCHv4 3/5] dt-bindings: document the CEC GPIO bindings
Date: Thu, 31 Aug 2017 13:01:54 +0200
Message-ID: <20170831110156.11018-4-hverkuil@xs4all.nl>
References: <20170831110156.11018-1-hverkuil@xs4all.nl>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170831110156.11018-1-hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>

Document the bindings for the cec-gpio module for hardware where the
CEC line and optionally the HPD line are connected to GPIO lines.

Signed-off-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
---
 .../devicetree/bindings/media/cec-gpio.txt         | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/cec-gpio.txt

diff --git a/Documentation/devicetree/bindings/media/cec-gpio.txt b/Documentation/devicetree/bindings/media/cec-gpio.txt
new file mode 100644
index 000000000000..db20a7452dbd
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/cec-gpio.txt
@@ -0,0 +1,22 @@
+* HDMI CEC GPIO driver
+
+The HDMI CEC GPIO module supports CEC implementations where the CEC line
+is hooked up to a pull-up GPIO line and - optionally - the HPD line is
+hooked up to another GPIO line.
+
+Required properties:
+  - compatible: value must be "cec-gpio"
+  - cec-gpio: gpio that the CEC line is connected to
+
+Optional property:
+  - hpd-gpio: gpio that the HPD line is connected to
+
+Example for the Raspberry Pi 3 where the CEC line is connected to
+pin 26 aka BCM7 aka CE1 on the GPIO pin header and the HPD line is
+connected to pin 11 aka BCM17:
+
+cec-gpio@7 {
+       compatible = "cec-gpio";
+       cec-gpio = <&gpio 7 GPIO_OPEN_DRAIN>;
+       hpd-gpio = <&gpio 17 GPIO_ACTIVE_HIGH>;
+};
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
