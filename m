From: Erin Lo <erin.lo@mediatek.com>
Subject: [PATCH 1/5] arm: dts: mt2701: Add ethernet device node
Date: Tue, 1 Aug 2017 15:03:29 +0800
Message-ID: <1501571013-22327-2-git-send-email-erin.lo@mediatek.com>
References: <1501571013-22327-1-git-send-email-erin.lo@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1501571013-22327-1-git-send-email-erin.lo@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: srv_heupstream@mediatek.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@mediatek.com>, Erin Lo <erin.lo@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

Add ethernet device node for MT2701

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Erin Lo <erin.lo@mediatek.com>
---
 arch/arm/boot/dts/mt2701.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
index f1efdc6..0619b86 100644
--- a/arch/arm/boot/dts/mt2701.dtsi
+++ b/arch/arm/boot/dts/mt2701.dtsi
@@ -597,6 +597,30 @@
 		#clock-cells = <1>;
 	};
 
+	eth: ethernet@1b100000 {
+		compatible = "mediatek,mt2701-eth", "syscon";
+		reg = <0 0x1b100000 0 0x20000>;
+		interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_SPI 199 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&topckgen CLK_TOP_ETHIF_SEL>,
+			 <&ethsys CLK_ETHSYS_ESW>,
+			 <&ethsys CLK_ETHSYS_GP1>,
+			 <&ethsys CLK_ETHSYS_GP2>,
+			 <&apmixedsys CLK_APMIXED_TRGPLL>;
+		clock-names = "ethif", "esw", "gp1", "gp2", "trgpll";
+		resets = <&ethsys MT2701_ETHSYS_FE_RST>,
+			 <&ethsys MT2701_ETHSYS_GMAC_RST>,
+			 <&ethsys MT2701_ETHSYS_PPE_RST>;
+		reset-names = "fe", "gmac", "ppe";
+		power-domains = <&scpsys MT2701_POWER_DOMAIN_ETH>;
+		mediatek,ethsys = <&ethsys>;
+		mediatek,pctl = <&syscfg_pctl_a>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
 	bdpsys: syscon@1c000000 {
 		compatible = "mediatek,mt2701-bdpsys", "syscon";
 		reg = <0 0x1c000000 0 0x1000>;
-- 
1.9.1
