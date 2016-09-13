From: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH] iio: dt-bindings: add documentation for Light&Proximity sensor STK331x
Date: Tue, 13 Sep 2016 17:27:02 +0800
Message-ID: <1473758822-17955-1-git-send-email-andy.yan@rock-chips.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: knaack.h-Mmb7MZpHnFY@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add the device tree binding documentation for Light & Proximity sensor
STK331X from Sensortek

Signed-off-by: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---

 .../devicetree/bindings/iio/light/stk3310.txt       | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/light/stk3310.txt

diff --git a/Documentation/devicetree/bindings/iio/light/stk3310.txt b/Documentation/devicetree/bindings/iio/light/stk3310.txt
new file mode 100644
index 0000000..d697118
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/light/stk3310.txt
@@ -0,0 +1,21 @@
+* Sensortek STK331X I2C Light&Proximity sensor
+
+Required properties:
+- compatible: should be "sensortek,STK3310" or "sensortek,STK3311"
+- reg: the I2C address of the device
+- interrupt-parent: phandle to the parent interrupt controller
+- interrupts: interrupt mapping for GPIO IRQ
+
+Example:
+	&i2c1 {
+		/* ... */
+
+		stk3310@48 {
+			compatible = "sensortek,STK3310";
+			reg = <0x48>;
+			interrupt-parent = <&gpio1>;
+			interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
+		};
+
+		/* ... */
+	};
-- 
2.7.4
