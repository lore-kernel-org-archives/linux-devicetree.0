From: Stuart Yoder <stuart.yoder@nxp.com>
Subject: [PATCH] of/irq: fix bug in computing output requester-id for an msi-map
Date: Mon, 8 Feb 2016 16:30:23 -0600
Message-ID: <1454970623-28781-1-git-send-email-stuart.yoder@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh@kernel.org, frowand.list@gmail.com, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: marc.zyngier@arm.com, david.daney@cavium.com, mark.rutland@arm.com, Stuart Yoder <stuart.yoder@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Stuart Yoder <stuart.yoder@nxp.com>

The binding for msi-map specifies that the output requester id
should be computed as: (r - rid-base + msi-base)

...update the code accordingly.

Signed-off-by: Stuart Yoder <stuart.yoder@nxp.com>
---
 drivers/of/irq.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 706e3ff..3f5e5fd 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -589,6 +589,7 @@ static u32 __of_msi_map_rid(struct device *dev, struct device_node **np,
 	struct device_node *msi_controller_node;
 	struct device_node *msi_np = *np;
 	u32 map_mask, masked_rid, rid_base, msi_base, rid_len, phandle;
+	u32 masked_rid_base;
 	int msi_map_len;
 	bool matched;
 	u32 rid_out = rid_in;
@@ -654,7 +655,8 @@ static u32 __of_msi_map_rid(struct device *dev, struct device_node **np,
 	if (!matched)
 		return rid_out;
 
-	rid_out = masked_rid + msi_base;
+	masked_rid_base = map_mask & rid_base;
+	rid_out = msi_base + (masked_rid - masked_rid_base);
 	dev_dbg(dev,
 		"msi-map at: %s, using mask %08x, rid-base: %08x, msi-base: %08x, length: %08x, rid: %08x -> %08x\n",
 		dev_name(parent_dev), map_mask, rid_base, msi_base,
-- 
1.7.9.5
