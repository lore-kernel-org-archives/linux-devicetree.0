From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v6 3/8] arm: dts: dt-bindings: Add Renesas RZ/A1 pinctrl header
Date: Thu, 22 Jun 2017 16:54:31 +0200
Message-ID: <1498143276-7976-4-git-send-email-jacopo+renesas@jmondi.org>
References: <1498143276-7976-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1498143276-7976-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, geert+renesas@glider.be, laurent.pinchart@ideasonboard.com, chris.brandt@renesas.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, aisheng.dong@nxp.com
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add dt-bindings for Renesas r7s72100 pin controller header file.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 include/dt-bindings/pinctrl/r7s72100-pinctrl.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 include/dt-bindings/pinctrl/r7s72100-pinctrl.h

diff --git a/include/dt-bindings/pinctrl/r7s72100-pinctrl.h b/include/dt-bindings/pinctrl/r7s72100-pinctrl.h
new file mode 100644
index 0000000..6b609fe
--- /dev/null
+++ b/include/dt-bindings/pinctrl/r7s72100-pinctrl.h
@@ -0,0 +1,16 @@
+/*
+ * Defines macros and constants for Renesas RZ/A1 pin controller pin
+ * muxing functions.
+ */
+#ifndef __DT_BINDINGS_PINCTRL_RENESAS_RZA1_H
+#define __DT_BINDINGS_PINCTRL_RENESAS_RZA1_H
+
+#define RZA1_PINS_PER_PORT	16
+
+/*
+ * Create the pin index from its bank and position numbers and store in
+ * the upper 16 bits the alternate function identifier
+ */
+#define RZA1_PINMUX(b, p, f)	((b) * RZA1_PINS_PER_PORT + (p) | (f << 16))
+
+#endif /* __DT_BINDINGS_PINCTRL_RENESAS_RZA1_H */
-- 
2.7.4
