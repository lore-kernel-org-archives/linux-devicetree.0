From: Boris BREZILLON <b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC PATCH v2 01/14] mtd: nand: retrieve ECC
 requirements from Hynix READ ID byte 4
Date: Wed, 29 Jan 2014 15:34:11 +0100
Message-ID: <1391006064-28890-2-git-send-email-b.brezillon.dev@gmail.com>
References: <1391006064-28890-1-git-send-email-b.brezillon.dev@gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDE6NB73YAMBB7VCUSLQKGQEDW4VY3A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1391006064-28890-1-git-send-email-b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Boris BREZILLON <b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

The Hynix nand flashes store their ECC requirements in byte 4 of its id
(returned on READ ID command).

Signed-off-by: Boris BREZILLON <b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/mtd/nand/nand_base.c |   37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index bd39f7b..15069ec 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3202,6 +3202,43 @@ static void nand_decode_ext_id(struct mtd_info *mtd, struct nand_chip *chip,
 		else
 			mtd->erasesize = (64 * 1024) << tmp;
 		*busw = 0;
+
+		/* Retrieve ECC infos */
+		switch ((id_data[4] >> 4) & 0x7) {
+		case 1:
+			chip->ecc_step_ds = 512;
+			chip->ecc_strength_ds = 1;
+			break;
+		case 2:
+			chip->ecc_step_ds = 512;
+			chip->ecc_strength_ds = 2;
+			break;
+		case 3:
+			chip->ecc_step_ds = 512;
+			chip->ecc_strength_ds = 4;
+			break;
+		case 4:
+			chip->ecc_step_ds = 512;
+			chip->ecc_strength_ds = 8;
+			break;
+		case 5:
+			chip->ecc_step_ds = 1024;
+			chip->ecc_strength_ds = 24;
+			break;
+		case 6:
+			chip->ecc_step_ds = 1024;
+			chip->ecc_strength_ds = 32;
+			break;
+		case 7:
+			chip->ecc_step_ds = 1024;
+			chip->ecc_strength_ds = 40;
+			break;
+		case 0:
+		default:
+			chip->ecc_step_ds = 0;
+			chip->ecc_strength_ds = 0;
+			break;
+		}
 	} else {
 		/* Calc pagesize */
 		mtd->writesize = 1024 << (extid & 0x03);
-- 
1.7.9.5
