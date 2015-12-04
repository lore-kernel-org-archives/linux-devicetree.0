From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH for-4.4 1/2] mtd: ofpart: don't complain about missing 'partitions' node too loudly
Date: Thu,  3 Dec 2015 18:02:08 -0800
Message-ID: <1449194529-145705-1-git-send-email-computersforpeace@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>, Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The ofpart partition parser might be run on DT-enabled systems that
don't have any "ofpart" partition subnodes at all, since "ofpart" is in
the default parser list. So don't complain loudly on every boot.

Example: using m25p80.c with no intent to use ofpart:

&spi2 {
	status = "okay";

	flash@0 {
		compatible = "jedec,spi-nor";
		reg = <0>;
	};
};

I see this warning:

[    0.588471] m25p80 spi2.0: gd25q32 (4096 Kbytes)
[    0.593091] spi2.0: 'partitions' subnode not found on /spi@ff130000/flash@0. Trying to parse direct subnodes as partitions.

Cc: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
This one really seems like we should put it into 4.4. Basically everyone with a
DT-enabled MTD using the default parsers will get this warning, even if they're
not intending to use ofpart at all.

 drivers/mtd/ofpart.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
index 669c3452f278..3e9c5857c991 100644
--- a/drivers/mtd/ofpart.c
+++ b/drivers/mtd/ofpart.c
@@ -46,8 +46,13 @@ static int parse_ofpart_partitions(struct mtd_info *master,
 
 	ofpart_node = of_get_child_by_name(mtd_node, "partitions");
 	if (!ofpart_node) {
-		pr_warn("%s: 'partitions' subnode not found on %s. Trying to parse direct subnodes as partitions.\n",
-			master->name, mtd_node->full_name);
+		/*
+		 * We might get here even when ofpart isn't used at all (e.g.,
+		 * when using another parser), so don't be louder than
+		 * KERN_DEBUG
+		 */
+		pr_debug("%s: 'partitions' subnode not found on %s. Trying to parse direct subnodes as partitions.\n",
+			 master->name, mtd_node->full_name);
 		ofpart_node = mtd_node;
 		dedicated = false;
 	}
-- 
2.6.0.rc2.230.g3dd15c0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
