From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: [PATCH] dt-bindings/gpio: Add Aspeed GPIO bindings header
Date: Mon, 31 Oct 2016 15:15:50 +1030
Message-ID: <20161031044550.1784-1-joel@jms.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org
List-Id: devicetree@vger.kernel.org

This provides constants for using GPIOs in the device tree on Aspeed
SoCs.

Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
---
The Apseed GPIO driver and binding document went upstream in 4.9, but we forgot
to send this patch as part of the series.

 include/dt-bindings/gpio/aspeed-gpio.h | 47 ++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 include/dt-bindings/gpio/aspeed-gpio.h

diff --git a/include/dt-bindings/gpio/aspeed-gpio.h b/include/dt-bindings/gpio/aspeed-gpio.h
new file mode 100644
index 000000000000..058c527cbcaf
--- /dev/null
+++ b/include/dt-bindings/gpio/aspeed-gpio.h
@@ -0,0 +1,47 @@
+/*
+ * This header provides constants for binding aspeed,*-gpio.
+ *
+ * The first cell in Aspeed's GPIO specifier is the GPIO ID. The macros below
+ * provide names for this.
+ *
+ * The second cell contains standard flag values specified in gpio.h.
+ */
+
+#ifndef _DT_BINDINGS_GPIO_ASPEED_GPIO_H
+#define _DT_BINDINGS_GPIO_ASPEED_GPIO_H
+
+#include <dt-bindings/gpio/gpio.h>
+
+#define ASPEED_GPIO_PORT_A 0
+#define ASPEED_GPIO_PORT_B 1
+#define ASPEED_GPIO_PORT_C 2
+#define ASPEED_GPIO_PORT_D 3
+#define ASPEED_GPIO_PORT_E 4
+#define ASPEED_GPIO_PORT_F 5
+#define ASPEED_GPIO_PORT_G 6
+#define ASPEED_GPIO_PORT_H 7
+#define ASPEED_GPIO_PORT_I 8
+#define ASPEED_GPIO_PORT_J 9
+#define ASPEED_GPIO_PORT_K 10
+#define ASPEED_GPIO_PORT_L 11
+#define ASPEED_GPIO_PORT_M 12
+#define ASPEED_GPIO_PORT_N 13
+#define ASPEED_GPIO_PORT_O 14
+#define ASPEED_GPIO_PORT_P 15
+#define ASPEED_GPIO_PORT_Q 16
+#define ASPEED_GPIO_PORT_R 17
+#define ASPEED_GPIO_PORT_S 18
+#define ASPEED_GPIO_PORT_T 19
+#define ASPEED_GPIO_PORT_U 20
+#define ASPEED_GPIO_PORT_V 21
+#define ASPEED_GPIO_PORT_W 22
+#define ASPEED_GPIO_PORT_X 23
+#define ASPEED_GPIO_PORT_Y 24
+#define ASPEED_GPIO_PORT_Z 25
+#define ASPEED_GPIO_PORT_AA 26
+#define ASPEED_GPIO_PORT_BB 27
+
+#define ASPEED_GPIO(port, offset) \
+	((ASPEED_GPIO_PORT_##port * 8) + offset)
+
+#endif
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
