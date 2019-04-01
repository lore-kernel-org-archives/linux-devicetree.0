From: Zhiyong Tao <zhiyong.tao@mediatek.com>
Subject: [PATCH v4 3/4] arm64: dts: mt8183: add pinctrl device node
Date: Mon, 1 Apr 2019 11:35:34 +0800
Message-ID: <20190401033535.16910-4-zhiyong.tao@mediatek.com>
References: <20190401033535.16910-1-zhiyong.tao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190401033535.16910-1-zhiyong.tao@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, linus.walleij@linaro.org, mark.rutland@arm.com, matthias.bgg@gmail.com, sean.wang@kernel.org
Cc: srv_heupstream@mediatek.com, zhiyong.tao@mediatek.com, hui.liu@mediatek.com, eddie.huang@mediatek.com, chuanjia.liu@mediatek.com, biao.huang@mediatek.com, hongzhou.yang@mediatek.com, erin.lo@mediatek.com, sean.wang@mediatek.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The commit adds pinctrl device node for mt8183

Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
Signed-off-by: Erin Lo <erin.lo@mediatek.com>

---
This patch is based on patch "https://patchwork.kernel.org/patch/10814239/".
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 75c4881bbe5e..cf92504e2a9b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -9,7 +9,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/power/mt8183-power.h>
-
+#include "mt8183-pinfunc.h"
 / {
 	compatible = "mediatek,mt8183";
 	interrupt-parent = <&sysirq>;
@@ -197,6 +197,30 @@
 			#clock-cells = <1>;
 		};
 
+		pio: pinctrl@10005000 {
+			compatible = "mediatek,mt8183-pinctrl";
+			reg = <0 0x10005000 0 0x1000>,
+			      <0 0x11f20000 0 0x1000>,
+			      <0 0x11e80000 0 0x1000>,
+			      <0 0x11e70000 0 0x1000>,
+			      <0 0x11e90000 0 0x1000>,
+			      <0 0x11d30000 0 0x1000>,
+			      <0 0x11d20000 0 0x1000>,
+			      <0 0x11c50000 0 0x1000>,
+			      <0 0x11f30000 0 0x1000>,
+			      <0 0x1000b000 0 0x1000>;
+			reg-names = "iocfg0", "iocfg1", "iocfg2",
+				    "iocfg3", "iocfg4", "iocfg5",
+				    "iocfg6", "iocfg7", "iocfg8",
+				    "eint";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pio 0 0 192>;
+			interrupt-controller;
+			interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
+			#interrupt-cells = <2>;
+		};
+
 		scpsys: syscon@10006000 {
 			compatible = "mediatek,mt8183-scpsys", "syscon";
 			#power-domain-cells = <1>;
-- 
2.12.5
