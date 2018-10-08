Return-Path: <SRS0=r14x=MU=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH v3 4/6] ARM: dts: r8a77470: Add SDHI0 support
Date: Mon,  8 Oct 2018 09:51:50 +0100
Message-Id: <1538988712-17077-5-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1538988712-17077-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1538988712-17077-1-git-send-email-fabrizio.castro@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

RZ/G1C comes with two different types of IP for the SDHI
interfaces, SDHI0 and SDHI2 share the same IP type, and
such an IP is also compatible with the one found in R-Car
Gen2. SDHI1 IP on the other hand is compatible with R-Car
Gen3 with internal DMA.
This patch completes the SDHI support of the R-Car Gen2
compatible IPs, including fixing the max-frequency
definition of SDHI2, as it turns out there is a bug in
Section 1.3.9 of the RZ/G1C Hardware User's Manual (Rev.
1.00 Oct. 2017).

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Biju Das <biju.das@bp.renesas.com>

---
v2->v3:
* No change

v2:
* New patch
---
 arch/arm/boot/dts/r8a77470.dtsi | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
index 9e7f86d..e01df9c 100644
--- a/arch/arm/boot/dts/r8a77470.dtsi
+++ b/arch/arm/boot/dts/r8a77470.dtsi
@@ -412,6 +412,21 @@
 			status = "disabled";
 		};
 
+		sdhi0: sd@ee100000 {
+			compatible = "renesas,sdhi-r8a77470",
+				     "renesas,rcar-gen2-sdhi";
+			reg = <0 0xee100000 0 0x328>;
+			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 314>;
+			dmas = <&dmac0 0xcd>, <&dmac0 0xce>,
+			       <&dmac1 0xcd>, <&dmac1 0xce>;
+			dma-names = "tx", "rx", "tx", "rx";
+			max-frequency = <156000000>;
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
+			resets = <&cpg 314>;
+			status = "disabled";
+		};
+
 		sdhi2: sd@ee160000 {
 			compatible = "renesas,sdhi-r8a77470",
 				     "renesas,rcar-gen2-sdhi";
@@ -421,7 +436,7 @@
 			dmas = <&dmac0 0xd3>, <&dmac0 0xd4>,
 			       <&dmac1 0xd3>, <&dmac1 0xd4>;
 			dma-names = "tx", "rx", "tx", "rx";
-			max-frequency = <97500000>;
+			max-frequency = <78000000>;
 			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
 			resets = <&cpg 312>;
 			status = "disabled";
-- 
2.7.4
