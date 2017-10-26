From: Chris Lew <clew-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v2 3/3] rpmsg: glink: Use best fit intent during tx
Date: Thu, 26 Oct 2017 15:28:56 -0700
Message-ID: <1509056936-26578-4-git-send-email-clew@codeaurora.org>
References: <1509056936-26578-1-git-send-email-clew@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1509056936-26578-1-git-send-email-clew-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: aneela-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, smaliyap-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, clew-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Intents can vary in size, try to find the best fitting remote intent
instead of first fit when sending a message to the remote proc.

Signed-off-by: Chris Lew <clew-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 drivers/rpmsg/qcom_glink_native.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 7155adad6ab6..0ba1ffe2698f 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1252,11 +1252,16 @@ static int __qcom_glink_send(struct glink_channel *channel,
 			spin_lock_irqsave(&channel->intent_lock, flags);
 			idr_for_each_entry(&channel->riids, tmp, iid) {
 				if (tmp->size >= len && !tmp->in_use) {
-					tmp->in_use = true;
-					intent = tmp;
-					break;
+					if (!intent)
+						intent = tmp;
+					else if (intent->size > tmp->size)
+						intent = tmp;
+					if (intent->size == len)
+						break;
 				}
 			}
+			if (intent)
+				intent->in_use = true;
 			spin_unlock_irqrestore(&channel->intent_lock, flags);
 
 			/* We found an available intent */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
