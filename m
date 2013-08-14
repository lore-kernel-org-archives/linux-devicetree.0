Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:53511 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933325Ab3HNV1V (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 14 Aug 2013 17:27:21 -0400
From: Stephen Warren <swarren@wwwdotorg.org>
Subject: [PATCH V6 2/5] of: move of_parse_phandle()
Date: Wed, 14 Aug 2013 15:27:09 -0600
Message-Id: <1376515632-12594-2-git-send-email-swarren@wwwdotorg.org>
In-Reply-To: <1376515632-12594-1-git-send-email-swarren@wwwdotorg.org>
References: <1376515632-12594-1-git-send-email-swarren@wwwdotorg.org>
Sender: devicetree-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Kumar Gala <galak@kernel.crashing.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

From: Stephen Warren <swarren@nvidia.com>

Move of_parse_phandle() after __of_parse_phandle_with_args(), since a
future patch will call __of_parse_phandle_with_args() from
of_parse_phandle(). Moving the function avoids adding a prototype. Doing
the move separately highlights the code changes separately.

Signed-off-by: Stephen Warren <swarren@nvidia.com>
Acked-by: Mark Rutland <mark.rutland@arm.com>
---
v5: New patch.
---
 drivers/of/base.c | 48 ++++++++++++++++++++++++------------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index e485489..9eaf662 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1081,30 +1081,6 @@ int of_property_count_strings(struct device_node *np, const char *propname)
 }
 EXPORT_SYMBOL_GPL(of_property_count_strings);
 
-/**
- * of_parse_phandle - Resolve a phandle property to a device_node pointer
- * @np: Pointer to device node holding phandle property
- * @phandle_name: Name of property holding a phandle value
- * @index: For properties holding a table of phandles, this is the index into
- *         the table
- *
- * Returns the device_node pointer with refcount incremented.  Use
- * of_node_put() on it when done.
- */
-struct device_node *of_parse_phandle(const struct device_node *np,
-				     const char *phandle_name, int index)
-{
-	const __be32 *phandle;
-	int size;
-
-	phandle = of_get_property(np, phandle_name, &size);
-	if ((!phandle) || (size < sizeof(*phandle) * (index + 1)))
-		return NULL;
-
-	return of_find_node_by_phandle(be32_to_cpup(phandle + index));
-}
-EXPORT_SYMBOL(of_parse_phandle);
-
 static int __of_parse_phandle_with_args(const struct device_node *np,
 					const char *list_name,
 					const char *cells_name, int index,
@@ -1208,6 +1184,30 @@ static int __of_parse_phandle_with_args(const struct device_node *np,
 }
 
 /**
+ * of_parse_phandle - Resolve a phandle property to a device_node pointer
+ * @np: Pointer to device node holding phandle property
+ * @phandle_name: Name of property holding a phandle value
+ * @index: For properties holding a table of phandles, this is the index into
+ *         the table
+ *
+ * Returns the device_node pointer with refcount incremented.  Use
+ * of_node_put() on it when done.
+ */
+struct device_node *of_parse_phandle(const struct device_node *np,
+				     const char *phandle_name, int index)
+{
+	const __be32 *phandle;
+	int size;
+
+	phandle = of_get_property(np, phandle_name, &size);
+	if ((!phandle) || (size < sizeof(*phandle) * (index + 1)))
+		return NULL;
+
+	return of_find_node_by_phandle(be32_to_cpup(phandle + index));
+}
+EXPORT_SYMBOL(of_parse_phandle);
+
+/**
  * of_parse_phandle_with_args() - Find a node pointed by phandle in a list
  * @np:		pointer to a device tree node containing a list
  * @list_name:	property name that contains a list
-- 
1.8.1.5

