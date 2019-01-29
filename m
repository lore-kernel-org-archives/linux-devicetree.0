From: Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 6/7] arm: mediatek: add MT7629 smp bring up code
Date: Tue, 29 Jan 2019 12:31:18 +0800
Message-ID: <06cca198146e5583690e5cb6c838c4603c9fa821.1548735271.git.ryder.lee@mediatek.com>
References: <d1ab6c89b115ad0582815816490fa0c13ea83178.1548735271.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d1ab6c89b115ad0582815816490fa0c13ea83178.1548735271.git.ryder.lee@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>, Weijie Gao <weijie.gao@mediatek.com>, Roy Luo <roychl666@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>
List-Id: devicetree@vger.kernel.org

Add support for booting secondary CPUs on MT7629.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 arch/arm/mach-mediatek/Kconfig    | 4 ++++
 arch/arm/mach-mediatek/mediatek.c | 1 +
 arch/arm/mach-mediatek/platsmp.c  | 1 +
 3 files changed, 6 insertions(+)

diff --git a/arch/arm/mach-mediatek/Kconfig b/arch/arm/mach-mediatek/Kconfig
index 91cc461..11ed264 100644
--- a/arch/arm/mach-mediatek/Kconfig
+++ b/arch/arm/mach-mediatek/Kconfig
@@ -26,6 +26,10 @@ config MACH_MT7623
 	bool "MediaTek MT7623 SoCs support"
 	default ARCH_MEDIATEK
 
+config MACH_MT7629
+	bool "MediaTek MT7629 SoCs support"
+	default ARCH_MEDIATEK
+
 config MACH_MT8127
 	bool "MediaTek MT8127 SoCs support"
 	default ARCH_MEDIATEK
diff --git a/arch/arm/mach-mediatek/mediatek.c b/arch/arm/mach-mediatek/mediatek.c
index c3cf215..b6a81ba 100644
--- a/arch/arm/mach-mediatek/mediatek.c
+++ b/arch/arm/mach-mediatek/mediatek.c
@@ -49,6 +49,7 @@ static void __init mediatek_timer_init(void)
 	"mediatek,mt6589",
 	"mediatek,mt6592",
 	"mediatek,mt7623",
+	"mediatek,mt7629",
 	"mediatek,mt8127",
 	"mediatek,mt8135",
 	NULL,
diff --git a/arch/arm/mach-mediatek/platsmp.c b/arch/arm/mach-mediatek/platsmp.c
index 51e8556..c9d7c04 100644
--- a/arch/arm/mach-mediatek/platsmp.c
+++ b/arch/arm/mach-mediatek/platsmp.c
@@ -60,6 +60,7 @@ struct mtk_smp_boot_info {
 static const struct of_device_id mtk_smp_boot_infos[] __initconst = {
 	{ .compatible   = "mediatek,mt6589", .data = &mtk_mt6589_boot },
 	{ .compatible   = "mediatek,mt7623", .data = &mtk_mt7623_boot },
+	{ .compatible   = "mediatek,mt7629", .data = &mtk_mt7623_boot },
 	{},
 };
 
-- 
1.9.1
