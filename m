From: Henry Chen <henryc.chen@mediatek.com>
Subject: [PATCH V3 04/10] arm64: dts: mt8183: add performance state support of scpsys
Date: Wed, 28 Aug 2019 20:28:42 +0800
Message-ID: <1566995328-15158-5-git-send-email-henryc.chen@mediatek.com>
References: <1566995328-15158-1-git-send-email-henryc.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566995328-15158-1-git-send-email-henryc.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <swboyd@chromium.org>, Ryan Case <ryandcase@chromium.org>
Cc: Nicolas Boichat <drinkcat@google.com>, Fan Chen <fan.chen@mediatek.com>, James Liao <jamesjj.liao@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Henry Chen <henryc.chen@mediatek.com>
List-Id: devicetree@vger.kernel.org

Add support for performance state of scpsys on mt8183 platform.

Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 66aaa07..a58999f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/power/mt8183-power.h>
 #include "mt8183-pinfunc.h"
+#include <dt-bindings/soc/mtk,dvfsrc.h>
 
 / {
 	compatible = "mediatek,mt8183";
@@ -293,6 +294,26 @@
 				      "vpu-3", "vpu-4", "vpu-5";
 			infracfg = <&infracfg>;
 			smi_comm = <&smi_common>;
+			operating-points-v2 = <&dvfsrc_opp_table>;
+			dvfsrc_opp_table: opp-table {
+				compatible = "operating-points-v2-level";
+
+				dvfsrc_vol_min: opp1 {
+					opp,level = <MT8183_DVFSRC_LEVEL_1>;
+				};
+
+				dvfsrc_freq_medium: opp2 {
+					opp,level = <MT8183_DVFSRC_LEVEL_2>;
+				};
+
+				dvfsrc_freq_max: opp3 {
+					opp,level = <MT8183_DVFSRC_LEVEL_3>;
+				};
+
+				dvfsrc_vol_max: opp4 {
+					opp,level = <MT8183_DVFSRC_LEVEL_4>;
+				};
+			};
 		};
 
 		apmixedsys: syscon@1000c000 {
-- 
1.9.1
