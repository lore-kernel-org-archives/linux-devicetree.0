From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] of: overlay: Fix out-of-bounds write in init_overlay_changeset()
Date: Fri,  8 Dec 2017 14:13:02 +0100
Message-ID: <1512738783-17452-2-git-send-email-geert+renesas@glider.be>
References: <1512738783-17452-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1512738783-17452-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

If an overlay has no "__symbols__" node, but it has nodes without
"__overlay__" subnodes at the end (e.g. a "__fixups__" node), after
filling in all fragments for nodes with "__overlay__" subnodes,
"fragment = &fragments[cnt]" will point beyond the end of the allocated
array.

Hence writing to "fragment->overlay" will overwrite unallocated memory,
which may lead to a crash later.

Fix this by deferring both the assignment to "fragment" and the
offending write afterwards until we know for sure the node has an
"__overlay__" subnode, and thus a valid entry in "fragments[]".

Fixes: 61b4de4e0b384f4a ("of: overlay: minor restructuring")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
--
This applies to both v4.15-rc2 and Rob's for-next branch.
---
 drivers/of/overlay.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index b8918e92d5a5268f..49b8939af6b201ca 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -572,9 +572,10 @@ static int init_overlay_changeset(struct overlay_changeset *ovcs,
 
 	cnt = 0;
 	for_each_child_of_node(tree, node) {
-		fragment = &fragments[cnt];
-		fragment->overlay = of_get_child_by_name(node, "__overlay__");
-		if (fragment->overlay) {
+		overlay_node = of_get_child_by_name(node, "__overlay__");
+		if (overlay_node) {
+			fragment = &fragments[cnt];
+			fragment->overlay = overlay_node;
 			fragment->target = find_target_node(node);
 			if (!fragment->target) {
 				of_node_put(fragment->overlay);
-- 
2.7.4
