From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 2/2] media: adv7604: automatic "default-input" selection
Date: Fri, 16 Sep 2016 11:39:42 +0200
Message-ID: <20160916093942.17213-3-ulrich.hecht+renesas@gmail.com>
References: <20160916093942.17213-1-ulrich.hecht+renesas@gmail.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20160916093942.17213-1-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: hans.verkuil@cisco.com, niklas.soderlund@ragnatech.se
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, magnus.damm@gmail.com, ulrich.hecht+renesas@gmail.com, laurent.pinchart@ideasonboard.com, william.towle@codethink.co.uk, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Fall back to input 0 if "default-input" property is not present.

Documentation states that the "default-input" property should reside
directly in the node for adv7612.  Hence, also adjust the parsing to make
the implementation consistent with this.

Based on patch by William Towle <william.towle@codethink.co.uk>.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
---
 drivers/media/i2c/adv7604.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index 4003831..055c9df 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -3077,10 +3077,13 @@ static int adv76xx_parse_dt(struct adv76xx_state *state)
 	if (!of_property_read_u32(endpoint, "default-input", &v))
 		state->pdata.default_input = v;
 	else
-		state->pdata.default_input = -1;
+		state->pdata.default_input = 0;
 
 	of_node_put(endpoint);
 
+	if (!of_property_read_u32(np, "default-input", &v))
+		state->pdata.default_input = v;
+
 	flags = bus_cfg.bus.parallel.flags;
 
 	if (flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
-- 
2.9.3
