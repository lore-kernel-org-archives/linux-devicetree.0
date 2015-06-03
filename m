From: Michal Suchanek <hramrach@gmail.com>
Subject: [PATCH 05/11] mtd: mtdpart: Do not fail mtd probe when parsing
 partitions fails.
Date: 3 Jun 2015 21:26:40 -0000
Message-ID: <2be0439cf72f5b7f430a937bacf430cffab91f08.1433364398.git.hramrach@gmail.com>
References: <cover.1433364398.git.hramrach@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1433364398.git.hramrach@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Han Xu <han.xu@freescale.com>, Mark Brown <broonie@kernel.org>, Michal Suchanek <hramrach@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Marek Vasut <marex@denx.de>, Alison Chaiken <alison_chaiken@mentor.com>, Huang Shijie <b32955@freescale.com>, Ben Hutchings <ben@decadent.org.uk>, Knut Wohlrab <knut.wohlrab@de.bosch.com>
List-Id: devicetree@vger.kernel.org

Due to wrong assumption in ofpart ofpart fails on Exynos on SPI chips
with no partitions because the subnode containing controller data
confuses the ofpart parser.

Thus compiling in ofpart support automatically fails probing any SPI NOR
flash without partitions on Exynos. Compiling in a partitioning scheme
should not cause probe of otherwise valid device to fail.

Remove that failure possibility.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
---
 drivers/mtd/mtdpart.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index a79c4f7..37a2b79 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -743,7 +743,6 @@ static const char * const default_mtd_part_types[] = {
  * partitions parsed out by the first parser.
  *
  * This function may return:
- * o a negative error code in case of failure
  * o zero if no partitions were found
  * o a positive number of found partitions, in which case on exit @pparts will
  *   point to an array containing this number of &struct mtd_info objects.
@@ -773,10 +772,10 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
 		if (ret > 0) {
 			printk(KERN_NOTICE "%d %s partitions found on MTD device %s\n",
 			       ret, parser->name, master->name);
-			break;
+			return ret;
 		}
 	}
-	return ret;
+	return 0;
 }
 
 int mtd_is_partition(const struct mtd_info *mtd)
-- 
2.1.4
