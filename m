From: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH 6/6] drm/msm/dsi: Parse DSI lanes via DT
Date: Mon, 15 Feb 2016 18:30:59 +0530
Message-ID: <1455541259-8967-7-git-send-email-architt@codeaurora.org>
References: <1455541259-8967-1-git-send-email-architt@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455541259-8967-1-git-send-email-architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The DSI driver is currently unaware of how the DSI clock and data pins
are mapped to the logical lanes provided by the DSI controller.

Use the generic 'lanes' DT binding provided for DSI lanes (used for DSI
in bindings/display/ti/ti,omap4-dss.txt) to get the desired mapping.

The MSM DSI controller is restricted in terms of what all mappings
it can support. The lane polarity is fixed for all the lanes, the clock
lanes are fixed, and the data lanes can be swapped among each other only
for a few combinations. Apply these restrictions when we parse the DT
data.

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>

Signed-off-by: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 .../devicetree/bindings/display/msm/dsi.txt        |  26 +++-
 drivers/gpu/drm/msm/dsi/dsi_host.c                 | 146 ++++++++++++++++++---
 2 files changed, 149 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
index e7423be..f0d8b6f 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi.txt
+++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
@@ -44,9 +44,28 @@ Optional properties:
 - pinctrl-names: the pin control state names; should contain "default"
 - pinctrl-0: the default pinctrl state (active)
 - pinctrl-n: the "sleep" pinctrl state
-- port: DSI controller output port. This contains one endpoint subnode, with its
-  remote-endpoint set to the phandle of the connected panel's endpoint.
-  See Documentation/devicetree/bindings/graph.txt for device graph info.
+- port: DSI controller output port, containing one endpoint subnode.
+
+  DSI Endpoint properties:
+  - remote-endpoint: set to phandle of the connected panel's endpoint.
+    See Documentation/devicetree/bindings/graph.txt for device graph info.
+  - lanes: list of pin numbers for the DSI lanes: CLKp, CLKn, DATA0p, DATA0n,
+    DATA1p, DATA1n, ...
+    This provides a physical to logical mapping of the DSI lanes. The CLKp and
+    CLKn pins have to be mapped to pins 0 and 1. For data lanes, there are only
+    a limited number of physical to logical mappings possible:
+
+     "0123": Logic 0->Phys 0; Logic 1->Phys 1; Logic 2->Phys 2; Logic 3->Phys 3;
+     "3012": Logic 3->Phys 0; Logic 0->Phys 1; Logic 1->Phys 2; Logic 2->Phys 3;
+     "2301": Logic 2->Phys 0; Logic 3->Phys 1; Logic 0->Phys 2; Logic 1->Phys 3;
+     "1230": Logic 1->Phys 0; Logic 2->Phys 1; Logic 3->Phys 2; Logic 0->Phys 3;
+     "0321": Logic 0->Phys 0; Logic 3->Phys 1; Logic 2->Phys 2; Logic 1->Phys 3;
+     "1032": Logic 1->Phys 0; Logic 0->Phys 1; Logic 3->Phys 2; Logic 2->Phys 3;
+     "2103": Logic 2->Phys 0; Logic 1->Phys 1; Logic 0->Phys 2; Logic 3->Phys 3;
+     "3210": Logic 3->Phys 0; Logic 2->Phys 1; Logic 1->Phys 2; Logic 0->Phys 3;
+
+     Here, a "3012" mapping will be represented by:
+     lanes = <0 1 8 9 2 3 4 5 6 7>;
 
 DSI PHY:
 Required properties:
