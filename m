From: Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: [PATCH 2/2] arm64: dts: mt8173: add timer node
Date: Wed, 16 Sep 2015 10:04:55 +0800
Message-ID: <1442369095-1094-2-git-send-email-yingjoe.chen@mediatek.com>
References: <1442369095-1094-1-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1442369095-1094-1-git-send-email-yingjoe.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, James Liao <jamesjj.liao@mediatek.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, Olof Johansson <olof@lixom.net>, srv_heupstream@mediatek.com, linux-arm-kernel@lists.infradead.org, Daniel Kurtz <djkurtz@chromium.org>, linux-clk@vger.kernel.org, Eddie Huang <eddie.huang@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Daniel Kurtz <djkurtz@chromium.org>

Add device node to enable GPT timer. This timer will be
used as sched clock source.

Change-Id: Idc4e3f0ee80b5c36cae6f0f2328f94aafcca1253
Signed-off-by: Daniel Kurtz <djkurtz@chromium.org>
Signed-off-by: Eddie Huang <eddie.huang@mediatek.com>
Signed-off-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index d18ee42..d763803 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -238,6 +238,15 @@
 			reg = <0 0x10007000 0 0x100>;
 		};
 
+		timer: timer@10008000 {
+			compatible = "mediatek,mt8173-timer",
+				     "mediatek,mt6577-timer";
+			reg = <0 0x10008000 0 0x1000>;
+			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&infracfg CLK_INFRA_CLK_13M>,
+				 <&topckgen CLK_TOP_RTC_SEL>;
+		};
+
 		pwrap: pwrap@1000d000 {
 			compatible = "mediatek,mt8173-pwrap";
 			reg = <0 0x1000d000 0 0x1000>;
-- 
1.9.1
