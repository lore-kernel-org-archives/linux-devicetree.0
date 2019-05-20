Return-Path: <SRS0=jBdM=TU=denx.de=marex@kernel.org>
From: Marek Vasut <marex@denx.de>
Subject: [PATCH 1/2] media: dt-bindings: Add Intersil ISL7998x DT bindings
Date: Mon, 20 May 2019 22:18:11 +0200
Message-Id: <20190520201812.7937-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: linux-media@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Add bindings for the Intersil ISL7998x BT656-to-MIPI-CSI2 decoder.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
To: linux-media@vger.kernel.org
---
 .../bindings/media/i2c/isl7998x.txt           | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/isl7998x.txt

diff --git a/Documentation/devicetree/bindings/media/i2c/isl7998x.txt b/Documentation/devicetree/bindings/media/i2c/isl7998x.txt
new file mode 100644
index 000000000000..c21703983360
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/isl7998x.txt
@@ -0,0 +1,37 @@
+Intersil ISL7998x BT656-to-MIPI-CSI2 decoder
+
+The Intersil ISL7998x is a BT656-to-MIPI-CSI decoder which, capable of
+receiving up to four analog stream and multiplexing them into up to four
+MIPI CSI2 virtual channels, using one MIPI clock lane and 1/2 data lanes.
+
+Required Properties:
+- compatible: value should be "isil,isl79987"
+- pd-gpios: a GPIO spec for the Power Down pin (active high)
+
+Option Properties:
+- isil,num-inputs: Number of connected inputs (1, 2 or 4)
+
+For further reading on port node refer to
+Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+Example:
+
+	i2c_master {
+		isl7998x_mipi@44 {
+			compatible = "isil,isl79987";
+			reg = <0x44>;
+			isil,num-inputs = <4>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_videoadc>;
+			pd-gpios = <&gpio3 27 GPIO_ACTIVE_HIGH>;
+			status = "okay";
+
+			port {
+				isl79987_to_mipi_csi2: endpoint {
+					remote-endpoint = <&mipi_csi2_in>;
+					clock-lanes = <0>;
+					data-lanes = <1 2>;
+				};
+			};
+		};
+	};
-- 
2.20.1
