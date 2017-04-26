From: <sean.wang@mediatek.com>
Subject: [PATCH v2 17/30] arm: dts: mt7623: add ir nodes to the mt7623.dtsi file
Date: Wed, 26 Apr 2017 17:26:01 +0800
Message-ID: <1493198774-4478-18-git-send-email-sean.wang@mediatek.com>
References: <1493198774-4478-1-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1493198774-4478-1-git-send-email-sean.wang@mediatek.com>
Sender: linux-gpio-owner@vger.kernel.org
To: robh+dt@kernel.org, matthias.bgg@gmail.com, john@phrozen.org, mark.rutland@arm.com, linux@armlinux.org.uk, linus.walleij@linaro.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

Add ir nodes to the mt7623.dtsi file.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 arch/arm/boot/dts/mt7623.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
index ad7c50a..76e0840 100644
--- a/arch/arm/boot/dts/mt7623.dtsi
+++ b/arch/arm/boot/dts/mt7623.dtsi
@@ -171,6 +171,15 @@
 		clock-names = "spi", "wrap";
 	};
 
+	cir: cir@0x10013000 {
+		compatible = "mediatek,mt7623-cir";
+		reg = <0 0x10013000 0 0x1000>;
+		interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&infracfg CLK_INFRA_IRRX>;
+		clock-names = "clk";
+		status = "disabled";
+	};
+
 	sysirq: interrupt-controller@10200100 {
 		compatible = "mediatek,mt7623-sysirq",
 			     "mediatek,mt6577-sysirq";
-- 
1.9.1

