From: Manivannan Sadhasivam <manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/2] dt-bindings: iio: temperature: Add bindings for TSYS01 temperature sensor
Date: Tue, 13 Jun 2017 21:23:13 +0530
Message-ID: <1497369193-32538-1-git-send-email-manivannan.sadhasivam@linaro.org>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, william.markezana-ya7vCgA9bt58UrSeD/g0lQ@public.gmane.org, ludovic.tancerel-sbt5i+FMW2pmsedzY7GhzwC/G2K4zDHf@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Manivannan Sadhasivam <manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add device tree bindings for Measurement Specialties TSYS01 temperature sensor

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/iio/temperature/tsys01.txt    | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/temperature/tsys01.txt

diff --git a/Documentation/devicetree/bindings/iio/temperature/tsys01.txt b/Documentation/devicetree/bindings/iio/temperature/tsys01.txt
new file mode 100644
index 0000000..0d5cc55
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/temperature/tsys01.txt
@@ -0,0 +1,19 @@
+* TSYS01 - Measurement Specialties temperature sensor
+
+Required properties:
+
+	- compatible: should be "meas,tsys01"
+	- reg: I2C address of the sensor (changeable via CSB pin)
+
+		------------------------
+		| CSB | Device Address |
+		------------------------
+		   1         0x76
+		   0	     0x77
+
+Example:
+
+tsys01@76 {
+	compatible = "meas,tsys01";
+	reg = <0x76>;
+};
-- 
2.7.4
