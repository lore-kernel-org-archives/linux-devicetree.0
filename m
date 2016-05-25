From: Venkat Reddy Talla <vreddytalla-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 2/2] extcon: gpio: add DT binding doc for extcon-gpio
Date: Wed, 25 May 2016 17:05:33 +0530
Message-ID: <1464176133-10742-2-git-send-email-vreddytalla@nvidia.com>
References: <1464176133-10742-1-git-send-email-vreddytalla@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1464176133-10742-1-git-send-email-vreddytalla-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Venkat Reddy Talla <vreddytalla-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Adding DT binding doc for extcon gpio device
properties.

Signed-off-by: Venkat Reddy Talla <vreddytalla-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

---
changes in v2:
- added description for extcon-gpio
- using gpio flag cell to handle gpio active state
- change dts property name gpio to gpios
- removed prefix for debounce
- added description for extcon-gpio,cable-names
---
---
 .../devicetree/bindings/extcon/extcon-gpio.txt     | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/extcon/extcon-gpio.txt

diff --git a/Documentation/devicetree/bindings/extcon/extcon-gpio.txt b/Documentation/devicetree/bindings/extcon/extcon-gpio.txt
new file mode 100644
index 0000000..2302960
--- /dev/null
+++ b/Documentation/devicetree/bindings/extcon/extcon-gpio.txt
@@ -0,0 +1,22 @@
+EXTCON FOR GPIO
+
+extcon-gpio responsible to detect external cable state when
+attached or detached.
+
+Required Properties:
+ - compatible : Should be "extcon-gpio";
+
+Optional Properties:
+ - extcon-gpio,name: Name of extcon device.
+ - gpios: gpio number.
+ - extcon-gpio,irq-flags: IRQ flags for gpio.
+ - debounce-ms: Debounce time in ms.
+ - extcon-gpio,cable-names: The unique id of specific external connector
+	defined in include/linux/extcon.h
+
+extcon-gpio {
+	compatible = "extcon-gpio";
+        extcon-gpio,name = "VBUS";
+	gpios = <&gpio 20 0>;
+	extcon-gpio,cable-names = <EXTCON_USB EXTCON_NONE>;
+};
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
