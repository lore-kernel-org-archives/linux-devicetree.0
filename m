From: Martin Kepplinger <martink-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH] iio: mma8452: support either of the available interrupt pins
Date: Tue, 13 Oct 2015 17:58:28 +0200
Message-ID: <1444751908-18242-1-git-send-email-martink@posteo.de>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Martin Kepplinger <martink-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>, Martin Kepplinger <martin.kepplinger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This change is important in order for everyone to be easily able to use the
driver for one of the supported accelerometer chips!

Until now, the driver blindly assumed that the INT1 interrupt line is wired
on a user's board. But these devices have 2 interrupt lines and can route
their different interrupt sources to one of them. Since only their motion
detection interrupt source is implemented as IIO events, users just use
either one of the pins.

client->irq is not changed because only one interrupt line is supported.
The user is warned if she describes both interrupt pins in the dts.

If possibly in the future more interrupt sources might be available,
additional DT properties will be added.

Of course, this also falls back to assuming INT1, so for existing users
nothing will break. The new functionality is described in the bindings doc.

Signed-off-by: Martin Kepplinger <martin.kepplinger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>
---
this applies to the current -next. thanks in advance for your review!


 .../devicetree/bindings/iio/accel/mma8452.txt      |  6 +++++
 drivers/iio/accel/mma8452.c                        | 26 +++++++++++++++++-----
 2 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/accel/mma8452.txt b/Documentation/devicetree/bindings/iio/accel/mma8452.txt
index e3c3746..6e42c23 100644
--- a/Documentation/devicetree/bindings/iio/accel/mma8452.txt
+++ b/Documentation/devicetree/bindings/iio/accel/mma8452.txt
@@ -7,13 +7,18 @@ Required properties:
     * "fsl,mma8453"
     * "fsl,mma8652"
     * "fsl,mma8653"
+
   - reg: the I2C address of the chip
 
 Optional properties:
 
   - interrupt-parent: should be the phandle for the interrupt controller
+
   - interrupts: interrupt mapping for GPIO IRQ
 
+  - interrupt-names: should contain "INT1" or "INT2", the accelerometer's
+		     interrupt line in use.
+
 Example:
 
 	mma8453fc@1d {
@@ -21,4 +26,5 @@ Example:
 		reg = <0x1d>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <5 0>;
+		interrupt-names = "INT2";
 	};
diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
index 1eccc2d..dbfd0b4 100644
--- a/drivers/iio/accel/mma8452.c
+++ b/drivers/iio/accel/mma8452.c
@@ -29,6 +29,7 @@
 #include <linux/iio/events.h>
 #include <linux/delay.h>
 #include <linux/of_device.h>
+#include <linux/of_irq.h>
 
 #define MMA8452_STATUS				0x00
 #define  MMA8452_STATUS_DRDY			(BIT(2) | BIT(1) | BIT(0))
@@ -1130,13 +1131,26 @@ static int mma8452_probe(struct i2c_client *client,
 					   MMA8452_INT_FF_MT;
 		int enabled_interrupts = MMA8452_INT_TRANS |
 					 MMA8452_INT_FF_MT;
+		int irq1, irq2;
 
-		/* Assume wired to INT1 pin */
-		ret = i2c_smbus_write_byte_data(client,
-						MMA8452_CTRL_REG5,
-						supported_interrupts);
-		if (ret < 0)
-			return ret;
+		irq1 = of_irq_get_byname(client->dev.of_node, "INT1");
+		irq2 = of_irq_get_byname(client->dev.of_node, "INT2");
+
+		if (irq1 > 0 && irq2 > 0)
+			dev_warn(&client->dev,
+				 "only one interrupt line supported\n");
+
+		/* if INT2 is found, use it. Otherwise INT1 */
+		if (!(irq2 > 0 && irq1 < 0)) {
+			ret = i2c_smbus_write_byte_data(client,
+							MMA8452_CTRL_REG5,
+							supported_interrupts);
+			if (ret < 0)
+				return ret;
+			dev_info(&client->dev, "using interrupt line INT1\n");
+		} else {
+			dev_info(&client->dev, "using interrupt line INT2\n");
+		}
 
 		ret = i2c_smbus_write_byte_data(client,
 						MMA8452_CTRL_REG4,
-- 
2.1.4
