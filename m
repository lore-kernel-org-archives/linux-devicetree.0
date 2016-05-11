From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>
Subject: [PATCHv3 3/4] ARM: dts: r8a7793: Reference both DMA controllers
Date: Wed, 11 May 2016 15:13:57 +0200
Message-ID: <1462972438-20797-4-git-send-email-niklas.soderlund+renesas@ragnatech.se>
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
 arch/arm/boot/dts/r8a7793.dtsi | 130 ++++++++++++++++++++++++---------=
--------
 1 file changed, 78 insertions(+), 52 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7793.dtsi b/arch/arm/boot/dts/r8a7793=
=2Edtsi
index 76c8435..5f50e9b 100644
--- a/arch/arm/boot/dts/r8a7793.dtsi
+++ b/arch/arm/boot/dts/r8a7793.dtsi
@@ -473,8 +473,9 @@
 		reg =3D <0 0xe60b0000 0 0x425>;
 		interrupts =3D <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp9_clks R8A7793_CLK_IICDVFS>;
-		dmas =3D <&dmac0 0x77>, <&dmac0 0x78>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x77>, <&dmac0 0x78>,
+		       <&dmac1 0x77>, <&dmac1 0x78>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7793_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -486,8 +487,9 @@
 		reg =3D <0 0xe6500000 0 0x425>;
 		interrupts =3D <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp3_clks R8A7793_CLK_IIC0>;
-		dmas =3D <&dmac0 0x61>, <&dmac0 0x62>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x61>, <&dmac0 0x62>,
+		       <&dmac1 0x61>, <&dmac1 0x62>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7793_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -499,8 +501,9 @@
 		reg =3D <0 0xe6510000 0 0x425>;
 		interrupts =3D <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp3_clks R8A7793_CLK_IIC1>;
-		dmas =3D <&dmac0 0x65>, <&dmac0 0x66>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x65>, <&dmac0 0x66>,
+		       <&dmac1 0x65>, <&dmac1 0x66>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7793_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -515,8 +518,9 @@
 		reg =3D <0 0xee100000 0 0x328>;
 		interrupts =3D <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp3_clks R8A7793_CLK_SDHI0>;
-		dmas =3D <&dmac0 0xcd>, <&dmac0 0xce>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0xcd>, <&dmac0 0xce>,
+		       <&dmac1 0xcd>, <&dmac1 0xce>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7793_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -526,8 +530,9 @@
 		reg =3D <0 0xee140000 0 0x100>;
 		interrupts =3D <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp3_clks R8A7793_CLK_SDHI1>;
-		dmas =3D <&dmac0 0xc1>, <&dmac0 0xc2>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0xc1>, <&dmac0 0xc2>,
+		       <&dmac1 0xc1>, <&dmac1 0xc2>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7793_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -537,8 +542,9 @@
 		reg =3D <0 0xee160000 0 0x100>;
 		interrupts =3D <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp3_clks R8A7793_CLK_SDHI2>;
-		dmas =3D <&dmac0 0xd3>, <&dmac0 0xd4>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0xd3>, <&dmac0 0xd4>,
+		       <&dmac1 0xd3>, <&dmac1 0xd4>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7793_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -548,8 +554,9 @@
 		reg =3D <0 0xee200000 0 0x80>;
 		interrupts =3D <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp3_clks R8A7793_CLK_MMCIF0>;
-		dmas =3D <&dmac0 0xd1>, <&dmac0 0xd2>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0xd1>, <&dmac0 0xd2>,
+		       <&dmac1 0xd1>, <&dmac1 0xd2>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7793_PD_ALWAYS_ON>;
 		reg-io-width =3D <4>;
 		status =3D "disabled";
@@ -563,8 +570,9 @@
 		interrupts =3D <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp2_clks R8A7793_CLK_SCIFA0>;
 		clock-names =3D "fck";
