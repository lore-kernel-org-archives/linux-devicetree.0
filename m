Return-Path: <SRS0=8UYE=GN=nxp.com=jun.li@kernel.org>
From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v2 2/5] usb: typec: fusb302:  remove max_snk_* for sink config
Date: Fri, 23 Mar 2018 22:58:44 +0800
Message-Id: <1521817127-23061-3-git-send-email-jun.li@nxp.com>
In-Reply-To: <1521817127-23061-1-git-send-email-jun.li@nxp.com>
References: <1521817127-23061-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, heikki.krogerus@linux.intel.com, hdegoede@redhat.com
Cc: linux@roeck-us.net, rmfrfs@gmail.com, yueyao.zhu@gmail.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

Since max_snk_* is to be deprecated, so remove max_snk_* by adding a
variable PDO for sink config.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/typec/fusb302/fusb302.c | 51 +++++++++++++++++++++++++++----------
 1 file changed, 37 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/typec/fusb302/fusb302.c b/drivers/usb/typec/fusb302/fusb302.c
index 7036171..db4d9cd 100644
--- a/drivers/usb/typec/fusb302/fusb302.c
+++ b/drivers/usb/typec/fusb302/fusb302.c
@@ -120,6 +120,7 @@ struct fusb302_chip {
 	enum typec_cc_polarity cc_polarity;
 	enum typec_cc_status cc1;
 	enum typec_cc_status cc2;
+	u32 snk_pdo[PDO_MAX_OBJECTS];
 
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *dentry;
@@ -1212,11 +1213,6 @@ static const u32 snk_pdo[] = {
 static const struct tcpc_config fusb302_tcpc_config = {
 	.src_pdo = src_pdo,
 	.nr_src_pdo = ARRAY_SIZE(src_pdo),
-	.snk_pdo = snk_pdo,
-	.nr_snk_pdo = ARRAY_SIZE(snk_pdo),
-	.max_snk_mv = 5000,
-	.max_snk_ma = 3000,
-	.max_snk_mw = 15000,
 	.operating_snk_mw = 2500,
 	.type = TYPEC_PORT_DRP,
 	.data = TYPEC_PORT_DRD,
@@ -1756,6 +1752,38 @@ static int init_gpio(struct fusb302_chip *chip)
 	return 0;
 }
 
+static int fusb302_composite_snk_pdo_array(struct fusb302_chip *chip)
+{
+	struct device *dev = chip->dev;
+	u32 mv, ma, mw, min_mv;
+	unsigned int i;
+
+	/* Copy the static snk pdo */
+	for (i = 0; i < ARRAY_SIZE(snk_pdo); i++)
+		chip->snk_pdo[i] = snk_pdo[i];
+
+	if (device_property_read_u32(dev, "fcs,max-sink-microvolt", &mv) ||
+	    device_property_read_u32(dev, "fcs,max-sink-microamp", &ma) ||
+	    device_property_read_u32(dev, "fcs,max-sink-microwatt", &mw))
+		return i;
+
+	mv = mv / 1000;
+	ma = ma / 1000;
+	mw = mw / 1000;
+
+	min_mv = 1000 * chip->tcpc_config.operating_snk_mw / ma;
+	if (pdo_type(snk_pdo[i-1] == PDO_TYPE_FIXED))
+		min_mv = max(min_mv, pdo_fixed_voltage(snk_pdo[i-1]));
+	else
+		min_mv = max(min_mv, pdo_max_voltage(snk_pdo[i-1]));
+	ma = min(ma, 1000 * mw / min_mv);
+
+	/* Insert the new pdo to the end */
+	chip->snk_pdo[i] = PDO_VAR(min_mv, mv, ma);
+
+	return i+1;
+}
+
 static int fusb302_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
@@ -1784,18 +1812,13 @@ static int fusb302_probe(struct i2c_client *client,
 	chip->tcpc_dev.config = &chip->tcpc_config;
 	mutex_init(&chip->lock);
 
-	if (!device_property_read_u32(dev, "fcs,max-sink-microvolt", &v))
-		chip->tcpc_config.max_snk_mv = v / 1000;
-
-	if (!device_property_read_u32(dev, "fcs,max-sink-microamp", &v))
-		chip->tcpc_config.max_snk_ma = v / 1000;
-
-	if (!device_property_read_u32(dev, "fcs,max-sink-microwatt", &v))
-		chip->tcpc_config.max_snk_mw = v / 1000;
-
 	if (!device_property_read_u32(dev, "fcs,operating-sink-microwatt", &v))
 		chip->tcpc_config.operating_snk_mw = v / 1000;
 
+	/* Composite sink PDO */
+	chip->tcpc_config.nr_snk_pdo = fusb302_composite_snk_pdo_array(chip);
+	chip->tcpc_config.snk_pdo = chip->snk_pdo;
+
 	/*
 	 * Devicetree platforms should get extcon via phandle (not yet
 	 * supported). On ACPI platforms, we get the name from a device prop.
-- 
2.7.4
