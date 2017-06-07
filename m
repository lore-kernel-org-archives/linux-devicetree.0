From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: [RFC PATCH 8/8] firmware: arm_scmi: probe and initialise all the supported protocols
Date: Wed,  7 Jun 2017 17:10:12 +0100
Message-ID: <1496851812-19623-9-git-send-email-sudeep.holla@arm.com>
References: <1496851812-19623-1-git-send-email-sudeep.holla@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496851812-19623-1-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Roy Franz <roy.franz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Harb Abdulhamid <harba-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Now that we have basic support for all the protocols in the
specification, let's probe them individually and initialise them.

Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
---
 drivers/firmware/arm_scmi/common.h |  5 +++++
 drivers/firmware/arm_scmi/driver.c | 30 +++++++++++++++++++++++++++++-
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index 32873a315c76..e2ff799e7dd4 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -119,4 +119,9 @@ int scmi_version_get(struct scmi_handle *h, u8 protocol, u32 *version);
 bool scmi_is_protocol_implemented(struct scmi_handle *h, u8 prot_id);
 void scmi_setup_protocol_implemented(struct scmi_handle *handle, u8 *prot_imp);
 
+typedef int (*scmi_init_fn_t)(struct scmi_handle *);
 int scmi_base_protocol_init(struct scmi_handle *h);
+int scmi_perf_protocol_init(struct scmi_handle *h);
+int scmi_sensors_protocol_init(struct scmi_handle *h);
+int scmi_power_protocol_init(struct scmi_handle *h);
+int scmi_clock_protocol_init(struct scmi_handle *h);
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 7b653c932edc..3300d0cce9e0 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -684,6 +684,23 @@ static int scmi_xfer_info_init(struct scmi_info *sinfo)
 	return 0;
 }
 
+static const struct of_device_id scmi_protocol_match[] = {
+	{
+		.compatible = "arm,scmi-perf-domains",
+		.data = scmi_perf_protocol_init,
+	}, {
+		.compatible = "arm,scmi-clocks",
+		.data = scmi_clock_protocol_init,
+	}, {
+		.compatible = "arm,scmi-power-domains",
+		.data = scmi_power_protocol_init,
+	}, {
+		.compatible = "arm,scmi-sensors",
+		.data = scmi_sensors_protocol_init,
+	},
+	{}
+};
+
 static int scmi_probe(struct platform_device *pdev)
 {
 	int ret = -EINVAL;
@@ -694,7 +711,7 @@ static int scmi_probe(struct platform_device *pdev)
 	const struct scmi_desc *desc;
 	struct scmi_info *info = NULL;
 	struct device *dev = &pdev->dev;
-	struct device_node *shmem, *np = dev->of_node;
+	struct device_node *child, *shmem, *np = dev->of_node;
 
 	desc = of_match_device(scmi_of_match, dev)->data;
 
@@ -755,6 +772,17 @@ static int scmi_probe(struct platform_device *pdev)
 		goto out;
 	}
 
+	for_each_available_child_of_node(np, child) {
+		scmi_init_fn_t fn;
+		const struct of_device_id *match;
+
+		match = of_match_node(scmi_protocol_match, child);
+		if (!match)
+			continue;
+		fn = match->data;
+		fn(handle);
+	}
+
 	mutex_lock(&scmi_list_mutex);
 	list_add_tail(&info->node, &scmi_list);
 	mutex_unlock(&scmi_list_mutex);
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
