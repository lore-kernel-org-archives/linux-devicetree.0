Return-Path: <pantelis.antoniou@konsulko.com>
Return-Path: <pantelis.antoniou@konsulko.com>
From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: [PATCH v7 5/9] OF: platform: Add OF notifier handler
Date: Fri,  4 Jul 2014 19:59:24 +0300
Message-Id: <1404493168-8980-6-git-send-email-pantelis.antoniou@konsulko.com>
In-Reply-To: <1404493168-8980-1-git-send-email-pantelis.antoniou@konsulko.com>
References: <1404493168-8980-1-git-send-email-pantelis.antoniou@konsulko.com>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-ID: <devicetree@vger.kernel.org>

Add OF notifier handler needed for creating/destroying platform devices
according to dynamic runtime changes in the DT live tree.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
---
 drivers/base/platform.c     | 18 ++++++++++---
 drivers/of/platform.c       | 62 +++++++++++++++++++++++++++++++++++++++++++++
 include/linux/of_platform.h | 10 ++++++++
 3 files changed, 87 insertions(+), 3 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 9e9227e..ebba70b 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -938,10 +938,22 @@ int __init platform_bus_init(void)
 
 	error = device_register(&platform_bus);
 	if (error)
-		return error;
-	error =  bus_register(&platform_bus_type);
+		goto err_out;
+
+	error = bus_register(&platform_bus_type);
+	if (error)
+		goto err_unreg_dev;
+
+	error = of_platform_register_reconfig_notifier();
 	if (error)
-		device_unregister(&platform_bus);
+		goto err_unreg_bus;
+
+	return 0;
+err_unreg_bus:
+	bus_unregister(&platform_bus_type);
+err_unreg_dev:
+	device_unregister(&platform_bus);
+err_out:
 	return error;
 }
 
diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 0197725..b5d21e2 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -547,4 +547,66 @@ void of_platform_depopulate(struct device *parent)
 }
 EXPORT_SYMBOL_GPL(of_platform_depopulate);
 
+#ifdef CONFIG_OF_DYNAMIC
+
+static struct notifier_block platform_of_notifier;
+
+static int of_platform_notify(struct notifier_block *nb,
+				unsigned long action, void *arg)
+{
+	struct device_node *dn;
+	struct platform_device *pdev_parent, *pdev;
+	bool children_left;
+
+	if (action == OF_RECONFIG_DYNAMIC_CREATE_DEV) {
+
+		dn = arg;
+
+		/* verify that the parent is a bus */
+		if (!of_match_node(of_default_bus_match_table, dn->parent))
+			return NOTIFY_OK;	/* not for us */
+
+		/* pdev_parent may be NULL when no bus platform device */
+		pdev_parent = of_find_device_by_node(dn->parent);
+		pdev = of_platform_device_create(dn, NULL,
+				pdev_parent ? &pdev_parent->dev : NULL);
+		of_dev_put(pdev_parent);
+
+		if (pdev == NULL) {
+			pr_err("%s: failed to create for '%s'\n",
+					__func__, dn->full_name);
+			/* of_platform_device_create tosses the error code */
+			return notifier_from_errno(-EINVAL);
+		}
+
+	} else if (action == OF_RECONFIG_DYNAMIC_DESTROY_DEV) {
+
+		dn = arg;
+
+		/* find our device by node */
+		pdev = of_find_device_by_node(dn);
+		if (pdev == NULL)
+			return NOTIFY_OK;	/* no? not meant for us */
+
+		/* unregister takes one ref away */
+		of_platform_device_destroy(&pdev->dev, &children_left);
+
+		/* and put the reference of the find */
+		of_dev_put(pdev);
+
+	} else
+		return NOTIFY_OK;
+
+	return NOTIFY_STOP;
+}
+
+int of_platform_register_reconfig_notifier(void)
+{
+	platform_of_notifier.notifier_call = of_platform_notify;
+	return of_reconfig_notifier_register(&platform_of_notifier);
+}
+EXPORT_SYMBOL_GPL(of_platform_register_reconfig_notifier);
+
+#endif
+
 #endif /* CONFIG_OF_ADDRESS */
diff --git a/include/linux/of_platform.h b/include/linux/of_platform.h
index c2b0627..01fe5d6 100644
--- a/include/linux/of_platform.h
+++ b/include/linux/of_platform.h
@@ -84,4 +84,14 @@ static inline int of_platform_populate(struct device_node *root,
 static inline void of_platform_depopulate(struct device *parent) { }
 #endif
 
+#ifdef CONFIG_OF_DYNAMIC
+extern int of_platform_register_reconfig_notifier(void);
+#else
+static inline int of_platform_register_reconfig_notifier(void)
+{
+	return 0;
+}
+#endif
+
+
 #endif	/* _LINUX_OF_PLATFORM_H */
-- 
1.7.12
