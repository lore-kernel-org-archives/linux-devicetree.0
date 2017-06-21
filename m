From: frowand.list@gmail.com
Subject: [PATCH] of: detect invalid phandle in overlay
Date: Wed, 21 Jun 2017 12:21:56 -0700
Message-ID: <1498072916-4664-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

Overlays are not allowed to modify phandle values of previously existing
nodes because there is no information available to allow fixup up
properties that use the previously existing phandle.

Signed-off-by: Frank Rowand <frank.rowand@sony.com>
---
 drivers/of/overlay.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 7827786718d8..c0e4ee1cd1ba 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -132,6 +132,10 @@ static int of_overlay_apply_single_device_node(struct of_overlay *ov,
 	/* NOTE: Multiple mods of created nodes not supported */
 	tchild = of_get_child_by_name(target, cname);
 	if (tchild != NULL) {
+		/* new overlay phandle value conflicts with existing value */
+		if (child->phandle)
+			return -EINVAL;
+
 		/* apply overlay recursively */
 		ret = of_overlay_apply_one(ov, tchild, child);
 		of_node_put(tchild);
-- 
Frank Rowand <frank.rowand@sony.com>
