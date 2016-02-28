From: Adam Baker <linux-u8Lxuz9p/S1csCcyGdaD/Q@public.gmane.org>
Subject: [PATCH v3 1/3] hwmon: Define binding for the nsa320-hwmon driver
Date: Sun, 28 Feb 2016 22:30:12 +0000
Message-ID: <1456698614-15176-2-git-send-email-linux@baker-net.org.uk>
References: <1456698614-15176-1-git-send-email-linux@baker-net.org.uk>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456698614-15176-1-git-send-email-linux-u8Lxuz9p/S1csCcyGdaD/Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org, carl.wolfgang-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org, Adam Baker <linux-u8Lxuz9p/S1csCcyGdaD/Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Define a binding for the hardware monitoring chip present in the Zyxel
NSA-320 and some of the other Zyxel NAS devices.

Signed-off-by: Adam Baker <linux-u8Lxuz9p/S1csCcyGdaD/Q@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
Changes for v3, Add Robs Ack
---
 .../devicetree/bindings/hwmon/nsa320-mcu.txt        | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/nsa320-mcu.txt

diff --git a/Documentation/devicetree/bindings/hwmon/nsa320-mcu.txt b/Documentation/devicetree/bindings/hwmon/nsa320-mcu.txt
new file mode 100644
index 0000000..7b346d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/nsa320-mcu.txt
@@ -0,0 +1,21 @@
+Bindings for the fan / temperature monitor microcontroller used on
+the Zyxel NSA 320 and several subsequent models.
+
+Required properties:
+- compatible	: "zyxel,nsa320-mcu"
+- data-gpios	: The GPIO pin connected to the data line on the MCU
+- clk-gpios	: The GPIO pin connected to the clock line on the MCU
+- act-gpios	: The GPIO pin connected to the active line on the MCU
+
+Example:
+
+	hwmon {
+		compatible = "zyxel,nsa320-mcu";
+		pinctrl-0 = <&pmx_mcu_data &pmx_mcu_clk &pmx_mcu_act>;
+		pinctrl-names = "default";
+
+		data-gpios = <&gpio0 14 GPIO_ACTIVE_HIGH>;
+		clk-gpios = <&gpio0 16 GPIO_ACTIVE_HIGH>;
+		act-gpios = <&gpio0 17 GPIO_ACTIVE_LOW>;
+	};
+
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
