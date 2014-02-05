From: Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 1/2] iio:as3935: Add DT binding docs for AS3935 driver
Date: Tue,  4 Feb 2014 19:14:55 -0800
Message-ID: <1391570096-2932-1-git-send-email-mranostay@gmail.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pantelis.antoniou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Document compatible string, required and optional DT properties for
AS3935 chipset driver.

Signed-off-by: Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../devicetree/bindings/iio/proximity/as3935.txt   | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/proximity/as3935.txt

diff --git a/Documentation/devicetree/bindings/iio/proximity/as3935.txt b/Documentation/devicetree/bindings/iio/proximity/as3935.txt
new file mode 100644
index 0000000..7e117cd
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/proximity/as3935.txt
@@ -0,0 +1,25 @@
+Austrian Microsystems AS3935 Franklin lightning sensor device driver
+
+Required properties:
+	- compatible: must be "ams,as3935"
+	- reg: SPI chip select number for the device
+	- spi-cpha: SPI Mode 1
+  	- interrupt-parent : should be the phandle for the interrupt controller
+	- interrupts : interrupt mapping for GPIO IRQ
+
+Optional properties:
+	- ams,tune-cap: Calibration tuning capacitor stepping value 0 - 15.
+	  Range of 0 to 120 pF, 8pF steps. This will require using the
+	  calibration data from the manufacturer.
+
+
+Example:
+
+as3935@0 {
+	compatible = "ams,as3935";
+	reg = <0>;
+	spi-cpha;
+	interrupt-parent = <&gpio1>;
+	interrupts = <16 1>;
+	ams,tune-cap = /bits/ 8 <10>;
+};
-- 
1.8.3.2
