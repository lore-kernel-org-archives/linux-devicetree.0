From: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [PATCH][V2] of: overlay: fix memory leak of ovcs on error exit path
Date: Thu, 30 Nov 2017 12:57:06 +0000
Message-ID: <20171130125706.13790-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Colin Ian King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>

Currently if the call to of_resolve_phandles fails then then ovcs
is not kfree'd on the error exit path.  Rather than try and make
the clean up exit path more convoluted, fix this by just kfree'ing
ovcs at the point of error detection and exit via the same exit
path.

Detected by CoverityScan, CID#1462296 ("Resource Leak")

Fixes: bd80e2555c5c ("of: overlay: Fix cleanup order in of_overlay_apply()")
Signed-off-by: Colin Ian King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
---
 drivers/of/overlay.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 53bc9e3f0b98..6c8efe7d8cbb 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -708,8 +708,10 @@ int of_overlay_apply(struct device_node *tree, int *ovcs_id)
 	of_overlay_mutex_lock();
 
 	ret = of_resolve_phandles(tree);
-	if (ret)
+	if (ret) {
+		kfree(ovcs);
 		goto err_overlay_unlock;
+	}
 
 	mutex_lock(&of_mutex);
 
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
