From: frowand.list@gmail.com
Subject: [PATCH v3 08/12] of: overlay: loosen overly strict phandle clash check
Date: Tue, 17 Oct 2017 16:36:28 -0700
Message-ID: <1508283392-18252-9-git-send-email-frowand.list@gmail.com>
References: <1508283392-18252-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1508283392-18252-1-git-send-email-frowand.list@gmail.com>
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
index 4cdee169a5ab..791753321ed2 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -311,10 +311,10 @@ static int add_changeset_node(struct overlay_changeset *ovcs,
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
