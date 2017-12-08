From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] of: overlay: Make node skipping in init_overlay_changeset() clearer
Date: Fri,  8 Dec 2017 14:13:03 +0100
Message-ID: <1512738783-17452-3-git-send-email-geert+renesas@glider.be>
References: <1512738783-17452-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1512738783-17452-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Make it more clear that nodes without "__overlay__" subnodes are
skipped, by reverting the logic and using continue.
This also reduces indentation level.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This applies to Rob's for-next branch only.
---
 drivers/of/overlay.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 49b8939af6b201ca..54a73bd771fe27b7 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -573,18 +573,19 @@ static int init_overlay_changeset(struct overlay_changeset *ovcs,
 	cnt = 0;
 	for_each_child_of_node(tree, node) {
 		overlay_node = of_get_child_by_name(node, "__overlay__");
-		if (overlay_node) {
-			fragment = &fragments[cnt];
-			fragment->overlay = overlay_node;
-			fragment->target = find_target_node(node);
-			if (!fragment->target) {
-				of_node_put(fragment->overlay);
-				ret = -EINVAL;
-				goto err_free_fragments;
-			}
+		if (!overlay_node)
+			continue;
 
-			cnt++;
+		fragment = &fragments[cnt];
+		fragment->overlay = overlay_node;
+		fragment->target = find_target_node(node);
+		if (!fragment->target) {
+			of_node_put(fragment->overlay);
+			ret = -EINVAL;
+			goto err_free_fragments;
 		}
+
+		cnt++;
 	}
 
 	/*
-- 
2.7.4
