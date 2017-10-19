From: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: Re: [PATCH v3] of: dynamic: fix memory leak related to properties of __of_node_dup
Date: Thu, 19 Oct 2017 16:34:49 -0700
Message-ID: <1508456089-32293-1-git-send-email-frowand.list@gmail.com>
References: <59E934A1.9060304@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <59E934A1.9060304-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lixin Wang <alan.1.wang-FTnzSCDXTkYjo0HpFSRKWA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

This is Lixin's patch v3, reworded for my preferred style.

---
If Lixin agrees,

   Reviewed-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>


 drivers/of/dynamic.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index 301b6db2b48d..f33b7c2e703e 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -315,6 +315,17 @@ int of_detach_node(struct device_node *np)
 }
 EXPORT_SYMBOL_GPL(of_detach_node);
 
+static void property_list_free(struct property *prop_list)
+{
+	struct property *prop;
+
+	for (prop = prop_list; prop != NULL; prop = prop->next) {
+		kfree(prop->name);
+		kfree(prop->value);
+		kfree(prop);
+	}
+}
+
 /**
  * of_node_release() - release a dynamically allocated node
  * @kref: kref element of the node to be released
@@ -324,7 +335,6 @@ int of_detach_node(struct device_node *np)
 void of_node_release(struct kobject *kobj)
 {
 	struct device_node *node = kobj_to_device_node(kobj);
-	struct property *prop = node->properties;
 
 	/* We should never be releasing nodes that haven't been detached. */
 	if (!of_node_check_flag(node, OF_DETACHED)) {
@@ -335,18 +345,9 @@ void of_node_release(struct kobject *kobj)
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
Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
