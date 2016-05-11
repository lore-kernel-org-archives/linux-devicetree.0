From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>
Subject: [PATCHv3 2/4] ARM: dts: r8a7791: Reference both DMA controllers
Date: Wed, 11 May 2016 15:13:56 +0200
Message-ID: <1462972438-20797-3-git-send-email-niklas.soderlund+renesas@ragnatech.se>
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
 arch/arm/boot/dts/r8a7791.dtsi | 145 ++++++++++++++++++++++++---------=
--------
 1 file changed, 87 insertions(+), 58 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791=
=2Edtsi
index db67e34..2f92414 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -514,8 +514,9 @@
 		reg =3D <0 0xe60b0000 0 0x425>;
 		interrupts =3D <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp9_clks R8A7791_CLK_IICDVFS>;
-		dmas =3D <&dmac0 0x77>, <&dmac0 0x78>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x77>, <&dmac0 0x78>,
+		       <&dmac1 0x77>, <&dmac1 0x78>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7791_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -527,8 +528,9 @@
 		reg =3D <0 0xe6500000 0 0x425>;
 		interrupts =3D <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp3_clks R8A7791_CLK_IIC0>;
-		dmas =3D <&dmac0 0x61>, <&dmac0 0x62>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x61>, <&dmac0 0x62>,
+		       <&dmac1 0x61>, <&dmac1 0x62>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7791_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -540,8 +542,9 @@
 		reg =3D <0 0xe6510000 0 0x425>;
 		interrupts =3D <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp3_clks R8A7791_CLK_IIC1>;
-		dmas =3D <&dmac0 0x65>, <&dmac0 0x66>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x65>, <&dmac0 0x66>,
+		       <&dmac1 0x65>, <&dmac1 0x66>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7791_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -556,8 +559,9 @@
 		reg =3D <0 0xee200000 0 0x80>;
 		interrupts =3D <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp3_clks R8A7791_CLK_MMCIF0>;
-		dmas =3D <&dmac0 0xd1>, <&dmac0 0xd2>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0xd1>, <&dmac0 0xd2>,
+		       <&dmac1 0xd1>, <&dmac1 0xd2>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7791_PD_ALWAYS_ON>;
 		reg-io-width =3D <4>;
 		status =3D "disabled";
@@ -569,8 +573,9 @@
 		reg =3D <0 0xee100000 0 0x328>;
 		interrupts =3D <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp3_clks R8A7791_CLK_SDHI0>;
-		dmas =3D <&dmac1 0xcd>, <&dmac1 0xce>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0xcd>, <&dmac0 0xce>,
+		       <&dmac1 0xcd>, <&dmac1 0xce>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7791_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -580,8 +585,9 @@
 		reg =3D <0 0xee140000 0 0x100>;
 		interrupts =3D <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp3_clks R8A7791_CLK_SDHI1>;
-		dmas =3D <&dmac1 0xc1>, <&dmac1 0xc2>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0xc1>, <&dmac0 0xc2>,
+		       <&dmac1 0xc1>, <&dmac1 0xc2>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7791_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -591,8 +597,9 @@
 		reg =3D <0 0xee160000 0 0x100>;
 		interrupts =3D <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp3_clks R8A7791_CLK_SDHI2>;
-		dmas =3D <&dmac1 0xd3>, <&dmac1 0xd4>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0xd3>, <&dmac0 0xd4>,
+		       <&dmac1 0xd3>, <&dmac1 0xd4>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7791_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -604,8 +611,9 @@
 		interrupts =3D <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp2_clks R8A7791_CLK_SCIFA0>;
 		clock-names =3D "fck";
-		dmas =3D <&dmac0 0x21>, <&dmac0 0x22>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x21>, <&dmac0 0x22>,
+		       <&dmac1 0x21>, <&dmac1 0x22>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7791_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -617,8 +625,9 @@
 		interrupts =3D <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp2_clks R8A7791_CLK_SCIFA1>;
 		clock-names =3D "fck";
-		dmas =3D <&dmac0 0x25>, <&dmac0 0x26>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x25>, <&dmac0 0x26>,
+		       <&dmac1 0x25>, <&dmac1 0x26>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7791_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -630,8 +639,9 @@
 		interrupts =3D <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp2_clks R8A7791_CLK_SCIFA2>;
 		clock-names =3D "fck";