-		dmas =3D <&dmac0 0x21>, <&dmac0 0x22>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x21>, <&dmac0 0x22>,
+		       <&dmac1 0x21>, <&dmac1 0x22>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7793_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -576,8 +584,9 @@
 		interrupts =3D <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp2_clks R8A7793_CLK_SCIFA1>;
 		clock-names =3D "fck";
-		dmas =3D <&dmac0 0x25>, <&dmac0 0x26>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x25>, <&dmac0 0x26>,
+		       <&dmac1 0x25>, <&dmac1 0x26>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7793_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -589,8 +598,9 @@
 		interrupts =3D <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp2_clks R8A7793_CLK_SCIFA2>;
 		clock-names =3D "fck";
-		dmas =3D <&dmac0 0x27>, <&dmac0 0x28>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x27>, <&dmac0 0x28>,
+		       <&dmac1 0x27>, <&dmac1 0x28>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7793_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -602,8 +612,9 @@
 		interrupts =3D <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp11_clks R8A7793_CLK_SCIFA3>;
 		clock-names =3D "fck";
-		dmas =3D <&dmac0 0x1b>, <&dmac0 0x1c>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x1b>, <&dmac0 0x1c>,
+		       <&dmac1 0x1b>, <&dmac1 0x1c>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7793_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -615,8 +626,9 @@
 		interrupts =3D <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp11_clks R8A7793_CLK_SCIFA4>;
 		clock-names =3D "fck";
-		dmas =3D <&dmac0 0x1f>, <&dmac0 0x20>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x1f>, <&dmac0 0x20>,
+		       <&dmac1 0x1f>, <&dmac1 0x20>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7793_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -628,8 +640,9 @@
 		interrupts =3D <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp11_clks R8A7793_CLK_SCIFA5>;
 		clock-names =3D "fck";
-		dmas =3D <&dmac0 0x23>, <&dmac0 0x24>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x23>, <&dmac0 0x24>,
+		       <&dmac1 0x23>, <&dmac1 0x24>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7793_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -641,8 +654,9 @@
 		interrupts =3D <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp2_clks R8A7793_CLK_SCIFB0>;
 		clock-names =3D "fck";
-		dmas =3D <&dmac0 0x3d>, <&dmac0 0x3e>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x3d>, <&dmac0 0x3e>,
+		       <&dmac1 0x3d>, <&dmac1 0x3e>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7793_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -654,8 +668,9 @@
 		interrupts =3D <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp2_clks R8A7793_CLK_SCIFB1>;
 		clock-names =3D "fck";
-		dmas =3D <&dmac0 0x19>, <&dmac0 0x1a>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x19>, <&dmac0 0x1a>,
+		       <&dmac1 0x19>, <&dmac1 0x1a>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7793_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -667,8 +682,9 @@
 		interrupts =3D <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp2_clks R8A7793_CLK_SCIFB2>;
 		clock-names =3D "fck";
-		dmas =3D <&dmac0 0x1d>, <&dmac0 0x1e>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x1d>, <&dmac0 0x1e>,
+		       <&dmac1 0x1d>, <&dmac1 0x1e>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7793_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -681,8 +697,9 @@
 		clocks =3D <&mstp7_clks R8A7793_CLK_SCIF0>, <&zs_clk>,
 			 <&scif_clk>;
 		clock-names =3D "fck", "brg_int", "scif_clk";
-		dmas =3D <&dmac0 0x29>, <&dmac0 0x2a>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x29>, <&dmac0 0x2a>,
+		       <&dmac1 0x29>, <&dmac1 0x2a>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7793_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -695,8 +712,9 @@
 		clocks =3D <&mstp7_clks R8A7793_CLK_SCIF1>, <&zs_clk>,
 			 <&scif_clk>;
 		clock-names =3D "fck", "brg_int", "scif_clk";
