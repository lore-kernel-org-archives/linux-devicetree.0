From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH 07/11] phy: phy-mtk-tphy: add a property for internal resistance
Date: Fri, 23 Aug 2019 15:00:14 +0800
Message-ID: <b89098f22cd172315b2202bd2adc04d3fb444431.1566542697.git.chunfeng.yun@mediatek.com>
References: <e99c0d7a55869a4425250c601b80a3331c9d0976.1566542696.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e99c0d7a55869a4425250c601b80a3331c9d0976.1566542696.git.chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This is used to tune internal resistance for J-K test

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/phy/mediatek/phy-mtk-tphy.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
index 5afe33621dbc..4a2dc92f10f5 100644
--- a/drivers/phy/mediatek/phy-mtk-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-tphy.c
@@ -43,6 +43,8 @@
 #define PA0_RG_USB20_INTR_EN		BIT(5)
 
 #define U3P_USBPHYACR1		0x004
+#define PA1_RG_INTR_CAL		GENMASK(23, 19)
+#define PA1_RG_INTR_CAL_VAL(x)	((0x1f & (x)) << 19)
 #define PA1_RG_VRT_SEL			GENMASK(14, 12)
 #define PA1_RG_VRT_SEL_VAL(x)	((0x7 & (x)) << 12)
 #define PA1_RG_TERM_SEL		GENMASK(10, 8)
@@ -302,6 +304,7 @@ struct mtk_phy_instance {
 	int eye_src;
 	int eye_vrt;
 	int eye_term;
+	int intr;
 	int discth;
 	bool bc12_en;
 };
@@ -853,12 +856,14 @@ static void phy_parse_property(struct mtk_tphy *tphy,
 				 &instance->eye_vrt);
 	device_property_read_u32(dev, "mediatek,eye-term",
 				 &instance->eye_term);
+	device_property_read_u32(dev, "mediatek,intr",
+				 &instance->intr);
 	device_property_read_u32(dev, "mediatek,discth",
 				 &instance->discth);
-	dev_dbg(dev, "bc12:%d, src:%d, vrt:%d, term:%d, disc:%d\n",
+	dev_dbg(dev, "bc12:%d, src:%d, vrt:%d, term:%d, intr:%d, disc:%d\n",
 		instance->bc12_en, instance->eye_src,
 		instance->eye_vrt, instance->eye_term,
-		instance->discth);
+		instance->intr, instance->discth);
 }
 
 static void u2_phy_props_set(struct mtk_tphy *tphy,
@@ -895,6 +900,13 @@ static void u2_phy_props_set(struct mtk_tphy *tphy,
 		writel(tmp, com + U3P_USBPHYACR1);
 	}
 
+	if (instance->intr) {
+		tmp = readl(com + U3P_USBPHYACR1);
+		tmp &= ~PA1_RG_INTR_CAL;
+		tmp |= PA1_RG_INTR_CAL_VAL(instance->intr);
+		writel(tmp, com + U3P_USBPHYACR1);
+	}
+
 	if (instance->discth) {
 		tmp = readl(com + U3P_USBPHYACR6);
 		tmp &= ~PA6_RG_U2_DISCTH;
-- 
2.23.0
