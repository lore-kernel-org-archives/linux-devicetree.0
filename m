From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 1/2] dt-bindings: media: i2c: Add IMX296 CMOS sensor binding
Date: Fri, 11 Oct 2019 09:26:12 +0530
Message-ID: <20191011035613.13598-2-manivannan.sadhasivam@linaro.org>
References: <20191011035613.13598-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191011035613.13598-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mchehab@kernel.org, robh+dt@kernel.org, sakari.ailus@iki.fi
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, c.barrett@framos.com, a.brela@framos.com, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Add devicetree binding for IMX296 CMOS image sensor.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../devicetree/bindings/media/i2c/imx296.txt  | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/imx296.txt

diff --git a/Documentation/devicetree/bindings/media/i2c/imx296.txt b/Documentation/devicetree/bindings/media/i2c/imx296.txt
new file mode 100644
index 000000000000..25d3b15162c1
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/imx296.txt
@@ -0,0 +1,55 @@
+* Sony IMX296 1/2.8-Inch CMOS Image Sensor
+
+The Sony IMX296 is a 1/2.9-Inch active pixel type CMOS Solid-state image
+sensor with square pixel array and 1.58 M effective pixels. This chip features
+a global shutter with variable charge-integration time. It is programmable
+through I2C and 4-wire interfaces. The sensor output is available via CSI-2
+serial data output (1 Lane).
+
+Required Properties:
+- compatible: Should be "sony,imx296"
+- reg: I2C bus address of the device
+- clocks: Reference to the mclk clock.
+- clock-names: Should be "mclk".
+- clock-frequency: Frequency of the mclk clock in Hz.
+- vddo-supply: Interface power supply.
+- vdda-supply: Analog power supply.
+- vddd-supply: Digital power supply.
+
+Optional Properties:
+- reset-gpios: Sensor reset GPIO
+
+The imx296 device node should contain one 'port' child node with
+an 'endpoint' subnode. For further reading on port node refer to
+Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+Required Properties on endpoint:
+- data-lanes: check ../video-interfaces.txt
+- remote-endpoint: check ../video-interfaces.txt
+
+Example:
+	&i2c1 {
+		...
+		imx296: camera-sensor@1a {
+			compatible = "sony,imx296";
+			reg = <0x1a>;
+
+			reset-gpios = <&msmgpio 35 GPIO_ACTIVE_LOW>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&camera_rear_default>;
+
+			clocks = <&gcc GCC_CAMSS_MCLK0_CLK>;
+			clock-names = "mclk";
+			clock-frequency = <37125000>;
+
+			vddo-supply = <&camera_vddo_1v8>;
+			vdda-supply = <&camera_vdda_3v3>;
+			vddd-supply = <&camera_vddd_1v2>;
+
+			port {
+				imx296_ep: endpoint {
+					data-lanes = <1>;
+					remote-endpoint = <&csiphy0_ep>;
+				};
+			};
+		};
-- 
2.17.1