-		dmas =3D <&dmac0 0x2d>, <&dmac0 0x2e>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x2d>, <&dmac0 0x2e>,
+		       <&dmac1 0x2d>, <&dmac1 0x2e>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7793_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -709,8 +727,9 @@
 		clocks =3D <&mstp7_clks R8A7793_CLK_SCIF2>, <&zs_clk>,
 			 <&scif_clk>;
 		clock-names =3D "fck", "brg_int", "scif_clk";
-		dmas =3D <&dmac0 0x2b>, <&dmac0 0x2c>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x2b>, <&dmac0 0x2c>,
+		       <&dmac1 0x2b>, <&dmac1 0x2c>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7793_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -723,8 +742,9 @@
 		clocks =3D <&mstp7_clks R8A7793_CLK_SCIF3>, <&zs_clk>,
 			 <&scif_clk>;
 		clock-names =3D "fck", "brg_int", "scif_clk";
-		dmas =3D <&dmac0 0x2f>, <&dmac0 0x30>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x2f>, <&dmac0 0x30>,
+		       <&dmac1 0x2f>, <&dmac1 0x30>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7793_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -737,8 +757,9 @@
 		clocks =3D <&mstp7_clks R8A7793_CLK_SCIF4>, <&zs_clk>,
 			 <&scif_clk>;
 		clock-names =3D "fck", "brg_int", "scif_clk";
-		dmas =3D <&dmac0 0xfb>, <&dmac0 0xfc>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0xfb>, <&dmac0 0xfc>,
+		       <&dmac1 0xfb>, <&dmac1 0xfc>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7793_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -751,8 +772,9 @@
 		clocks =3D <&mstp7_clks R8A7793_CLK_SCIF5>, <&zs_clk>,
 			 <&scif_clk>;
 		clock-names =3D "fck", "brg_int", "scif_clk";
-		dmas =3D <&dmac0 0xfd>, <&dmac0 0xfe>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0xfd>, <&dmac0 0xfe>,
+		       <&dmac1 0xfd>, <&dmac1 0xfe>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7793_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -765,8 +787,9 @@
 		clocks =3D <&mstp7_clks R8A7793_CLK_HSCIF0>, <&zs_clk>,
 			 <&scif_clk>;
 		clock-names =3D "fck", "brg_int", "scif_clk";
-		dmas =3D <&dmac0 0x39>, <&dmac0 0x3a>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x39>, <&dmac0 0x3a>,
+		       <&dmac1 0x39>, <&dmac1 0x3a>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7793_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -779,8 +802,9 @@
 		clocks =3D <&mstp7_clks R8A7793_CLK_HSCIF1>, <&zs_clk>,
 			 <&scif_clk>;
 		clock-names =3D "fck", "brg_int", "scif_clk";
-		dmas =3D <&dmac0 0x4d>, <&dmac0 0x4e>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x4d>, <&dmac0 0x4e>,
+		       <&dmac1 0x4d>, <&dmac1 0x4e>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7793_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -793,8 +817,9 @@
 		clocks =3D <&mstp7_clks R8A7793_CLK_HSCIF2>, <&zs_clk>,
 			 <&scif_clk>;
 		clock-names =3D "fck", "brg_int", "scif_clk";
-		dmas =3D <&dmac0 0x3b>, <&dmac0 0x3c>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x3b>, <&dmac0 0x3c>,
+		       <&dmac1 0x3b>, <&dmac1 0x3c>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7793_PD_ALWAYS_ON>;
 		status =3D "disabled";
 	};
@@ -816,8 +841,9 @@
 		reg =3D <0 0xe6b10000 0 0x2c>;
 		interrupts =3D <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp9_clks R8A7793_CLK_QSPI_MOD>;
-		dmas =3D <&dmac0 0x17>, <&dmac0 0x18>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x17>, <&dmac0 0x18>,
+		       <&dmac1 0x17>, <&dmac1 0x18>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&sysc R8A7793_PD_ALWAYS_ON>;
 		num-cs =3D <1>;
 		#address-cells =3D <1>;
--=20
2.8.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
