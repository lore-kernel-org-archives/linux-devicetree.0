From: Ulrich Hecht <ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] media: adv7180: add missing adv7180cp, adv7180st i2c device IDs
Date: Mon,  3 Jul 2017 10:43:33 +0200
Message-ID: <1499071413-609-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ulrich Hecht <ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Fixes a crash on Renesas R8A7793 Gose board that uses these "compatible"
entries.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/media/i2c/adv7180.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 78de7dd..3df28f2 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -1402,6 +1402,8 @@ static int adv7180_remove(struct i2c_client *client)
 
 static const struct i2c_device_id adv7180_id[] = {
 	{ "adv7180", (kernel_ulong_t)&adv7180_info },
+	{ "adv7180cp", (kernel_ulong_t)&adv7180_info },
+	{ "adv7180st", (kernel_ulong_t)&adv7180_info },
 	{ "adv7182", (kernel_ulong_t)&adv7182_info },
 	{ "adv7280", (kernel_ulong_t)&adv7280_info },
 	{ "adv7280-m", (kernel_ulong_t)&adv7280_m_info },
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
