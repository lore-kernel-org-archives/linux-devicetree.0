From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: [PATCH 2/3] arm64: dts: imx8m: Add ddr-pmu nodes
Date: Thu,  4 Jul 2019 11:53:21 +0300
Message-ID: <b8aeb9caf6c2380a7c8f65b19e420e18498d5c1a.1562230183.git.leonard.crestez@nxp.com>
References: <cover.1562230183.git.leonard.crestez@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1562230183.git.leonard.crestez@nxp.com>
In-Reply-To: <cover.1562230183.git.leonard.crestez@nxp.com>
References: <cover.1562230183.git.leonard.crestez@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>, Will Deacon <will@kernel.org>, Frank Li <Frank.li@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, devicetree@vger.kernel.org, Andrey Smirnov <andrew.smirnov@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-imx@nxp.com, kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The same ddr perfomance counter IP from 8qxp is also available on imx8m
series so add it to dts.

Tested with `perf stat` and `memtester` on imx8mm-evk and obtained
plausible results.

Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 7 +++++++
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 232a7412755a..9a8d8cd21ef0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -816,7 +816,14 @@
 			      <0x38880000 0xc0000>; /* GICR (RD_base + SGI_base) */
 			#interrupt-cells = <3>;
 			interrupt-controller;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 		};
+
+		ddr-pmu@3d800000 {
+			compatible = "fsl,imx8mm-ddr-pmu", "fsl,imx8m-ddr-pmu";
+			reg = <0x3d800000 0x400000>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+		};
 	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index d09b808eff87..fb0fdee5f889 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -1031,7 +1031,14 @@
 			#interrupt-cells = <3>;
 			interrupt-controller;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-parent = <&gic>;
 		};
+
+		ddr-pmu@3d800000 {
+			compatible = "fsl,imx8mq-ddr-pmu", "fsl,imx8m-ddr-pmu";
+			reg = <0x3d800000 0x400000>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+		};
 	};
 };
-- 
2.17.1
