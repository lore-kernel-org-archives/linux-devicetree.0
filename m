From: Andreas Klinger <ak@it-klinger.de>
Subject: [PATCH 2/3] devantech-srf04.yaml: add Maxbotix ultrasonic iio
 proximity sensors
Date: Tue, 9 Apr 2019 21:10:55 +0200
Message-ID: <20190409191054.va6y2l5lyhyoo5p4@arbad>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, songqiang1304521@gmail.com, robh@kernel.org, m.othacehe@gmail.com, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

add compatibles for Maxbotix ultrasonic iio sensor types to yaml
documentation

Signed-off-by: Andreas Klinger <ak@it-klinger.de>
---
 .../bindings/iio/proximity/devantech-srf04.yaml    | 25 ++++++++++++++--------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/proximity/devantech-srf04.yaml b/Documentation/devicetree/bindings/iio/proximity/devantech-srf04.yaml
index e7aab785c97d..4e80ea7c1475 100644
--- a/Documentation/devicetree/bindings/iio/proximity/devantech-srf04.yaml
+++ b/Documentation/devicetree/bindings/iio/proximity/devantech-srf04.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/iio/proximity/devantech-srf04.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Devantech SRF04 ultrasonic range finder
+title: Devantech SRF04 and Maxbotix mb1000 ultrasonic range finder
 
 maintainers:
   - Andreas Klinger <ak@it-klinger.de>
@@ -16,19 +16,28 @@ description: |
   - echo-gpio is held high by the sensor after sending ultrasonic burst
     until it is received once again
 
-  Specifications about the driver can be found at:
+  Specifications about the devices can be found at:
   http://www.robot-electronics.co.uk/htm/srf04tech.htm
 
+  http://www.maxbotix.com/documents/LV-MaxSonar-EZ_Datasheet.pdf
+
 properties:
   compatible:
-    items:
-      - const: devantech,srf04
+    enum:
+      - devantech,srf04
+      - maxbotix,mb1000
+      - maxbotix,mb1010
+      - maxbotix,mb1020
+      - maxbotix,mb1030
+      - maxbotix,mb1040
 
   trig-gpios:
     description:
-      Definition of the GPIO for the triggering (output) This GPIO is set
-      for about 10 us by the driver to tell the device it should initiate
-      the measurement cycle.
+      Definition of the GPIO for the triggering (output)
+      This GPIO is set for about 10 us by the driver to tell the device it
+      should initiate the measurement cycle.
+      See Documentation/devicetree/bindings/gpio/gpio.txt for information
+      on how to specify a consumer gpio.
     maxItems: 1
 
   echo-gpios:
@@ -40,8 +49,6 @@ properties:
       trip.
       It needs to be an GPIO which is able to deliver an interrupt because
       the time between two interrupts is measured in the driver.
-      See Documentation/devicetree/bindings/gpio/gpio.txt for information
-      on how to specify a consumer gpio.
     maxItems: 1
 
 required:
-- 
2.11.0
