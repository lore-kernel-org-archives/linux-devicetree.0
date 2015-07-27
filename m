From: Martin Kepplinger <martink-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCHv2 8/8] iio: mma8452: add devicetree property to allow all pin wirings
Date: Mon, 27 Jul 2015 16:56:22 +0200
Message-ID: <1438008982-28690-1-git-send-email-martink@posteo.de>
References: <20150727142336.GB10821@leverpostej>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150727142336.GB10821@leverpostej>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org, roberta.dobrescu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, christoph.muellner-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org, Martin Kepplinger <martink-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>, Martin Kepplinger <martin.kepplinger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>
List-Id: devicetree@vger.kernel.org

For the devices supported by the mma8452 driver, two interrupt pins are
available to route the interrupt signals to. By default INT1 is assumed.

This adds a bitmask DT property for users to configure interrupt sources
for INT2, if that is the wired interrupt pin for them.

This is important for everyone to be able to use this driver, no matter
how their chip is wired. At the moment, only 0xff for using INT2 for all
available interrupt sources is supported. See the devicetree documentation
file for more details.

Since this doesn't change the default behaviour, it doesn't break anything
for existing users.

Signed-off-by: Martin Kepplinger <martin.kepplinger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>
Signed-off-by: Christoph Muellner <christoph.muellner-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>
---
PATCH v2 of the series' 5th version. DT cleanup and a little clearer
documentation.


 .../devicetree/bindings/iio/accel/mma8452.txt        |  3 +++
 drivers/iio/accel/mma8452.c                          | 20 +++++++++++++-------
 2 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/accel/mma8452.txt b/Documentation/devicetree/bindings/iio/accel/mma8452.txt
index 57feb16..32f137e 100644
--- a/Documentation/devicetree/bindings/iio/accel/mma8452.txt
+++ b/Documentation/devicetree/bindings/iio/accel/mma8452.txt
@@ -13,6 +13,8 @@ Optional properties:
 
   - interrupt-parent: should be the phandle for the interrupt controller
   - interrupts: interrupt mapping for GPIO IRQ
+  - use-int2: To use interrupt pin INT2 instead of INT1 (default), use
+    "/bits/ 8 <0xff>" here. More options might be available in the future.
 
 Example:
 
@@ -21,4 +23,5 @@ Example:
 		reg = <0x1d>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <5 0>;
+		use-int2 = /bits/ 8 <0xff>;
 	};
diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
index 918ab59..ab40fa9 100644
--- a/drivers/iio/accel/mma8452.c
+++ b/drivers/iio/accel/mma8452.c
@@ -1028,8 +1028,9 @@ static int mma8452_probe(struct i2c_client *client,
 {
 	struct mma8452_data *data;
 	struct iio_dev *indio_dev;
-	int ret;
 	const struct of_device_id *match;
+	int ret;
+	u8 int2;
 
 	match = of_match_device(mma8452_dt_ids, &client->dev);
 	if (!match) {
@@ -1104,12 +1105,17 @@ static int mma8452_probe(struct i2c_client *client,
 		int enabled_interrupts = MMA8452_INT_TRANS |
 					 MMA8452_INT_FF_MT;
 
-		/* Assume wired to INT1 pin */
-		ret = i2c_smbus_write_byte_data(client,
-						MMA8452_CTRL_REG5,
-						supported_interrupts);
-		if (ret < 0)
-			return ret;
+		of_property_read_u8(client->dev.of_node, "use-int2", &int2);
+		if (int2 == 0xff) {
+			dev_dbg(&client->dev, "use interrupt line INT2\n");
+		} else {
+			dev_dbg(&client->dev, "use interrupt line INT1\n");
+			ret = i2c_smbus_write_byte_data(client,
+							MMA8452_CTRL_REG5,
+							supported_interrupts);
+			if (ret < 0)
+				return ret;
+		}
 
 		ret = i2c_smbus_write_byte_data(client,
 						MMA8452_CTRL_REG4,
-- 
2.1.4
