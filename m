From: frowand.list@gmail.com
Subject: [PATCH v2 08/12] of: overlay: loosen overly strict phandle clash check
Date: Mon, 16 Oct 2017 18:17:50 -0700
Message-ID: <1508203074-26917-9-git-send-email-frowand.list@gmail.com>
References: <1508203074-26917-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1508203074-26917-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, David Airlie <airlied@linux.ie>, Jyri Sarha <jsarha@ti.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

When an overlay contains a node that already exists in
the live device tree, the overlay node is not allowed
to change the phandle of the existing node.

The existing check refused to allow an overlay node to
set the node phandle even when the existing node did
not have a phandle.  Relax the check to allow an
overlay node to set the phandle value if the existing
node does not have a phandle.

Signed-off-by: Frank Rowand <frank.rowand@sony.com>
---
 drivers/of/overlay.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 015d8b112f60..a0d3222febdc 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -302,10 +302,10 @@ static int add_changeset_node(struct overlay_changeset *ovcs,
 		return build_changeset_next_level(ovcs, tchild, node, 0);
 	}
 
-	if (node->phandle)
-		return -EINVAL;
-
-	ret = build_changeset_next_level(ovcs, tchild, node, 0);
+	if (node->phandle && tchild->phandle)
+		ret = -EINVAL;
+	else
+		ret = build_changeset_next_level(ovcs, tchild, node, 0);
 	of_node_put(tchild);
 
 	return ret;
-- 
Frank Rowand <frank.rowand@sony.com>
