Return-Path: <pantelis.antoniou@konsulko.com>
Return-Path: <pantelis.antoniou@konsulko.com>
From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: [PATCH 1/6] of: Do not free memory at of_node_release
Date: Sun, 22 Jun 2014 12:40:34 +0300
Message-Id: <1403430039-15085-2-git-send-email-pantelis.antoniou@konsulko.com>
In-Reply-To: <1403430039-15085-1-git-send-email-pantelis.antoniou@konsulko.com>
References: <1403430039-15085-1-git-send-email-pantelis.antoniou@konsulko.com>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-ID: <devicetree@vger.kernel.org>

The life-cycle of nodes and properties does not allow us to release
the memory taken by a device_node. Pointer to properties and nodes
might still be in use in drivers, so any memory free'ing is dangerous.

Simply move all the properties to the deadprops list, and the node
itself to of_alldeadnodes until the life-cycles issues are resolved.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
---
 drivers/of/base.c | 43 ++++++++++++++++++++++++++++---------------
 1 file changed, 28 insertions(+), 15 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index b986480..d3493e1 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -110,17 +110,27 @@ static inline struct device_node *kobj_to_device_node(struct kobject *kobj)
 	return container_of(kobj, struct device_node, kobj);
 }
 
+static struct device_node *of_alldeadnodes;
+static DEFINE_RAW_SPINLOCK(deadtree_lock);
+
 /**
  *	of_node_release - release a dynamically allocated node
  *	@kref:  kref element of the node to be released
  *
  *	In of_node_put() this function is passed to kref_put()
  *	as the destructor.
+ *
+ *	Note that due to the way that node and property life-cycles
+ *	are not completely managed, we can't free the memory of
+ *	a node at will. Instead we move the node to the dead nodes
+ *	list where it will remain until the life-cycle issues are
+ *	resolved.
  */
 static void of_node_release(struct kobject *kobj)
 {
 	struct device_node *node = kobj_to_device_node(kobj);
-	struct property *prop = node->properties;
+	struct property *prop;
+	unsigned long flags;
 
 	/* We should never be releasing nodes that haven't been detached. */
 	if (!of_node_check_flag(node, OF_DETACHED)) {
@@ -129,24 +139,27 @@ static void of_node_release(struct kobject *kobj)
 		return;
 	}
 
-	if (!of_node_check_flag(node, OF_DYNAMIC))
+	pr_info("%s: dead node \"%s\"\n", __func__, node->full_name);
+
+	/* we should not be trying to release the root */
+	if (WARN_ON(node == of_allnodes))
 		return;
 
-	while (prop) {
-		struct property *next = prop->next;
-		kfree(prop->name);
-		kfree(prop->value);
-		kfree(prop);
-		prop = next;
+	/* can't use devtree lock; at of_node_put caller might be holding it */
+	raw_spin_lock_irqsave(&deadtree_lock, flags);
 
-		if (!prop) {
-			prop = node->deadprops;
-			node->deadprops = NULL;
-		}
+	/* move all properties to dead properties */
+	while ((prop = node->properties) != NULL) {
+		node->properties = prop->next;
+		prop->next = node->deadprops;
+		node->deadprops = prop;
 	}
-	kfree(node->full_name);
-	kfree(node->data);
-	kfree(node);
+
+	/* move node to alldeadnodes */
+	node->allnext = of_alldeadnodes;
+	of_alldeadnodes = node;
+
+	raw_spin_unlock_irqrestore(&deadtree_lock, flags);
 }
 
 /**
-- 
1.7.12
