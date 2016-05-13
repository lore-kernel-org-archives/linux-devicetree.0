From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V12 1/2] gpio: add DT binding doc for gpio of PMIC max77620/max20024
Date: Fri, 13 May 2016 10:49:12 +0530
Message-ID: <1463116755-30469-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Maxim Semiconductor's PMIC MAX77620/MAX20024 has 8 GPIO pins
which act as GPIO as well as special function mode.

Add DT binding document to support these pins in GPIO
mode via GPIO framework.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

---
This as part of the max77620 series and mfd patch are already applied.
This can go in subsystem branch.

Changes from V4:
- Separate out from gpio driver

Changes from V5/V6/V7:
- None

Changes from V8:
- Collected Linus ack.

Changes from V9i/V10:
None
---
 .../devicetree/bindings/gpio/gpio-max77620.txt     | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-max77620.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-max77620.txt b/Documentation/devicetree/bindings/gpio/gpio-max77620.txt
new file mode 100644
index 0000000..410e716
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-max77620.txt
@@ -0,0 +1,25 @@
+GPIO driver for MAX77620 Power management IC from Maxim Semiconductor.
+
+Device has 8 GPIO pins which can be configured as GPIO as well as the
+special IO functions.
+
+Required properties:
+-------------------
+- gpio-controller : 	Marks the device node as a gpio controller.
+- #gpio-cells : 	Should be two.  The first cell is the pin number and
+			the second cell is used to specify the gpio polarity:
+				0 = active high
+				1 = active low
+For more details, please refer generic GPIO DT binding document
+<devicetree/bindings/gpio/gpio.txt>.
+
+Example:
+--------
+#include <dt-bindings/mfd/max77620.h>
+...
+max77620@3c {
+	compatible = "maxim,max77620";
+
+	gpio-controller;
+	#gpio-cells = <2>;
+};
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
