From: Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v2 2/3] mtd: spi-nor: mtk-quadspi: add SNOR_HWCAPS_READ to spi_nor_hwcaps mask
Date: Wed, 16 Jan 2019 10:12:04 +0800
Message-ID: <2afa18c0c898259fc244f15844c5319f71e811df.1547538621.git.ryder.lee@mediatek.com>
References: <74d710ed89fd505a49bce53b51f6cb489e313dbb.1547538621.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <74d710ed89fd505a49bce53b51f6cb489e313dbb.1547538621.git.ryder.lee@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Vasut <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>, Weijie Gao <weijie.gao@mediatek.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Guochun Mao <guochun.mao@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Guochun Mao <guochun.mao@mediatek.com>

SNOR_HWCAPS_READ should be supported by this controller, so add this
flag to spi_nor_hwcaps mask.

Signed-off-by: Guochun Mao <guochun.mao@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
Changes since v2: Revise commit msg. 
Changes since v1: none. 
---
 drivers/mtd/spi-nor/mtk-quadspi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/mtk-quadspi.c b/drivers/mtd/spi-nor/mtk-quadspi.c
index 5442993..d9eed68 100644
--- a/drivers/mtd/spi-nor/mtk-quadspi.c
+++ b/drivers/mtd/spi-nor/mtk-quadspi.c
@@ -431,7 +431,8 @@ static int mtk_nor_init(struct mtk_nor *mtk_nor,
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
