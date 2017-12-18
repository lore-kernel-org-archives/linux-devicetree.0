From: Chris Lew <clew-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH 6/6] rpmsg: glink: Add get_rproc_name device op
Date: Mon, 18 Dec 2017 14:02:14 -0800
Message-ID: <1513634534-22861-7-git-send-email-clew@codeaurora.org>
References: <1513634534-22861-1-git-send-email-clew@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1513634534-22861-1-git-send-email-clew-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: aneela-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, clew-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add support for clients to query the edge name for the glink device
their channel is registered for.

Signed-off-by: Chris Lew <clew-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 drivers/rpmsg/qcom_glink_native.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index a897ccea3098..4748dea0748e 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1346,6 +1346,14 @@ static struct device_node *qcom_glink_match_channel(struct device_node *node,
 	return NULL;
 }
 
+static const char *qcom_glink_get_rproc_name(struct rpmsg_device *rpdev)
+{
+	struct glink_channel *channel = to_glink_channel(rpdev->ept);
+	struct qcom_glink *glink = channel->glink;
+
+	return glink->name;
+}
+
 static const struct rpmsg_device_ops glink_chrdev_ops = {
 	.create_ept = qcom_glink_create_ept,
 };
@@ -1353,6 +1361,7 @@ static struct device_node *qcom_glink_match_channel(struct device_node *node,
 static const struct rpmsg_device_ops glink_device_ops = {
 	.create_ept = qcom_glink_create_ept,
 	.announce_create = qcom_glink_announce_create,
+	.get_rproc_name = qcom_glink_get_rproc_name,
 };
 
 static const struct rpmsg_endpoint_ops glink_endpoint_ops = {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