-		dmas =3D <&dmac0 0x27>, <&dmac0 0x28>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x27>, <&dmac0 0x28>,
+		       <&dmac1 0x27>, <&dmac1 0x28>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7791_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -643,8 +653,9 @@
 		interrupts =3D <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp11_clks R8A7791_CLK_SCIFA3>;
 		clock-names =3D "fck";
-		dmas =3D <&dmac0 0x1b>, <&dmac0 0x1c>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x1b>, <&dmac0 0x1c>,
+		       <&dmac1 0x1b>, <&dmac1 0x1c>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7791_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -656,8 +667,9 @@
 		interrupts =3D <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp11_clks R8A7791_CLK_SCIFA4>;
 		clock-names =3D "fck";
-		dmas =3D <&dmac0 0x1f>, <&dmac0 0x20>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x1f>, <&dmac0 0x20>,
+		       <&dmac1 0x1f>, <&dmac1 0x20>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7791_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -669,8 +681,9 @@
 		interrupts =3D <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp11_clks R8A7791_CLK_SCIFA5>;
 		clock-names =3D "fck";
-		dmas =3D <&dmac0 0x23>, <&dmac0 0x24>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x23>, <&dmac0 0x24>,
+		       <&dmac1 0x23>, <&dmac1 0x24>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7791_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -682,8 +695,9 @@
 		interrupts =3D <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp2_clks R8A7791_CLK_SCIFB0>;
 		clock-names =3D "fck";
-		dmas =3D <&dmac0 0x3d>, <&dmac0 0x3e>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x3d>, <&dmac0 0x3e>,
+		       <&dmac1 0x3d>, <&dmac1 0x3e>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7791_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -695,8 +709,9 @@
 		interrupts =3D <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp2_clks R8A7791_CLK_SCIFB1>;
 		clock-names =3D "fck";
-		dmas =3D <&dmac0 0x19>, <&dmac0 0x1a>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x19>, <&dmac0 0x1a>,
+		       <&dmac1 0x19>, <&dmac1 0x1a>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7791_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -708,8 +723,9 @@
 		interrupts =3D <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp2_clks R8A7791_CLK_SCIFB2>;
 		clock-names =3D "fck";
-		dmas =3D <&dmac0 0x1d>, <&dmac0 0x1e>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x1d>, <&dmac0 0x1e>,
+		       <&dmac1 0x1d>, <&dmac1 0x1e>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7791_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -722,8 +738,9 @@
 		clocks =3D <&mstp7_clks R8A7791_CLK_SCIF0>, <&zs_clk>,
 			 <&scif_clk>;
 		clock-names =3D "fck", "brg_int", "scif_clk";
-		dmas =3D <&dmac0 0x29>, <&dmac0 0x2a>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x29>, <&dmac0 0x2a>,
+		       <&dmac1 0x29>, <&dmac1 0x2a>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7791_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -736,8 +753,9 @@
 		clocks =3D <&mstp7_clks R8A7791_CLK_SCIF1>, <&zs_clk>,
 			 <&scif_clk>;
 		clock-names =3D "fck", "brg_int", "scif_clk";
-		dmas =3D <&dmac0 0x2d>, <&dmac0 0x2e>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x2d>, <&dmac0 0x2e>,
+		       <&dmac1 0x2d>, <&dmac1 0x2e>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7791_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -750,8 +768,9 @@
 		clocks =3D <&mstp7_clks R8A7791_CLK_SCIF2>, <&zs_clk>,
 			 <&scif_clk>;
 		clock-names =3D "fck", "brg_int", "scif_clk";
-		dmas =3D <&dmac0 0x2b>, <&dmac0 0x2c>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x2b>, <&dmac0 0x2c>,
+		       <&dmac1 0x2b>, <&dmac1 0x2c>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7791_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -764,8 +783,9 @@
 		clocks =3D <&mstp7_clks R8A7791_CLK_SCIF3>, <&zs_clk>,
 			 <&scif_clk>;
 		clock-names =3D "fck", "brg_int", "scif_clk";
-		dmas =3D <&dmac0 0x2f>, <&dmac0 0x30>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x2f>, <&dmac0 0x30>,
+		       <&dmac1 0x2f>, <&dmac1 0x30>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7791_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -778,8 +798,9 @@
 		clocks =3D <&mstp7_clks R8A7791_CLK_SCIF4>, <&zs_clk>,
 			 <&scif_clk>;
 		clock-names =3D "fck", "brg_int", "scif_clk";
