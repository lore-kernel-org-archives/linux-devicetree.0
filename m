From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>
Subject: [PATCHv3 1/4] ARM: dts: r8a7790: Reference both DMA controllers
Date: Wed, 11 May 2016 15:13:55 +0200
Message-ID: <1462972438-20797-2-git-send-email-niklas.soderlund+renesas@ragnatech.se>
References: <1462972438-20797-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462972438-20797-1-git-send-email-niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

R-Car Gen2 have two DMA controllers, which are equivalent. Add
references to both dmac0 and dmac1 so the driver can choose which one t=
o
use.

Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatec=
h.se>
---
 arch/arm/boot/dts/r8a7790.dtsi | 131 ++++++++++++++++++++++++---------=
--------
 1 file changed, 78 insertions(+), 53 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790=
=2Edtsi
index 83cf23c..14fcd19 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -517,8 +517,9 @@
 		reg =3D <0 0xe6500000 0 0x425>;
 		interrupts =3D <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp3_clks R8A7790_CLK_IIC0>;
-		dmas =3D <&dmac0 0x61>, <&dmac0 0x62>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x61>, <&dmac0 0x62>,
+		       <&dmac1 0x61>, <&dmac1 0x62>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7790_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -530,8 +531,9 @@
 		reg =3D <0 0xe6510000 0 0x425>;
 		interrupts =3D <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp3_clks R8A7790_CLK_IIC1>;
-		dmas =3D <&dmac0 0x65>, <&dmac0 0x66>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x65>, <&dmac0 0x66>,
+		       <&dmac1 0x65>, <&dmac1 0x66>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7790_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -543,8 +545,9 @@
 		reg =3D <0 0xe6520000 0 0x425>;
 		interrupts =3D <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp3_clks R8A7790_CLK_IIC2>;
-		dmas =3D <&dmac0 0x69>, <&dmac0 0x6a>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x69>, <&dmac0 0x6a>,
+		       <&dmac1 0x69>, <&dmac1 0x6a>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7790_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -556,8 +559,9 @@
 		reg =3D <0 0xe60b0000 0 0x425>;
 		interrupts =3D <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp9_clks R8A7790_CLK_IICDVFS>;
-		dmas =3D <&dmac0 0x77>, <&dmac0 0x78>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x77>, <&dmac0 0x78>,
+		       <&dmac1 0x77>, <&dmac1 0x78>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7790_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -567,8 +571,9 @@
 		reg =3D <0 0xee200000 0 0x80>;
 		interrupts =3D <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp3_clks R8A7790_CLK_MMCIF0>;
-		dmas =3D <&dmac0 0xd1>, <&dmac0 0xd2>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0xd1>, <&dmac0 0xd2>,
+		       <&dmac1 0xd1>, <&dmac1 0xd2>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7790_PD_ALWAYS_ON>;
 		reg-io-width =3D <4>;
 		status =3D "disabled";
@@ -580,8 +585,9 @@
 		reg =3D <0 0xee220000 0 0x80>;
 		interrupts =3D <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp3_clks R8A7790_CLK_MMCIF1>;
-		dmas =3D <&dmac0 0xe1>, <&dmac0 0xe2>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0xe1>, <&dmac0 0xe2>,
+		       <&dmac1 0xe1>, <&dmac1 0xe2>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7790_PD_ALWAYS_ON>;
 		reg-io-width =3D <4>;
 		status =3D "disabled";
@@ -598,8 +604,9 @@
 		reg =3D <0 0xee100000 0 0x328>;
 		interrupts =3D <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp3_clks R8A7790_CLK_SDHI0>;
-		dmas =3D <&dmac1 0xcd>, <&dmac1 0xce>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0xcd>, <&dmac0 0xce>,
+		       <&dmac1 0xcd>, <&dmac1 0xce>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		max-frequency =3D <195000000>;
 		power-domains =3D <&sysc R8A7790_PD_ALWAYS_ON>;
 		status =3D "disabled";
@@ -610,8 +617,9 @@
 		reg =3D <0 0xee120000 0 0x328>;
 		interrupts =3D <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp3_clks R8A7790_CLK_SDHI1>;
