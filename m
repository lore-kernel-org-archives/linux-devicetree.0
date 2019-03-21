From: Liang Yang <liang.yang@amlogic.com>
Subject: [PATCH 1/1] mtd: rawnand: meson: set oob layout ops
Date: Thu, 21 Mar 2019 20:14:01 +0800
Message-ID: <1553170441-23448-1-git-send-email-liang.yang@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@bootlin.com>, linux-mtd@lists.infradead.org
Cc: Liang Yang <liang.yang@amlogic.com>, David Woodhouse <dwmw2@infradead.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh@kernel.org>, Jian Hu <jian.hu@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>, Hanjie Lin <hanjie.lin@amlogic.com>, Victor Wan <victor.wan@amlogic.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Specify the oob layout operation to avoid no oob scheme defined for
some nand flash.

Fixes: 8fae856c5350 ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
Signed-off-by: Liang Yang <liang.yang@amlogic.com>
---
 drivers/mtd/nand/raw/meson_nand.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index 3e8aa71..a2154a2 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -1183,6 +1183,8 @@ static int meson_nand_attach_chip(struct nand_chip *nand)
 		return -EINVAL;
 	}
 
+	mtd_set_ooblayout(mtd, &meson_ooblayout_ops);
+
 	ret = meson_nand_bch_mode(nand);
 	if (ret)
 		return -EINVAL;
-- 
1.9.1
