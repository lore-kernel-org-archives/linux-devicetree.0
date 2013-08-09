Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:40583 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S968243Ab3HIQ6C (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Fri, 9 Aug 2013 12:58:02 -0400
From: Stephen Warren <swarren@wwwdotorg.org>
Subject: [PATCH V4 3/4] of: introduce of_parse_phandle_with_fixed_args
Date: Fri,  9 Aug 2013 10:57:48 -0600
Message-Id: <1376067469-8811-3-git-send-email-swarren@wwwdotorg.org>
In-Reply-To: <1376067469-8811-1-git-send-email-swarren@wwwdotorg.org>
References: <1376067469-8811-1-git-send-email-swarren@wwwdotorg.org>
Sender: devicetree-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@linaro.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Kumar Gala <galak@kernel.crashing.org>, Stephen Warren <swarren@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

From: Stephen Warren <swarren@nvidia.com>

This is identical to of_parse_phandle_with_args(), except that the
number of argument cells is fixed, rather than being parsed out of the
node referenced by each phandle.

Signed-off-by: Stephen Warren <swarren@nvidia.com>
Acked-by: Mark Rutland <mark.rutland@arm.com>
---
Rob, Grant, Linus needs your ack on this so he can take the change through
the GPIO tree along with the others.

v3: s/cells_count/cell_count, add missing braces per coding style
---
 drivers/of/base.c  | 66 +++++++++++++++++++++++++++++++++++++++++++++++-------
 include/linux/of.h | 10 +++++++++
 2 files changed, 68 insertions(+), 8 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 23e7073..2c9a808 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1106,7 +1106,8 @@ EXPORT_SYMBOL(of_parse_phandle);
 
 static int __of_parse_phandle_with_args(const struct device_node *np,
 					const char *list_name,
-					const char *cells_name, int index,
+					const char *cells_name,
+					int cell_count, int index,
 					struct of_phandle_args *out_args)
 {
 	const __be32 *list, *list_end;
@@ -1142,11 +1143,17 @@ static int __of_parse_phandle_with_args(const struct device_node *np,
 					 np->full_name);
 				goto err;
 			}
-			if (of_property_read_u32(node, cells_name, &count)) {
-				pr_err("%s: could not get %s for %s\n",
-					 np->full_name, cells_name,
-					 node->full_name);
-				goto err;
+
+			if (cells_name) {
+				if (of_property_read_u32(node, cells_name,
+							 &count)) {
+					pr_err("%s: could not get %s for %s\n",
+						np->full_name, cells_name,
+						node->full_name);
+					goto err;
+				}
+			} else {
+				count = cell_count;
 			}
 
 			/*
@@ -1244,11 +1251,53 @@ int of_parse_phandle_with_args(const struct device_node *np, const char *list_na
 {
 	if (index < 0)
 		return -EINVAL;
-	return __of_parse_phandle_with_args(np, list_name, cells_name, index, out_args);
+	return __of_parse_phandle_with_args(np, list_name, cells_name, 0,
+					    index, out_args);
 }
 EXPORT_SYMBOL(of_parse_phandle_with_args);
 
 /**
+ * of_parse_phandle_with_fixed_args() - Find a node pointed by phandle in a list
+ * @np:		pointer to a device tree node containing a list
+ * @list_name:	property name that contains a list
+ * @cell_count: number of argument cells following the phandle
+ * @index:	index of a phandle to parse out
+ * @out_args:	optional pointer to output arguments structure (will be filled)
+ *
+ * This function is useful to parse lists of phandles and their arguments.
+ * Returns 0 on success and fills out_args, on error returns appropriate
+ * errno value.
+ *
+ * Caller is responsible to call of_node_put() on the returned out_args->node
+ * pointer.
+ *
+ * Example:
+ *
+ * phandle1: node1 {
+ * }
+ *
+ * phandle2: node2 {
+ * }
+ *
+ * node3 {
+ * 	list = <&phandle1 0 2 &phandle2 2 3>;
+ * }
+ *
+ * To get a device_node of the `node2' node you may call this:
+ * of_parse_phandle_with_fixed_args(node3, "list", 2, 1, &args);
+ */
+int of_parse_phandle_with_fixed_args(const struct device_node *np,
+				const char *list_name, int cell_count,
+				int index, struct of_phandle_args *out_args)
+{
+	if (index < 0)
+		return -EINVAL;
+	return __of_parse_phandle_with_args(np, list_name, NULL, cell_count,
+					   index, out_args);
+}
+EXPORT_SYMBOL(of_parse_phandle_with_fixed_args);
+
+/**
  * of_count_phandle_with_args() - Find the number of phandles references in a property
  * @np:		pointer to a device tree node containing a list
  * @list_name:	property name that contains a list
@@ -1266,7 +1315,8 @@ EXPORT_SYMBOL(of_parse_phandle_with_args);
 int of_count_phandle_with_args(const struct device_node *np, const char *list_name,
 				const char *cells_name)
 {
-	return __of_parse_phandle_with_args(np, list_name, cells_name, -1, NULL);
+	return __of_parse_phandle_with_args(np, list_name, cells_name, 0, -1,
+					    NULL);
 }
 EXPORT_SYMBOL(of_count_phandle_with_args);
 
diff --git a/include/linux/of.h b/include/linux/of.h
index 1fd08ca..0c457f5 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -280,6 +280,9 @@ extern struct device_node *of_parse_phandle(const struct device_node *np,
 extern int of_parse_phandle_with_args(const struct device_node *np,
 	const char *list_name, const char *cells_name, int index,
 	struct of_phandle_args *out_args);
+extern int of_parse_phandle_with_fixed_args(const struct device_node *np,
+	const char *list_name, int cells_count, int index,
+	struct of_phandle_args *out_args);
 extern int of_count_phandle_with_args(const struct device_node *np,
 	const char *list_name, const char *cells_name);
 
@@ -488,6 +491,13 @@ static inline int of_parse_phandle_with_args(struct device_node *np,
 	return -ENOSYS;
 }
 
+static inline int of_parse_phandle_with_fixed_args(const struct device_node *np,
+	const char *list_name, int cells_count, int index,
+	struct of_phandle_args *out_args)
+{
+	return -ENOSYS;
+}
+
 static inline int of_count_phandle_with_args(struct device_node *np,
 					     const char *list_name,
 					     const char *cells_name)
-- 
1.8.1.5