-		dmas =3D <&dmac1 0xc9>, <&dmac1 0xca>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0xc9>, <&dmac0 0xca>,
+		       <&dmac1 0xc9>, <&dmac1 0xca>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		max-frequency =3D <195000000>;
 		power-domains =3D <&sysc R8A7790_PD_ALWAYS_ON>;
 		status =3D "disabled";
@@ -622,8 +630,9 @@
 		reg =3D <0 0xee140000 0 0x100>;
 		interrupts =3D <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp3_clks R8A7790_CLK_SDHI2>;
-		dmas =3D <&dmac1 0xc1>, <&dmac1 0xc2>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0xc1>, <&dmac0 0xc2>,
+		       <&dmac1 0xc1>, <&dmac1 0xc2>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		max-frequency =3D <97500000>;
 		power-domains =3D <&sysc R8A7790_PD_ALWAYS_ON>;
 		status =3D "disabled";
@@ -634,8 +643,9 @@
 		reg =3D <0 0xee160000 0 0x100>;
 		interrupts =3D <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp3_clks R8A7790_CLK_SDHI3>;
-		dmas =3D <&dmac1 0xd3>, <&dmac1 0xd4>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0xd3>, <&dmac0 0xd4>,
+		       <&dmac1 0xd3>, <&dmac1 0xd4>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		max-frequency =3D <97500000>;
 		power-domains =3D <&sysc R8A7790_PD_ALWAYS_ON>;
 		status =3D "disabled";
@@ -648,8 +658,9 @@
 		interrupts =3D <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp2_clks R8A7790_CLK_SCIFA0>;
 		clock-names =3D "fck";
-		dmas =3D <&dmac0 0x21>, <&dmac0 0x22>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x21>, <&dmac0 0x22>,
+		       <&dmac1 0x21>, <&dmac1 0x22>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7790_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -661,8 +672,9 @@
 		interrupts =3D <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp2_clks R8A7790_CLK_SCIFA1>;
 		clock-names =3D "fck";
-		dmas =3D <&dmac0 0x25>, <&dmac0 0x26>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x25>, <&dmac0 0x26>,
+		       <&dmac1 0x25>, <&dmac1 0x26>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7790_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -674,8 +686,9 @@
 		interrupts =3D <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp2_clks R8A7790_CLK_SCIFA2>;
 		clock-names =3D "fck";
-		dmas =3D <&dmac0 0x27>, <&dmac0 0x28>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x27>, <&dmac0 0x28>,
+		       <&dmac1 0x27>, <&dmac1 0x28>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7790_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -687,8 +700,9 @@
 		interrupts =3D <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp2_clks R8A7790_CLK_SCIFB0>;
 		clock-names =3D "fck";
-		dmas =3D <&dmac0 0x3d>, <&dmac0 0x3e>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x3d>, <&dmac0 0x3e>,
+		       <&dmac1 0x3d>, <&dmac1 0x3e>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7790_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -700,8 +714,9 @@
 		interrupts =3D <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp2_clks R8A7790_CLK_SCIFB1>;
 		clock-names =3D "fck";
-		dmas =3D <&dmac0 0x19>, <&dmac0 0x1a>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x19>, <&dmac0 0x1a>,
+		       <&dmac1 0x19>, <&dmac1 0x1a>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7790_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -713,8 +728,9 @@
 		interrupts =3D <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp2_clks R8A7790_CLK_SCIFB2>;
 		clock-names =3D "fck";
-		dmas =3D <&dmac0 0x1d>, <&dmac0 0x1e>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x1d>, <&dmac0 0x1e>,
+		       <&dmac1 0x1d>, <&dmac1 0x1e>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7790_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -727,8 +743,9 @@
 		clocks =3D <&mstp7_clks R8A7790_CLK_SCIF0>, <&zs_clk>,
 			 <&scif_clk>;
 		clock-names =3D "fck", "brg_int", "scif_clk";
-		dmas =3D <&dmac0 0x29>, <&dmac0 0x2a>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x29>, <&dmac0 0x2a>,
+		       <&dmac1 0x29>, <&dmac1 0x2a>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7790_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -741,8 +758,9 @@
 		clocks =3D <&mstp7_clks R8A7790_CLK_SCIF1>, <&zs_clk>,
 			 <&scif_clk>;
 		clock-names =3D "fck", "brg_int", "scif_clk";
