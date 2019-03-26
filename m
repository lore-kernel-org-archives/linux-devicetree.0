From: Andreas Klinger <ak@it-klinger.de>
Subject: [PATCH 2/2] devantech-srf04.txt: remove old DT documentation
Date: Tue, 26 Mar 2019 13:31:47 +0100
Message-ID: <20190326123146.2ru6yu5vea2xha4r@arbad>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

remove the outdated DT documentation of devantech srf04 iio driver which
is replaced by devantech-srf04.yaml

Signed-off-by: Andreas Klinger <ak@it-klinger.de>
---
 .../bindings/iio/proximity/devantech-srf04.txt     | 28 ----------------------
 1 file changed, 28 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/iio/proximity/devantech-srf04.txt

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
-- 
2.11.0
