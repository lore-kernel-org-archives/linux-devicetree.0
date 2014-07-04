Return-Path: <pantelis.antoniou@konsulko.com>
Return-Path: <pantelis.antoniou@konsulko.com>
From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: [PATCH v7 9/9] OF: spi: Add OF notifier handler
Date: Fri,  4 Jul 2014 19:59:28 +0300
Message-Id: <1404493168-8980-10-git-send-email-pantelis.antoniou@konsulko.com>
In-Reply-To: <1404493168-8980-1-git-send-email-pantelis.antoniou@konsulko.com>
References: <1404493168-8980-1-git-send-email-pantelis.antoniou@konsulko.com>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-ID: <devicetree@vger.kernel.org>

Add OF notifier handler needed for creating/destroying spi devices
according to dynamic runtime changes in the DT live tree.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
---
 drivers/spi/spi.c | 64 ++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index cd98bf2..d2a02ba 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -2343,6 +2343,57 @@ EXPORT_SYMBOL_GPL(spi_write_then_read);
 
 /*-------------------------------------------------------------------------*/
 
+#if IS_ENABLED(CONFIG_OF)
+
+static int of_spi_notify(struct notifier_block *nb,
+				unsigned long action, void *arg)
+{
+	struct device_node *dn;
+	struct spi_master *master;
+	struct spi_device *spi;
+
+	if (action == OF_RECONFIG_DYNAMIC_CREATE_DEV) {
+
+		dn = arg;
+
+		master = of_find_spi_master_by_node(dn->parent);
+		if (master == NULL)
+			return NOTIFY_OK;	/* not for us */
+
+		spi = of_register_spi_device(master, dn);
+		put_device(&master->dev);
+
+		if (IS_ERR(spi)) {
+			pr_err("%s: failed to create for '%s'\n",
+					__func__, dn->full_name);
+			return notifier_from_errno(PTR_ERR(spi));
+		}
+
+	} else if (action == OF_RECONFIG_DYNAMIC_DESTROY_DEV) {
+
+		dn = arg;
+
+		/* find our device by node */
+		spi = of_find_spi_device_by_node(dn);
+		if (spi == NULL)
+			return NOTIFY_OK;	/* no? not meant for us */
+
+		/* unregister takes one ref away */
+		spi_unregister_device(spi);
+
+		/* and put the reference of the find */
+		put_device(&spi->dev);
+
+	} else
+		return NOTIFY_OK;
+
+	return NOTIFY_STOP;
+}
+
+static struct notifier_block spi_of_notifier;
+
+#endif
+
 static int __init spi_init(void)
 {
 	int	status;
@@ -2360,8 +2411,19 @@ static int __init spi_init(void)
 	status = class_register(&spi_master_class);
 	if (status < 0)
 		goto err2;
-	return 0;
 
+#if IS_ENABLED(CONFIG_OF)
+	spi_of_notifier.notifier_call = of_spi_notify;
+	status = of_reconfig_notifier_register(&spi_of_notifier);
+	if (status)
+		goto err3;
+#endif
+
+	return 0;
+#if IS_ENABLED(CONFIG_OF)
+err3:
+	class_unregister(&spi_master_class);
+#endif
 err2:
 	bus_unregister(&spi_bus_type);
 err1:
-- 
1.7.12
