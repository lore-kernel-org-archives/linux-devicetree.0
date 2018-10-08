From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: [PATCH 02/14] mtd: maps: physmap: Rename ->map and ->mtd into ->maps
 and ->mtds
Date: Mon,  8 Oct 2018 22:10:15 +0200
Message-ID: <20181008201027.17952-3-boris.brezillon@bootlin.com>
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

The ->map and ->mtd fields are actually arrays of map and mtd objects.
Rename those fields into ->maps and ->mtds to make it obvious.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/maps/physmap.c | 55 +++++++++++++++++++++++-----------------------
 1 file changed, 28 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 19ec105cbb2d..4010afee4a33 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -25,9 +25,9 @@
 #define MAX_RESOURCES		4
 
 struct physmap_flash_info {
-	struct mtd_info		*mtd[MAX_RESOURCES];
+	struct mtd_info		*mtds[MAX_RESOURCES];
 	struct mtd_info		*cmtd;
-	struct map_info		map[MAX_RESOURCES];
+	struct map_info		maps[MAX_RESOURCES];
 	spinlock_t		vpp_lock;
 	int			vpp_refcnt;
 };
@@ -46,13 +46,13 @@ static int physmap_flash_remove(struct platform_device *dev)
 
 	if (info->cmtd) {
 		mtd_device_unregister(info->cmtd);
-		if (info->cmtd != info->mtd[0])
+		if (info->cmtd != info->mtds[0])
 			mtd_concat_destroy(info->cmtd);
 	}
 
 	for (i = 0; i < MAX_RESOURCES; i++) {
-		if (info->mtd[i] != NULL)
-			map_destroy(info->mtd[i]);
+		if (info->mtds[i] != NULL)
+			map_destroy(info->mtds[i]);
 	}
 
 	if (physmap_data->exit)
@@ -136,48 +136,49 @@ static int physmap_flash_probe(struct platform_device *dev)
 			goto err_out;
 		}
 
-		info->map[i].name = dev_name(&dev->dev);
-		info->map[i].phys = dev->resource[i].start;
-		info->map[i].size = resource_size(&dev->resource[i]);
-		info->map[i].bankwidth = physmap_data->width;
-		info->map[i].set_vpp = physmap_set_vpp;
-		info->map[i].pfow_base = physmap_data->pfow_base;
-		info->map[i].map_priv_1 = (unsigned long)dev;
-
-		info->map[i].virt = devm_ioremap(&dev->dev, info->map[i].phys,
-						 info->map[i].size);
-		if (info->map[i].virt == NULL) {
+		info->maps[i].name = dev_name(&dev->dev);
+		info->maps[i].phys = dev->resource[i].start;
+		info->maps[i].size = resource_size(&dev->resource[i]);
+		info->maps[i].bankwidth = physmap_data->width;
+		info->maps[i].set_vpp = physmap_set_vpp;
+		info->maps[i].pfow_base = physmap_data->pfow_base;
+		info->maps[i].map_priv_1 = (unsigned long)dev;
+
+		info->maps[i].virt = devm_ioremap(&dev->dev,
+						  info->maps[i].phys,
+						  info->maps[i].size);
+		if (info->maps[i].virt == NULL) {
 			dev_err(&dev->dev, "Failed to ioremap flash region\n");
 			err = -EIO;
 			goto err_out;
 		}
 
-		simple_map_init(&info->map[i]);
+		simple_map_init(&info->maps[i]);
 
 		probe_type = rom_probe_types;
 		if (physmap_data->probe_type == NULL) {
-			for (; info->mtd[i] == NULL && *probe_type != NULL; probe_type++)
-				info->mtd[i] = do_map_probe(*probe_type, &info->map[i]);
+			for (; info->mtds[i] == NULL && *probe_type != NULL; probe_type++)
+				info->mtds[i] = do_map_probe(*probe_type, &info->maps[i]);
 		} else
-			info->mtd[i] = do_map_probe(physmap_data->probe_type, &info->map[i]);
+			info->mtds[i] = do_map_probe(physmap_data->probe_type, &info->maps[i]);
 
-		if (info->mtd[i] == NULL) {
+		if (info->mtds[i] == NULL) {
 			dev_err(&dev->dev, "map_probe failed\n");
 			err = -ENXIO;
 			goto err_out;
 		} else {
 			devices_found++;
 		}
-		info->mtd[i]->dev.parent = &dev->dev;
+		info->mtds[i]->dev.parent = &dev->dev;
 	}
 
 	if (devices_found == 1) {
-		info->cmtd = info->mtd[0];
+		info->cmtd = info->mtds[0];
 	} else if (devices_found > 1) {
 		/*
 		 * We detected multiple devices. Concatenate them together.
 		 */
-		info->cmtd = mtd_concat_create(info->mtd, devices_found, dev_name(&dev->dev));
+		info->cmtd = mtd_concat_create(info->mtds, devices_found, dev_name(&dev->dev));
 		if (info->cmtd == NULL)
 			err = -ENXIO;
 	}
@@ -203,9 +204,9 @@ static void physmap_flash_shutdown(struct platform_device *dev)
 	struct physmap_flash_info *info = platform_get_drvdata(dev);
 	int i;
 
-	for (i = 0; i < MAX_RESOURCES && info->mtd[i]; i++)
-		if (mtd_suspend(info->mtd[i]) == 0)
-			mtd_resume(info->mtd[i]);
+	for (i = 0; i < MAX_RESOURCES && info->mtds[i]; i++)
+		if (mtd_suspend(info->mtds[i]) == 0)
+			mtd_resume(info->mtds[i]);
 }
 #else
 #define physmap_flash_shutdown NULL
-- 
2.14.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
