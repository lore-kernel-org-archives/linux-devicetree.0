From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: [PATCH 05/14] mtd: maps: physmap: Use devm_ioremap_resource()
Date: Mon,  8 Oct 2018 22:10:18 +0200
Message-ID: <20181008201027.17952-6-boris.brezillon@bootlin.com>
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

Use devm_ioremap_resource() to replace the devm_request_mem_region() +
devm_ioremap() combination.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/maps/physmap.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index c8df9cccf4c4..cbc50b53ec9d 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -129,17 +129,15 @@ static int physmap_flash_probe(struct platform_device *dev)
 		if (res)
 			break;
 
-		dev_notice(&dev->dev, "physmap platform flash device: %pR\n",
-			   res);
-
-		if (!devm_request_mem_region(&dev->dev, res->start,
-					     resource_size(res),
-					     dev_name(&dev->dev))) {
-			dev_err(&dev->dev, "Could not reserve memory region\n");
-			err = -ENOMEM;
+		info->maps[i].virt = devm_ioremap_resource(&dev->dev, res);
+		if (IS_ERR(info->maps[i].virt)) {
+			err = PTR_ERR(info->maps[i].virt);
 			goto err_out;
 		}
 
+		dev_notice(&dev->dev, "physmap platform flash device: %pR\n",
+			   res);
+
 		info->maps[i].name = dev_name(&dev->dev);
 		info->maps[i].phys = res->start;
 		info->maps[i].size = resource_size(res);
@@ -148,15 +146,6 @@ static int physmap_flash_probe(struct platform_device *dev)
 		info->maps[i].pfow_base = physmap_data->pfow_base;
 		info->maps[i].map_priv_1 = (unsigned long)dev;
 
-		info->maps[i].virt = devm_ioremap(&dev->dev,
-						  info->maps[i].phys,
-						  info->maps[i].size);
-		if (info->maps[i].virt == NULL) {
-			dev_err(&dev->dev, "Failed to ioremap flash region\n");
-			err = -EIO;
-			goto err_out;
-		}
-
 		simple_map_init(&info->maps[i]);
 
 		probe_type = rom_probe_types;
-- 
2.14.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
