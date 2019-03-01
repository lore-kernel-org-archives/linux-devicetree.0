From: Andreas Klinger <ak@it-klinger.de>
Subject: [PATCH v2 2/4] dt-bindings: maxbotix,i2cxl: Add MaxBotix i2c
 ultrasonic rangers
Date: Fri, 1 Mar 2019 14:42:27 +0100
Message-ID: <20190301134225.susjgtck4iktkbeg@arbad>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-iio@vger.kernel.org
Cc: jic23@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, afaerber@suse.de, arnd@arndb.de, davem@davemloft.net, gregkh@linuxfoundation.org, johan@kernel.org, khilman@baylibre.com, knaack.h@gmx.de, lars@metafoo.de, linux-kernel@vger.kernel.org, martin.blumenstingl@googlemail.com, mchehab+samsung@kernel.org, m.othacehe@gmail.com, nicolas.ferre@microchip.com, pmeerw@pmeerw.net, robh@kernel.org, songqiang1304521@gmail.com, treding@nvidia.com, techsupport@maxbotix.com
List-Id: devicetree@vger.kernel.org

Add doc for dt binding maxbotix,i2cxl. This binding is for MaxBotix
I2CXL-MaxSonar ultrasonic rangers which share a common i2c interface.

Signed-off-by: Andreas Klinger <ak@it-klinger.de>
---
 .../bindings/iio/proximity/maxbotix,i2cxl.txt       | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/proximity/maxbotix,i2cxl.txt

diff --git a/Documentation/devicetree/bindings/iio/proximity/maxbotix,i2cxl.txt b/Documentation/devicetree/bindings/iio/proximity/maxbotix,i2cxl.txt
new file mode 100644
index 000000000000..528f428fc583
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/proximity/maxbotix,i2cxl.txt
@@ -0,0 +1,21 @@
+* MaxBotix I2CXL-MaxSonar ultrasonic distance sensor of type mb12x2 using
+  the i2c interface for ranging
+
+Required properties:
+ - compatible:		Should be "maxbotix,i2cxl"
+
+ - reg:			i2c address of the device
+
+Optional properties:
+ - status-gpios:	Status gpio (input) used to announce the preceding
+			reading request has finished and that data is
+			available. If no status gpio is specified the
+			device driver falls back to wait until data can be
+			retrieved.
+
+Example:
+proximity@70 {
+	compatible = "maxbotix,i2cxl";
+	reg = <0x70>;
+	status-gpios = <&gpio2 2 GPIO_ACTIVE_HIGH>;
+};
-- 
2.11.0
