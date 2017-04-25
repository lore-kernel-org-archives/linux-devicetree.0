From: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH v3 3/4] of: be consistent in form of file mode
Date: Tue, 25 Apr 2017 01:47:28 -0700
Message-ID: <1493110049-30165-4-git-send-email-frowand.list@gmail.com>
References: <1493110049-30165-1-git-send-email-frowand.list@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1493110049-30165-1-git-send-email-frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

checkpatch whined about using S_IRUGO instead of octal equivalent
when adding phandle sysfs code, so used octal in that patch.
Change other instances of the S_* constants in the same file to
the octal form.

Signed-off-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
---
 drivers/of/base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 41473b1e2445..9fe42346925b 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -168,7 +168,7 @@ int __of_add_property_sysfs(struct device_node *np, struct property *pp)
 
 	sysfs_bin_attr_init(&pp->attr);
 	pp->attr.attr.name = safe_name(&np->kobj, pp->name);
-	pp->attr.attr.mode = secure ? S_IRUSR : S_IRUGO;
+	pp->attr.attr.mode = secure ? 0400 : 0444;
 	pp->attr.size = secure ? 0 : pp->length;
 	pp->attr.read = of_node_property_read;
 
-- 
Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
