From: <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: [RFC 1/8] dt-bindings: mfd: Add Altera Arria10 System Resource Chip bindings
Date: Tue, 29 Mar 2016 14:13:04 -0500
Message-ID: <1459278791-3646-2-git-send-email-tthayer@opensource.altera.com>
References: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1459278791-3646-1-git-send-email-tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jdelvare-IBi9RG/b67k@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawell.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>

The Altera Arria10 Devkit System Resource chip is a Multi-Function
Device, it has two subdevices:
     - GPIO
     - HWMON

This patch adds documentation for the Altera A10-SR DT bindings.

Signed-off-by: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
---
 .../devicetree/bindings/mfd/altera-a10sr.txt       |   35 ++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/altera-a10sr.txt

diff --git a/Documentation/devicetree/bindings/mfd/altera-a10sr.txt b/Documentation/devicetree/bindings/mfd/altera-a10sr.txt
new file mode 100644
index 0000000..564c761
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/altera-a10sr.txt
@@ -0,0 +1,35 @@
+* Altera Arria10 Development Kit System Resource Chip
+
+Required parent device properties:
+- compatible : "altr,altr_a10sr"
+- spi-max-frequency : Maximum SPI frequency.
+- reg : the SPI Chip Select address for the Arria10 System Resource chip
+
+The A10SR consists of this varied group of sub-devices:
+
+Device                   Description
+------                   ----------
+altr_a10sr_gpio          GPIO Controller
+altr_a10sr_hwmon         Hardware Monitor
+
+The LEDs are implemented entirely in the device tree using
+the gpio-led framework.
+
+Example:
+
+        a10-sr: a10-sr@0 {
+		compatible = "altr,altr-a10sr";
+		reg = <0>;
+		spi-max-frequency = <100000>;
+
+		a10sr_gpio: a10sr_gpio {
+			compatible = "altr,a10sr-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			ngpios = <16>;
+		};
+
+		a10sr_hwmon: a10sr_hwmon {
+			compatible = "altr,a10sr-hwmon";
+		};
+	};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
