From: Jonas Gorski <jonas.gorski@gmail.com>
Subject: [PATCH V2 2/5] mtd: bcm63xxpart: add of_match_table support
Date: Thu, 28 Mar 2019 15:19:07 +0100
Message-ID: <20190328141910.5723-3-jonas.gorski@gmail.com>
References: <20190328141910.5723-1-jonas.gorski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20190328141910.5723-1-jonas.gorski@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

Add of_match_table support to allow using bcm63xxpart as a full flash
layout parser from device tree.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 drivers/mtd/bcm63xxpart.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/bcm63xxpart.c b/drivers/mtd/bcm63xxpart.c
index 41d1d3149c61..f639b4c960f0 100644
--- a/drivers/mtd/bcm63xxpart.c
+++ b/drivers/mtd/bcm63xxpart.c
@@ -34,6 +34,7 @@
 #include <linux/vmalloc.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
+#include <linux/of.h>
 
 #define BCM963XX_CFE_BLOCK_SIZE		SZ_64K	/* always at least 64KiB */
 
@@ -311,9 +312,16 @@ static int bcm63xx_parse_cfe_partitions(struct mtd_info *master,
 	return ret;
 };
 
+static const struct of_device_id parse_bcm63xx_cfe_match_table[] = {
+	{ .compatible = "brcm,bcm963xx-cfe-nor-partitions" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, parse_bcm63xx_cfe_match_table);
+
 static struct mtd_part_parser bcm63xx_cfe_parser = {
 	.parse_fn = bcm63xx_parse_cfe_partitions,
 	.name = "bcm63xxpart",
+	.of_match_table = parse_bcm63xx_cfe_match_table,
 };
 module_mtd_part_parser(bcm63xx_cfe_parser);
 
-- 
2.13.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
