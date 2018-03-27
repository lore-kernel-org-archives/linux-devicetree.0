Return-Path: <SRS0=NL1J=GR=vger.kernel.org=devicetree-compiler-owner@kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH dtc] checks: Print duplicate node name instead of parent name
Date: Tue, 27 Mar 2018 14:13:31 +0200
Message-Id: <1522152811-28022-1-git-send-email-geert+renesas@glider.be>
Sender: devicetree-compiler-owner@vger.kernel.org
To: David Gibson <david@gibson.dropbear.id.au>, Jon Loeliger <jdl@jdl.com>
Cc: devicetree-compiler@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

When refactoring node path printing, the code checking for duplicate
node names was accidentally changed to print the name of the parent
node, instead of the name of the duplicated child node.

Fixes: 88960e3989073207 ("checks: centralize printing of node path in check_msg")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Also applies to Linux' scripts/dtc/checks.c.
---
 checks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/checks.c b/checks.c
index 1e6a88c81a998415..e6a38a87cc7d9aac 100644
--- a/checks.c
+++ b/checks.c
@@ -255,7 +255,7 @@ static void check_duplicate_node_names(struct check *c, struct dt_info *dti,
 		     child2;
 		     child2 = child2->next_sibling)
 			if (streq(child->name, child2->name))
-				FAIL(c, dti, node, "Duplicate node name");
+				FAIL(c, dti, child2, "Duplicate node name");
 }
 ERROR(duplicate_node_names, check_duplicate_node_names, NULL);
 
-- 
2.7.4

