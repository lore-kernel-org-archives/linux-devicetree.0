From: Andreas Klinger <ak@it-klinger.de>
Subject: [PATCH 1/4] maxbotix,mb12x2.txt: add dt doc for maxbotix,mb12x2
Date: Sun, 24 Feb 2019 17:22:10 +0100
Message-ID: <20190224162208.esbrzartgfqxptsw@arbad>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: afaerber@suse.de, arnd@arndb.de, davem@davemloft.net, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, jic23@kernel.org, johan@kernel.org, khilman@baylibre.com, knaack.h@gmx.de, lars@metafoo.de, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, martin.blumenstingl@googlemail.com, mchehab+samsung@kernel.org, m.othacehe@gmail.com, nicolas.ferre@microchip.com, pmeerw@pmeerw.net, robh+dt@kernel.org, robh@kernel.org, songqiang1304521@gmail.com, treding@nvidia.com
List-Id: devicetree@vger.kernel.org

add dt doc for maxbotix,mb12x2 and also a new vendor prefix maxbotix

Signed-off-by: Andreas Klinger <ak@it-klinger.de>
---
 .../bindings/iio/proximity/maxbotix,mb12x2.txt     | 22 ++++++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.txt        |  1 +
 2 files changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/proximity/maxbotix,mb12x2.txt

diff --git a/Documentation/devicetree/bindings/iio/proximity/maxbotix,mb12x2.txt b/Documentation/devicetree/bindings/iio/proximity/maxbotix,mb12x2.txt
new file mode 100644
index 000000000000..29f7fc09cfdc
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/proximity/maxbotix,mb12x2.txt
@@ -0,0 +1,22 @@
+* MaxSonar-I2CXL ultrasonic distance sensor of type mb12x2 using the i2c
+  interface for ranging
+
+Required properties:
+ - compatible:		Should be "maxbotix,mb12x2"
+
+ - reg:			i2c address of the device
+
+Optional properties:
+ - status-gpios:	Definition of the status gpio (input) which is used
+			to announce the preceding reading request has
+			finished and that data is available. If no status
+			gpio is specified the device driver falls back to
+			wait a certain amount of time (15 ms) until data
+			can be retrieved.
+
+Example:
+mb@70 {
+	compatible = "maxbotix,mb12x2";
+	reg = <0x70>;
+	status-gpios = <&gpio2 2 GPIO_ACTIVE_HIGH>;
+};
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 389508584f48..added54a1108 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -225,6 +225,7 @@ lsi	LSI Corp. (LSI Logic)
 lwn	Liebherr-Werk Nenzing GmbH
 macnica	Macnica Americas
 marvell	Marvell Technology Group Ltd.
+maxbotix	MaxBotix Inc.
 maxim	Maxim Integrated Products
 mbvl	Mobiveil Inc.
 mcube	mCube
-- 
2.11.0
