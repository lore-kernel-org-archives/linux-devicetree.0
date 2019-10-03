From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v9 09/12] lib/vsprintf: Make use of fwnode API to obtain node names and separators
Date: Thu,  3 Oct 2019 15:32:16 +0300
Message-ID: <20191003123219.11237-10-sakari.ailus@linux.intel.com>
References: <20191003123219.11237-1-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191003123219.11237-1-sakari.ailus@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, rafael@kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Joe Perches <joe@perches.com>
List-Id: devicetree@vger.kernel.org

Instead of implementing our own means of discovering parent nodes, node
names or counting how many parents a node has, use the newly added
functions in the fwnode API to obtain that information.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Petr Mladek <pmladek@suse.com>
---
 lib/vsprintf.c | 39 +++++++++++++++++----------------------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index cf48769fe330c..c2be0e5bc087d 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -38,6 +38,7 @@
 #include <net/addrconf.h>
 #include <linux/siphash.h>
 #include <linux/compiler.h>
+#include <linux/property.h>
 #ifdef CONFIG_BLOCK
 #include <linux/blkdev.h>
 #endif
@@ -1863,32 +1864,25 @@ char *flags_string(char *buf, char *end, void *flags_ptr,
 	return format_flags(buf, end, flags, names);
 }
 
-static const char *device_node_name_for_depth(const struct device_node *np, int depth)
-{
-	for ( ; np && depth; depth--)
-		np = np->parent;
-
-	return kbasename(np->full_name);
-}
-
 static noinline_for_stack
-char *device_node_gen_full_name(const struct device_node *np, char *buf, char *end)
+char *fwnode_full_name_string(struct fwnode_handle *fwnode, char *buf,
+			      char *end)
 {
 	int depth;
-	const struct device_node *parent = np->parent;
 
-	/* special case for root node */
-	if (!parent)
-		return string_nocheck(buf, end, "/", default_str_spec);
+	/* Loop starting from the root node to the current node. */
+	for (depth = fwnode_count_parents(fwnode); depth >= 0; depth--) {
+		struct fwnode_handle *__fwnode =
+			fwnode_get_nth_parent(fwnode, depth);
 
-	for (depth = 0; parent->parent; depth++)
-		parent = parent->parent;
-
-	for ( ; depth >= 0; depth--) {
-		buf = string_nocheck(buf, end, "/", default_str_spec);
-		buf = string(buf, end, device_node_name_for_depth(np, depth),
+		buf = string(buf, end, fwnode_get_name_prefix(__fwnode),
+			     default_str_spec);
+		buf = string(buf, end, fwnode_get_name(__fwnode),
 			     default_str_spec);
+
+		fwnode_handle_put(__fwnode);
 	}
+
 	return buf;
 }
 
@@ -1933,10 +1927,11 @@ char *device_node_string(char *buf, char *end, struct device_node *dn,
 
 		switch (*fmt) {
 		case 'f':	/* full_name */
-			buf = device_node_gen_full_name(dn, buf, end);
+			buf = fwnode_full_name_string(of_fwnode_handle(dn), buf,
+						      end);
 			break;
 		case 'n':	/* name */
-			p = kbasename(of_node_full_name(dn));
+			p = fwnode_get_name(of_fwnode_handle(dn));
 			precision = str_spec.precision;
 			str_spec.precision = strchrnul(p, '@') - p;
 			buf = string(buf, end, p, str_spec);
@@ -1946,7 +1941,7 @@ char *device_node_string(char *buf, char *end, struct device_node *dn,
 			buf = number(buf, end, (unsigned int)dn->phandle, num_spec);
 			break;
 		case 'P':	/* path-spec */
-			p = kbasename(of_node_full_name(dn));
+			p = fwnode_get_name(of_fwnode_handle(dn));
 			if (!p[1])
 				p = "/";
 			buf = string(buf, end, p, str_spec);
-- 
2.20.1
