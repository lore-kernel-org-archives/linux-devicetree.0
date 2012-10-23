From: Wei Yongjun <weiyj.lk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] usb: musb: dsps: use platform_device_unregister in dsps_delete_musb_pdev()
Date: Tue, 23 Oct 2012 13:36:06 +0800
Message-ID: <CAPgLHd8uQT0ZPZhejhsDJBMaiyO-vynozC5g47sa2FkHk1BY5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org
Cc: yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>

platform_device_unregister() only calls platform_device_del() and
platform_device_put(), thus use platform_device_unregister() to
simplify the code.

Also the documents in platform.c shows that platform_device_del
and platform_device_put must _only_ be externally called in error
cases.  All other usage is a bug.

dpatch engine is used to auto generate this patch.
(https://github.com/weiyj/dpatch)

Signed-off-by: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
---
 drivers/usb/musb/musb_dsps.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/musb/musb_dsps.c b/drivers/usb/musb/musb_dsps.c
index 444346e..828d2a2 100644
--- a/drivers/usb/musb/musb_dsps.c
+++ b/drivers/usb/musb/musb_dsps.c
@@ -565,8 +565,7 @@ err0:
 static void dsps_delete_musb_pdev(struct dsps_glue *glue, u8 id)
 {
 	musb_put_id(glue->dev, glue->musb[id]->id);
-	platform_device_del(glue->musb[id]);
-	platform_device_put(glue->musb[id]);
+	platform_device_unregister(glue->musb[id]);
 }
 
 static int __devinit dsps_probe(struct platform_device *pdev)


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
