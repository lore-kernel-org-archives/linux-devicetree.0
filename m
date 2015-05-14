Return-Path: <mtk10466@mediatek.inc>
From: Hongzhou Yang <hongzhou.yang@mediatek.com>
Subject: [PATCH 07/10] arm64: dts: mt8173-evb: Add pinctrl/GPIO node for mt6397.
Date: Wed, 13 May 2015 18:35:43 -0700
Message-ID: <1431567346-33780-8-git-send-email-hongzhou.yang@mediatek.com>
In-Reply-To: <1431567346-33780-1-git-send-email-hongzhou.yang@mediatek.com>
References: <1431567346-33780-1-git-send-email-hongzhou.yang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Sascha Hauer <s.hauer@pengutronix.de>, Eddie Huang <eddie.huang@mediatek.com>, Howard Chen <ibanezchen@gmail.com>, Ashwin Chaugule <ashwin.chaugule@linaro.org>, "Joe.C" <yingjoe.chen@mediatek.com>, Chaotian Jing <chaotian.jing@mediatek.com>, Fabian Frederick <fabf@skynet.be>, Maoguang Meng <maoguang.meng@mediatek.com>, Axel Lin <axel.lin@ingics.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, dandan.he@mediatek.com
List-ID: <devicetree@vger.kernel.org>

Add pinctrl and GPIO node to mt8173-evb.dts.

Signed-off-by: Hongzhou Yang <hongzhou.yang@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
index c9bc71b..bd473c8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
@@ -14,6 +14,7 @@
 
 /dts-v1/;
 #include "mt8173.dtsi"
+#include <dt-bindings/pinctrl/mt6397-pinfunc.h>
 
 / {
 	model = "mediatek,mt8173-evb";
@@ -43,6 +44,13 @@
 		interrupt-controller;
 		#interrupt-cells = <2>;
 
+		pio6397: pinctrl@c000 {
+			compatible = "mediatek,mt6397-pinctrl";
+			pins-are-numbered;
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
 		rtc: rtc@e000 {
 			compatible = "mediatek,mt6397-rtc";
 		};
-- 
1.7.9.5
