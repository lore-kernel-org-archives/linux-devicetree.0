Return-Path: <SRS0=ezLt=RQ=linaro.org=rui.silva@kernel.org>
From: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH v3 1/6] iio: gyro: add DT bindings to fxas21002c
Date: Wed, 13 Mar 2019 18:39:57 +0000
Message-Id: <20190313184002.2501-2-rui.silva@linaro.org>
In-Reply-To: <20190313184002.2501-1-rui.silva@linaro.org>
References: <20190313184002.2501-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>
List-ID: <devicetree@vger.kernel.org>

Add device tree bindings for the FXAS21002C gyroscope.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 .../bindings/iio/gyroscope/nxp,fxas21002c.txt | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/gyroscope/nxp,fxas21002c.txt

diff --git a/Documentation/devicetree/bindings/iio/gyroscope/nxp,fxas21002c.txt b/Documentation/devicetree/bindings/iio/gyroscope/nxp,fxas21002c.txt
new file mode 100644
index 000000000000..68b4cd283d1d
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/gyroscope/nxp,fxas21002c.txt
@@ -0,0 +1,26 @@
+* NXP FXAS21002C Gyroscope device tree bindings
+
+http://www.nxp.com/products/sensors/gyroscopes/3-axis-digital-gyroscope:FXAS21002C
+
+Required properties:
+  - compatible : should be "nxp,fxas21002c"
+  - reg : the I2C address of the sensor or SPI chip select number for the
+          device.
+  - vdd-supply: phandle to the regulator that provides power to the sensor.
+  - vddio-supply: phandle to the regulator that provides power to the bus.
+
+Optional properties:
+  - reset-gpios : gpio used to reset the device, see gpio/gpio.txt
+  - interrupts : device support 2 interrupts, INT1 and INT2.
+                 See interrupt-controller/interrupts.txt
+  - interrupt-names: should contain "INT1" or "INT2", the gyroscope interrupt
+                     line in use.
+
+Example:
+
+gyroscope@20 {
+	compatible = "nxp,fxas21002c";
+	reg = <0x20>;
+	vdd-supply = <&reg_peri_3p15v>;
+	vddio-supply = <&reg_peri_3p15v>;
+};
-- 
2.20.1
