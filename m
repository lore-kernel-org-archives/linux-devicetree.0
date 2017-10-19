From: frowand.list@gmail.com
Subject: [PATCH] of: overlay: make pr_err() string unique
Date: Thu, 19 Oct 2017 14:38:11 -0700
Message-ID: <1508449091-9506-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, pantelis.antoniou@konsulko.com, Pantelis Antoniou <panto@antoniou-consulting.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

The same error string occurs in drivers/of/resolver.c.  Change
the error here to more precisely describe this case, and avoid
the possible confusion of looking in the wrong source location
to understand the cause of an error.

Signed-off-by: Frank Rowand <frank.rowand@sony.com>
---

And yes, I was looking in the wrong file and not understanding
how this error could have been triggered by the example
provided.  :-)

 drivers/of/overlay.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index f5fce0fea40b..c150abb9049d 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -598,7 +598,7 @@ static int init_overlay_changeset(struct overlay_changeset *ovcs,
 		fragment->target = of_find_node_by_path("/__symbols__");
 
 		if (!fragment->target) {
-			pr_err("no symbols in root of device tree.\n");
+			pr_err("symbols in overlay, but not in live tree\n");
 			ret = -EINVAL;
 			goto err_free_fragments;
 		}
-- 
Frank Rowand <frank.rowand@sony.com>
