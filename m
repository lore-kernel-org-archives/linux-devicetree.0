From: Yunfei Dong <yunfei.dong@mediatek.com>
Subject: [PATCH v3,2/3] arm64: dts: Using standard CCF interface to set vcodec clk
Date: Thu, 17 Jan 2019 13:39:19 +0800
Message-ID: <1547703560-16195-2-git-send-email-yunfei.dong@mediatek.com>
References: <1547703560-16195-1-git-send-email-yunfei.dong@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1547703560-16195-1-git-send-email-yunfei.dong@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Qianqian Yan <qianqian.yan@mediatek.com>
List-Id: devicetree@vger.kernel.org

Using standard CCF interface to set vdec/venc parent clk
and clk rate.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Signed-off-by: Qianqian Yan <qianqian.yan@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 412ffd4d426b..126d11ee649a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -1305,6 +1305,15 @@
 				      "vencpll",
 				      "venc_lt_sel",
 				      "vdec_bus_clk_src";
+			assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>,
+					  <&topckgen CLK_TOP_CCI400_SEL>,
+					  <&topckgen CLK_TOP_VDEC_SEL>,
+					  <&apmixedsys CLK_APMIXED_VCODECPLL>,
+					  <&apmixedsys CLK_APMIXED_VENCPLL>;
+			assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL_370P5>,
+						 <&topckgen CLK_TOP_UNIVPLL_D2>,
+						 <&topckgen CLK_TOP_VCODECPLL>;
+			assigned-clock-rates = <0>, <0>, <0>, <1482000000>, <800000000>;
 		};
 
 		larb1: larb@16010000 {
@@ -1370,6 +1379,10 @@
 				      "venc_sel",
 				      "venc_lt_sel_src",
 				      "venc_lt_sel";
+			assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>,
+					  <&topckgen CLK_TOP_VENC_LT_SEL>;
+			assigned-clock-parents = <&topckgen CLK_TOP_VENCPLL_D2>,
+						 <&topckgen CLK_TOP_UNIVPLL1_D2>;
 		};
 
 		vencltsys: clock-controller@19000000 {
-- 
2.20.1
