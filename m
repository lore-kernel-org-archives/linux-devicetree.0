Return-Path: <SRS0=c6Dm=MD=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 4/4] ARM: dts: r8a77470: Add I2C4 support
Date: Fri, 21 Sep 2018 18:37:01 +0100
Message-Id: <1537551421-4259-5-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1537551421-4259-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1537551421-4259-1-git-send-email-fabrizio.castro@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Biju Das <biju.das@bp.renesas.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>, Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Add I2C4 support to RZ/G1C (a.k.a. r8a77470) SoC specific
device tree.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Biju Das <biju.das@bp.renesas.com>
---
 arch/arm/boot/dts/r8a77470.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
index 9e7f86d..9ec78d3 100644
--- a/arch/arm/boot/dts/r8a77470.dtsi
+++ b/arch/arm/boot/dts/r8a77470.dtsi
@@ -237,6 +237,20 @@
 			reg = <0 0xe6300000 0 0x20000>;
 		};
 
+		i2c4: i2c@e6520000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,i2c-r8a77470",
+				     "renesas,rcar-gen2-i2c";
+			reg = <0 0xe6520000 0 0x40>;
+			interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 927>;
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
+			resets = <&cpg 927>;
+			i2c-scl-internal-delay-ns = <6>;
+			status = "disabled";
+		};
+
 		dmac0: dma-controller@e6700000 {
 			compatible = "renesas,dmac-r8a77470",
 				     "renesas,rcar-dmac";
-- 
2.7.4
