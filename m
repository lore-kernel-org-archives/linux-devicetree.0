Return-Path: <SRS0=VDIu=P3=labundy.com=jeff@kernel.org>
From: Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v5 1/2] dt-bindings: input: touchscreen: iqs5xx: Add bindings
Date: Fri, 18 Jan 2019 21:21:30 -0600
Message-Id: <1547868091-32079-1-git-send-email-jeff@labundy.com>
To: dmitry.torokhov@gmail.com, devicetree@vger.kernel.org
Cc: linux-input@vger.kernel.org, rydberg@bitmath.org, robh+dt@kernel.org, mark.rutland@arm.com, Jeff LaBundy <jeff@labundy.com>
List-ID: <devicetree@vger.kernel.org>

This patch adds binding documentation for the Azoteq IQS550/572/525
family of trackpad/touchscreen controllers.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes in v5:
  - None

Changes in v4:
  - None

Changes in v3:
  - Added Reviewed-by trailer

Changes in v2:
  - Separated each valid "compatible" property with a line break
  - Specified the polarity of the RDY and NRST pins
  - Replaced duplicate definitions of common touchscreen properties with a
    reference to touchscreen.txt
  - Specified the example node as "touchscreen@74"

 .../bindings/input/touchscreen/iqs5xx.txt          | 109 +++++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 2 files changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/iqs5xx.txt

diff --git a/Documentation/devicetree/bindings/input/touchscreen/iqs5xx.txt b/Documentation/devicetree/bindings/input/touchscreen/iqs5xx.txt
new file mode 100644
index 0000000..25ee2a0
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/iqs5xx.txt
@@ -0,0 +1,109 @@
+Azoteq IQS550/572/525 Trackpad/Touchscreen Controller
+
+Required properties:
+
+- compatible			: Must be equal to one of the following:
+				  "azoteq,iqs550"
+				  "azoteq,iqs572"
+				  "azoteq,iqs525"
+
+- reg				: I2C slave address for the device.
+
+- interrupts			: GPIO to which the device's active-high RDY
+				  output is connected (see [0]).
+
+- reset-gpios			: GPIO to which the device's active-low NRST
+				  input is connected (see [1]). Hardware reset
+				  access is required in order to to facilitate
+				  in-system firmware replacement.
+
+Optional properties:
+
+- azoteq,exp-ver-major		: Major field of the export file version number
+				  (0 through 255 inclusive). This property must
+				  be specified as a '/bits/ 8' value.
+
+- azoteq,exp-ver-minor		: Minor field of the export file version number
+				  (0 through 255 inclusive). This property must
+				  be specified as a '/bits/ 8' value.
+
+				  The export file version number is a customer-
+				  assigned parameter embedded in the device's
+				  firmware at the time it is exported from the
+				  manufacturer's PC-based configuration tool.
+
+				  If the export file version number stored in
+				  the device's nonvolatile memory does not match
+				  the number specified here, the driver replaces
+				  the firmware on the device with that which is
+				  stored on the local filesystem (for which the
+				  export file version number must match).
+
+				  If both major and minor fields are omitted or
+				  specified as zero, the driver does not query
+				  the device's export file version number.
+
+- touchscreen-min-x		: See [2].
+
+- touchscreen-min-y		: See [2].
+
+- touchscreen-size-x		: See [2]. If this property is omitted, the
+				  maximum x-coordinate is specified by the
+				  device's "X Resolution" register.
+
+- touchscreen-size-y		: See [2]. If this property is omitted, the
+				  maximum y-coordinate is specified by the
+				  device's "Y Resolution" register.
+
+- touchscreen-max-pressure	: See [2]. Pressure is expressed as the sum of
+				  the deltas across all channels impacted by a
+				  touch event. A channel's delta is calculated
+				  as its count value minus a reference, where
+				  the count value is inversely proportional to
+				  the channel's capacitance.
+
+- touchscreen-fuzz-x		: See [2].
+
+- touchscreen-fuzz-y		: See [2].
+
+- touchscreen-fuzz-pressure	: See [2].
+
+- touchscreen-inverted-x	: See [2]. Inversion is applied relative to that
+				  which may already be specified by the device's
+				  FLIP_X and FLIP_Y register fields.
+
+- touchscreen-inverted-y	: See [2]. Inversion is applied relative to that
+				  which may already be specified by the device's
+				  FLIP_X and FLIP_Y register fields.
+
+- touchscreen-swapped-x-y	: See [2]. Swapping is applied relative to that
+				  which may already be specified by the device's
+				  SWITCH_XY_AXIS register fields.
+
+[0]: Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
+[1]: Documentation/devicetree/bindings/gpio/gpio.txt
+[2]: Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
+
+Example:
+
+	&i2c1 {
+		/* ... */
+
+		touchscreen@74 {
+			compatible = "azoteq,iqs550";
+			reg = <0x74>;
+			interrupt-parent = <&gpio>;
+			interrupts = <17 1>;
+			reset-gpios = <&gpio 27 0>;
+
+			azoteq,exp-ver-major = /bits/ 8 <1>;
+			azoteq,exp-ver-minor = /bits/ 8 <0>;
+
+			touchscreen-size-x = <640>;
+			touchscreen-size-y = <480>;
+
+			touchscreen-max-pressure = <16000>;
+		};
+
+		/* ... */
+	};
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 4b1a2a8..51f9954 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -53,6 +53,7 @@ avic	Shanghai AVIC Optoelectronics Co., Ltd.
 avnet	Avnet, Inc.
 axentia	Axentia Technologies AB
 axis	Axis Communications AB
+azoteq	Azoteq (Pty) Ltd
 bananapi BIPAI KEJI LIMITED
 bhf	Beckhoff Automation GmbH & Co. KG
 bitmain	Bitmain Technologies
--
2.7.4
