From: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] rtc: ds1374: Add trickle charger device tree binding
Date: Mon, 17 Apr 2017 15:40:10 -0700
Message-ID: <1492468810-17224-1-git-send-email-mdf@kernel.org>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBAABBVUI2XDQKGQEDRW7P3I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Introduce a device tree binding for specifying the trickle charger
configuration for ds1374. This is based on the code for ds13390.

Signed-off-by: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/rtc/dallas,ds1374.txt      | 18 ++++++++
 drivers/rtc/rtc-ds1374.c                           | 54 ++++++++++++++++++++++
 2 files changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/dallas,ds1374.txt

diff --git a/Documentation/devicetree/bindings/rtc/dallas,ds1374.txt b/Documentation/devicetree/bindings/rtc/dallas,ds1374.txt
new file mode 100644
index 0000000..4cf5bd7
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/dallas,ds1374.txt
@@ -0,0 +1,18 @@
+* Dallas DS1374		I2C Real-Time Clock / WDT
+
+Required properties:
+- compatible: Should contain "dallas,ds1374".
+- reg: I2C address for chip
+
+Optional properties:
+- trickle-resistor-ohms : Selected resistor for trickle charger
+	Values usable for ds1374 are 250, 2000, 4000
+	Should be given if trickle charger should be enabled
+- trickle-diode-disable : Do not use internal trickle charger diode
+	Should be given if internal trickle charger diode should be disabled
+Example:
+	ds1374: rtc@0 {
+		compatible = "dallas,ds1374";
+		trickle-resistor-ohms = <250>;
+		reg = <0>;
+	};
diff --git a/drivers/rtc/rtc-ds1374.c b/drivers/rtc/rtc-ds1374.c
index 4cd115e..873475d 100644
--- a/drivers/rtc/rtc-ds1374.c
+++ b/drivers/rtc/rtc-ds1374.c
@@ -53,6 +53,13 @@
 #define DS1374_REG_SR_AF	0x01 /* Alarm Flag */
 #define DS1374_REG_TCR		0x09 /* Trickle Charge */
 
+#define DS1374_TRICKLE_CHARGER_ENABLE	0xA0
+#define DS1374_TRICKLE_CHARGER_250_OHM	0x01
+#define DS1374_TRICKLE_CHARGER_2K_OHM	0x02
+#define DS1374_TRICKLE_CHARGER_4K_OHM	0x03
+#define DS1374_TRICKLE_CHARGER_NO_DIODE	0x04
+#define DS1374_TRICKLE_CHARGER_DIODE	0x08
+
 static const struct i2c_device_id ds1374_id[] = {
 	{ "ds1374", 0 },
 	{ }
@@ -597,6 +604,49 @@ static struct notifier_block ds1374_wdt_notifier = {
 };
 
 #endif /*CONFIG_RTC_DRV_DS1374_WDT*/
+
+static int ds1374_trickle_of_init(struct i2c_client *client)
+{
+	u32 ohms = 0;
+	u8 value;
+	int ret;
+
+	if (of_property_read_u32(client->dev.of_node, "trickle-resistor-ohms",
+				 &ohms))
+		return 0;
+
+	/* Enable charger */
+	value = DS1374_TRICKLE_CHARGER_ENABLE;
+	if (of_property_read_bool(client->dev.of_node, "trickle-diode-disable"))
+		value |= DS1374_TRICKLE_CHARGER_NO_DIODE;
+	else
+		value |= DS1374_TRICKLE_CHARGER_DIODE;
+
+	/* Resistor select */
+	switch (ohms) {
+	case 250:
+		value |= DS1374_TRICKLE_CHARGER_250_OHM;
+		break;
+	case 2000:
+		value |= DS1374_TRICKLE_CHARGER_2K_OHM;
+		break;
+	case 4000:
+		value |= DS1374_TRICKLE_CHARGER_4K_OHM;
+		break;
+	default:
+		dev_warn(&client->dev,
+			 "Unsupported ohm value %02ux in dt\n", ohms);
+		return -EINVAL;
+	}
+	dev_dbg(&client->dev, "Trickle charge value is 0x%02x\n", value);
+
+	ret = i2c_smbus_write_byte_data(client, DS1374_REG_TCR, value);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
 /*
  *****************************************************************************
  *
@@ -620,6 +670,10 @@ static int ds1374_probe(struct i2c_client *client,
 	INIT_WORK(&ds1374->work, ds1374_work);
 	mutex_init(&ds1374->mutex);
 
+	ret = ds1374_trickle_of_init(client);
+	if (ret)
+		return ret;
+
 	ret = ds1374_check_rtc_status(client);
 	if (ret)
 		return ret;
-- 
2.7.4

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
