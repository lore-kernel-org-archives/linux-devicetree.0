Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:42243 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S967908Ab3HIQ6A (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Fri, 9 Aug 2013 12:58:00 -0400
From: Stephen Warren <swarren@wwwdotorg.org>
Subject: [PATCH V4 2/4] of: move documentation of of_parse_phandle_with_args
Date: Fri,  9 Aug 2013 10:57:47 -0600
Message-Id: <1376067469-8811-2-git-send-email-swarren@wwwdotorg.org>
In-Reply-To: <1376067469-8811-1-git-send-email-swarren@wwwdotorg.org>
References: <1376067469-8811-1-git-send-email-swarren@wwwdotorg.org>
Sender: devicetree-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@linaro.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Kumar Gala <galak@kernel.crashing.org>, Stephen Warren <swarren@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

From: Stephen Warren <swarren@nvidia.com>

Commit bd69f73 "of: Create function for counting number of phandles in
a property" renamed of_parse_phandle_with_args(), and created a wrapper
function that implemented the original name. However, the documentation
of the original function was not moved, leaving it apparently documenting
the newly renamed function.

Move the documentation so that it is adjacent to the function it
documents.

Signed-off-by: Stephen Warren <swarren@nvidia.com>
Acked-by: Mark Rutland <mark.rutland@arm.com>
---
Rob, Grant, Linus needs your ack on this so he can take the change through
the GPIO tree along with the others.
 
 drivers/of/base.c | 64 +++++++++++++++++++++++++++----------------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 5c54279..23e7073 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1104,38 +1104,6 @@ struct device_node *of_parse_phandle(const struct device_node *np,
 }
 EXPORT_SYMBOL(of_parse_phandle);
 
-/**
- * of_parse_phandle_with_args() - Find a node pointed by phandle in a list
- * @np:		pointer to a device tree node containing a list
- * @list_name:	property name that contains a list
- * @cells_name:	property name that specifies phandles' arguments count
- * @index:	index of a phandle to parse out
- * @out_args:	optional pointer to output arguments structure (will be filled)
- *
- * This function is useful to parse lists of phandles and their arguments.
- * Returns 0 on success and fills out_args, on error returns appropriate
- * errno value.
- *
- * Caller is responsible to call of_node_put() on the returned out_args->node
- * pointer.
- *
- * Example:
- *
- * phandle1: node1 {
- * 	#list-cells = <2>;
- * }
- *
- * phandle2: node2 {
- * 	#list-cells = <1>;
- * }
- *
- * node3 {
- * 	list = <&phandle1 1 2 &phandle2 3>;
- * }
- *
- * To get a device_node of the `node2' node you may call this:
- * of_parse_phandle_with_args(node3, "list", "#list-cells", 1, &args);
- */
 static int __of_parse_phandle_with_args(const struct device_node *np,
 					const char *list_name,
 					const char *cells_name, int index,
@@ -1238,6 +1206,38 @@ static int __of_parse_phandle_with_args(const struct device_node *np,
 	return rc;
 }
 
+/**
+ * of_parse_phandle_with_args() - Find a node pointed by phandle in a list
+ * @np:		pointer to a device tree node containing a list
+ * @list_name:	property name that contains a list
+ * @cells_name:	property name that specifies phandles' arguments count
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
+ * 	#list-cells = <2>;
+ * }
+ *
+ * phandle2: node2 {
+ * 	#list-cells = <1>;
+ * }
+ *
+ * node3 {
+ * 	list = <&phandle1 1 2 &phandle2 3>;
+ * }
+ *
+ * To get a device_node of the `node2' node you may call this:
+ * of_parse_phandle_with_args(node3, "list", "#list-cells", 1, &args);
+ */
 int of_parse_phandle_with_args(const struct device_node *np, const char *list_name,
 				const char *cells_name, int index,
 				struct of_phandle_args *out_args)
-- 
1.8.1.5

