From: matthias.bgg@kernel.org
Subject: [PATCH v5 10/12] arm64: dts: mt6797: Use the new mmsys clock compatible
Date: Fri, 16 Nov 2018 13:54:47 +0100
Message-ID: <20181116125449.23581-11-matthias.bgg@kernel.org>
References: <20181116125449.23581-1-matthias.bgg@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181116125449.23581-1-matthias.bgg@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com, p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com, sboyd@codeaurora.org, ulrich.hecht+renesas@gmail.com, laurent.pinchart@ideasonboard.com, matthias.bgg@gmail.com
Cc: sean.wang@mediatek.com, sean.wang@kernel.org, rdunlap@infradead.org, wens@csie.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>
List-Id: devicetree@vger.kernel.org

From: Matthias Brugger <mbrugger@suse.com>

Move the clock part of mmsys in a child node.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
---
 arch/arm64/boot/dts/mediatek/mt6797.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6797.dtsi b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
index 4beaa71107d7..3ca635c81de1 100644
--- a/arch/arm64/boot/dts/mediatek/mt6797.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
@@ -206,9 +206,13 @@
 	};
 
 	mmsys: mmsys_config@14000000 {
-		compatible = "mediatek,mt6797-mmsys", "syscon";
+		compatible = "mediatek,mt6797-mmsys", "syscon", "simple-mfd";
 		reg = <0 0x14000000 0 0x1000>;
-		#clock-cells = <1>;
+
+		mmsys_clk: clock-controller@14000000 {
+			compatible = "mediatek,mt6797-mmsys-clk";
+			#clock-cells = <1>;
+		};
 	};
 
 	imgsys: imgsys_config@15000000  {
-- 
2.19.1
