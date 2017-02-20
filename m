From: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 3/7] arm: dts: dt-bindings: Add Renesas RZ pinctrl header
Date: Mon, 20 Feb 2017 18:13:04 +0100
Message-ID: <1487610788-6939-4-git-send-email-jacopo+renesas@jmondi.org>
References: <1487610788-6939-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1487610788-6939-1-git-send-email-jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add dt-bindings for Renesas r7s72100 pin controller header file.

Signed-off-by: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
---
 include/dt-bindings/pinctrl/r7s72100-pinctrl.h | 30 ++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 include/dt-bindings/pinctrl/r7s72100-pinctrl.h

diff --git a/include/dt-bindings/pinctrl/r7s72100-pinctrl.h b/include/dt-bindings/pinctrl/r7s72100-pinctrl.h
new file mode 100644
index 0000000..24759bf
--- /dev/null
+++ b/include/dt-bindings/pinctrl/r7s72100-pinctrl.h
@@ -0,0 +1,30 @@
+/*
+ * Defines macros and constants for Renesas RZ/A1 pin controller pin
+ * muxing functions.
+ */
+#ifndef __DT_BINDINGS_PINCTRL_RENESAS_RZA1_H
+#define __DT_BINDINGS_PINCTRL_RENESAS_RZA1_H
+
+#define RZA1_PINS_PER_PORT	16
+
+/* Create the pin index from it's bank and position numbers */
+#define PIN(b, p)		((b) * RZA1_PINS_PER_PORT + (p))
+
+/* Flags to apply to alternate function configuration */
+/*
+ * Pin needs input buffer enabled.
+ * This applies to pin which alternate function requires input capabilities.
+ * Eg: RX pin on a serial interface needs this flag to be set.
+ */
+#define INPUT_EN		(1 << 3)
+
+/*
+ * Let software drive the pin I/O direction overriding the alternate function
+ * configuration.
+ * Some alternate function requires software to force I/O direction of a pin,
+ * ovverriding the designated one.
+ * Reference to the HW manual to know when this flag shall be used.
+ */
+#define SWIO			(1 << 4)
+
+#endif
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
