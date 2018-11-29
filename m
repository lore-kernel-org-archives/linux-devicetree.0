From: Ryder Lee <ryder.lee@mediatek.com>
Subject: [RESEND PATCH 3/4] mtd: spi-nor: mtk-quadspi: add SNOR_HWCAPS_READ for capcity setting
Date: Thu, 29 Nov 2018 14:29:55 +0800
Message-ID: <f904902162d17270b4963030a244f42aaea65380.1543472168.git.ryder.lee@mediatek.com>
References: <235ade9c5cda19fb0c9356913e3f56ad86600f59.1543472168.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <235ade9c5cda19fb0c9356913e3f56ad86600f59.1543472168.git.ryder.lee@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Vasut <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>, Weijie Gao <weijie.gao@mediatek.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Guochun Mao <guochun.mao@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Guochun Mao <guochun.mao@mediatek.com>

SNOR_HWCAPS_READ is a basic read mode for both flash and controller,
it should be supported, so add the capcity for mtk-quadspi.

Signed-off-by: Guochun Mao <guochun.mao@mediatek.com>
Tested-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/mtd/spi-nor/mtk-quadspi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/mtk-quadspi.c b/drivers/mtd/spi-nor/mtk-quadspi.c
index 2278677..c198fd2 100644
--- a/drivers/mtd/spi-nor/mtk-quadspi.c
+++ b/drivers/mtd/spi-nor/mtk-quadspi.c
@@ -433,7 +433,8 @@ static int mtk_nor_init(struct mtk_nor *mtk_nor,
 			struct device_node *flash_node)
 {
 	const struct spi_nor_hwcaps hwcaps = {
-		.mask = SNOR_HWCAPS_READ_FAST |
+		.mask = SNOR_HWCAPS_READ |
+			SNOR_HWCAPS_READ_FAST |
 			SNOR_HWCAPS_READ_1_1_2 |
 			SNOR_HWCAPS_PP,
 	};
-- 
1.9.1
