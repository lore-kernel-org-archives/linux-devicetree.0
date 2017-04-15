From: frowand.list@gmail.com
Subject: [PATCH 4/4] of: detect invalid phandle in overlay
Date: Fri, 14 Apr 2017 20:55:20 -0700
Message-ID: <1492228520-12450-5-git-send-email-frowand.list@gmail.com>
References: <1492228520-12450-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1492228520-12450-1-git-send-email-frowand.list@gmail.com>
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
index ca0b85f5deb1..20ab49d2f7a4 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -130,6 +130,10 @@ static int of_overlay_apply_single_device_node(struct of_overlay *ov,
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
