From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/5] pinctrl: Add DT bindings for Cortina Gemini
Date: Sat, 15 Jul 2017 19:50:52 +0200
Message-ID: <20170715175056.13040-1-linus.walleij@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Janos Laube <janos.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paulius Zaleckas <paulius.zaleckas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The Cortina Gemini pin controller uses the standard pin control
bindings for muxing functions with groups so these bindings
should be entirely uncontroversial.

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../bindings/pinctrl/cortina,gemini-pinctrl.txt    | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/cortina,gemini-pinctrl.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/cortina,gemini-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/cortina,gemini-pinctrl.txt
new file mode 100644
index 000000000000..2ef3e8a65559
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/cortina,gemini-pinctrl.txt
@@ -0,0 +1,54 @@
+Cortina Systems Gemini pin controller
+
+This pin controller is found in the Cortina Systems Gemini SoC family,
+see further arm/gemini.txt. It is a purely group-based multiplexing pin
+controller.
+
+Required properties:
+- compatible: "cortina,gemini-pinctrl"
+- regmap: phandle to the system controller node
+
+Subnodes of the pin controller contain pin control multiplexing set-up.
+Please refer to pinctrl-bindings.txt for generic pin multiplexing nodes.
+
+Example:
+
+pinctrl {
+	compatible = "cortina,gemini-pinctrl";
+	regmap = <&syscon>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&dram_default_pins>, <&system_default_pins>,
+		    <&vcontrol_default_pins>;
+
+	dram_default_pins: pinctrl-dram {
+		mux {
+			function = "dram";
+			groups = "dramgrp";
+		};
+	};
+	rtc_default_pins: pinctrl-rtc {
+		mux {
+			function = "rtc";
+			groups = "rtcgrp";
+		};
+	};
+	power_default_pins: pinctrl-power {
+		mux {
+			function = "power";
+			groups = "powergrp";
+		};
+	};
+	system_default_pins: pinctrl-system {
+		mux {
+			function = "system";
+			groups = "systemgrp";
+		};
+	};
+	(...)
+	uart_default_pins: pinctrl-uart {
+		mux {
+			function = "uart";
+			groups = "uartrxtxgrp";
+		};
+	};
+};
-- 
2.9.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
