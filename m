From: Jacky Bai <ping.bai@nxp.com>
Subject: [PATCH 3/3] arm64: dts: freescale: Add power domain nodes for i.mx8mm
Date: Wed, 17 Apr 2019 05:27:40 +0000
Message-ID: <20190417053211.2195-4-ping.bai@nxp.com>
References: <20190417053211.2195-1-ping.bai@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190417053211.2195-1-ping.bai@nxp.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Aisheng Dong <aisheng.dong@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Add the power domain nodes for i.MX8MM.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 103 ++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index de3498c2dd44..49af5181e17f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -149,6 +149,109 @@
 		interrupt-affinity = <&A53_0>, <&A53_1>, <&A53_2>, <&A53_3>;
 	};
 
+	power-domains {
+		compatible = "simple-bus";
+		/* HSIO SS */
+		hsiomix_pd: hsiomix-pd {
+			compatible = "fsl,imx8m-pm-domain";
+			#power-domain-cells = <0>;
+			domain-index = <0>;
+			domain-name = "hsiomix";
+			clocks = <&clk IMX8MM_CLK_USB1_CTRL_ROOT>;
+		};
+
+		pcie_pd: pcie-pd {
+			compatible = "fsl,imx8m-pm-domain";
+			#power-domain-cells = <0>;
+			domain-index = <1>;
+			domain-name = "pcie";
+			parent-domains = <&hsiomix_pd>;
+		};
+
+		usb_otg1_pd: usbotg1-pd {
+			compatible = "fsl,imx8m-pm-domain";
+			#power-domain-cells = <0>;
+			domain-index = <2>;
+			domain-name = "usb_otg1";
+			parent-domains = <&hsiomix_pd>;
+		};
+
+		usb_otg2_pd: usbotg2-pd {
+			compatible = "fsl,imx8m-pm-domain";
+			#power-domain-cells = <0>;
+			domain-index = <3>;
+			domain-name = "usb_otg2";
+			parent-domains = <&hsiomix_pd>;
+		};
+
+		/* GPU SS */
+		gpumix_pd: gpumix-pd {
+			compatible = "fsl,imx8m-pm-domain";
+			#power-domain-cells = <0>;
+			domain-index = <4>;
+			domain-name = "gpumix";
+			clocks = <&clk IMX8MM_CLK_GPU_BUS_ROOT>,
+				 <&clk IMX8MM_CLK_GPU_AHB>,
+				 <&clk IMX8MM_CLK_GPU2D_ROOT>,
+				 <&clk IMX8MM_CLK_GPU3D_ROOT>;
+		};
+
+		/* VPU SS */
+		vpumix_pd: vpumix-pd {
+			compatible = "fsl,imx8m-pm-domain";
+			#power-domain-cells = <0>;
+			domain-index = <5>;
+			domain-name = "vpumix";
+			clocks = <&clk IMX8MM_CLK_VPU_DEC_ROOT>;
+		};
+
+		vpu_g1_pd: vpug1-pd {
+			compatible = "fsl,imx8m-pm-domain";
+			#power-domain-cells = <0>;
+			domain-index = <6>;
+			domain-name = "vpu_g1";
+			parent-domains = <&vpumix_pd>;
+			clocks = <&clk IMX8MM_CLK_VPU_G1_ROOT>;
+		};
+
+		vpu_g2_pd: vpug2-pd {
+			compatible = "fsl,imx8m-pm-domain";
+			#power-domain-cells = <0>;
+			domain-index = <7>;
+			domain-name = "vpu_g2";
+			parent-domains = <&vpumix_pd>;
+			clocks = <&clk IMX8MM_CLK_VPU_G2_ROOT>;
+		};
+
+		vpu_h1_pd: vpuh1-pd {
+			compatible = "fsl,imx8m-pm-domain";
+			#power-domain-cells = <0>;
+			domain-index = <8>;
+			domain-name = "vpu_h1";
+			parent-domains = <&vpumix_pd>;
+			clocks = <&clk IMX8MM_CLK_VPU_H1_ROOT>;
+		};
+
+		/* DISP SS */
+		dispmix_pd: dispmix-pd {
+			compatible = "fsl,imx8m-pm-domain";
+			#power-domain-cells = <0>;
+			domain-index = <9>;
+			domain-name = "dispmix";
+			clocks = <&clk IMX8MM_CLK_DISP_ROOT>,
+				 <&clk IMX8MM_CLK_DISP_AXI_ROOT>,
+				 <&clk IMX8MM_CLK_DISP_APB_ROOT>;
+		};
+
+		mipi_pd: mipi-pd {
+			compatible = "fsl,imx8m-pm-domain";
+			#power-domain-cells = <0>;
+			domain-index = <10>;
+			domain-name = "mipi";
+			parent-domains = <&dispmix_pd>;
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>, /* Physical Secure */
-- 
2.21.0
