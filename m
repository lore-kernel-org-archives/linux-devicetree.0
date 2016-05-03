From: Archit Taneja <architt@codeaurora.org>
Subject: [PATCH 7/9] drm/msm/dsi: Use generic PHY bindings
Date: Tue,  3 May 2016 16:27:59 +0530
Message-ID: <1462273081-5814-8-git-send-email-architt@codeaurora.org>
References: <1462273081-5814-1-git-send-email-architt@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1462273081-5814-1-git-send-email-architt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: robdclark@gmail.com, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, heiko@sntech.de, p.zabel@pengutronix.de, devicetree@vger.kernel.org, Archit Taneja <architt@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The DSI host links to the DSI PHY device using a custom binding. Switch to
the generic PHY bindings. The DSI PHY driver itself doesn't use the common
PHY framework for now.

Signed-off-by: Archit Taneja <architt@codeaurora.org>
---
 drivers/gpu/drm/msm/dsi/dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 6edcd6f..ec572f8 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -29,7 +29,7 @@ static int dsi_get_phy(struct msm_dsi *msm_dsi)
 	struct platform_device *phy_pdev;
 	struct device_node *phy_node;
 
-	phy_node = of_parse_phandle(pdev->dev.of_node, "qcom,dsi-phy", 0);
+	phy_node = of_parse_phandle(pdev->dev.of_node, "phys", 0);
 	if (!phy_node) {
 		dev_err(&pdev->dev, "cannot find phy device\n");
 		return -ENXIO;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
