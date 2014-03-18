From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 5/7] OF: i2c: Add overlay bus handler
Date: Tue, 18 Mar 2014 23:56:04 +0200
Message-ID: <1395179766-31575-6-git-send-email-pantelis.antoniou@konsulko.com>
References: <1395179766-31575-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395179766-31575-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Alison Chaiken <Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Lubbe <jluebbe-H4yykcOXDpCzQB+pC5nmwQ@public.gmane.org>, Alexander Sverdlin <alexander.sverdlin-OYasijW0DpE@public.gmane.org>, Michael Stickel <ms-g5CePrrZ5ROELgA04lAiVw@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Dirk Behme <dirk.behme-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Michael Bohan <mbohan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ionut Nicu <ioan.nicu.ext-OYasijW0DpE@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pete Popov <pete.popov-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Dan Malek <dan.malek-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Georgi Vlaev <georgi.vlaev-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add the bus handler registration needed for performing overlays
containing i2c devices.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 drivers/i2c/i2c-core.c | 87 +++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 86 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core.c b/drivers/i2c/i2c-core.c
index 5fb80b8..5120d28 100644
--- a/drivers/i2c/i2c-core.c
+++ b/drivers/i2c/i2c-core.c
@@ -1073,10 +1073,89 @@ struct i2c_adapter *of_find_i2c_adapter_by_node(struct device_node *node)
 	return i2c_verify_adapter(dev);
 }
 EXPORT_SYMBOL(of_find_i2c_adapter_by_node);
+
+#ifdef CONFIG_OF_OVERLAY
+static int i2c_handler_create(struct of_overlay_device_entry *de,
+		int revert)
+{
+	struct device_node *dn;
+	struct i2c_adapter *adap;
+	struct i2c_client *client;
+
+	if (!de || !de->np)
+		return -ENOTSUPP;
+
+	dn = de->np;
+
+	adap = of_find_i2c_adapter_by_node(dn->parent);
+	if (adap == NULL)
+		return -ENOTSUPP;
+
+	client = of_i2c_register_device(adap, dn);
+	put_device(&adap->dev);
+
+	if (client == NULL) {
+		pr_err("%s: failed to create i2c client device "
+				"for '%s'\n",
+				__func__, dn->full_name);
+		/* of_i2c_device_create tosses the real error code */
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int i2c_handler_remove(struct of_overlay_device_entry *de,
+		int revert)
+{
+	struct device_node *dn;
+	struct i2c_client *client;
+
+	if (!de || !de->np)
+		return -ENOTSUPP;
+
+	dn = de->np;
+
+	client = of_find_i2c_device_by_node(dn);
+	if (client == NULL)
+		return -ENOTSUPP;
+
+	/* unregister takes one ref away */
+	i2c_unregister_device(client);
+
+	/* and put the reference of the find */
+	put_device(&client->dev);
+
+	return 0;
+}
+
+static const struct of_overlay_handler_ops i2c_handler_ops = {
+	.create	= i2c_handler_create,
+	.remove = i2c_handler_remove,
+};
+
+static struct of_overlay_handler i2c_handler = {
+	.name = "i2c",
+	.ops = &i2c_handler_ops,
+};
+
+static int __init i2c_bus_handler_register(void)
+{
+	return of_overlay_handler_register(&i2c_handler);
+}
+#endif
+
 #else
 static void of_i2c_register_devices(struct i2c_adapter *adap) { }
 #endif /* CONFIG_OF */
 
+#if !defined(CONFIG_OF) || !defined(CONFIG_OF_OVERLAY)
+static inline int i2c_bus_handler_register(void)
+{
+	return 0;
+}
+#endif
+
 /* ACPI support code */
 
 #if IS_ENABLED(CONFIG_ACPI)
@@ -1668,8 +1747,14 @@ static int __init i2c_init(void)
 	retval = i2c_add_driver(&dummy_driver);
 	if (retval)
 		goto class_err;
-	return 0;
 
+	retval = i2c_bus_handler_register();
+	if (retval)
+		goto bus_handler_err;
+
+	return 0;
+bus_handler_err:
+	i2c_del_driver(&dummy_driver);
 class_err:
 #ifdef CONFIG_I2C_COMPAT
 	class_compat_unregister(i2c_adapter_compat_class);
-- 
1.7.12

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
