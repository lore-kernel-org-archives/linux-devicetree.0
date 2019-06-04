From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH v4 06/14] [media] mtk-mipicsi: enable/disable ana clk
Date: Tue, 4 Jun 2019 18:11:47 +0800
Message-ID: <1559643115-15124-7-git-send-email-stu.hsieh@mediatek.com>
References: <1559643115-15124-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559643115-15124-1-git-send-email-stu.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, CK Hu <ck.hu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Stu Hsieh <stu.hsieh@mediatek.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org

This patch enable/disable ana clk when power on/off

Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
---
 .../media/platform/mtk-mipicsi/mtk_mipicsi.c  | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
index 28dcc683a958..f5cb29077022 100644
--- a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
+++ b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
@@ -182,6 +182,41 @@ static const struct mtk_format mtk_mipicsi_formats[] = {
 },
 };
 
+static void mtk_mipicsi_ana_clk_enable(void __iomem *base, bool enable)
+{
+	if (enable) {
+		writel(1UL | readl(base + MIPI_RX_ANA00_CSI),
+			base + MIPI_RX_ANA00_CSI);
+		writel(1UL | readl(base + MIPI_RX_ANA04_CSI),
+			base + MIPI_RX_ANA04_CSI);
+		writel(1UL | readl(base + MIPI_RX_ANA08_CSI),
+			base + MIPI_RX_ANA08_CSI);
+		writel(1UL | readl(base + MIPI_RX_ANA0C_CSI),
+			base + MIPI_RX_ANA0C_CSI);
+		writel(1UL | readl(base + MIPI_RX_ANA10_CSI),
+			base + MIPI_RX_ANA10_CSI);
+		writel(1UL | readl(base + MIPI_RX_ANA20_CSI),
+			base + MIPI_RX_ANA20_CSI);
+		writel(1UL | readl(base + MIPI_RX_ANA24_CSI),
+			base + MIPI_RX_ANA24_CSI);
+	} else {
+		writel(~1UL & readl(base + MIPI_RX_ANA00_CSI),
+			base + MIPI_RX_ANA00_CSI);
+		writel(~1UL & readl(base + MIPI_RX_ANA04_CSI),
+			base + MIPI_RX_ANA04_CSI);
+		writel(~1UL & readl(base + MIPI_RX_ANA08_CSI),
+			base + MIPI_RX_ANA08_CSI);
+		writel(~1UL & readl(base + MIPI_RX_ANA0C_CSI),
+			base + MIPI_RX_ANA0C_CSI);
+		writel(~1UL & readl(base + MIPI_RX_ANA10_CSI),
+			base + MIPI_RX_ANA10_CSI);
+		writel(~1UL & readl(base + MIPI_RX_ANA20_CSI),
+			base + MIPI_RX_ANA20_CSI);
+		writel(~1UL & readl(base + MIPI_RX_ANA24_CSI),
+			base + MIPI_RX_ANA24_CSI);
+	}
+}
+
 static void mtk_mipicsi_ana_init(void __iomem *base)
 {
 	writel(0xFEFBEFBEU & readl(base + MIPI_RX_ANA4C_CSI),
@@ -354,6 +389,8 @@ static void mipicsi_clk_enable(struct mtk_mipicsi_dev *mipicsi, bool enable)
 	for (i = 0; i < mipicsi->common_clk_num; i++)
 		enable ? clk_prepare_enable(mipicsi->common_clk[i]) :
 			 clk_disable_unprepare(mipicsi->common_clk[i]);
+
+	mtk_mipicsi_ana_clk_enable(mipicsi->ana, enable);
 }
 
 static int mtk_mipicsi_pm_suspend(struct device *dev)
-- 
2.18.0
