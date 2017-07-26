From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 4/5] arm64: dts: renesas: r8a7795: add usb-dmac ch2 and ch3 device nodes
Date: Wed, 26 Jul 2017 20:29:39 +0900
Message-ID: <1501068580-3981-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1501068580-3981-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1501068580-3981-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch adds support for usb-dmac ch2 and ch3 device nodes for
R-Car H3 ES2.0.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi |  3 +++
 arch/arm64/boot/dts/renesas/r8a7795.dtsi     | 28 ++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
index 1eccc7c..9743aca 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
@@ -25,6 +25,9 @@
 	/delete-node/ usb@ee0e0100;
 	/delete-node/ usb@ee0e0000;
 
+	/delete-node/ dma-controller@e6460000;
+	/delete-node/ dma-controller@e6470000;
+
 	fcpf2: fcp@fe952000 {
 		compatible = "renesas,fcpf";
 		reg = <0 0xfe952000 0 0x200>;
diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index c3b1285..d1381d9 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1499,6 +1499,34 @@
 			dma-channels = <2>;
 		};
 
+		usb_dmac2: dma-controller@e6460000 {
+			compatible = "renesas,r8a7795-usb-dmac",
+				     "renesas,usb-dmac";
+			reg = <0 0xe6460000 0 0x100>;
+			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "ch0", "ch1";
+			clocks = <&cpg CPG_MOD 326>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			resets = <&cpg 326>;
+			#dma-cells = <1>;
+			dma-channels = <2>;
+		};
+
+		usb_dmac3: dma-controller@e6470000 {
+			compatible = "renesas,r8a7795-usb-dmac",
+				     "renesas,usb-dmac";
+			reg = <0 0xe6470000 0 0x100>;
+			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "ch0", "ch1";
+			clocks = <&cpg CPG_MOD 329>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			resets = <&cpg 329>;
+			#dma-cells = <1>;
+			dma-channels = <2>;
+		};
+
 		sdhi0: sd@ee100000 {
 			compatible = "renesas,sdhi-r8a7795";
 			reg = <0 0xee100000 0 0x2000>;
-- 
1.9.1
