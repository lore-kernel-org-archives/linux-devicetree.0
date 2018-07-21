From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3 08/18] dmaengine: dma-jz4780: Add support for the JZ4740 SoC
Date: Sat, 21 Jul 2018 13:06:33 +0200
Message-ID: <20180721110643.19624-9-paul@crapouillou.net>
References: <20180721110643.19624-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180721110643.19624-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, Paul Cercueil <paul@crapouillou.net>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

The JZ4740 SoC has a single DMA core starring six DMA channels.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Mathieu Malaterre <malat@debian.org>
Reviewed-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
---
 drivers/dma/dma-jz4780.c | 3 +++
 1 file changed, 3 insertions(+)

 v2: The documentation update is now in patch 01/17

 v3: The Kconfig update was dropped thanks to patch 06/18

diff --git a/drivers/dma/dma-jz4780.c b/drivers/dma/dma-jz4780.c
index a5f4a8d54516..084d4023637e 100644
--- a/drivers/dma/dma-jz4780.c
+++ b/drivers/dma/dma-jz4780.c
@@ -135,6 +135,7 @@ struct jz4780_dma_chan {
 };
 
 enum jz_version {
+	ID_JZ4740,
 	ID_JZ4770,
 	ID_JZ4780,
 };
@@ -803,11 +804,13 @@ static struct dma_chan *jz4780_of_dma_xlate(struct of_phandle_args *dma_spec,
 }
 
 static const struct jz4780_dma_soc_data jz4780_dma_soc_data[] = {
+	[ID_JZ4740] = { .nb_channels = 6, .transfer_ord_max = 5, },
 	[ID_JZ4770] = { .nb_channels = 6, .transfer_ord_max = 6, },
 	[ID_JZ4780] = { .nb_channels = 32, .transfer_ord_max = 7, },
 };
 
 static const struct of_device_id jz4780_dma_dt_match[] = {
+	{ .compatible = "ingenic,jz4740-dma", .data = (void *)ID_JZ4740 },
 	{ .compatible = "ingenic,jz4770-dma", .data = (void *)ID_JZ4770 },
 	{ .compatible = "ingenic,jz4780-dma", .data = (void *)ID_JZ4780 },
 	{},
-- 
2.11.0
