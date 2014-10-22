From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 1/4] of: Correct of_phandle_args node reference in comments
Date: Wed, 22 Oct 2014 11:44:52 +0200
Message-ID: <1413971095-27192-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The device_node pointer in struct of_phandle_args is called "np", not
"node".

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
 drivers/of/base.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 2305dc0382bca0a5..e3f9043860c81b5d 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1560,7 +1560,7 @@ EXPORT_SYMBOL(of_parse_phandle);
  * Returns 0 on success and fills out_args, on error returns appropriate
  * errno value.
  *
- * Caller is responsible to call of_node_put() on the returned out_args->node
+ * Caller is responsible to call of_node_put() on the returned out_args->np
  * pointer.
  *
  * Example:
@@ -1603,7 +1603,7 @@ EXPORT_SYMBOL(of_parse_phandle_with_args);
  * Returns 0 on success and fills out_args, on error returns appropriate
  * errno value.
  *
- * Caller is responsible to call of_node_put() on the returned out_args->node
+ * Caller is responsible to call of_node_put() on the returned out_args->np
  * pointer.
  *
  * Example:
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
