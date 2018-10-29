Return-Path: <SRS0=pxxc=NJ=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v2 1/2] dt-bindings: input: add Microchip QT1050 bindings
Date: Mon, 29 Oct 2018 14:38:25 +0100
Message-Id: <20181029133826.30326-2-m.felsch@pengutronix.de>
In-Reply-To: <20181029133826.30326-1-m.felsch@pengutronix.de>
References: <20181029133826.30326-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: dmitry.torokhov@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, raphaelpereira@gmail.com, voice.shen@atmel.com, linux-input@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

This patch adds the device tree binding documentation for the Microchip
QT1050 touch sensor.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

---
Changes:

v2:
- change fw-layout, so each key is represented by a fw-subnode
- use microchip,* device properties instead of touchscreen ones

 .../bindings/input/microchip,qt1050.txt       | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/microchip,qt1050.txt

diff --git a/Documentation/devicetree/bindings/input/microchip,qt1050.txt b/Documentation/devicetree/bindings/input/microchip,qt1050.txt
new file mode 100644
index 000000000000..c36604aed5bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/microchip,qt1050.txt
@@ -0,0 +1,75 @@
+Microchip AT42QT1050 Five-channel Touch Sensor IC
+
+The AT42QT1050 (QT1050) is a QTouchADC sensor device. The device can sense from
+one to five keys, dependent on mode. The QT1050 includes all signal processing
+functions necessary to provide stable sensing under a wide variety of changing
+conditions, and the outputs are fully debounced.
+
+The touchkey device node should be placed inside an I2C bus node.
+
+Required properties:
+- compatible: Must be "microchip,qt1050"
+- reg: The I2C address of the device
+- interrupts: The sink for the touchpad's IRQ output,
+  see ../interrupt-controller/interrupts.txt
+
+Each button (key) is represented as a sub-node:
+
+Each not specified key or key with linux,code set to KEY_RESERVED gets disabled
+in HW.
+
+Subnode properties:
+- linux,code: Keycode to emit.
+- reg: The key number. Valid values: 0, 1, 2, 3, 4.
+
+Optional subnode-properties:
+
+If a optional property is missing or has a invalid value the default value is
+taken.
+
+- microchip,pre-charge-time-ns:
+  Each touchpad need some time to precharge. The value depends on the mechanical
+  layout.
+  Valid value range: 0 - 637500; values must be a multiple of 2500;
+  default is 0.
+- microchip,average-samples:
+  Number of data samples which are averaged for each read.
+  Valid values: 1, 4, 16, 64, 256, 1024, 4096, 16384; default is 1.
+- microchip,average-scaling:
+  The scaling factor which is used to scale the average-samples.
+  Valid values: 1, 2, 4, 8, 16, 32, 64, 128; default is 1.
+- microchip,threshold:
+  Number of counts to register a touch detection.
+  Valid value range: 0 - 255; default is 20.
+
+Example:
+QT1050 with 3 non continuous keys, key2 and key4 are disabled.
+
+touchkeys@41 {
+	compatible = "microchip,qt1050";
+	reg = <0x41>;
+	interrupt-parent = <&gpio0>;
+	interrupts = <17 IRQ_TYPE_EDGE_FALLING>;
+
+	up@0 {
+		reg = <0>;
+		linux,code = <KEY_UP>;
+		microchip,average-samples = <64>;
+		microchip,average-scaling = <16>;
+		microchip,pre-charge-time-ns = <10000>;
+	};
+
+	right@1 {
+		reg = <1>;
+		linux,code = <KEY_RIGHT>;
+		microchip,average-samples = <64>;
+		microchip,average-scaling = <8>;
+	};
+
+	down@3 {
+		reg = <3>;
+		linux,code = <KEY_DOWN>;
+		microchip,average-samples = <256>;
+		microchip,average-scaling = <16>;
+	};
+};
-- 
2.19.1
