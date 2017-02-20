From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v2 3/3] mtd: nand: Remove unused chip->write_page() hook
Date: Mon, 20 Feb 2017 13:28:38 +0100
Message-ID: <1487593718-20752-4-git-send-email-boris.brezillon@free-electrons.com>
References: <1487593718-20752-1-git-send-email-boris.brezillon@free-electrons.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1487593718-20752-1-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, Nicolas Ferre <nicolas.ferre@atmel.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Haavard Skinnemoen <hskinnemoen@gmail.com>, Hans-Christian Egtvedt <egtvedt@samfundet.no>, linux-kernel@vger.kernel.org, Wenyou Yang <wenyou.yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The last/only user of the chip->write_page() hook (the Atmel NAND
controller driver) has been reworked and is no longer specifying a custom
->write_page() implementation.
Drop this hook before someone else start abusing it.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/nand_base.c | 10 ++++------
 include/linux/mtd/nand.h     |  4 ----
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index ec1c28aaaf23..c8894f31392e 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2839,9 +2839,10 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 			/* We still need to erase leftover OOB data */
 			memset(chip->oob_poi, 0xff, mtd->oobsize);
 		}
-		ret = chip->write_page(mtd, chip, column, bytes, wbuf,
-					oob_required, page, cached,
-					(ops->mode == MTD_OPS_RAW));
+
+		ret = nand_write_page(mtd, chip, column, bytes, wbuf,
+				      oob_required, page, cached,
+				      (ops->mode == MTD_OPS_RAW));
 		if (ret)
 			break;
 
@@ -4623,9 +4624,6 @@ int nand_scan_tail(struct mtd_info *mtd)
 		}
 	}
 
-	if (!chip->write_page)
-		chip->write_page = nand_write_page;
-
 	/*
 	 * Check ECC mode, default to software if 3byte/512byte hardware ECC is
 	 * selected and we have 256 byte pagesize fallback to software ECC
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index c5f3a012ae62..9d51dee53be4 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -818,7 +818,6 @@ nand_get_sdr_timings(const struct nand_data_interface *conf)
  * @errstat:		[OPTIONAL] hardware specific function to perform
  *			additional error status checks (determine if errors are
  *			correctable).
- * @write_page:		[REPLACEABLE] High-level page write function
  */
 
 struct nand_chip {
@@ -843,9 +842,6 @@ struct nand_chip {
 	int (*scan_bbt)(struct mtd_info *mtd);
 	int (*errstat)(struct mtd_info *mtd, struct nand_chip *this, int state,
 			int status, int page);
-	int (*write_page)(struct mtd_info *mtd, struct nand_chip *chip,
-			uint32_t offset, int data_len, const uint8_t *buf,
-			int oob_required, int page, int cached, int raw);
 	int (*onfi_set_features)(struct mtd_info *mtd, struct nand_chip *chip,
 			int feature_addr, uint8_t *subfeature_para);
 	int (*onfi_get_features)(struct mtd_info *mtd, struct nand_chip *chip,
-- 
2.7.4
