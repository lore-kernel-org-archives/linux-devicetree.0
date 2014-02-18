From: Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] of: reimplement the matching method for __of_match_node()
Date: Tue, 18 Feb 2014 15:57:30 +0800
Message-ID: <1392710250-29913-3-git-send-email-haokexin@gmail.com>
References: <1392710250-29913-1-git-send-email-haokexin@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392710250-29913-1-git-send-email-haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen N Chivers <schivers-znpAAEhiOVUQrrorzV6ljw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In the current implementation of __of_match_node(), it will compare
each given match entry against all the node's compatible strings
with of_device_is_compatible().

To achieve multiple compatible strings per node with ordering from
specific to generic, this requires given matches to be ordered from
specific to generic. For most of the drivers this is not true and
also an alphabetical ordering is more sane there.

Therefore, we define a following priority order for the match, and
then scan all the entries to find the best match.
  1. specific compatible && type && name
  2. specific compatible && type
  3. specific compatible && name
  4. specific compatible
  5. general compatible && type && name
  6. general compatible && type
  7. general compatible && name
  8. general compatible
  9. type && name
  10. type
  11. name

This is based on some pseudo-codes provided by Grant Likely.

Signed-off-by: Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/of/base.c | 87 +++++++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 68 insertions(+), 19 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index ba195fbce4c6..378091f8460c 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -342,21 +342,28 @@ struct device_node *of_get_cpu_node(int cpu, unsigned int *thread)
 }
 EXPORT_SYMBOL(of_get_cpu_node);
 
-/** Checks if the given "compat" string matches one of the strings in
- * the device's "compatible" property
+/*
+ * Compare with the __of_device_is_compatible, this will return a score for the
+ * matching strings. The smaller value indicates the match for the more specific
+ * compatible string.
  */
-static int __of_device_is_compatible(const struct device_node *device,
-				     const char *compat)
+static int __of_device_is_compatible_score(const struct device_node *device,
+				     const char *compat, unsigned int *pscore)
 {
 	const char* cp;
 	int cplen, l;
+	unsigned int score = 0;
 
 	cp = __of_get_property(device, "compatible", &cplen);
 	if (cp == NULL)
 		return 0;
 	while (cplen > 0) {
-		if (of_compat_cmp(cp, compat, strlen(compat)) == 0)
+		score++;
+		if (of_compat_cmp(cp, compat, strlen(compat)) == 0) {
+			if (pscore)
+				*pscore = score;
 			return 1;
+		}
 		l = strlen(cp) + 1;
 		cp += l;
 		cplen -= l;
@@ -368,6 +375,15 @@ static int __of_device_is_compatible(const struct device_node *device,
 /** Checks if the given "compat" string matches one of the strings in
  * the device's "compatible" property
  */
+static int __of_device_is_compatible(const struct device_node *device,
+				     const char *compat)
+{
+	return __of_device_is_compatible_score(device, compat, NULL);
+}
+
+/** Checks if the given "compat" string matches one of the strings in
+ * the device's "compatible" property
+ */
 int of_device_is_compatible(const struct device_node *device,
 		const char *compat)
 {
@@ -734,25 +750,46 @@ static
 const struct of_device_id *__of_match_node(const struct of_device_id *matches,
 					   const struct device_node *node)
 {
+	const struct of_device_id *best_match = NULL;
+	unsigned int best_score = ~0;
+
 	if (!matches)
 		return NULL;
 
 	while (matches->name[0] || matches->type[0] || matches->compatible[0]) {
-		int match = 1;
-		if (matches->name[0])
-			match &= node->name
-				&& !strcmp(matches->name, node->name);
-		if (matches->type[0])
-			match &= node->type
-				&& !strcmp(matches->type, node->type);
-		if (matches->compatible[0])
-			match &= __of_device_is_compatible(node,
-							   matches->compatible);
-		if (match)
-			return matches;
+		unsigned int score = ~0;
+
+		/*
+		 * Matching compatible is better than matching type and name,
+		 * and the specific compatible is better than the general.
+		 */
+		if (matches->compatible[0] &&
+			 __of_device_is_compatible_score(node,
+						matches->compatible, &score))
+			score *= 10;
+
+		/*
+		 * Matching type is better than matching name, but matching
+		 * both is even better than that.
+		 */
+		if (matches->type[0] && node->type &&
+			!strcmp(matches->type, node->type))
+			score -= 2;
+
+		/* Matching name is a bit better than not */
+		if (matches->name[0] && node->name &&
+			!strcmp(matches->name, node->name))
+			score--;
+
+		if (score < best_score) {
+			best_match = matches;
+			best_score = score;
+		}
+
 		matches++;
 	}
-	return NULL;
+
+	return best_match;
 }
 
 /**
@@ -760,7 +797,19 @@ const struct of_device_id *__of_match_node(const struct of_device_id *matches,
  *	@matches:	array of of device match structures to search in
  *	@node:		the of device structure to match against
  *
- *	Low level utility function used by device matching.
+ *	Low level utility function used by device matching. The priority order
+ *	for the matching is:
+ *	  1. specific compatible && type && name
+ *	  2. specific compatible && type
+ *	  3. specific compatible && name
+ *	  4. specific compatible
+ *	  5. general compatible && type && name
+ *	  6. general compatible && type
+ *	  7. general compatible && name
+ *	  8. general compatible
+ *	  9. type && name
+ *	  10. type
+ *	  11. name
  */
 const struct of_device_id *of_match_node(const struct of_device_id *matches,
 					 const struct device_node *node)
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
