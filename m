Return-Path: <SRS0=r166=I2=verge.net.au=horms@kernel.org>
Date: Fri, 8 Jun 2018 10:18:51 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a77990: Enable USB2.0 Host for
 Ebisu board
Message-ID: <20180608081850.zj5g77zzhbbgk5lp@verge.net.au>
References: <1528278726-2910-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1528278726-2910-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Jun 06, 2018 at 06:52:06PM +0900, Yoshihiro Shimoda wrote:
> This patch adds USB2.0 PHY and Host(EHCI/OHCI) nodes and
> enables them for R-Car E3 Ebisu board.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
> This patch set is based on renesas-drivers.git /
> renesas-drivers-2018-06-05-v4.17 tag.
> 
> Changes from v1:
>  - Squash 4 patches into a single patch.

Thanks Shimoda-san, I have applied this for v4.19.

I had to do so manually to resolve a trivial conflict in
r8a779980-ebisu.dts. The result is below. Please check to make
sure that I got it right.

From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] arm64: dts: renesas: r8a77990: Enable USB2.0 Host for Ebisu
 board

This patch adds USB2.0 PHY and Host(EHCI/OHCI) nodes and
enables them for R-Car E3 Ebisu board.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 20 ++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi      | 37 ++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
index 28945a8b9800..5e28c1b94b77 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
@@ -47,10 +47,18 @@
 	};
 };
 
+&ehci0 {
+	status = "okay";
+};
+
 &extal_clk {
 	clock-frequency = <48000000>;
 };
 
+&ohci0 {
+	status = "okay";
+};
+
 &pfc {
 	avb_pins: avb {
 		mux {
@@ -58,6 +66,11 @@
 			function = "avb";
 		};
 	};
+
+	usb0_pins: usb {
+		groups = "usb0_b";
+		function = "usb0";
+	};
 };
 
 &rwdt {
@@ -68,3 +81,10 @@
 &scif2 {
 	status = "okay";
 };
+
+&usb2_phy0 {
+	pinctrl-0 = <&usb0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 735881d4e57a..f8004608c595 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -267,6 +267,43 @@
 			status = "disabled";
 		};
 
+		ohci0: usb@ee080000 {
+			compatible = "generic-ohci";
+			reg = <0 0xee080000 0 0x100>;
+			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 703>;
+			phys = <&usb2_phy0>;
+			phy-names = "usb";
+			power-domains = <&sysc 32>;
+			resets = <&cpg 703>;
+			status = "disabled";
+		};
+
+		ehci0: usb@ee080100 {
+			compatible = "generic-ehci";
+			reg = <0 0xee080100 0 0x100>;
+			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 703>;
+			phys = <&usb2_phy0>;
+			phy-names = "usb";
+			companion = <&ohci0>;
+			power-domains = <&sysc 32>;
+			resets = <&cpg 703>;
+			status = "disabled";
+		};
+
+		usb2_phy0: usb-phy@ee080200 {
+			compatible = "renesas,usb2-phy-r8a77990",
+				     "renesas,rcar-gen3-usb2-phy";
+			reg = <0 0xee080200 0 0x700>;
+			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 703>;
+			power-domains = <&sysc 32>;
+			resets = <&cpg 703>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@f1010000 {
 			compatible = "arm,gic-400";
 			#interrupt-cells = <3>;
-- 
2.11.0
