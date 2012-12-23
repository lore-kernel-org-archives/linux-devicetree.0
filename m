From: Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH] mtd: physmap_of: fix cmdline partition method w/o linux,
 mtd-name
Date: Sun, 23 Dec 2012 13:10:50 +0200
Message-ID: <df9da712b775781366ae23aac28ed20849b4e4d3.1356260943.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: linux-mtd-bounces@lists.infradead.org
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: linux-mtd@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Baruch Siach <baruch@tkos.co.il>
List-Id: devicetree@vger.kernel.org

Commit d68cbdd4fb (mtd: physmap_of: allow to specify the mtd name for retro
compatiblity) broke cmdline partitioning using dev_name() in the kernel command
line.  of_property_read_string() does not touch mtd_name when linux,mtd-name is
not present in the device tree, which causes map.name to be set to a random
value.  Fix this by initializing mtd_name to NULL.

Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 drivers/mtd/maps/physmap_of.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index 37cdc20..6fb2bd8 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -170,7 +170,7 @@ static int of_flash_probe(struct platform_device *dev)
 	resource_size_t res_size;
 	struct mtd_part_parser_data ppdata;
 	bool map_indirect;
-	const char *mtd_name;
+	const char *mtd_name = NULL;
 
 	match = of_match_device(of_flash_match, &dev->dev);
 	if (!match)
-- 
1.7.10.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
