From: Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org>
Subject: [PATCH] hwmon: (max6650.c) Add devicetree support documentation
Date: Tue, 16 Aug 2016 09:23:10 +0200
Message-ID: <1471332190-14638-1-git-send-email-mike.looijmans@topic.nl>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: hjk-vqZO0P4V72/QD6PfKP4TzA@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds the devicetree binding documentation for the max6650 fan
controller.

Signed-off-by: Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org>
---
Associated code changes sent as a separate patch as requested.

 .../devicetree/bindings/hwmon/max6650.txt          | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/max6650.txt

diff --git a/Documentation/devicetree/bindings/hwmon/max6650.txt b/Documentation/devicetree/bindings/hwmon/max6650.txt
new file mode 100644
index 0000000..2e46e69
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/max6650.txt
@@ -0,0 +1,23 @@
+Bindings for MAX6651 and MAX6650 I2C fan controllers
+
+Reference:
+[1]	https://datasheets.maximintegrated.com/en/ds/MAX6650-MAX6651.pdf
+
+Required properties:
+- compatible : One of "maxim,max6650" or "maxim,max6651"
+- reg        : I2C address, one of 0x1b, 0x1f, 0x4b, 0x48.
+
+Optional properties, default is to retain the chip's current setting:
+- maxim,fan-microvolt : The supply voltage of the fan, sets the ADC range to
+			either 5V or 12V. Max value 13500000.
+- maxim,fan-prescale  : Pre-scaling value, as per datasheet [1]. Lower values
+			allow more fine-grained control of slower fans.
+			Valid: 1, 2, 4, 8, 16.
+
+Example:
+	fan-max6650: max6650@1b {
+		reg = <0x1b>;
+		compatible = "maxim,max6650";
+		maxim,fan-microvolt = <12000000>;
+		maxim,fan-prescale = <4>;
+	};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
