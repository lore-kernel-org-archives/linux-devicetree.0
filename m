From: Zhiyong Tao <zhiyong.tao@mediatek.com>
Subject: [PATCH v1 1/2] arm64: dts: mt8183: auxadc: add efuse information in device tree
Date: Thu, 18 Jul 2019 16:01:18 +0800
Message-ID: <20190718080119.30707-2-zhiyong.tao@mediatek.com>
References: <20190718080119.30707-1-zhiyong.tao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190718080119.30707-1-zhiyong.tao@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net
Cc: srv_heupstream@mediatek.com, hui.liu@mediatek.com, jg_poxu@mediatek.com, sj.huang@mediatek.com, yingjoe.chen@mediatek.com, sean.wang@mediatek.com, erin.lo@mediatek.com, eddie.huang@mediatek.com, matthias.bgg@gmail.com, s.hauer@pengutronix.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, linux-mediatek@lists.infradead.org, Zhiyong Tao <zhiyong.tao@mediatek.com>
List-Id: devicetree@vger.kernel.org

The commit add add efuse information in device tree

Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
Signed-off-by: jg_poxu <jg_poxu@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index c2749c4631bc..59b4f3d933b5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -261,6 +261,8 @@
 			clocks = <&infracfg CLK_INFRA_AUXADC>;
 			clock-names = "main";
 			#io-channel-cells = <1>;
+			nvmem-cells = <&auxadc_calibration>;
+			nvmem-cell-names = "calibration-data";
 			status = "disabled";
 		};
 
@@ -382,6 +384,9 @@
 			compatible = "mediatek,mt8183-efuse",
 				     "mediatek,efuse";
 			reg = <0 0x11f10000 0 0x1000>;
+			auxadc_calibration: auxadccali@1b4 {
+				reg = <0x1b4 0x4>;
+			};
 		};
 
 		mfgcfg: syscon@13000000 {
-- 
2.12.5
