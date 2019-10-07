From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 1/2] dt-bindings: iio: light: Add binding for ADUX1020
Date: Mon,  7 Oct 2019 15:40:26 +0530
Message-ID: <20191007101027.8383-2-manivannan.sadhasivam@linaro.org>
References: <20191007101027.8383-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191007101027.8383-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org, knaack.h@gmx.de, pmeerw@pmeerw.net, robh+dt@kernel.org
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Add devicetree binding for Analog Devices ADUX1020 Photometric
sensor.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../bindings/iio/light/adux1020.txt           | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/light/adux1020.txt

diff --git a/Documentation/devicetree/bindings/iio/light/adux1020.txt b/Documentation/devicetree/bindings/iio/light/adux1020.txt
new file mode 100644
index 000000000000..e896dda30e36
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/light/adux1020.txt
@@ -0,0 +1,22 @@
+Analog Devices ADUX1020 Photometric sensor
+
+Link to datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/ADUX1020.pdf
+
+Required properties:
+
+ - compatible: should be "adi,adux1020"
+ - reg: the I2C address of the sensor
+
+Optional properties:
+
+ - interrupts: interrupt mapping for IRQ as documented in
+   Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
+
+Example:
+
+adux1020@64 {
+	compatible = "adi,adux1020";
+	reg = <0x64>;
+	interrupt-parent = <&msmgpio>;
+	interrupts = <24 IRQ_TYPE_LEVEL_HIGH>;
+};
-- 
2.17.1
