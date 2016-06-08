From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [RESEND PATCH 2/3] mtd: nand: Support maximizing ECC when using
 software BCH
Date: Wed,  8 Jun 2016 17:04:23 +0200
Message-ID: <1465398264-8202-3-git-send-email-boris.brezillon@free-electrons.com>
References: <1465398264-8202-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1465398264-8202-1-git-send-email-boris.brezillon@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add support for ECC maximization when software BCH with
nand_ooblayout_lp_ops layout is used.
Other cases should be handled by the NAND controller driver.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/nand_base.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index d374129..ca4f53d 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4224,6 +4224,7 @@ static int nand_set_ecc_soft_ops(struct mtd_info *mtd)
 		ecc->write_page_raw = nand_write_page_raw;
 		ecc->read_oob = nand_read_oob_std;
 		ecc->write_oob = nand_write_oob_std;
+
 		/*
 		* Board driver should supply ecc.size and ecc.strength
 		* values to select how many bits are correctable.
@@ -4246,6 +4247,25 @@ static int nand_set_ecc_soft_ops(struct mtd_info *mtd)
 			}
 
 			mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
+
+		}
+
+		/*
+		 * We can only maximize ECC config when the default layout is
+		 * used, otherwise we don't know how many bytes can really be
+		 * used.
+		 */
+		if (mtd->ooblayout == &nand_ooblayout_lp_ops &&
+		    ecc->options & NAND_ECC_MAXIMIZE) {
+			int steps, bytes;
+
+			/* Always prefer 1k blocks over 512bytes ones */
+			ecc->size = 1024;
+			steps = mtd->writesize / ecc->size;
+
+			/* Reserve 2 bytes for the BBM */
+			bytes = (mtd->oobsize - 2) / steps;
+			ecc->strength = bytes * 8 / fls(8 * ecc->size);
 		}
 
 		/* See nand_bch_init() for details. */
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
