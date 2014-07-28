Return-Path: <pantelis.antoniou@konsulko.com>
Return-Path: <pantelis.antoniou@konsulko.com>
From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: [PATCH 1/4] of: Only call notifiers when node is attached
Date: Mon, 28 Jul 2014 23:06:46 +0300
Message-Id: <1406578009-30154-2-git-send-email-pantelis.antoniou@konsulko.com>
In-Reply-To: <1406578009-30154-1-git-send-email-pantelis.antoniou@konsulko.com>
References: <1406578009-30154-1-git-send-email-pantelis.antoniou@konsulko.com>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-ID: <devicetree@vger.kernel.org>

Make sure we call notifier only when the node is attached.
When a detatched tree is being constructed we do not want the
notifiers to fire at all.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
---
 drivers/of/base.c    | 9 ++++++---
 drivers/of/dynamic.c | 5 +----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index a7ad101..108d1f7 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1685,7 +1685,8 @@ int of_add_property(struct device_node *np, struct property *prop)
 
 	mutex_unlock(&of_mutex);
 
-	if (!rc)
+	/* only call notifiers if the node is attached and no error occurred */
+	if (of_node_is_attached(np) && !rc)
 		of_property_notify(OF_RECONFIG_ADD_PROPERTY, np, prop, NULL);
 
 	return rc;
@@ -1741,7 +1742,8 @@ int of_remove_property(struct device_node *np, struct property *prop)
 
 	mutex_unlock(&of_mutex);
 
-	if (!rc)
+	/* only call notifiers if the node is attached and no error occurred */
+	if (of_node_is_attached(np) && !rc)
 		of_property_notify(OF_RECONFIG_REMOVE_PROPERTY, np, prop, NULL);
 
 	return rc;
@@ -1814,7 +1816,8 @@ int of_update_property(struct device_node *np, struct property *newprop)
 
 	mutex_unlock(&of_mutex);
 
-	if (!rc)
+	/* only call notifiers if the node is attached and no error occurred */
+	if (of_node_is_attached(np) && !rc)
 		of_property_notify(OF_RECONFIG_UPDATE_PROPERTY, np, newprop, oldprop);
 
 	return rc;
diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index c1002b7..b82b375 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -87,10 +87,6 @@ int of_property_notify(int action, struct device_node *np,
 {
 	struct of_prop_reconfig pr;
 
-	/* only call notifiers if the node is attached */
-	if (!of_node_is_attached(np))
-		return 0;
-
 	pr.dn = np;
 	pr.prop = prop;
 	pr.old_prop = oldprop;
@@ -135,6 +131,7 @@ int of_attach_node(struct device_node *np)
 	__of_attach_node_sysfs(np);
 	mutex_unlock(&of_mutex);
 
+	/* node is guaranteed to be attached at this point */
 	of_reconfig_notify(OF_RECONFIG_ATTACH_NODE, np);
 
 	return 0;
-- 
1.7.12
