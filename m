Return-Path: <SRS0=L7Fd=RW=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46490 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727418AbfCSK7p (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 19 Mar 2019 06:59:45 -0400
Received: by mail-wr1-f68.google.com with SMTP id o1so1147838wrs.13
        for <devicetree@vger.kernel.org>; Tue, 19 Mar 2019 03:59:44 -0700 (PDT)
From: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH v4 1/6] iio: gyro: add DT bindings to fxas21002c
Date: Tue, 19 Mar 2019 10:59:20 +0000
Message-Id: <20190319105925.25863-2-rui.silva@linaro.org>
In-Reply-To: <20190319105925.25863-1-rui.silva@linaro.org>
References: <20190319105925.25863-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>
List-ID: <devicetree@vger.kernel.org>

Add device tree bindings for the FXAS21002C gyroscope.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 .../bindings/iio/gyroscope/nxp,fxas21002c.txt | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/gyroscope/nxp,fxas21002c.txt

diff --git a/Documentation/devicetree/bindings/iio/gyroscope/nxp,fxas21002c.txt b/Documentation/devicetree/bindings/iio/gyroscope/nxp,fxas21002c.txt
new file mode 100644
index 000000000000..465e104bbf14
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/gyroscope/nxp,fxas21002c.txt
@@ -0,0 +1,31 @@
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
+  - interrupts : device support 2 interrupts, INT1 and INT2,
+                 the interrupts can be triggered on rising or falling edges.
+                 See interrupt-controller/interrupts.txt
+  - interrupt-names: should contain "INT1" or "INT2", the gyroscope interrupt
+                     line in use.
+  - drive-open-drain: the interrupt/data ready line will be configured
+                      as open drain, which is useful if several sensors share
+                      the same interrupt line. This is a boolean property.
+                      (This binding is taken from pinctrl/pinctrl-bindings.txt)
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
2.21.0
