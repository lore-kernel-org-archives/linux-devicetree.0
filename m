From: Lukasz Czerwinski <l.czerwinski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 4/4] iio: lps331ap: Add support for DT
Date: Tue, 02 Jul 2013 14:15:38 +0200
Message-ID: <1372767338-13179-5-git-send-email-l.czerwinski@samsung.com>
References: <1372767338-13179-1-git-send-email-l.czerwinski@samsung.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1372767338-13179-1-git-send-email-l.czerwinski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, denis.ciocca-qxv4g6HH51o@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

This patch adds DT support for the lps331ap barometer
sensor.

Signed-off-by: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 .../bindings/iio/pressure/st_pressure.txt          |   41 ++++++++++++++++++++
 drivers/iio/pressure/st_pressure_i2c.c             |    9 +++++
 drivers/iio/pressure/st_pressure_spi.c             |    9 +++++
 3 files changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/pressure/st_pressure.txt

diff --git a/Documentation/devicetree/bindings/iio/pressure/st_pressure.txt b/Documentation/devicetree/bindings/iio/pressure/st_pressure.txt
new file mode 100644
index 0000000..73a4b7d
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/pressure/st_pressure.txt
@@ -0,0 +1,41 @@
+* STMicroelectronics LPS331AP barometer sensor
+
+Required properties:
+
+  - compatible : should be "lps331ap"
+  - reg : the I2C address of the barometer
+
+Optional properties:
+
+  - drdy-int-pin : redirect DRDY on pin INT1 (1) or pin INT2 (2) (u8)
+  - interrupt-parent : phandle to the interrupt map subnode
+  - interrupts : interrupt mapping for LPS331AP interrupt sources:
+		2 sources: 0 - INT1, 1 - INT2
+  - irq-map : irq sub-node defining interrupt map
+	      (all properties listed below are required):
+      - #interrupt-cells : should be 1
+      - #address-cells : should be 0
+      - #size-cells : should be 0
+      - interrupt-map : table of entries consisting of three child elements:
+	  - unit_interrupt_specifier - 0 : INT1, 1 : INT2
+	  - interrupt parent phandle
+	  - parent unit interrupt specifier consisiting of two elements:
+	      - index of the interrupt within the controller
+	      - flags : should be 0
+
+Example:
+
+lps331ap@5d {
+	compatible = "lps331ap";
+	reg = <0x5d>;
+	drdy-int-pin = /bits/ 8 <2>;
+	interrupt-parent = <&irq_map>;
+	interrupts = <0>, <1>;
+
+	irq_map: irq-map {
+		#interrupt-cells = <1>;
+		#address-cells = <0>;
+		#size-cells = <0>;
+		interrupt-map = <0 &gpf0 5 0>;
+	};
+};
diff --git a/drivers/iio/pressure/st_pressure_i2c.c b/drivers/iio/pressure/st_pressure_i2c.c
index 7cebcc7..a1ad3cf 100644
--- a/drivers/iio/pressure/st_pressure_i2c.c
+++ b/drivers/iio/pressure/st_pressure_i2c.c
@@ -61,10 +61,19 @@ static const struct i2c_device_id st_press_id_table[] = {
 };
 MODULE_DEVICE_TABLE(i2c, st_press_id_table);
 
+#ifdef CONFIG_OF
+static const struct of_device_id lps331ap_of_match[] = {
+	{ .compatible = LPS331AP_PRESS_DEV_NAME, },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lps331ap_of_match);
+#endif
+
 static struct i2c_driver st_press_driver = {
 	.driver = {
 		.owner = THIS_MODULE,
 		.name = "st-press-i2c",
+		.of_match_table = of_match_ptr(lps331ap_of_match),
 	},
 	.probe = st_press_i2c_probe,
 	.remove = st_press_i2c_remove,
diff --git a/drivers/iio/pressure/st_pressure_spi.c b/drivers/iio/pressure/st_pressure_spi.c
index 17a1490..e49269d 100644
--- a/drivers/iio/pressure/st_pressure_spi.c
+++ b/drivers/iio/pressure/st_pressure_spi.c
@@ -60,10 +60,19 @@ static const struct spi_device_id st_press_id_table[] = {
 };
 MODULE_DEVICE_TABLE(spi, st_press_id_table);
 
+#ifdef CONFIG_OF
+static const struct of_device_id lps331ap_of_match[] = {
+	{ .compatible = LPS331AP_PRESS_DEV_NAME, },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lps331ap_of_match);
+#endif
+
 static struct spi_driver st_press_driver = {
 	.driver = {
 		.owner = THIS_MODULE,
 		.name = "st-press-spi",
+		.of_match_table = of_match_ptr(lps331ap_of_match),
 	},
 	.probe = st_press_spi_probe,
 	.remove = st_press_spi_remove,
-- 
1.7.9.5
