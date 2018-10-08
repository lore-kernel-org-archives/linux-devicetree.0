From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: [PATCH 09/14] mtd: maps: physmap: Fix coding style issues reported by
 checkpatch
Date: Mon,  8 Oct 2018 22:10:22 +0200
Message-ID: <20181008201027.17952-10-boris.brezillon@bootlin.com>
References: <20181008201027.17952-1-boris.brezillon@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20181008201027.17952-1-boris.brezillon@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@bootlin.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
List-Id: devicetree@vger.kernel.org

Fix the following coding style issues:
- != NULL and == NULL test replaced by ! (or nothing)
- split over 80 chars lines
- add missing braces in multi-line if() {} else {} statements

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/maps/physmap.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 7d30f3524d35..e27051bc5dc6 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -38,7 +38,7 @@ static int physmap_flash_remove(struct platform_device *dev)
 	int i, err;
 
 	info = platform_get_drvdata(dev);
-	if (info == NULL)
+	if (!info)
 		return 0;
 
 	physmap_data = dev_get_platdata(&dev->dev);
@@ -53,7 +53,7 @@ static int physmap_flash_remove(struct platform_device *dev)
 	}
 
 	for (i = 0; i < info->nmaps; i++) {
-		if (info->mtds[i] != NULL)
+		if (info->mtds[i])
 			map_destroy(info->mtds[i]);
 	}
 
@@ -90,10 +90,12 @@ static void physmap_set_vpp(struct map_info *map, int state)
 }
 
 static const char * const rom_probe_types[] = {
-	"cfi_probe", "jedec_probe", "qinfo_probe", "map_rom", NULL };
+	"cfi_probe", "jedec_probe", "qinfo_probe", "map_rom", NULL
+};
 
 static const char * const part_probe_types[] = {
-	"cmdlinepart", "RedBoot", "afs", NULL };
+	"cmdlinepart", "RedBoot", "afs", NULL
+};
 
 static int physmap_flash_probe(struct platform_device *dev)
 {
@@ -105,11 +107,10 @@ static int physmap_flash_probe(struct platform_device *dev)
 	int i;
 
 	physmap_data = dev_get_platdata(&dev->dev);
-	if (physmap_data == NULL)
+	if (!physmap_data)
 		return -ENODEV;
 
-	info = devm_kzalloc(&dev->dev, sizeof(struct physmap_flash_info),
-			    GFP_KERNEL);
+	info = devm_kzalloc(&dev->dev, sizeof(*info), GFP_KERNEL);
 	if (!info)
 		return -ENOMEM;
 
@@ -163,13 +164,16 @@ static int physmap_flash_probe(struct platform_device *dev)
 		simple_map_init(&info->maps[i]);
 
 		probe_type = rom_probe_types;
-		if (physmap_data->probe_type == NULL) {
-			for (; info->mtds[i] == NULL && *probe_type != NULL; probe_type++)
-				info->mtds[i] = do_map_probe(*probe_type, &info->maps[i]);
-		} else
-			info->mtds[i] = do_map_probe(physmap_data->probe_type, &info->maps[i]);
+		if (!physmap_data->probe_type) {
+			for (; !info->mtds[i] && *probe_type; probe_type++)
+				info->mtds[i] = do_map_probe(*probe_type,
+							     &info->maps[i]);
+		} else {
+			info->mtds[i] = do_map_probe(physmap_data->probe_type,
+						     &info->maps[i]);
+		}
 
-		if (info->mtds[i] == NULL) {
+		if (!info->mtds[i]) {
 			dev_err(&dev->dev, "map_probe failed\n");
 			err = -ENXIO;
 			goto err_out;
@@ -185,7 +189,7 @@ static int physmap_flash_probe(struct platform_device *dev)
 		 */
 		info->cmtd = mtd_concat_create(info->mtds, info->nmaps,
 					       dev_name(&dev->dev));
-		if (info->cmtd == NULL)
+		if (!info->cmtd)
 			err = -ENXIO;
 	}
 	if (err)
@@ -231,7 +235,6 @@ static struct platform_driver physmap_flash_driver = {
 	},
 };
 
-
 #ifdef CONFIG_MTD_PHYSMAP_COMPAT
 static struct physmap_flash_data physmap_flash_data = {
 	.width		= CONFIG_MTD_PHYSMAP_BANKWIDTH,
-- 
2.14.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
