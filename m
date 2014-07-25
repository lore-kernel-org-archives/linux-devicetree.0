From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/6] leds: add device tree bindings for syscon LEDs
Date: Fri, 25 Jul 2014 15:23:44 +0200
Message-ID: <1406294628-16079-3-git-send-email-linus.walleij@linaro.org>
References: <1406294628-16079-1-git-send-email-linus.walleij@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406294628-16079-1-git-send-email-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds the device tree bindings used by syscon-based LEDs.

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>
Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/leds/leds-syscon.txt       | 83 ++++++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-syscon.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-syscon.txt b/Documentation/devicetree/bindings/leds/leds-syscon.txt
new file mode 100644
index 000000000000..460b9c3d1bd3
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-syscon.txt
@@ -0,0 +1,83 @@
+Device Tree Bindings for Syscon LEDs
+
+Required properties:
+- compatible : must be "syscon-leds".
+- regmap : a phandle to a syscon node containing a regmap
+
+Each LED is represented as a sub-node of the syscon-leds device. Each
+node's name represents the name of the corresponding LED.
+
+LED sub-node properties:
+- offset : register offset to the register controlling this LED
+- mask : bit mask for the bit controlling this LED in the register
+  typically 0x01, 0x02, 0x04 ...
+- label : (optional)
+  see Documentation/devicetree/bindings/leds/common.txt
+- linux,default-trigger : (optional)
+  see Documentation/devicetree/bindings/leds/common.txt
+- default-state: (optional) The initial state of the LED. Valid
+  values are "on", "off", and "keep". If the LED is already on or off
+  and the default-state property is set the to same value, then no
+  glitch should be produced where the LED momentarily turns off (or
+  on). The "keep" setting will keep the LED at whatever its current
+  state is, without producing a glitch.  The default is off if this
+  property is not present.
+
+Example:
+
+leds: leds@08 {
+	compatible = "syscon-leds";
+	regmap = <&syscon>;
+
+	led@bit0 {
+		offset = <0x08>;
+		mask = <0x01>;
+		label = "versatile:0";
+		linux,default-trigger = "heartbeat";
+		default-state = "on";
+	};
+	led@bit1 {
+		offset = <0x08>;
+		mask = <0x02>;
+		label = "versatile:1";
+		linux,default-trigger = "mmc0";
+		default-state = "off";
+	};
+	led@bit2 {
+		offset = <0x08>;
+		mask = <0x04>;
+		label = "versatile:2";
+		linux,default-trigger = "cpu0";
+		default-state = "off";
+	};
+	led@bit3 {
+		offset = <0x08>;
+		mask = <0x08>;
+		label = "versatile:3";
+		default-state = "off";
+	};
+	led@bit4 {
+		offset = <0x08>;
+		mask = <0x10>;
+		label = "versatile:4";
+		default-state = "off";
+	};
+	led@bit5 {
+		offset = <0x08>;
+		mask = <0x20>;
+		label = "versatile:5";
+		default-state = "off";
+	};
+	led@bit6 {
+		offset = <0x08>;
+		mask = <0x40>;
+		label = "versatile:6";
+		default-state = "off";
+	};
+	led@bit7 {
+		offset = <0x08>;
+		mask = <0x80>;
+		label = "versatile:7";
+		default-state = "off";
+	};
+};
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