@@ -131,6 +150,7 @@ Example:
 		port {
 			dsi0_out: endpoint {
 				remote-endpoint = <&panel_in>;
+				lanes = <0 1 2 3 4 5 6 7 8 9>;
 			};
 		};
 	};
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 69bac59..5dc58bb 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -163,6 +163,10 @@ struct msm_dsi_host {
 	enum mipi_dsi_pixel_format format;
 	unsigned long mode_flags;
 
+	/* lane data parsed via DT */
+	int dlane_swap;
+	int num_data_lanes;
+
 	u32 dma_cmd_ctrl_restore;
 
 	bool registered;
@@ -845,19 +849,10 @@ static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
 	data = DSI_CTRL_CLK_EN;
 
 	DBG("lane number=%d", msm_host->lanes);
-	if (msm_host->lanes == 2) {
-		data |= DSI_CTRL_LANE1 | DSI_CTRL_LANE2;
-		/* swap lanes for 2-lane panel for better performance */
-		dsi_write(msm_host, REG_DSI_LANE_SWAP_CTRL,
-			DSI_LANE_SWAP_CTRL_DLN_SWAP_SEL(LANE_SWAP_1230));
-	} else {
-		/* Take 4 lanes as default */
-		data |= DSI_CTRL_LANE0 | DSI_CTRL_LANE1 | DSI_CTRL_LANE2 |
-			DSI_CTRL_LANE3;
-		/* Do not swap lanes for 4-lane panel */
-		dsi_write(msm_host, REG_DSI_LANE_SWAP_CTRL,
-			DSI_LANE_SWAP_CTRL_DLN_SWAP_SEL(LANE_SWAP_0123));
-	}
+	data |= ((DSI_CTRL_LANE0 << msm_host->lanes) - DSI_CTRL_LANE0);
+
+	dsi_write(msm_host, REG_DSI_LANE_SWAP_CTRL,
+		  DSI_LANE_SWAP_CTRL_DLN_SWAP_SEL(msm_host->dlane_swap));
 
 	if (!(flags & MIPI_DSI_CLOCK_NON_CONTINUOUS))
 		dsi_write(msm_host, REG_DSI_LANE_CTRL,
@@ -1479,6 +1474,9 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
 	int ret;
 
+	if (dsi->lanes > msm_host->num_data_lanes)
+		return -EINVAL;
+
 	msm_host->channel = dsi->channel;
 	msm_host->lanes = dsi->lanes;
 	msm_host->format = dsi->format;
@@ -1532,6 +1530,105 @@ static struct mipi_dsi_host_ops dsi_host_ops = {
 	.transfer = dsi_host_transfer,
 };
 
+/*
+ * List of supported physical to logical lane mappings.
+ * For example, the 2nd entry represents the following mapping:
+ *
+ * "3012": Logic 3->Phys 0; Logic 0->Phys 1; Logic 1->Phys 2; Logic 2->Phys 3;
+ */
+static const int supported_data_lane_swaps[][4] = {
+	{ 0, 1, 2, 3 },
+	{ 3, 0, 1, 2 },
+	{ 2, 3, 0, 1 },
+	{ 1, 2, 3, 0 },
+	{ 0, 3, 2, 1 },
+	{ 1, 0, 3, 2 },
+	{ 2, 1, 0, 3 },
+	{ 3, 2, 1, 0 },
+};
+
+static int dsi_host_parse_lane_data(struct msm_dsi_host *msm_host,
+				    struct device_node *ep)
+{
+	struct device *dev = &msm_host->pdev->dev;
+	struct property *prop;
+	u32 pins[10];
+	int logic_pos[4];
+	int ret, i, len, num_pins, num_data;
+
+	prop = of_find_property(ep, "lanes", &len);
+	if (!prop) {
+		dev_dbg(dev, "failed to find lane data, setting defaults\n");
+		msm_host->num_data_lanes = 4;
+		msm_host->dlane_swap = 0;
+		return -EINVAL;
+	}
+
+	num_pins = len / sizeof(u32);
+
+	if (num_pins < 4 || num_pins > 10 || num_pins % 2 != 0) {
+		dev_err(dev, "bad number of lanes\n");
+		return -EINVAL;
+	}
+
+	ret = of_property_read_u32_array(ep, "lanes", pins, num_pins);
+	if (ret) {
+		dev_err(dev, "failed to read lane data\n");
+		return ret;
+	}
+
+	/* parse CLK pins */
+	if (pins[0] != 0 || pins[1] != 1) {
+		dev_err(dev, "clkp and clkn have to be at positions 0 and 1\n");
+		return -EINVAL;
+	}
+
+	/* parse DATA pins */
+	num_data = 0;
+
+	for (i = 2; i < num_pins; i += 2) {
+		int dp, dn;
+
+		dp = pins[i];
+		dn = pins[i + 1];
+
+		if ((dp < 0 || dp > 9) || (dn < 0 || dn > 9))
+			return -EINVAL;
+
+		if (dn & 1) {
+			if (dn != dp + 1)
+				return -EINVAL;
+		} else {
+			return -EINVAL;
+		}
+
+		logic_pos[num_data++] = dp / 2 - 1;
+	}
+
+	msm_host->num_data_lanes = num_data;
+
+	/*
+	 * compare DT specified physical-logical lane mappings with the ones
+	 * supported by hardware
+	 */
+	for (i = 0; i < ARRAY_SIZE(supported_data_lane_swaps); i++) {
+		const int *swap = supported_data_lane_swaps[i];
+		int j;
+
+		for (j = 0; j < num_data; j++) {
+			if (swap[j] != logic_pos[j])
+				break;
+		}
+
+		if (j == num_data) {
+			msm_host->dlane_swap = i;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
 static int dsi_host_parse_dt(struct msm_dsi_host *msm_host)
 {
 	struct device *dev = &msm_host->pdev->dev;
@@ -1558,17 +1655,21 @@ static int dsi_host_parse_dt(struct msm_dsi_host *msm_host)
 		return 0;
 	}
 
+	ret = dsi_host_parse_lane_data(msm_host, endpoint);
+	if (ret) {
+		dev_err(dev, "%s: invalid lane configuration %d\n",
+			__func__, ret);
+		goto err;
+	}
+
 	/* Get panel node from the output port's endpoint data */
 	device_node = of_graph_get_remote_port_parent(endpoint);
 	if (!device_node) {
 		dev_err(dev, "%s: no valid device\n", __func__);
-		of_node_put(endpoint);
-		return -ENODEV;
+		ret = -ENODEV;
+		goto err;
 	}
 
-	of_node_put(endpoint);
-	of_node_put(device_node);
-
 	msm_host->device_node = device_node;
 
 	if (of_property_read_bool(np, "syscon-sfpb")) {
@@ -1577,11 +1678,16 @@ static int dsi_host_parse_dt(struct msm_dsi_host *msm_host)
 		if (IS_ERR(msm_host->sfpb)) {
 			dev_err(dev, "%s: failed to get sfpb regmap\n",
 				__func__);
-			return PTR_ERR(msm_host->sfpb);
+			ret = PTR_ERR(msm_host->sfpb);
 		}
 	}
 
-	return 0;
+	of_node_put(device_node);
+
+err:
+	of_node_put(endpoint);
+
+	return ret;
 }
 
 int msm_dsi_host_init(struct msm_dsi *msm_dsi)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
