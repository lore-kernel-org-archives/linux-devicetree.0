From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] arm64: dts: r8a7795: Add USB-DMAC device nodes
Date: Mon, 1 Feb 2016 19:29:00 +0900
Message-ID: <1454322540-5608-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
This patch is based on the latest renesas.git / renesas-devel-20160129-v4.5-rc1
tag. (commit id = 0319e29efd838de5a7a4b589b8f07d9c1fd4abf6)

This patch needs r8a7795-cpg-mssr.c update for usb-dmac clocks.

 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 119549e..8cb1838 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -880,5 +880,31 @@
 			power-domains = <&cpg>;
 			status = "disabled";
 		};
+
+		usb_dmac0: dma-controller@e65a0000 {
+			compatible = "renesas,r8a7795-usb-dmac",
+				     "renesas,usb-dmac";
+			reg = <0 0xe65a0000 0 0x100>;
+			interrupts = <0 109 IRQ_TYPE_LEVEL_HIGH
+				      0 109 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "ch0", "ch1";
+			clocks = <&cpg CPG_MOD 330>;
+			power-domains = <&cpg>;
+			#dma-cells = <1>;
+			dma-channels = <2>;
+		};
+
+		usb_dmac1: dma-controller@e65b0000 {
+			compatible = "renesas,r8a7795-usb-dmac",
+				     "renesas,usb-dmac";
+			reg = <0 0xe65b0000 0 0x100>;
+			interrupts = <0 110 IRQ_TYPE_LEVEL_HIGH
+				      0 110 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "ch0", "ch1";
+			clocks = <&cpg CPG_MOD 331>;
+			power-domains = <&cpg>;
+			#dma-cells = <1>;
+			dma-channels = <2>;
+		};
 	};
 };
-- 
1.9.1
