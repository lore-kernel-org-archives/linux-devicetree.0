From: Archit Taneja <architt@codeaurora.org>
Subject: [PATCH v2 04/10] drm/msm/dsi: Modify port parsing
Date: Fri, 10 Jun 2016 16:16:34 +0530
Message-ID: <1465555600-25742-5-git-send-email-architt@codeaurora.org>
References: <1462273081-5814-1-git-send-email-architt@codeaurora.org>
 <1465555600-25742-1-git-send-email-architt@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1465555600-25742-1-git-send-email-architt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: robdclark@gmail.com, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, heiko@sntech.de, p.zabel@pengutronix.de, devicetree@vger.kernel.org, Archit Taneja <architt@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The DSI interface is going to have two ports defined in its device node.
The first port is always going to be the link between the MDP output
and the input to DSI, the second port is going to be the link between
the DSI output and the connected panel/bridge:

 -----           -----           -------
| MDP | ------> | DSI | ------> | Panel |
 -----           -----           -------
        (Port 0)       (Port 1)

Until now, there was only one Port representing the output. Update the
DSI host driver such that it parses Port #1 for a connected device.

Signed-off-by: Archit Taneja <architt@codeaurora.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index a3e47ad8..4f1335e 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1602,12 +1602,12 @@ static int dsi_host_parse_dt(struct msm_dsi_host *msm_host)
 	}
 
 	/*
-	 * Get the first endpoint node. In our case, dsi has one output port
-	 * to which the panel is connected. Don't return an error if a port
-	 * isn't defined. It's possible that there is nothing connected to
-	 * the dsi output.
+	 * Get the endpoint of the output port of the DSI host. In our case,
+	 * this is mapped to port number with reg = 1. Don't return an error if
+	 * the remote endpoint isn't defined. It's possible that there is
+	 * nothing connected to the dsi output.
 	 */
-	endpoint = of_graph_get_next_endpoint(np, NULL);
+	endpoint = of_graph_get_endpoint_by_regs(np, 1, -1);
 	if (!endpoint) {
 		dev_dbg(dev, "%s: no endpoint\n", __func__);
 		return 0;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
