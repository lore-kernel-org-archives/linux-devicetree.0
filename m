From: Crt Mori <cmo-fc6wVz46lShBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 2/3] dt-bindings: iio: temperature: add MLX90632 device bindings
Date: Mon,  4 Dec 2017 16:31:54 +0100
Message-ID: <20171204153154.26211-1-cmo@melexis.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Crt Mori <cmo-fc6wVz46lShBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add device tree bindings for MLX90632 IR temperature sensor.

Signed-off-by: Crt Mori <cmo-fc6wVz46lShBDgjK7y7TUQ@public.gmane.org>
Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 .../bindings/iio/temperature/mlx90632.txt          | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/temperature/mlx90632.txt

diff --git a/Documentation/devicetree/bindings/iio/temperature/mlx90632.txt b/Documentation/devicetree/bindings/iio/temperature/mlx90632.txt
new file mode 100644
index 000000000000..0b05812001f8
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/temperature/mlx90632.txt
@@ -0,0 +1,28 @@
+* Melexis MLX90632 contactless Infra Red temperature sensor
+
+Link to datasheet: https://www.melexis.com/en/documents/documentation/datasheets/datasheet-mlx90632
+
+There are various applications for the Infra Red contactless temperature sensor
+and MLX90632 is most suitable for consumer applications where measured object
+temperature is in range between -20 to 200 degrees Celsius with relative error
+of measurement below 1 degree Celsius in object temperature range for
+industrial applications. Since it can operate and measure ambient temperature
+in range of -20 to 85 degrees Celsius it is suitable also for outdoor use.
+
+Be aware that electronics surrounding the sensor can increase ambient
+temperature. MLX90632 can be calibrated to reduce the housing effect via
+already existing EEPROM parameters.
+
+Since measured object emissivity effects Infra Red energy emitted, emissivity
+should be set before requesting the object temperature.
+
+Required properties:
+  - compatible: should be "melexis,mlx90632"
+  - reg: the I2C address of the sensor (default 0x3a)
+
+Example:
+
+mlx90632@3a {
+	compatible = "melexis,mlx90632";
+	reg = <0x3a>;
+};
-- 
2.15.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
