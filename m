From: Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 3/3] iio:as3935: Add DT binding docs for AS3935 driver
Date: Fri, 31 Jan 2014 22:22:40 -0800
Message-ID: <1391235760-32652-3-git-send-email-mranostay@gmail.com>
References: <1391235760-32652-1-git-send-email-mranostay@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1391235760-32652-1-git-send-email-mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Document compatible string, required and optional DT properties for
AS3935 chipset driver.

Signed-off-by: Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../devicetree/bindings/iio/distance/as3935.txt    | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/distance/as3935.txt

diff --git a/Documentation/devicetree/bindings/iio/distance/as3935.txt b/Documentation/devicetree/bindings/iio/distance/as3935.txt
new file mode 100644
index 0000000..409b48b
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/distance/as3935.txt
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
+	  Range of 0 to 120 pF, 8pF steps. This will require using the calibration
+	  data from the manufacturer.
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
