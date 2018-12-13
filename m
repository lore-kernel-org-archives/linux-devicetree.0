From: Biao Huang <biao.huang@mediatek.com>
Subject: [PATCH] net-next: stmmac: dwmac-mediatek: add module license info
Date: Thu, 13 Dec 2018 10:41:37 +0800
Message-ID: <1544668897-6947-1-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: davem@davemloft.net, robh+dt@kernel.org
Cc: honghui.zhang@mediatek.com, yt.shen@mediatek.com, liguo.zhang@mediatek.com, mark.rutland@arm.com, nelson.chang@mediatek.com, matthias.bgg@gmail.com, biao.huang@mediatek.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, joabreu@synopsys.com, andrew@lunn.ch
List-Id: devicetree@vger.kernel.org

Add MODULE_LICENSE info to fix this:
WARNING: modpost: missing MODULE_LICENSE() in drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.o

Signed-off-by: Biao Huang <biao.huang@mediatek.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-mediatek.c   |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index b5db85d..e400cbd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -5,6 +5,7 @@
 #include <linux/bitfield.h>
 #include <linux/io.h>
 #include <linux/mfd/syscon.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_net.h>
@@ -406,3 +407,7 @@ static int mediatek_dwmac_probe(struct platform_device *pdev)
 	},
 };
 module_platform_driver(mediatek_dwmac_driver);
+
+MODULE_AUTHOR("Biao Huang <biao.huang@mediatek.com>");
+MODULE_DESCRIPTION("MediaTek DWMAC specific glue layer");
+MODULE_LICENSE("GPL v2");
-- 
1.7.9.5
