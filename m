From: Julia Lawall <julia@diku.dk>
Subject: [PATCH 1/4] drivers/mtd/maps: introduce missing kfree
Date: Tue, 1 Jun 2010 16:34:20 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.1006011625510.12546@ask.diku.dk>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Woodhouse <dwmw2@infradead.org>, Grant Likely <grant.likely@secretlab.ca>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.orgker
List-Id: devicetree@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Error handling code following a kmalloc should free the allocated data.

The semantic match that finds the problem is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@r exists@
local idexpression x;
statement S;
expression E;
identifier f,f1,l;
position p1,p2;
expression *ptr != NULL;
@@

x@p1 = \(kmalloc\|kzalloc\|kcalloc\)(...);
...
if (x == NULL) S
<... when != x
     when != if (...) { <+...x...+> }
(
x->f1 = E
|
 (x->f1 == NULL || ...)
|
 f(...,x->f1,...)
)
...>
(
 return \(0\|<+...x...+>\|ptr\);
|
 return@p2 ...;
)

@script:python@
p1 << r.p1;
p2 << r.p2;
@@

print "* file: %s kmalloc %s return %s" % (p1[0].file,p1[0].line,p2[0].line)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>
---
 drivers/mtd/maps/physmap_of.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index ba124ba..6ac5f9f 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -353,7 +353,7 @@ static int __devinit of_flash_probe(struct of_device *dev,
 				   &info->parts, 0);
 	if (err < 0) {
 		of_free_probes(part_probe_types);
-		return err;
+		goto err_out;
 	}
 	of_free_probes(part_probe_types);
 
@@ -361,14 +361,14 @@ static int __devinit of_flash_probe(struct of_device *dev,
 	if (err == 0) {
 		err = of_mtd_parse_partitions(&dev->dev, dp, &info->parts);
 		if (err < 0)
-			return err;
+			goto err_out;
 	}
 #endif
 
 	if (err == 0) {
 		err = parse_obsolete_partitions(dev, info, dp);
 		if (err < 0)
-			return err;
+			goto err_out;
 	}
 
 	if (err > 0)
