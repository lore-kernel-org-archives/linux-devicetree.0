From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 10/20] Documentation: dt: iio: Add binding for LSM303DLH - Magn
Date: Mon, 16 Sep 2013 17:02:16 +0100
Message-ID: <1379347346-823-11-git-send-email-lee.jones@linaro.org>
References: <1379347346-823-1-git-send-email-lee.jones@linaro.org>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379347346-823-1-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org
Cc: arnd-r2nGTMty4D4@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, denis.ciocca-qxv4g6HH51o@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

LSM303DLH is a Magnetometer Sensor

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../bindings/iio/magnetometer/lsm303dlhc.txt        | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/magnetometer/lsm303dlhc.txt

diff --git a/Documentation/devicetree/bindings/iio/magnetometer/lsm303dlhc.txt b/Documentation/devicetree/bindings/iio/magnetometer/lsm303dlhc.txt
new file mode 100644
index 0000000..2ad49c7
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/magnetometer/lsm303dlhc.txt
@@ -0,0 +1,21 @@
+* STMicroelectronics Magnetometer Sensor
+
+Required properties:
+  - compatible: Should be "st,lsm303dlhc_magn"
+  - reg: The I2C address of the sensor
+
+Optional properties:
+  - vdd-supply: Phandle to the Vdd supply regulator
+  - vddio-supply: Phandle to the Vdd-IO supply regulator
+
+Example:
+
+i2c@80128000 {
+	lsm303dlhc_magn@1e {
+		compatible = "st,lsm303dlhc_magn";
+		reg = <0x1e>;
+
+		vdd-supply = <&ab8500_ldo_aux1_reg>;
+		vddio-supply = <&db8500_vsmps2_reg>;
+	};
+};
-- 
1.8.1.2
