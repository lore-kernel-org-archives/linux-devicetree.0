From: Archit Taneja <architt@codeaurora.org>
Subject: [PATCH v2 06/10] drm/msm/dsi: Use a standard DT binding for data lanes
Date: Fri, 10 Jun 2016 16:16:36 +0530
Message-ID: <1465555600-25742-7-git-send-email-architt@codeaurora.org>
References: <1462273081-5814-1-git-send-email-architt@codeaurora.org>
 <1465555600-25742-1-git-send-email-architt@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1465555600-25742-1-git-send-email-architt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: robdclark@gmail.com, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, heiko@sntech.de, p.zabel@pengutronix.de, devicetree@vger.kernel.org, Archit Taneja <architt@codeaurora.org>
List-Id: devicetree@vger.kernel.org

A more standard DT binding describing data lanes already exists here:
Documentation/devicetree/bindings/media/video-interfaces.txt

Use this binding instead of "qcom,data-lane-map". One difference
in the standard binding w.r.t to the existing binding is that it
provides a logical to physical mapping instead of the other way
round. Tweak the code to translate the data the way we want it.

The MSM DSI DT bindings aren't used anywhere at the moment, so
it's okay to update this property.

Signed-off-by: Archit Taneja <architt@codeaurora.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 4f1335e..e6a8cd1 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1543,7 +1543,7 @@ static int dsi_host_parse_lane_data(struct msm_dsi_host *msm_host,
 	u32 lane_map[4];
 	int ret, i, len, num_lanes;
 
-	prop = of_find_property(ep, "qcom,data-lane-map", &len);
+	prop = of_find_property(ep, "data-lanes", &len);
 	if (!prop) {
 		dev_dbg(dev, "failed to find data lane mapping\n");
 		return -EINVAL;
@@ -1558,7 +1558,7 @@ static int dsi_host_parse_lane_data(struct msm_dsi_host *msm_host,
 
 	msm_host->num_data_lanes = num_lanes;
 
-	ret = of_property_read_u32_array(ep, "qcom,data-lane-map", lane_map,
+	ret = of_property_read_u32_array(ep, "data-lanes", lane_map,
 					 num_lanes);
 	if (ret) {
 		dev_err(dev, "failed to read lane data\n");
@@ -1573,8 +1573,19 @@ static int dsi_host_parse_lane_data(struct msm_dsi_host *msm_host,
 		const int *swap = supported_data_lane_swaps[i];
 		int j;
 
+		/*
+		 * the data-lanes array we get from DT has a logical->physical
+		 * mapping. The "data lane swap" register field represents
+		 * supported configurations in a physical->logical mapping.
+		 * Translate the DT mapping to what we understand and find a
+		 * configuration that works.
+		 */
 		for (j = 0; j < num_lanes; j++) {
-			if (swap[j] != lane_map[j])
+			if (lane_map[j] < 0 || lane_map[j] > 3)
+				dev_err(dev, "bad physical lane entry %u\n",
+					lane_map[j]);
+
+			if (swap[lane_map[j]] != j)
 				break;
 		}
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
