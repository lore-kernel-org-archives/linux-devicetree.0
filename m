From: Ian Molton <ian.molton-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Subject: [PATCH 2/2] media: adv7604: Add ability to read default input port from DT
Date: Mon, 11 Aug 2014 13:05:19 +0100
Message-ID: <1407758719-12474-3-git-send-email-ian.molton@codethink.co.uk>
References: <1407758719-12474-1-git-send-email-ian.molton@codethink.co.uk>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1407758719-12474-1-git-send-email-ian.molton-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, shubhrajyoti-l0cyMroinI0@public.gmane.org, william-towle-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org, ian.molton-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds support to the adv7604 driver for reading the default
selected input from the Device tree. If none is provided, the driver will not
select an input without help from userspace.

Tested-by: William Towle <william.towle-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Signed-off-by: Ian Molton <ian.molton-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
---
 Documentation/devicetree/bindings/media/i2c/adv7604.txt | 5 ++++-
 drivers/media/i2c/adv7604.c                             | 9 +++++++--
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/adv7604.txt b/Documentation/devicetree/bindings/media/i2c/adv7604.txt
index cc0708c..6e8ace0 100644
--- a/Documentation/devicetree/bindings/media/i2c/adv7604.txt
+++ b/Documentation/devicetree/bindings/media/i2c/adv7604.txt
@@ -41,11 +41,12 @@ Optional Endpoint Properties:
 
   - hsync-active: Horizontal synchronization polarity. Defaults to active low.
   - vsync-active: Vertical synchronization polarity. Defaults to active low.
-  - pclk-sample: Pixel clock polarity. Defaults to output on the falling edge.
+  - pclk-sample:  Pixel clock polarity. Defaults to output on the falling edge.
 
   If none of hsync-active, vsync-active and pclk-sample is specified the
   endpoint will use embedded BT.656 synchronization.
 
+  - default-input: Select which input is selected after reset.
 
 Example:
 
@@ -59,6 +60,8 @@ Example:
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		default-input = <0>;
+
 		port@0 {
 			reg = <0>;
 		};
diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index 9f73a7f..75e1942 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -2732,7 +2732,7 @@ static int adv7604_parse_dt(struct adv7604_state *state)
 	struct v4l2_of_endpoint bus_cfg;
 	struct device_node *endpoint;
 	struct device_node *np;
-	unsigned int flags;
+	unsigned int flags, v;
 
 	np = state->i2c_clients[ADV7604_PAGE_IO]->dev.of_node;
 
@@ -2742,6 +2742,12 @@ static int adv7604_parse_dt(struct adv7604_state *state)
 		return -EINVAL;
 
 	v4l2_of_parse_endpoint(endpoint, &bus_cfg);
+
+	 if (!of_property_read_u32(endpoint, "default_input", &v))
+		state->pdata.default_input = v;
+	else
+		state->pdata.default_input = -1;
+
 	of_node_put(endpoint);
 
 	flags = bus_cfg.bus.parallel.flags;
@@ -2780,7 +2786,6 @@ static int adv7604_parse_dt(struct adv7604_state *state)
 	/* Hardcode the remaining platform data fields. */
 	state->pdata.disable_pwrdnb = 0;
 	state->pdata.disable_cable_det_rst = 0;
-	state->pdata.default_input = -1;
 	state->pdata.blank_data = 1;
 	state->pdata.alt_data_sat = 1;
 	state->pdata.op_format_mode_sel = ADV7604_OP_FORMAT_MODE0;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