-		dmas =3D <&dmac0 0xfb>, <&dmac0 0xfc>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0xfb>, <&dmac0 0xfc>,
+		       <&dmac1 0xfb>, <&dmac1 0xfc>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7791_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -792,8 +813,9 @@
 		clocks =3D <&mstp7_clks R8A7791_CLK_SCIF5>, <&zs_clk>,
 			 <&scif_clk>;
 		clock-names =3D "fck", "brg_int", "scif_clk";
-		dmas =3D <&dmac0 0xfd>, <&dmac0 0xfe>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0xfd>, <&dmac0 0xfe>,
+		       <&dmac1 0xfd>, <&dmac1 0xfe>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7791_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -806,8 +828,9 @@
 		clocks =3D <&mstp7_clks R8A7791_CLK_HSCIF0>, <&zs_clk>,
 			 <&scif_clk>;
 		clock-names =3D "fck", "brg_int", "scif_clk";
-		dmas =3D <&dmac0 0x39>, <&dmac0 0x3a>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x39>, <&dmac0 0x3a>,
+		       <&dmac1 0x39>, <&dmac1 0x3a>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7791_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -820,8 +843,9 @@
 		clocks =3D <&mstp7_clks R8A7791_CLK_HSCIF1>, <&zs_clk>,
 			 <&scif_clk>;
 		clock-names =3D "fck", "brg_int", "scif_clk";
-		dmas =3D <&dmac0 0x4d>, <&dmac0 0x4e>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x4d>, <&dmac0 0x4e>,
+		       <&dmac1 0x4d>, <&dmac1 0x4e>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7791_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -834,8 +858,9 @@
 		clocks =3D <&mstp7_clks R8A7791_CLK_HSCIF2>, <&zs_clk>,
 			 <&scif_clk>;
 		clock-names =3D "fck", "brg_int", "scif_clk";
-		dmas =3D <&dmac0 0x3b>, <&dmac0 0x3c>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x3b>, <&dmac0 0x3c>,
+		       <&dmac1 0x3b>, <&dmac1 0x3c>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7791_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -1478,8 +1503,9 @@
 		reg =3D <0 0xe6b10000 0 0x2c>;
 		interrupts =3D <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp9_clks R8A7791_CLK_QSPI_MOD>;
-		dmas =3D <&dmac0 0x17>, <&dmac0 0x18>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x17>, <&dmac0 0x18>,
+		       <&dmac1 0x17>, <&dmac1 0x18>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7791_PD_ALWAYS_ON>;
 		num-cs =3D <1>;
 		#address-cells =3D <1>;
@@ -1492,8 +1518,9 @@
 		reg =3D <0 0xe6e20000 0 0x0064>;
 		interrupts =3D <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp0_clks R8A7791_CLK_MSIOF0>;
-		dmas =3D <&dmac0 0x51>, <&dmac0 0x52>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x51>, <&dmac0 0x52>,
+		       <&dmac1 0x51>, <&dmac1 0x52>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7791_PD_ALWAYS_ON>;
 		#address-cells =3D <1>;
 		#size-cells =3D <0>;
@@ -1505,8 +1532,9 @@
 		reg =3D <0 0xe6e10000 0 0x0064>;
 		interrupts =3D <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp2_clks R8A7791_CLK_MSIOF1>;
-		dmas =3D <&dmac0 0x55>, <&dmac0 0x56>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x55>, <&dmac0 0x56>,
+		       <&dmac1 0x55>, <&dmac1 0x56>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7791_PD_ALWAYS_ON>;
 		#address-cells =3D <1>;
 		#size-cells =3D <0>;
@@ -1518,8 +1546,9 @@
 		reg =3D <0 0xe6e00000 0 0x0064>;
 		interrupts =3D <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp2_clks R8A7791_CLK_MSIOF2>;
-		dmas =3D <&dmac0 0x41>, <&dmac0 0x42>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x41>, <&dmac0 0x42>,
+		       <&dmac1 0x41>, <&dmac1 0x42>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7791_PD_ALWAYS_ON>;
 		#address-cells =3D <1>;
 		#size-cells =3D <0>;
--=20
2.8.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
