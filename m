From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 09/20] Documentation: dt: iio: Add binding for L3G4200D
Date: Mon, 16 Sep 2013 17:02:15 +0100
Message-ID: <1379347346-823-10-git-send-email-lee.jones@linaro.org>
References: <1379347346-823-1-git-send-email-lee.jones@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1379347346-823-1-git-send-email-lee.jones@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, jic23@cam.ac.uk
Cc: arnd@arndb.de, linus.walleij@linaro.org, denis.ciocca@st.com, linux-iio@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

L3G4200D is a Gyroscope Sensor

Cc: devicetree@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 .../devicetree/bindings/iio/gyro/l3g4200d.txt       | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/gyro/l3g4200d.txt

diff --git a/Documentation/devicetree/bindings/iio/gyro/l3g4200d.txt b/Documentation/devicetree/bindings/iio/gyro/l3g4200d.txt
new file mode 100644
index 0000000..3ca2b9c
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/gyro/l3g4200d.txt
@@ -0,0 +1,21 @@
+* STMicroelectronics Gyroscope Sensor
+
+Required properties:
+  - compatible: Should be "st,l3g4200d"
+  - reg: The I2C address of the sensor
+
+Optional properties:
+  - vdd-supply: Phandle to the Vdd supply regulator
+  - vddio-supply: Phandle to the Vdd-IO supply regulator
+
+Example:
+
+i2c@80128000 {
+	l3g4200d@68 {
+		compatible = "st,l3g4200d";
+		reg = <0x68>;
+
+		vdd-supply = <&ab8500_ldo_aux1_reg>;
+		vddio-supply = <&db8500_vsmps2_reg>;
+	};
+};
-- 
1.8.1.2
