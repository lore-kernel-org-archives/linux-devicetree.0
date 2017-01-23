From: Alexander Sverdlin <alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] of/platform: Ignore disabled devices in of_platform_populate()
Date: Mon, 23 Jan 2017 13:21:51 +0100
Message-ID: <20170123122151.21908-1-alexander.sverdlin@nokia.com>
References: <CAL_JsqKb8KUgit-q_cOON8VgZBsrXEQd2EcC0iF=ou_271Vg_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKb8KUgit-q_cOON8VgZBsrXEQd2EcC0iF=ou_271Vg_w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Alexander Sverdlin <alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Check the status property and give up early enough. Otherwise
OF_POPULATED_BUS might be set for disabled bus which will prevent
it from being populated later (if enabled).

Signed-off-by: Alexander Sverdlin <alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 drivers/of/platform.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 35de1fc59fa6..5ad8c13f754a 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -473,9 +473,13 @@ int of_platform_populate(struct device_node *root,
 	struct device_node *child;
 	int rc = 0;
 
-	root = root ? of_node_get(root) : of_find_node_by_path("/");
+	if (!root)
+		root = of_find_node_by_path("/");
 	if (!root)
 		return -EINVAL;
+	if (!of_device_is_available(root))
+		return 0;
+	of_node_get(root);
 
 	pr_debug("%s()\n", __func__);
 	pr_debug(" starting at: %s\n", root->full_name);
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
