From: John Crispin <john@phrozen.org>
Subject: [PATCH 11/16] arm: dts: add usb nodes to the mt7623.dtsi file
Date: Mon, 23 Jan 2017 12:29:30 +0100
Message-ID: <1485170975-51813-12-git-send-email-john@phrozen.org>
References: <1485170975-51813-1-git-send-email-john@phrozen.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1485170975-51813-1-git-send-email-john@phrozen.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, linux-arm-kernel@lists.infradead.org, John Crispin <john@phrozen.org>
List-Id: devicetree@vger.kernel.org

Add USB nodes to the mt7623.dtsi file.

Signed-off-by: John Crispin <john@phrozen.org>
---
 arch/arm/boot/dts/mt7623.dtsi |   59 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
index 791f3b1..540f70c 100644
--- a/arch/arm/boot/dts/mt7623.dtsi
+++ b/arch/arm/boot/dts/mt7623.dtsi
@@ -340,6 +340,65 @@
 		status = "disabled";
 	};
 
+	usb1: usb@1a1c0000 {
+		compatible = "mediatek,mt7623-xhci",
+			     "mediatek,mt8173-xhci";
+		reg = <0 0x1a1c0000 0 0x1000>,
+		      <0 0x1a1c4700 0 0x0100>;
+		reg-names = "mac", "ippc";
+		interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&hifsys CLK_HIFSYS_USB0PHY>,
+			 <&topckgen CLK_TOP_ETHIF_SEL>;
+		clock-names = "sys_ck", "ethif";
+		power-domains = <&scpsys MT2701_POWER_DOMAIN_HIF>;
+		phys = <&phy_port0 PHY_TYPE_USB3>;
+		status = "disabled";
+	};
+
+	u3phy1: usb-phy@1a1c4000 {
+		compatible = "mediatek,mt7623-u3phy",
+			     "mediatek,mt8173-u3phy";
+		reg = <0 0x1a1c4000 0 0x0700>;
+		clocks = <&clk26m>;
+		clock-names = "u3phya_ref";
+		#phy-cells = <1>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		status = "disabled";
+
+		phy_port0: phy_port0: port@1a1c4800 {
+			reg = <0 0x1a1c4800 0 0x800>;
+			#phy-cells = <1>;
+			status = "okay";
+		};
+	};
+
+	usb2: usb@1a240000 {
+		compatible = "mediatek,mt7623-xhci",
+			     "mediatek,mt8173-xhci";
+		reg = <0 0x1a240000 0 0x1000>,
+		      <0 0x1a244700 0 0x0100>;
+		interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&hifsys CLK_HIFSYS_USB1PHY>,
+			 <&topckgen CLK_TOP_ETHIF_SEL>;
+		clock-names = "sys_ck", "ethif";
+		power-domains = <&scpsys MT2701_POWER_DOMAIN_HIF>;
+		phys = <&u3phy2 0>;
+		status = "disabled";
+	};
+
+	u3phy2: usb-phy@1a244000 {
+		compatible = "mediatek,mt7623-u3phy",
+			     "mediatek,mt8173-u3phy";
+		reg = <0 0x1a244000 0 0x0700>,
+		      <0 0x1a244800 0 0x0800>;
+		clocks = <&clk26m>;
+		clock-names = "u3phya_ref";
+		#phy-cells = <1>;
+		status = "disabled";
+	};
+
 	hifsys: syscon@1a000000 {
 		compatible = "mediatek,mt7623-hifsys",
 			     "mediatek,mt2701-hifsys",
-- 
1.7.10.4
