From: Andreas Klinger <ak@it-klinger.de>
Subject: [PATCH v2] devantech-srf04.yaml: transform DT binding to YAML
Date: Tue, 26 Mar 2019 14:39:40 +0100
Message-ID: <20190326133938.oitfjxlx2kou26lm@arbad>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

devantech-srf04.yaml: yaml devicetree binding for iio ultrasonic
proximity driver of devantech srf04

use devantech-srf04.txt, transform binding into yaml and remove the
outdated DT documentation

Signed-off-by: Andreas Klinger <ak@it-klinger.de>
---
 .../bindings/iio/proximity/devantech-srf04.txt     | 28 ----------
 .../bindings/iio/proximity/devantech-srf04.yaml    | 59 ++++++++++++++++++++++
 2 files changed, 59 insertions(+), 28 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/iio/proximity/devantech-srf04.txt
 create mode 100644 Documentation/devicetree/bindings/iio/proximity/devantech-srf04.yaml

diff --git a/Documentation/devicetree/bindings/iio/proximity/devantech-srf04.txt b/Documentation/devicetree/bindings/iio/proximity/devantech-srf04.txt
deleted file mode 100644
index d4dc7a227e2e..000000000000
--- a/Documentation/devicetree/bindings/iio/proximity/devantech-srf04.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-* Devantech SRF04 ultrasonic range finder
-  Bit-banging driver using two GPIOs
-
-Required properties:
- - compatible:	Should be "devantech,srf04"
-
- - trig-gpios:	Definition of the GPIO for the triggering (output)
-		This GPIO is set for about 10 us by the driver to tell the
-		device it should initiate the measurement cycle.
-
- - echo-gpios:	Definition of the GPIO for the echo (input)
-		This GPIO is set by the device as soon as an ultrasonic
-		burst is sent out and reset when the first echo is
-		received.
-		Thus this GPIO is set while the ultrasonic waves are doing
-		one round trip.
-		It needs to be an GPIO which is able to deliver an
-		interrupt because the time between two interrupts is
-		measured in the driver.
-		See Documentation/devicetree/bindings/gpio/gpio.txt for
-		information on how to specify a consumer gpio.
-
-Example:
-srf04@0 {
-	compatible = "devantech,srf04";
-	trig-gpios = <&gpio1 15 GPIO_ACTIVE_HIGH>;
-	echo-gpios = <&gpio2  6 GPIO_ACTIVE_HIGH>;
-};
diff --git a/Documentation/devicetree/bindings/iio/proximity/devantech-srf04.yaml b/Documentation/devicetree/bindings/iio/proximity/devantech-srf04.yaml
new file mode 100644
index 000000000000..e7aab785c97d
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/proximity/devantech-srf04.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/proximity/devantech-srf04.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Devantech SRF04 ultrasonic range finder
+
+maintainers:
+  - Andreas Klinger <ak@it-klinger.de>
+
+description: |
+  Bit-banging driver using two GPIOs:
+  - trigger-gpio is raised by the driver to start sending out an ultrasonic
+    burst
+  - echo-gpio is held high by the sensor after sending ultrasonic burst
+    until it is received once again
+
+  Specifications about the driver can be found at:
+  http://www.robot-electronics.co.uk/htm/srf04tech.htm
+
+properties:
+  compatible:
+    items:
+      - const: devantech,srf04
+
+  trig-gpios:
+    description:
+      Definition of the GPIO for the triggering (output) This GPIO is set
+      for about 10 us by the driver to tell the device it should initiate
+      the measurement cycle.
+    maxItems: 1
+
+  echo-gpios:
+    description:
+      Definition of the GPIO for the echo (input)
+      This GPIO is set by the device as soon as an ultrasonic burst is sent
+      out and reset when the first echo is received.
+      Thus this GPIO is set while the ultrasonic waves are doing one round
+      trip.
+      It needs to be an GPIO which is able to deliver an interrupt because
+      the time between two interrupts is measured in the driver.
+      See Documentation/devicetree/bindings/gpio/gpio.txt for information
+      on how to specify a consumer gpio.
+    maxItems: 1
+
+required:
+  - compatible
+  - trig-gpios
+  - echo-gpios
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    proximity {
+        compatible = "devantech,srf04";
+        trig-gpios = <&gpio1 15 GPIO_ACTIVE_HIGH>;
+        echo-gpios = <&gpio2  6 GPIO_ACTIVE_HIGH>;
+    };
-- 
2.11.0
