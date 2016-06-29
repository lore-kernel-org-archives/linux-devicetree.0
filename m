From: Dirk Behme <dirk.behme-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 3/3] rtc: rv8803: Be able to set VDETOFF and
 SWOFF via devcie tree
Date: Wed, 29 Jun 2016 16:40:01 +0200
Message-ID: <1467211201-17252-4-git-send-email-dirk.behme@de.bosch.com>
References: <1467211201-17252-1-git-send-email-dirk.behme@de.bosch.com>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBDCMXBNSKAIMNO6PXMCRUBBXWTGXM-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1467211201-17252-1-git-send-email-dirk.behme-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Oleksij Rempel <fixed-term.Oleksij.Rempel-V5te9oGctAVWk0Htik3J/w@public.gmane.org>, Carsten Resch <Carsten.Resch-V5te9oGctAVWk0Htik3J/w@public.gmane.org>, Dirk Behme <dirk.behme-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Oleksij Rempel <fixed-term.Oleksij.Rempel-V5te9oGctAVWk0Htik3J/w@public.gmane.org>

There might be designs where the power supply circuit is designed
in a way that VDETOFF and SWOFF is reuqired to be set. Otherwise the
RTC detects a power loss. Add a device tree interface for this.

Signed-off-by: Carsten Resch <Carsten.Resch-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
Signed-off-by: Dirk Behme <dirk.behme-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
Signed-off-by: Oleksij Rempel <fixed-term.Oleksij.Rempel-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 drivers/rtc/rtc-rv8803.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index f623038..0801048 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -49,11 +49,21 @@
 #define RV8803_CTRL_TIE			BIT(4)
 #define RV8803_CTRL_UIE			BIT(5)
 
+#define RX8900_BACKUP_CTRL		0x18
+#define RX8900_FLAG_SWOFF		BIT(2)
+#define RX8900_FLAG_VDETOFF		BIT(3)
+
+enum rv8803_type {
+	rv_8803,
+	rx_8900
+};
+
 struct rv8803_data {
 	struct i2c_client *client;
 	struct rtc_device *rtc;
 	struct mutex flags_lock;
 	u8 ctrl;
+	enum rv8803_type type;
 };
 
 static irqreturn_t rv8803_handle_irq(int irq, void *dev_id)
@@ -422,6 +432,35 @@ static struct rtc_class_ops rv8803_rtc_ops = {
 	.ioctl = rv8803_ioctl,
 };
 
+static int rx8900_trickle_charger_init(struct rv8803_data *rv8803)
+{
+	struct i2c_client *client = rv8803->client;
+	struct device_node *node = client->dev.of_node;
+	int err;
+	u8 flags;
+
+	if (!node)
+		return 0;
+
+	if (rv8803->type != rx_8900)
+		return 0;
+
+	err = i2c_smbus_read_byte_data(rv8803->client, RX8900_BACKUP_CTRL);
+	if (err < 0)
+		return err;
+
+	flags = ~(RX8900_FLAG_VDETOFF | RX8900_FLAG_SWOFF) & (u8)err;
+
+	if (of_property_read_bool(node, "epson,vdet-disable"))
+		flags |= RX8900_FLAG_VDETOFF;
+
+	if (of_property_read_bool(node, "trickle-diode-disable"))
+		flags |= RX8900_FLAG_SWOFF;
+
+	return i2c_smbus_write_byte_data(rv8803->client, RX8900_BACKUP_CTRL,
+					 flags);
+}
+
 static int rv8803_probe(struct i2c_client *client,
 			const struct i2c_device_id *id)
 {
@@ -442,6 +481,7 @@ static int rv8803_probe(struct i2c_client *client,
 
 	mutex_init(&rv8803->flags_lock);
 	rv8803->client = client;
+	rv8803->type = id->driver_data;
 	i2c_set_clientdata(client, rv8803);
 
 	/*
@@ -497,6 +537,12 @@ static int rv8803_probe(struct i2c_client *client,
 	if (err)
 		return err;
 
+	err = rx8900_trickle_charger_init(rv8803);
+	if (err) {
+		dev_err(&client->dev, "failed to init charger\n");
+		return err;
+	}
+
 	err = device_create_bin_file(&client->dev, &rv8803_nvram_attr);
 	if (err)
 		return err;
@@ -514,8 +560,8 @@ static int rv8803_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id rv8803_id[] = {
-	{ "rv8803", 0 },
-	{ "rx8900", 0 },
+	{ "rv8803", rv_8803 },
+	{ "rx8900", rx_8900 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rv8803_id);
-- 
1.9.1

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
