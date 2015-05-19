From: Hongzhou Yang <hongzhou.yang@mediatek.com>
Subject: [PATCH v2 11/11] ARM: dts: mt8135-evbp1: Add pinctrl/GPIO node for mt6397.
Date: Mon, 18 May 2015 23:11:22 -0700
Message-ID: <1432015882-8646-12-git-send-email-hongzhou.yang@mediatek.com>
References: <1432015882-8646-1-git-send-email-hongzhou.yang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1432015882-8646-1-git-send-email-hongzhou.yang@mediatek.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Sascha Hauer <s.hauer@pengutronix.de>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Chaotian Jing <chaotian.jing@mediatek.com>, Fabian Frederick <fabf@skynet.be>, Maoguang Meng <maoguang.meng@mediatek.com>, Axel Lin <axel.lin@ingics.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, dandan.he@mediatek.com, eddie.huang@mediatek.com
List-Id: devicetree@vger.kernel.org

Add pinctrl and GPIO node to mt8135-evbp1.dts.

Signed-off-by: Hongzhou Yang <hongzhou.yang@mediatek.com>
---
 arch/arm/boot/dts/mt8135-evbp1.dts |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/mt8135-evbp1.dts b/arch/arm/boot/dts/mt8135-evbp1.dts
index 357a91f..332233b 100644
--- a/arch/arm/boot/dts/mt8135-evbp1.dts
+++ b/arch/arm/boot/dts/mt8135-evbp1.dts
@@ -14,6 +14,7 @@
 
 /dts-v1/;
 #include "mt8135.dtsi"
+#include <dt-bindings/pinctrl/mt6397-pinfunc.h>
 
 / {
 	model = "MediaTek MT8135 evaluation board";
@@ -28,6 +29,13 @@
 	pmic: mt6397 {
 		compatible = "mediatek,mt6397";
 
+		pio6397: pinctrl@c000 {
+			compatible = "mediatek,mt6397-pinctrl";
+			pins-are-numbered;
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
 		mt6397regulator: mt6397regulator {
 			compatible = "mediatek,mt6397-regulator";
 
-- 
1.7.9.5

