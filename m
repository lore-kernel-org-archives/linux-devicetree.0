Return-Path: <pantelis.antoniou@konsulko.com>
Return-Path: <pantelis.antoniou@konsulko.com>
From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: [PATCH v7 7/9] OF: i2c: Add OF notifier handler
Date: Fri,  4 Jul 2014 19:59:26 +0300
Message-Id: <1404493168-8980-8-git-send-email-pantelis.antoniou@konsulko.com>
In-Reply-To: <1404493168-8980-1-git-send-email-pantelis.antoniou@konsulko.com>
References: <1404493168-8980-1-git-send-email-pantelis.antoniou@konsulko.com>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-ID: <devicetree@vger.kernel.org>

Add OF notifier handler needed for creating/destroying i2c devices
according to dynamic runtime changes in the DT live tree.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
---
 drivers/i2c/i2c-core.c | 65 +++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 64 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core.c b/drivers/i2c/i2c-core.c
index 6e47f73..8df7cd0 100644
--- a/drivers/i2c/i2c-core.c
+++ b/drivers/i2c/i2c-core.c
@@ -1097,6 +1097,7 @@ struct i2c_adapter *of_find_i2c_adapter_by_node(struct device_node *node)
 	return i2c_verify_adapter(dev);
 }
 EXPORT_SYMBOL(of_find_i2c_adapter_by_node);
+
 #else
 static void of_i2c_register_devices(struct i2c_adapter *adap) { }
 #endif /* CONFIG_OF */
@@ -1675,6 +1676,57 @@ void i2c_clients_command(struct i2c_adapter *adap, unsigned int cmd, void *arg)
 }
 EXPORT_SYMBOL(i2c_clients_command);
 
+#if IS_ENABLED(CONFIG_OF)
+
+static int of_i2c_notify(struct notifier_block *nb,
+				unsigned long action, void *arg)
+{
+	struct device_node *dn;
+	struct i2c_adapter *adap;
+	struct i2c_client *client;
+
+	if (action == OF_RECONFIG_DYNAMIC_CREATE_DEV) {
+
+		dn = arg;
+
+		adap = of_find_i2c_adapter_by_node(dn->parent);
+		if (adap == NULL)
+			return NOTIFY_OK;	/* not for us */
+
+		client = of_i2c_register_device(adap, dn);
+		put_device(&adap->dev);
+
+		if (IS_ERR(client)) {
+			pr_err("%s: failed to create for '%s'\n",
+					__func__, dn->full_name);
+			return notifier_from_errno(PTR_ERR(client));
+		}
+
+	} else if (action == OF_RECONFIG_DYNAMIC_DESTROY_DEV) {
+
+		dn = arg;
+
+		/* find our device by node */
+		client = of_find_i2c_device_by_node(dn);
+		if (client == NULL)
+			return NOTIFY_OK;	/* no? not meant for us */
+
+		/* unregister takes one ref away */
+		i2c_unregister_device(client);
+
+		/* and put the reference of the find */
+		put_device(&client->dev);
+
+	} else
+		return NOTIFY_OK;
+
+	return NOTIFY_STOP;
+}
+
+static struct notifier_block i2c_of_notifier;
+
+#endif
+
 static int __init i2c_init(void)
 {
 	int retval;
@@ -1692,8 +1744,19 @@ static int __init i2c_init(void)
 	retval = i2c_add_driver(&dummy_driver);
 	if (retval)
 		goto class_err;
-	return 0;
 
+#if IS_ENABLED(CONFIG_OF)
+	i2c_of_notifier.notifier_call = of_i2c_notify;
+	retval = of_reconfig_notifier_register(&i2c_of_notifier);
+	if (retval)
+		goto notifier_err;
+#endif
+
+	return 0;
+#if IS_ENABLED(CONFIG_OF)
+notifier_err:
+	i2c_del_driver(&dummy_driver);
+#endif
 class_err:
 #ifdef CONFIG_I2C_COMPAT
 	class_compat_unregister(i2c_adapter_compat_class);
-- 
1.7.12
