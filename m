From: Chris Lew <clew@codeaurora.org>
Subject: [PATCH v2 2/3] rpmsg: glink: Add support to preallocate intents
Date: Thu, 26 Oct 2017 15:28:55 -0700
Message-ID: <1509056936-26578-3-git-send-email-clew@codeaurora.org>
References: <1509056936-26578-1-git-send-email-clew@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1509056936-26578-1-git-send-email-clew@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: aneela@codeaurora.org, smaliyap@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, clew@codeaurora.org
List-Id: devicetree@vger.kernel.org

The base intents prequeued during channel creation may not satisfy a
channel's throughput requirement. Add support for intents dt-binding to
allow channels to specify the size and amount of intents to prequeue
during endpoint announcement.

Signed-off-by: Chris Lew <clew@codeaurora.org>
---

Changes since v1:
- Change intents property string to qcom,intents
- Use np local variable to fit of_find_property call on one line

 drivers/rpmsg/qcom_glink_native.c | 37 +++++++++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 5a5e927ea50f..7155adad6ab6 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1143,19 +1143,40 @@ static struct rpmsg_endpoint *qcom_glink_create_ept(struct rpmsg_device *rpdev,
 static int qcom_glink_announce_create(struct rpmsg_device *rpdev)
 {
 	struct glink_channel *channel = to_glink_channel(rpdev->ept);
-	struct glink_core_rx_intent *intent;
+	struct device_node *np = rpdev->dev.of_node;
 	struct qcom_glink *glink = channel->glink;
-	int num_intents = glink->intentless ? 0 : 5;
+	struct glink_core_rx_intent *intent;
+	const struct property *prop = NULL;
+	int num_groups = 1;
+	int num_intents;
+	int size;
+	__be32 base[2];
+	int *val = base;
+
+	if (np)
+		prop = of_find_property(np, "qcom,intents", NULL);
+
+	if (prop && !glink->intentless) {
+		val = prop->value;
+		num_groups = prop->length / sizeof(u32) / 2;
+	} else {
+		base[0] = cpu_to_be32(SZ_1K);
+		base[1] = cpu_to_be32(glink->intentless ? 0 : 5);
+	}
 
 	/* Channel is now open, advertise base set of intents */
-	while (num_intents--) {
-		intent = qcom_glink_alloc_intent(glink, channel, SZ_1K, true);
-		if (!intent)
-			break;
+	while (num_groups--) {
+		size = be32_to_cpup(val++);
+		num_intents = be32_to_cpup(val++);
+		while(num_intents--) {
+			intent = qcom_glink_alloc_intent(glink, channel, size,
+							 true);
+			if (!intent)
+				break;
 
-		qcom_glink_advertise_intent(glink, channel, intent);
+			qcom_glink_advertise_intent(glink, channel, intent);
+		}
 	}
-
 	return 0;
 }
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
