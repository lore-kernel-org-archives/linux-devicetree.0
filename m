From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] of/device: Fix of_device_get_modalias() buffer handling
Date: Wed, 23 Aug 2017 18:03:52 -0700
Message-ID: <20170824010352.9085-1-bjorn.andersson@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

of_device_request_module() calls of_device_get_modalias() with "len" 0,
to calculate the size of the buffer needed to store the result, but due
to integer promotion the ssize_t "len" will be compared as unsigned with
strlen(compat) and the loop will generally never break. This results in
a call to snprintf() with a negative len, which triggers below warning,
followed by a dereference of a invalid pointer:

  [    3.060067] WARNING: CPU: 0 PID: 51 at lib/vsprintf.c:2122 vsnprintf+0x348/0x6d8
  ...
  [    3.060301] [<ffffff800891ede8>] vsnprintf+0x348/0x6d8
  [    3.060308] [<ffffff800891f248>] snprintf+0x48/0x50
  [    3.060316] [<ffffff80086a7c80>] of_device_get_modalias+0x108/0x160
  [    3.060322] [<ffffff80086a7cf8>] of_device_request_module+0x20/0x88
  ...

Further more of_device_get_modalias() is supposed to return the number
of bytes needed to store the entire modalias, so the loop needs to
continue accumulate the total size even though the buffer is full.

Finally the function is not expected to ensure space for the NUL, nor
include it in the returned size, so only 1 should be added to the length
of "compat" in the loop (to account for the character 'C').

Fixes: bc575064d688 ("of/device: use of_property_for_each_string to parse compatible strings")
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/of/device.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/of/device.c b/drivers/of/device.c
index 6f33a0e0d351..7cff599a9c6a 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -195,10 +195,11 @@ EXPORT_SYMBOL(of_device_get_match_data);
 
 static ssize_t of_device_get_modalias(struct device *dev, char *str, ssize_t len)
 {
-	const char *compat, *start = str;
+	const char *compat;
 	char *c;
 	struct property *p;
 	ssize_t csize;
+	ssize_t tsize;
 
 	if ((!dev) || (!dev->of_node))
 		return -ENODEV;
@@ -206,12 +207,16 @@ static ssize_t of_device_get_modalias(struct device *dev, char *str, ssize_t len
 	/* Name & Type */
 	csize = snprintf(str, len, "of:N%sT%s", dev->of_node->name,
 			 dev->of_node->type);
+	tsize = csize;
 	len -= csize;
-	str += csize;
+	if (str)
+		str += csize;
 
 	of_property_for_each_string(dev->of_node, "compatible", p, compat) {
-		if (strlen(compat) + 2 > len)
-			break;
+		csize = strlen(compat) + 1;
+		tsize += csize;
+		if (csize > len)
+			continue;
 
 		csize = snprintf(str, len, "C%s", compat);
 		for (c = str; c; ) {
@@ -223,7 +228,7 @@ static ssize_t of_device_get_modalias(struct device *dev, char *str, ssize_t len
 		str += csize;
 	}
 
-	return str - start;
+	return tsize;
 }
 
 int of_device_request_module(struct device *dev)
-- 
2.12.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
