From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] of/device: use of_property_for_each_string to parse compatible strings
Date: Mon, 24 Jul 2017 10:14:37 -0500
Message-ID: <20170724151438.7069-1-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Instead of directly parsing the compatible property, use the
of_property_for_each_string() helper to iterate over each compatible
string. This reduces the LoC and makes the functions easier to
understand.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/of/device.c | 66 +++++++++++++++++++----------------------------------
 1 file changed, 23 insertions(+), 43 deletions(-)

diff --git a/drivers/of/device.c b/drivers/of/device.c
index f9f31d66f64d..9d0895fb53b5 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -195,9 +195,10 @@ EXPORT_SYMBOL(of_device_get_match_data);
 
 static ssize_t of_device_get_modalias(struct device *dev, char *str, ssize_t len)
 {
-	const char *compat;
-	int cplen, i;
-	ssize_t tsize, csize, repend;
+	const char *compat, *start = str;
+	char *c;
+	struct property *p;
+	ssize_t csize;
 
 	if ((!dev) || (!dev->of_node))
 		return -ENODEV;
@@ -205,42 +206,24 @@ static ssize_t of_device_get_modalias(struct device *dev, char *str, ssize_t len
 	/* Name & Type */
 	csize = snprintf(str, len, "of:N%sT%s", dev->of_node->name,
 			 dev->of_node->type);
-
-	/* Get compatible property if any */
-	compat = of_get_property(dev->of_node, "compatible", &cplen);
-	if (!compat)
-		return csize;
-
-	/* Find true end (we tolerate multiple \0 at the end */
-	for (i = (cplen - 1); i >= 0 && !compat[i]; i--)
-		cplen--;
-	if (!cplen)
-		return csize;
-	cplen++;
-
-	/* Check space (need cplen+1 chars including final \0) */
-	tsize = csize + cplen;
-	repend = tsize;
-
-	if (csize >= len)		/* @ the limit, all is already filled */
-		return tsize;
-
-	if (tsize >= len) {		/* limit compat list */
-		cplen = len - csize - 1;
-		repend = len;
-	}
-
-	/* Copy and do char replacement */
-	memcpy(&str[csize + 1], compat, cplen);
-	for (i = csize; i < repend; i++) {
-		char c = str[i];
-		if (c == '\0')
-			str[i] = 'C';
-		else if (c == ' ')
-			str[i] = '_';
+	len -= csize;
+	str += csize;
+
+	of_property_for_each_string(dev->of_node, "compatible", p, compat) {
+		if (strlen(compat) + 2 > len)
+			break;
+
+		csize = snprintf(str, len, "C%s", compat);
+		for (c = str; c; ) {
+			c = strchr(c, ' ');
+			if (c)
+				*c++ = '_';
+		}
+		len -= csize;
+		str += csize;
 	}
 
-	return repend;
+	return str - start;
 }
 
 int of_device_request_module(struct device *dev)
@@ -288,7 +271,8 @@ void of_device_uevent(struct device *dev, struct kobj_uevent_env *env)
 {
 	const char *compat;
 	struct alias_prop *app;
-	int seen = 0, cplen, sl;
+	struct property *p;
+	int seen = 0;
 
 	if ((!dev) || (!dev->of_node))
 		return;
@@ -301,12 +285,8 @@ void of_device_uevent(struct device *dev, struct kobj_uevent_env *env)
 	/* Since the compatible field can contain pretty much anything
 	 * it's not really legal to split it out with commas. We split it
 	 * up using a number of environment variables instead. */
-	compat = of_get_property(dev->of_node, "compatible", &cplen);
-	while (compat && *compat && cplen > 0) {
+	of_property_for_each_string(dev->of_node, "compatible", p, compat) {
 		add_uevent_var(env, "OF_COMPATIBLE_%d=%s", seen, compat);
-		sl = strlen(compat) + 1;
-		compat += sl;
-		cplen -= sl;
 		seen++;
 	}
 	add_uevent_var(env, "OF_COMPATIBLE_N=%d", seen);
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
