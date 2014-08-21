From: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 3/3] [media] rc: remove change_protocol in rc-ir-raw.c
Date: Thu, 21 Aug 2014 17:24:45 +0800
Message-ID: <1408613086-12538-4-git-send-email-zhangfei.gao@linaro.org>
References: <1408613086-12538-1-git-send-email-zhangfei.gao@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1408613086-12538-1-git-send-email-zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, =?UTF-8?q?David=20H=C3=A4rdeman?= <david-0WFrdVpeebksCylrc8G9yg@public.gmane.org>, arnd-r2nGTMty4D4@public.gmane.org, haifeng.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jchxue-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

With commit 4924a311a62f ("[media] rc-core: rename ir-raw.c"),
empty change_protocol was introduced.
As a result, rc_register_device will set dev->enabled_protocols
addording to rc_map->rc_type, which prevent using all protocols.

Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/media/rc/rc-ir-raw.c |    7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/rc/rc-ir-raw.c b/drivers/media/rc/rc-ir-raw.c
index e8fff2a..a118539 100644
--- a/drivers/media/rc/rc-ir-raw.c
+++ b/drivers/media/rc/rc-ir-raw.c
@@ -240,12 +240,6 @@ ir_raw_get_allowed_protocols(void)
 	return protocols;
 }
 
-static int change_protocol(struct rc_dev *dev, u64 *rc_type)
-{
-	/* the caller will update dev->enabled_protocols */
-	return 0;
-}
-
 /*
  * Used to (un)register raw event clients
  */
@@ -263,7 +257,6 @@ int ir_raw_event_register(struct rc_dev *dev)
 
 	dev->raw->dev = dev;
 	dev->enabled_protocols = ~0;
-	dev->change_protocol = change_protocol;
 	rc = kfifo_alloc(&dev->raw->kfifo,
 			 sizeof(struct ir_raw_event) * MAX_IR_EVENT_SIZE,
 			 GFP_KERNEL);
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
