From: Flora Fu <flora.fu@mediatek.com>
Subject: [PATCH v4 3/3] arm: dts: mt8135: Add Reset Controller for MediaTek SoC
Date: Fri, 26 Dec 2014 17:05:51 +0800
Message-ID: <1419584751-18149-4-git-send-email-flora.fu@mediatek.com>
References: <1419584751-18149-1-git-send-email-flora.fu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1419584751-18149-1-git-send-email-flora.fu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Flora Fu <flora.fu@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Dongdong Cheng <dongdong.cheng@mediatek.com>, HenryC Chen <henryc.chen@mediatek.com>, Menghui Lin <menghui.lin@mediatek.com>, Chen Zhong <chen.zhong@mediatek.com>
List-Id: devicetree@vger.kernel.org

Add reset controller to MT8135.dtsi.

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Flora Fu <flora.fu@mediatek.com>
---
 arch/arm/boot/dts/mt8135.dtsi | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm/boot/dts/mt8135.dtsi b/arch/arm/boot/dts/mt8135.dtsi
index ec83e69..989e488 100644
--- a/arch/arm/boot/dts/mt8135.dtsi
+++ b/arch/arm/boot/dts/mt8135.dtsi
@@ -14,6 +14,7 @@
 
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/reset-controller/mt8135-resets.h>
 #include "skeleton64.dtsi"
 
 / {
@@ -100,6 +101,34 @@
 		compatible = "simple-bus";
 		ranges;
 
+		infracfg: syscon@10001000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "mediatek,mt8135-infracfg", "syscon";
+			reg = <0 0x10001000 0 0x1000>;
+			#clock-cells = <1>;
+
+			infrarst: reset-controller@30 {
+				#reset-cells = <1>;
+				compatible = "mediatek,mt8135-infracfg-reset", "mediatek,reset";
+				reg = <0x30 0x8>;
+			};
+		};
+
+		pericfg: syscon@10003000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "mediatek,mt8135-pericfg", "syscon";
+			reg = <0 0x10003000 0 0x1000>;
+			#clock-cells = <1>;
+
+			perirst: reset-controller@00 {
+				#reset-cells = <1>;
+				compatible = "mediatek,mt8135-pericfg-reset", "mediatek,reset";
+				reg = <0x00 0x8>;
+			};
+		};
+
 		timer: timer@10008000 {
 			compatible = "mediatek,mt8135-timer",
 					"mediatek,mt6577-timer";
-- 
1.8.1.1.dirty
