From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/3] pinctrl: lpc1850-scu: document nxp,gpio-pin-interrupt
Date: Sat, 20 Feb 2016 23:51:56 +0100
Message-ID: <1456008716-6236-4-git-send-email-manabian@gmail.com>
References: <1456008716-6236-1-git-send-email-manabian@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456008716-6236-1-git-send-email-manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Update devicetree documention for lpc1850-scu with the new
nxp,gpio-pin-interrupt property.

Signed-off-by: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../devicetree/bindings/pinctrl/nxp,lpc1850-scu.txt        | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/nxp,lpc1850-scu.txt b/Documentation/devicetree/bindings/pinctrl/nxp,lpc1850-scu.txt
index df0309c57505..bd8b0c69fa44 100644
--- a/Documentation/devicetree/bindings/pinctrl/nxp,lpc1850-scu.txt
+++ b/Documentation/devicetree/bindings/pinctrl/nxp,lpc1850-scu.txt
@@ -22,6 +22,10 @@ The following generic nodes are supported:
  - input-schmitt-disable
  - slew-rate
 
+NXP specific properties:
+ - nxp,gpio-pin-interrupt : Assign pin to gpio pin interrupt controller
+			    irq number 0 to 7. See example below.
+
 Not all pins support all properties so either refer to the NXP 1850/4350
 user manual or the pin table in the pinctrl-lpc18xx driver for supported
 pin properties.
@@ -54,4 +58,14 @@ pinctrl: pinctrl@40086000 {
 			bias-disable;
 		};
 	};
+
+	gpio_joystick_pins: gpio-joystick-pins {
+		gpio_joystick_1_cfg {
+			pins =  "p9_0";
+			function = "gpio";
+			nxp,gpio-pin-interrupt = <0>;
+			input-enable;
+			bias-disable;
+		};
+	};
 };
-- 
1.8.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
