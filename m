From: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
Subject: [PATCH] of: Export of_{add/remove/update}_property() API
Date: Thu, 11 Aug 2016 19:18:08 -0500
Message-ID: <20160812001808.65199-1-s-anna@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The of_add_property(), of_remove_property() and of_update_property()
API are not exported and are limited to only built-in modules at the
moment. Export these so they can be used within modules. Also added
the stubs for the !CONFIG_OF case for these functions.

Signed-off-by: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
---
Hi Rob,

We came across a need for this during some remoteproc enhancements
for providing a standard OF API. Please see the discussion in [1].

I am not sure which EXPORT_SYMBOL variant (_GPL or plain) to use as
I see some mixed usage in this base, I have followed the convention
used on of_find_property.

[1] https://patchwork.kernel.org/patch/9237767/

 drivers/of/base.c  |  3 +++
 include/linux/of.h | 17 +++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 7792266db259..e6baf940db1b 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1826,6 +1826,7 @@ int of_add_property(struct device_node *np, struct property *prop)
 
 	return rc;
 }
+EXPORT_SYMBOL(of_add_property);
 
 int __of_remove_property(struct device_node *np, struct property *prop)
 {
@@ -1894,6 +1895,7 @@ int of_remove_property(struct device_node *np, struct property *prop)
 
 	return rc;
 }
+EXPORT_SYMBOL(of_remove_property);
 
 int __of_update_property(struct device_node *np, struct property *newprop,
 		struct property **oldpropp)
@@ -1970,6 +1972,7 @@ int of_update_property(struct device_node *np, struct property *newprop)
 
 	return rc;
 }
+EXPORT_SYMBOL(of_update_property);
 
 static void of_alias_add(struct alias_prop *ap, struct device_node *np,
 			 int id, const char *stem, int stem_len)
diff --git a/include/linux/of.h b/include/linux/of.h
index 3d9ff8e9d803..b6f17d8f4b13 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -668,6 +668,23 @@ static inline int of_machine_is_compatible(const char *compat)
 	return 0;
 }
 
+static inline int of_add_property(struct device_node *np, struct property *prop)
+{
+	return -ENOTSUPP;
+}
+
+static inline int of_remove_property(struct device_node *np,
+				     struct property *prop)
+{
+	return -ENOTSUPP;
+}
+
+static inline int of_update_property(struct device_node *np,
+				     struct property *newprop)
+{
+	return -ENOTSUPP;
+}
+
 static inline bool of_console_check(const struct device_node *dn, const char *name, int index)
 {
 	return false;
-- 
2.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
