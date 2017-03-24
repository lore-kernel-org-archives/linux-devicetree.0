From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v3 3/7] arm: dts: dt-bindings: Add Renesas RZ pinctrl header
Date: Fri, 24 Mar 2017 16:22:10 +0100
Message-ID: <1490368934-12494-4-git-send-email-jacopo+renesas@jmondi.org>
References: <1490368934-12494-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1490368934-12494-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-gpio-owner@vger.kernel.org
To: geert+renesas@glider.be, laurent.pinchart@ideasonboard.com, chris.brandt@renesas.com, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add dt-bindings for Renesas r7s72100 pin controller header file.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 include/dt-bindings/pinctrl/r7s72100-pinctrl.h | 36 ++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 include/dt-bindings/pinctrl/r7s72100-pinctrl.h

diff --git a/include/dt-bindings/pinctrl/r7s72100-pinctrl.h b/include/dt-bindings/pinctrl/r7s72100-pinctrl.h
new file mode 100644
index 0000000..170338b
--- /dev/null
+++ b/include/dt-bindings/pinctrl/r7s72100-pinctrl.h
@@ -0,0 +1,36 @@
+/*
+ * Defines macros and constants for Renesas RZ/A1 pin controller pin
+ * muxing functions.
+ */
+#ifndef __DT_BINDINGS_PINCTRL_RENESAS_RZA1_H
+#define __DT_BINDINGS_PINCTRL_RENESAS_RZA1_H
+
+#define RZA1_PINS_PER_PORT	16
+
+/* Create the pin index from its bank and position numbers */
+#define PIN(b, p)		((b) * RZA1_PINS_PER_PORT + (p))
+
+/*
+ * Flags to apply to alternate function configuration
+ * All of the following are mutually exclusive.
+ */
+
+/*
+ * Pin is bi-directional.
+ * An alternate function that needs both input/output functionalities shall
+ * be configured as bidirectional.
+ * Eg. SDA/SCL pins of an I2c interface.
+ */
+#define BI_DIR			(1 << 3)
+
+/*
+ * Flags used to ask software to drive the pin I/O direction overriding the
+ * alternate function configuration.
+ * Some alternate functions require software to force I/O direction of a pin,
+ * overriding the designated one.
+ * Refer to the HW manual to know when this flag shall be used.
+ */
+#define SWIO_IN			(1 << 4)
+#define SWIO_OUT		(1 << 5)
+
+#endif
-- 
2.7.4

