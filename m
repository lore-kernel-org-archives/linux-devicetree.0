From: Michal Suchanek <hramrach@gmail.com>
Subject: [PATCH 07/11] mtd: spi-nor: rework write loop
Date: 3 Jun 2015 21:26:41 -0000
Message-ID: <df028a8d9cff88f0acecb950839255a6ede492d0.1433364398.git.hramrach@gmail.com>
References: <cover.1433364398.git.hramrach@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <cover.1433364398.git.hramrach@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Han Xu <han.xu@freescale.com>, Mark Brown <broonie@kernel.org>, Michal Suchanek <hramrach@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Marek Vasut <marex@denx.de>, Alison Chaiken <alison_chaiken@mentor.com>, Huang Shijie <b32955@freescale.com>, Ben Hutchings <ben@decadent.org.uk>, Knut Wohlrab <knut.wohlrab@de.bosch.com>
List-Id: devicetree@vger.kernel.org

The write loop assumes that what is passed to write() is what gets
written. When write() writes less than page size at once data is dropped
on the floor. Check the amount of data writen.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 48 ++++++++++++++-----------------------------
 1 file changed, 15 insertions(+), 33 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index c851bb5..76f4970 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -823,7 +823,7 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 	size_t *retlen, const u_char *buf)
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
-	u32 page_offset, page_size, i;
+	size_t page_offset, page_remain, i;
 	int ret;
 
 	dev_dbg(nor->dev, "to 0x%08x, len %zd\n", (u32)to, len);
@@ -832,45 +832,27 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 	if (ret)
 		return ret;
 
-	write_enable(nor);
-
-	page_offset = to & (nor->page_size - 1);
+	for (i = 0; i < len; ) {
+		int written;
 
-	/* do all the bytes fit onto one page? */
-	if (page_offset + len <= nor->page_size) {
-		ret = nor->write(nor, to, len, buf);
-		if (ret < 0)
-			goto write_err;
-		*retlen += ret;
-	} else {
+		page_offset = to & (nor->page_size - 1);
 		/* the size of data remaining on the first page */
-		page_size = nor->page_size - page_offset;
-		nor->write(nor, to, page_size, buf);
+		page_remain = min_t(size_t,
+				    nor->page_size - page_offset, len - i);
+
+		write_enable(nor);
+		ret = nor->write(nor, to + i, page_remain, buf + i);
 		if (ret < 0)
 			goto write_err;
-		*retlen += ret;
-
-		/* write everything in nor->page_size chunks */
-		for (i = ret; i < len; ) {
-			page_size = len - i;
-			if (page_size > nor->page_size)
-				page_size = nor->page_size;
-
-			ret = spi_nor_wait_till_ready(nor);
-			if (ret)
-				goto write_err;
+		written = ret;
 
-			write_enable(nor);
-
-			ret = nor->write(nor, to + i, page_size, buf + i);
-			if (ret < 0)
-				goto write_err;
-			*retlen += ret;
-			i += ret;
-		}
+		ret = spi_nor_wait_till_ready(nor);
+		if (ret)
+			goto write_err;
+		*retlen += written;
+		i += written;
 	}
 
-	ret = spi_nor_wait_till_ready(nor);
 write_err:
 	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_WRITE);
 	return ret;
-- 
2.1.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
