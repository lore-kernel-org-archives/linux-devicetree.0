From: frowand.list@gmail.com
Subject: [PATCH v3 12/12] of: overlay: remove unneeded check for NULL kbasename()
Date: Tue, 17 Oct 2017 16:36:32 -0700
Message-ID: <1508283392-18252-13-git-send-email-frowand.list@gmail.com>
References: <1508283392-18252-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1508283392-18252-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, David Airlie <airlied@linux.ie>, Jyri Sarha <jsarha@ti.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

kbasename() will not return NULL if passed a valid string.  If
the parameter passed to kbasename() in this case is already NULL
then the devicetree has been corrupted.

Signed-off-by: Frank Rowand <frank.rowand@sony.com>
---
 drivers/of/overlay.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 0e9aefc1ff15..c99842bb4b09 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -331,8 +331,6 @@ static int add_changeset_node(struct overlay_changeset *ovcs,
 	int ret = 0;
 
 	node_kbasename = kbasename(node->full_name);
-	if (!node_kbasename)
-		return -ENOMEM;
 
 	for_each_child_of_node(target_node, tchild)
 		if (!of_node_cmp(node_kbasename, kbasename(tchild->full_name)))
-- 
Frank Rowand <frank.rowand@sony.com>
