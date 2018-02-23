Return-Path: <SRS0=goDf=FR=vger.kernel.org=devicetree-owner@kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:34572 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751461AbeBWIfY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 23 Feb 2018 03:35:24 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC dtc 1/2] overlay: Do not use @ in overlay fragment generation
Date: Fri, 23 Feb 2018 09:35:16 +0100
Message-Id: <1519374917-30171-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1519374917-30171-1-git-send-email-geert+renesas@glider.be>
References: <1519374917-30171-1-git-send-email-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: David Gibson <david@gibson.dropbear.id.au>, Jon Loeliger <jdl@jdl.com>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

Fragments generated from overlay sugar syntax violate unit address
rules:

    <stdout>: Warning (unit_address_vs_reg): Node /fragment@0 has a unit name, but no reg property

Use "fragment-N" instead of "fragment@N" to fix this.

Fixes: 737b2df39cc8c566 ("overlay: Add syntactic sugar version of overlays")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 livetree.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/livetree.c b/livetree.c
index 57b7db2ed1534873..a87a1262459c830e 100644
--- a/livetree.c
+++ b/livetree.c
@@ -229,7 +229,7 @@ struct node * add_orphan_node(struct node *dt, struct node *new_node, char *ref)
 
 	p = build_property("target", d);
 
-	xasprintf(&name, "fragment@%u",
+	xasprintf(&name, "fragment-%u",
 			next_orphan_fragment++);
 	name_node(new_node, "__overlay__");
 	node = build_node(p, new_node);
-- 
2.7.4

