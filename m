Return-Path: <SRS0=jObF=U7=nxp.com=ping.bai@kernel.org>
From: Jacky Bai <ping.bai@nxp.com>
Subject: [RESEND PATCH 3/3] arm64: dts: freescale: Add power domain nodes for
 i.mx8mm
Date: Tue, 2 Jul 2019 10:03:52 +0000
Message-ID: <20190702100832.29718-4-ping.bai@nxp.com>
References: <20190702100832.29718-1-ping.bai@nxp.com>
In-Reply-To: <20190702100832.29718-1-ping.bai@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <59EEF88A35FB0041A690F06EAA9D1AA4@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, Leonard Crestez <leonard.crestez@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

Add the power domain nodes for i.MX8MM.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 103 ++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dt=
s/freescale/imx8mm.dtsi
index 232a7412755a..850ca6a7ac66 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -181,6 +181,109 @@
 		interrupt-affinity =3D <&A53_0>, <&A53_1>, <&A53_2>, <&A53_3>;
 	};
=20
+	power-domains {
+		compatible =3D "simple-bus";
+		/* HSIO SS */
+		hsiomix_pd: hsiomix-pd {
+			compatible =3D "fsl,imx8m-pm-domain";
+			#power-domain-cells =3D <0>;
+			domain-index =3D <0>;
+			domain-name =3D "hsiomix";
+			clocks =3D <&clk IMX8MM_CLK_USB1_CTRL_ROOT>;
+		};
+
+		pcie_pd: pcie-pd {
+			compatible =3D "fsl,imx8m-pm-domain";
+			#power-domain-cells =3D <0>;
+			domain-index =3D <1>;
+			domain-name =3D "pcie";
+			parent-domains =3D <&hsiomix_pd>;
+		};
+
+		usb_otg1_pd: usbotg1-pd {
+			compatible =3D "fsl,imx8m-pm-domain";
+			#power-domain-cells =3D <0>;
+			domain-index =3D <2>;
+			domain-name =3D "usb_otg1";
+			parent-domains =3D <&hsiomix_pd>;
+		};
+
+		usb_otg2_pd: usbotg2-pd {
+			compatible =3D "fsl,imx8m-pm-domain";
+			#power-domain-cells =3D <0>;
+			domain-index =3D <3>;
+			domain-name =3D "usb_otg2";
+			parent-domains =3D <&hsiomix_pd>;
+		};
+
+		/* GPU SS */
+		gpumix_pd: gpumix-pd {
+			compatible =3D "fsl,imx8m-pm-domain";
+			#power-domain-cells =3D <0>;
+			domain-index =3D <4>;
+			domain-name =3D "gpumix";
+			clocks =3D <&clk IMX8MM_CLK_GPU_BUS_ROOT>,
+				 <&clk IMX8MM_CLK_GPU_AHB>,
+				 <&clk IMX8MM_CLK_GPU2D_ROOT>,
+				 <&clk IMX8MM_CLK_GPU3D_ROOT>;
+		};
+
+		/* VPU SS */
+		vpumix_pd: vpumix-pd {
+			compatible =3D "fsl,imx8m-pm-domain";
+			#power-domain-cells =3D <0>;
+			domain-index =3D <5>;
+			domain-name =3D "vpumix";
+			clocks =3D <&clk IMX8MM_CLK_VPU_DEC_ROOT>;
+		};
+
+		vpu_g1_pd: vpug1-pd {
+			compatible =3D "fsl,imx8m-pm-domain";
+			#power-domain-cells =3D <0>;
+			domain-index =3D <6>;
+			domain-name =3D "vpu_g1";
+			parent-domains =3D <&vpumix_pd>;
+			clocks =3D <&clk IMX8MM_CLK_VPU_G1_ROOT>;
+		};
+
+		vpu_g2_pd: vpug2-pd {
+			compatible =3D "fsl,imx8m-pm-domain";
+			#power-domain-cells =3D <0>;
+			domain-index =3D <7>;
+			domain-name =3D "vpu_g2";
+			parent-domains =3D <&vpumix_pd>;
+			clocks =3D <&clk IMX8MM_CLK_VPU_G2_ROOT>;
+		};
+
+		vpu_h1_pd: vpuh1-pd {
+			compatible =3D "fsl,imx8m-pm-domain";
+			#power-domain-cells =3D <0>;
+			domain-index =3D <8>;
+			domain-name =3D "vpu_h1";
+			parent-domains =3D <&vpumix_pd>;
+			clocks =3D <&clk IMX8MM_CLK_VPU_H1_ROOT>;
+		};
+
+		/* DISP SS */
+		dispmix_pd: dispmix-pd {
+			compatible =3D "fsl,imx8m-pm-domain";
+			#power-domain-cells =3D <0>;
+			domain-index =3D <9>;
+			domain-name =3D "dispmix";
+			clocks =3D <&clk IMX8MM_CLK_DISP_ROOT>,
+				 <&clk IMX8MM_CLK_DISP_AXI_ROOT>,
+				 <&clk IMX8MM_CLK_DISP_APB_ROOT>;
+		};
+
+		mipi_pd: mipi-pd {
+			compatible =3D "fsl,imx8m-pm-domain";
+			#power-domain-cells =3D <0>;
+			domain-index =3D <10>;
+			domain-name =3D "mipi";
+			parent-domains =3D <&dispmix_pd>;
+		};
+	};
+
 	timer {
 		compatible =3D "arm,armv8-timer";
 		interrupts =3D <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)=
>, /* Physical Secure */
--=20
2.21.0
