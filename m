From: Ran Bi <ran.bi@mediatek.com>
Subject: [PATCH 3/3] arm64: dts: add rtc nodes for MT2712
Date: Tue, 2 Jul 2019 11:21:20 +0800
Message-ID: <20190702032120.16539-4-ran.bi@mediatek.com>
References: <20190702032120.16539-1-ran.bi@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190702032120.16539-1-ran.bi@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Mark Rutland <mark.rutland@arm.com>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, YT Shen <yt.shen@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Flora Fu <flora.fu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Ran Bi <ran.bi@mediatek.com>
List-Id: devicetree@vger.kernel.org

This patch add device node for MT2712 rtc.

Signed-off-by: Ran Bi <ran.bi@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
index 43307bad3f0d..31166c17c39a 100644
--- a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
@@ -303,6 +303,12 @@
 		status = "disabled";
 	};
 
+	rtc: rtc@10011000 {
+		compatible = "mediatek,mt2712-rtc";
+		reg = <0 0x10011000 0 0x1000>;
+		interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_LOW>;
+	};
+
 	spis1: spi@10013000 {
 		compatible = "mediatek,mt2712-spi-slave";
 		reg = <0 0x10013000 0 0x100>;
-- 
2.18.0
