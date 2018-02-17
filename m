From: <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 12/15] arm64: dts: mt7622: add SATA device nodes
Date: Sun, 18 Feb 2018 03:54:47 +0800
Message-ID: <03cd35cd3ffce2a8cd238005ad3f68a868358b9e.1518895232.git.sean.wang@mediatek.com>
References: <cover.1518895232.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1518895232.git.sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

This patch adds SATA support fot MT7622.

Signed-off-by: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts |  8 ++++++
 arch/arm64/boot/dts/mediatek/mt7622.dtsi     | 40 ++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
index 72ef443..6715ffa 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
@@ -323,6 +323,14 @@
 	status = "okay";
 };
 
+&sata {
+	status = "okay";
+};
+
+&sata_phy {
+	status = "okay";
+};
+
 &spi0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&spic0_pins>;
diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index cc026eb..881bc17 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/mt7622-clk.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/power/mt7622-power.h>
 #include <dt-bindings/reset/mt7622-reset.h>
 #include <dt-bindings/thermal/thermal.h>
@@ -616,6 +617,45 @@
 		};
 	};
 
+	sata: sata@1a200000 {
+		compatible = "mediatek,mt7622-ahci",
+			     "mediatek,mtk-ahci";
+		reg = <0 0x1a200000 0 0x1100>;
+		interrupts = <GIC_SPI 233 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "hostc";
+		clocks = <&pciesys CLK_SATA_AHB_EN>,
+			 <&pciesys CLK_SATA_AXI_EN>,
+			 <&pciesys CLK_SATA_ASIC_EN>,
+			 <&pciesys CLK_SATA_RBC_EN>,
+			 <&pciesys CLK_SATA_PM_EN>;
+		clock-names = "ahb", "axi", "asic", "rbc", "pm";
+		phys = <&sata_port PHY_TYPE_SATA>;
+		phy-names = "sata-phy";
+		ports-implemented = <0x1>;
+		power-domains = <&scpsys MT7622_POWER_DOMAIN_HIF0>;
+		resets = <&pciesys MT7622_SATA_AXI_BUS_RST>,
+			 <&pciesys MT7622_SATA_PHY_SW_RST>,
+			 <&pciesys MT7622_SATA_PHY_REG_RST>;
+		reset-names = "axi", "sw", "reg";
+		mediatek,phy-mode = <&pciesys>;
+		status = "disabled";
+	};
+
+	sata_phy: sata-phy@1a243000 {
+		compatible = "mediatek,generic-tphy-v1";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		status = "disabled";
+
+		sata_port: sata-phy@1a243000 {
+			reg = <0 0x1a243000 0 0x0100>;
+			clocks = <&topckgen CLK_TOP_ETH_500M>;
+			clock-names = "ref";
+			#phy-cells = <1>;
+		};
+	};
+
 	ethsys: syscon@1b000000 {
 		compatible = "mediatek,mt7622-ethsys",
 			     "syscon";
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