-		dmas =3D <&dmac0 0x2d>, <&dmac0 0x2e>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x2d>, <&dmac0 0x2e>,
+		       <&dmac1 0x2d>, <&dmac1 0x2e>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7790_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -755,9 +773,9 @@
 		clocks =3D <&mstp3_clks R8A7790_CLK_SCIF2>, <&zs_clk>,
 			 <&scif_clk>;
 		clock-names =3D "fck", "brg_int", "scif_clk";
-		dmas =3D <&dmac0 0x2b>, <&dmac0 0x2c>;
-		dma-names =3D "tx", "rx";
-		power-domains =3D <&sysc R8A7790_PD_ALWAYS_ON>;
+		dmas =3D <&dmac0 0x2b>, <&dmac0 0x2c>,
+		       <&dmac1 0x2b>, <&dmac1 0x2c>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		status =3D "disabled";
 	};
=20
@@ -769,8 +787,9 @@
 		clocks =3D <&mstp7_clks R8A7790_CLK_HSCIF0>, <&zs_clk>,
 			 <&scif_clk>;
 		clock-names =3D "fck", "brg_int", "scif_clk";
-		dmas =3D <&dmac0 0x39>, <&dmac0 0x3a>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x39>, <&dmac0 0x3a>,
+		       <&dmac1 0x39>, <&dmac1 0x3a>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7790_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -783,8 +802,9 @@
 		clocks =3D <&mstp7_clks R8A7790_CLK_HSCIF1>, <&zs_clk>,
 			 <&scif_clk>;
 		clock-names =3D "fck", "brg_int", "scif_clk";
-		dmas =3D <&dmac0 0x4d>, <&dmac0 0x4e>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x4d>, <&dmac0 0x4e>,
+		       <&dmac1 0x4d>, <&dmac1 0x4e>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7790_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -1469,8 +1489,9 @@
 		reg =3D <0 0xe6b10000 0 0x2c>;
 		interrupts =3D <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp9_clks R8A7790_CLK_QSPI_MOD>;
-		dmas =3D <&dmac0 0x17>, <&dmac0 0x18>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x17>, <&dmac0 0x18>,
+		       <&dmac1 0x17>, <&dmac1 0x18>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7790_PD_ALWAYS_ON>;
 		num-cs =3D <1>;
 		#address-cells =3D <1>;
@@ -1483,8 +1504,9 @@
 		reg =3D <0 0xe6e20000 0 0x0064>;
 		interrupts =3D <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp0_clks R8A7790_CLK_MSIOF0>;
-		dmas =3D <&dmac0 0x51>, <&dmac0 0x52>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x51>, <&dmac0 0x52>,
+		       <&dmac1 0x51>, <&dmac1 0x52>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7790_PD_ALWAYS_ON>;
 		#address-cells =3D <1>;
 		#size-cells =3D <0>;
@@ -1496,8 +1518,9 @@
 		reg =3D <0 0xe6e10000 0 0x0064>;
 		interrupts =3D <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp2_clks R8A7790_CLK_MSIOF1>;
-		dmas =3D <&dmac0 0x55>, <&dmac0 0x56>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x55>, <&dmac0 0x56>,
+		       <&dmac1 0x55>, <&dmac1 0x56>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7790_PD_ALWAYS_ON>;
 		#address-cells =3D <1>;
 		#size-cells =3D <0>;
@@ -1509,8 +1532,9 @@
 		reg =3D <0 0xe6e00000 0 0x0064>;
 		interrupts =3D <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp2_clks R8A7790_CLK_MSIOF2>;
-		dmas =3D <&dmac0 0x41>, <&dmac0 0x42>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x41>, <&dmac0 0x42>,
+		       <&dmac1 0x41>, <&dmac1 0x42>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7790_PD_ALWAYS_ON>;
 		#address-cells =3D <1>;
 		#size-cells =3D <0>;
@@ -1522,8 +1546,9 @@
 		reg =3D <0 0xe6c90000 0 0x0064>;
 		interrupts =3D <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp2_clks R8A7790_CLK_MSIOF3>;
-		dmas =3D <&dmac0 0x45>, <&dmac0 0x46>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x45>, <&dmac0 0x46>,
+		       <&dmac1 0x45>, <&dmac1 0x46>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7790_PD_ALWAYS_ON>;
 		#address-cells =3D <1>;
 		#size-cells =3D <0>;
--=20
2.8.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
