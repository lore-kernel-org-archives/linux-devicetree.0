Return-Path: <SRS0=1fni=QL=linaro.org=rui.silva@kernel.org>
From: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 1/5] iio: gyro: add DT bindings to fxas2100x
Date: Mon,  4 Feb 2019 17:00:08 +0000
Message-Id: <20190204170012.13617-2-rui.silva@linaro.org>
In-Reply-To: <20190204170012.13617-1-rui.silva@linaro.org>
References: <20190204170012.13617-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>
List-ID: <devicetree@vger.kernel.org>

Add device tree bindings for the FXAS2100x gyroscope.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 .../bindings/iio/gyroscope/fxas2100x.txt           | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/gyroscope/fxas2100x.txt

diff --git a/Documentation/devicetree/bindings/iio/gyroscope/fxas2100x.txt b/Documentation/devicetree/bindings/iio/gyroscope/fxas2100x.txt
new file mode 100644
index 000000000000..2aeef9aafec4
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/gyroscope/fxas2100x.txt
@@ -0,0 +1,14 @@
+* NXP FXAS2100X Gyroscope device tree bindings
+
+http://www.nxp.com/products/sensors/gyroscopes/3-axis-digital-gyroscope:FXAS21002C
+
+Required properties:
+  - compatible : should be "nxp,fxas2100x"
+  - reg : the I2C address of the sensor
+
+Example:
+
+fxas2100x@20 {
+	compatible = "nxp,fxas2100x"
+	reg = <0x20>;
+};
-- 
2.20.1
