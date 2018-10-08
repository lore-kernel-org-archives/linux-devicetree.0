From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: [PATCH 07/14] mtd: maps: physmap: Check mtd_device_{parse_register,
 unregister}() ret code
Date: Mon,  8 Oct 2018 22:10:20 +0200
Message-ID: <20181008201027.17952-8-boris.brezillon@bootlin.com>
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

mtd_device_parse_register() and mtd_device_unregister() can fail,
check their return code and propagate the error to the upper layer
if needed.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/maps/physmap.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 86679d149a49..9b34223c4635 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -35,7 +35,7 @@ static int physmap_flash_remove(struct platform_device *dev)
 {
 	struct physmap_flash_info *info;
 	struct physmap_flash_data *physmap_data;
-	int i;
+	int i, err;
 
 	info = platform_get_drvdata(dev);
 	if (info == NULL)
@@ -44,7 +44,10 @@ static int physmap_flash_remove(struct platform_device *dev)
 	physmap_data = dev_get_platdata(&dev->dev);
 
 	if (info->cmtd) {
-		mtd_device_unregister(info->cmtd);
+		err = mtd_device_unregister(info->cmtd);
+		if (err)
+			return err;
+
 		if (info->cmtd != info->mtds[0])
 			mtd_concat_destroy(info->cmtd);
 	}
@@ -194,8 +197,12 @@ static int physmap_flash_probe(struct platform_device *dev)
 
 	part_types = physmap_data->part_probe_types ? : part_probe_types;
 
-	mtd_device_parse_register(info->cmtd, part_types, NULL,
-				  physmap_data->parts, physmap_data->nr_parts);
+	err = mtd_device_parse_register(info->cmtd, part_types, NULL,
+					physmap_data->parts,
+					physmap_data->nr_parts);
+	if (err)
+		goto err_out;
+
 	return 0;
 
 err_out:
-- 
2.14.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
