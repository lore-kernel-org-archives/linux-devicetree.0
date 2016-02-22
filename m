From: John Keeping <john@metanate.com>
Subject: Disabling graph endpoints in device trees
Date: Mon, 22 Feb 2016 14:14:38 +0000
Message-ID: <20160222141438.79de430c.john@metanate.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

Hi,

Is there a reason why endpoints in a device tree graph can't be
disabled?

I would like to be able to force the use of a particular CRTC for
certain outputs even though the hardware is capable of connecting any
CRTC to any output.  In this case I need to be able to support a wide
range of frequencies for external HDMI monitors so I will configure one
of the CRTCs to be able to generate these while the other will be tied
into a limited set of clock rates as a result of the overall system
clock setup.

Currently this can only be achieved by removing the endpoints from the
base SoC .dtsi file but it feels like it should be possible to add
'status = "disabled"' to the nodes in the board-specific .dts in order
to disable undesirable configurations.

I tested the change below and it behaves exactly as I want, but I don't
claim to understand all of the users of these functions to know if it
will break something else (hence this isn't a formal patch).

-- >8 --
diff --git a/drivers/of/base.c b/drivers/of/base.c
index 017dd94..1e56b91 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -2143,7 +2143,7 @@ struct device_node *of_graph_get_port_by_id(struct device_node *parent, u32 id)
 	if (node)
 		parent = node;
 
-	for_each_child_of_node(parent, port) {
+	for_each_available_child_of_node(parent, port) {
 		u32 port_id = 0;
 
 		if (of_node_cmp(port->name, "port") != 0)
@@ -2209,7 +2209,7 @@ struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
 		 * getting the next child. If the previous endpoint is NULL this
 		 * will return the first child.
 		 */
-		endpoint = of_get_next_child(port, prev);
+		endpoint = of_get_next_available_child(port, prev);
 		if (endpoint) {
 			of_node_put(port);
 			return endpoint;
@@ -2219,7 +2219,7 @@ struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
 		prev = NULL;
 
 		do {
-			port = of_get_next_child(parent, port);
+			port = of_get_next_available_child(parent, port);
 			if (!port)
 				return NULL;
 		} while (of_node_cmp(port->name, "port"));
-- 8< --


Thanks,
John
