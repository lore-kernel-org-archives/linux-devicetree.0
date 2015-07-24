From: James Liao <jamesjj.liao@mediatek.com>
Subject: [PATCH v4 7/7] arm64: dts: mt8173: Add subsystem clock controller device nodes
Date: Fri, 24 Jul 2015 11:02:05 +0800
Message-ID: <1437706925-3222-8-git-send-email-jamesjj.liao@mediatek.com>
References: <1437706925-3222-1-git-send-email-jamesjj.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1437706925-3222-1-git-send-email-jamesjj.liao@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Heiko Stubner <heiko@sntech.de>
Cc: srv_heupstream@mediatek.com, Daniel Kurtz <djkurtz@chromium.org>, Ricky Liang <jcliang@chromium.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, James Liao <jamesjj.liao@mediatek.com>
List-Id: devicetree@vger.kernel.org

This patch adds device nodes providing subsystem clocks on MT8173,
includes mmsys, imgsys, vdecsys, vencsys and vencltsys.

Signed-off-by: James Liao <jamesjj.liao@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 37 ++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index a2f63e4..8731d24 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -88,6 +88,13 @@
 		#clock-cells = <0>;
 	};
 
+	cpum_ck: dummy_clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+		clock-output-names = "cpum_ck";
+	};
+
 	clk26m: oscillator@0 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -227,6 +234,36 @@
 			clocks = <&uart_clk>;
 			status = "disabled";
 		};
+
+		mmsys: clock-controller@14000000 {
+			compatible = "mediatek,mt8173-mmsys", "syscon";
+			reg = <0 0x14000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		imgsys: clock-controller@15000000 {
+			compatible = "mediatek,mt8173-imgsys", "syscon";
+			reg = <0 0x15000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		vdecsys: clock-controller@16000000 {
+			compatible = "mediatek,mt8173-vdecsys", "syscon";
+			reg = <0 0x16000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		vencsys: clock-controller@18000000 {
+			compatible = "mediatek,mt8173-vencsys", "syscon";
+			reg = <0 0x18000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		vencltsys: clock-controller@19000000 {
+			compatible = "mediatek,mt8173-vencltsys", "syscon";
+			reg = <0 0x19000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
 	};
 };
 
-- 
1.8.1.1.dirty
