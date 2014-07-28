Return-Path: <pantelis.antoniou@konsulko.com>
Return-Path: <pantelis.antoniou@konsulko.com>
From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: [PATCH 4/4] of: dynamic: Handle special properties changes
Date: Mon, 28 Jul 2014 23:06:49 +0300
Message-Id: <1406578009-30154-5-git-send-email-pantelis.antoniou@konsulko.com>
In-Reply-To: <1406578009-30154-1-git-send-email-pantelis.antoniou@konsulko.com>
References: <1406578009-30154-1-git-send-email-pantelis.antoniou@konsulko.com>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-ID: <devicetree@vger.kernel.org>

Some node properties are 'special', that is fields in the node
are pointing at it. These are "name", "device_type", and
the phandles ("phandle", "linux,phandle" & "ibm,handle").

Instead of trying to handle them at node attachment, handle
them when the property changes.

Note that name properties are neither removable or updatable.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
---
 drivers/of/base.c    | 26 ++++++++++++++++++++++++++
 drivers/of/dynamic.c | 16 ++++------------
 2 files changed, 30 insertions(+), 12 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 108d1f7..d5324a7 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1645,6 +1645,27 @@ int of_count_phandle_with_args(const struct device_node *np, const char *list_na
 }
 EXPORT_SYMBOL(of_count_phandle_with_args);
 
+/* handle special properties actions */
+static void __of_handle_special_property(struct device_node *np,
+		struct property *prop, unsigned long action)
+{
+	int remove = action == OF_RECONFIG_REMOVE_PROPERTY;
+
+	if (!of_prop_cmp(prop->name, "name")) {
+		/* name properties are non-modifiable */
+		if (action != OF_RECONFIG_ADD_PROPERTY)
+			return;
+		np->name = prop->value;
+	} else if (!of_prop_cmp(prop->name, "device_type"))
+		np->type = !remove ? prop->value : "<NULL>";
+	else if (!of_prop_cmp(prop->name, "phandle") ||
+		!of_prop_cmp(prop->name, "linux,phandle") ||
+		(IS_ENABLED(PPC_PSERIES) &&
+			!of_prop_cmp(prop->name, "ibm,handle")))
+		np->phandle = !remove && prop->length >= 4 ?
+			be32_to_cpup(prop->value) : 0;
+}
+
 /**
  * __of_add_property - Add a property to a node without lock operations
  */
@@ -1663,6 +1684,7 @@ int __of_add_property(struct device_node *np, struct property *prop)
 	}
 	*next = prop;
 
+	__of_handle_special_property(np, prop, OF_RECONFIG_ADD_PROPERTY);
 	return 0;
 }
 
@@ -1708,6 +1730,8 @@ int __of_remove_property(struct device_node *np, struct property *prop)
 	prop->next = np->deadprops;
 	np->deadprops = prop;
 
+	__of_handle_special_property(np, prop, OF_RECONFIG_REMOVE_PROPERTY);
+
 	return 0;
 }
 
@@ -1772,6 +1796,8 @@ int __of_update_property(struct device_node *np, struct property *newprop,
 		*next = newprop;
 	}
 
+	__of_handle_special_property(np, newprop, OF_RECONFIG_UPDATE_PROPERTY);
+
 	return 0;
 }
 
diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index 87fb684..b033239 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -191,18 +191,10 @@ int of_property_notify(int action, struct device_node *np,
 
 void __of_attach_node(struct device_node *np)
 {
-	const __be32 *phandle;
-	int sz;
-
-	np->name = __of_get_property(np, "name", NULL) ? : "<NULL>";
-	np->type = __of_get_property(np, "device_type", NULL) ? : "<NULL>";
-
-	phandle = __of_get_property(np, "phandle", &sz);
-	if (!phandle)
-		phandle = __of_get_property(np, "linux,phandle", &sz);
-	if (IS_ENABLED(PPC_PSERIES) && !phandle)
-		phandle = __of_get_property(np, "ibm,phandle", &sz);
-	np->phandle = (phandle && (sz >= 4)) ? be32_to_cpup(phandle) : 0;
+	if (!np->name)
+		np->name = "<NULL>";
+	if (!np->type)
+		np->type = "<NULL>";
 
 	np->child = NULL;
 	np->sibling = np->parent->child;
-- 
1.7.12
