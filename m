From: Eddie James <eajames@linux.ibm.com>
Subject: [PATCH 2/2] hwmon: (pmbus/ibm-cffps) Add version detection capability
Date: Wed,  9 Oct 2019 14:11:02 -0500
Message-ID: <1570648262-25383-3-git-send-email-eajames@linux.ibm.com>
References: <1570648262-25383-1-git-send-email-eajames@linux.ibm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1570648262-25383-1-git-send-email-eajames@linux.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, jdelvare@suse.com, linux@roeck-us.net, mark.rutland@arm.com, robh+dt@kernel.org, Eddie James <eajames@linux.ibm.com>
List-Id: devicetree@vger.kernel.org

Some systems may plug in either version 1 or version 2 of the IBM common
form factor power supply. Add a version-less compatibility string that
tells the driver to try and detect which version of the power supply is
connected.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/hwmon/pmbus/ibm-cffps.c | 37 +++++++++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
index d44745e..d61547e 100644
--- a/drivers/hwmon/pmbus/ibm-cffps.c
+++ b/drivers/hwmon/pmbus/ibm-cffps.c
@@ -3,6 +3,7 @@
  * Copyright 2017 IBM Corp.
  */
 
+#include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/debugfs.h>
 #include <linux/device.h>
@@ -29,6 +30,10 @@
 #define CFFPS_INPUT_HISTORY_CMD			0xD6
 #define CFFPS_INPUT_HISTORY_SIZE		100
 
+#define CFFPS_CCIN_VERSION			GENMASK(15, 8)
+#define CFFPS_CCIN_VERSION_1			 0x2b
+#define CFFPS_CCIN_VERSION_2			 0x2e
+
 /* STATUS_MFR_SPECIFIC bits */
 #define CFFPS_MFR_FAN_FAULT			BIT(0)
 #define CFFPS_MFR_THERMAL_FAULT			BIT(1)
@@ -54,7 +59,7 @@ enum {
 	CFFPS_DEBUGFS_NUM_ENTRIES
 };
 
-enum versions { cffps1, cffps2 };
+enum versions { cffps1, cffps2, cffps_unknown };
 
 struct ibm_cffps_input_history {
 	struct mutex update_lock;
@@ -395,7 +400,7 @@ static int ibm_cffps_probe(struct i2c_client *client,
 			   const struct i2c_device_id *id)
 {
 	int i, rc;
-	enum versions vs;
+	enum versions vs = cffps_unknown;
 	struct dentry *debugfs;
 	struct dentry *ibm_cffps_dir;
 	struct ibm_cffps *psu;
@@ -405,8 +410,27 @@ static int ibm_cffps_probe(struct i2c_client *client,
 		vs = (enum versions)md;
 	else if (id)
 		vs = (enum versions)id->driver_data;
-	else
-		vs = cffps1;
+
+	if (vs == cffps_unknown) {
+		u16 ccin_version = CFFPS_CCIN_VERSION_1;
+		int ccin = i2c_smbus_read_word_swapped(client, CFFPS_CCIN_CMD);
+
+		if (ccin > 0)
+			ccin_version = FIELD_GET(CFFPS_CCIN_VERSION, ccin);
+
+		switch (ccin_version) {
+		default:
+		case CFFPS_CCIN_VERSION_1:
+			vs = cffps1;
+			break;
+		case CFFPS_CCIN_VERSION_2:
+			vs = cffps2;
+			break;
+		}
+
+		/* Set the client name to include the version number. */
+		snprintf(client->name, I2C_NAME_SIZE, "cffps%d", vs + 1);
+	}
 
 	client->dev.platform_data = &ibm_cffps_pdata;
 	rc = pmbus_do_probe(client, id, &ibm_cffps_info[vs]);
@@ -465,6 +489,7 @@ static int ibm_cffps_probe(struct i2c_client *client,
 static const struct i2c_device_id ibm_cffps_id[] = {
 	{ "ibm_cffps1", cffps1 },
 	{ "ibm_cffps2", cffps2 },
+	{ "ibm_cffps", cffps_unknown },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, ibm_cffps_id);
@@ -478,6 +503,10 @@ static int ibm_cffps_probe(struct i2c_client *client,
 		.compatible = "ibm,cffps2",
 		.data = (void *)cffps2
 	},
+	{
+		.compatible = "ibm,cffps",
+		.data = (void *)cffps_unknown
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, ibm_cffps_of_match);
-- 
1.8.3.1
