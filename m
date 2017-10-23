From: Lixin Wang <alan.1.wang@nokia-sbell.com>
Subject: [PATCH v5] of: dynamic: fix memory leak related to properties of __of_node_dup
Date: Mon, 23 Oct 2017 11:19:53 +0800
Message-ID: <1508728793-1213-1-git-send-email-alan.1.wang@nokia-sbell.com>
References: <1507858967-40416-1-git-send-email-alan.1.wang@nokia-sbell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1507858967-40416-1-git-send-email-alan.1.wang@nokia-sbell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Lixin Wang <alan.1.wang@nokia-sbell.com>
List-Id: devicetree@vger.kernel.org

If a node with no properties is dynamically added, then a property is
dynamically added to the node, then the property is dynamically removed,
the result will be node->properties == NULL and node->deadprops != NULL.

Add a separate function to release the properties in both lists.

Signed-off-by: Lixin Wang <alan.1.wang@nokia-sbell.com>
---
 v4 -> v5:
 * fix the bug in v4, that the prop->next should be saved before release
   the prop.

 drivers/of/dynamic.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index 301b6db..39d69d3 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -315,6 +315,18 @@ int of_detach_node(struct device_node *np)
 }
 EXPORT_SYMBOL_GPL(of_detach_node);
 
+static void property_list_free(struct property *prop_list)
+{
+	struct property *prop, *next;
+
+	for (prop = prop_list; prop != NULL; prop = next) {
+		next = prop->next;
+		kfree(prop->name);
+		kfree(prop->value);
+		kfree(prop);
+	}
+}
+
 /**
  * of_node_release() - release a dynamically allocated node
  * @kref: kref element of the node to be released
@@ -324,7 +336,6 @@ EXPORT_SYMBOL_GPL(of_detach_node);
 void of_node_release(struct kobject *kobj)
 {
 	struct device_node *node = kobj_to_device_node(kobj);
-	struct property *prop = node->properties;
 
 	/* We should never be releasing nodes that haven't been detached. */
 	if (!of_node_check_flag(node, OF_DETACHED)) {
@@ -335,18 +346,9 @@ void of_node_release(struct kobject *kobj)
 	if (!of_node_check_flag(node, OF_DYNAMIC))
 		return;
 
-	while (prop) {
-		struct property *next = prop->next;
-		kfree(prop->name);
-		kfree(prop->value);
-		kfree(prop);
-		prop = next;
+	property_list_free(node->properties);
+	property_list_free(node->deadprops);
 
-		if (!prop) {
-			prop = node->deadprops;
-			node->deadprops = NULL;
-		}
-	}
 	kfree(node->full_name);
 	kfree(node->data);
 	kfree(node);
-- 
2.6.2
