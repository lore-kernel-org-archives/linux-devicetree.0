From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: [PATCH 13/14] arm64: dts: imx: add imx8qm common dts file
Date: Thu, 21 Feb 2019 18:25:43 +0000
Message-ID: <1550773093-13349-14-git-send-email-aisheng.dong@nxp.com>
References: <1550773093-13349-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1550773093-13349-1-git-send-email-aisheng.dong@nxp.com>
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
To: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, Mark Rutland <mark.rutland@arm.com>, "dongas86@gmail.com" <dongas86@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>
List-Id: devicetree@vger.kernel.org

The i.MX8QuadMax is a Dual (2x) Cortex-A72 and Quad (4x) Cortex-A53
proccessor with powerful graphic and multimedia features. It uses
the same architecture as MX8QXP, so many SS can be reused.
This patch adds i.MX8QuadMax SoC dtsi file.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm.dtsi | 173 ++++++++++++++++++++++++++++++
 1 file changed, 173 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
new file mode 100644
index 0000000..526cbbd
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
@@ -0,0 +1,173 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2018-2019 NXP
+ *	Dong Aisheng <aisheng.dong@nxp.com>
+ */
+
+#include <dt-bindings/firmware/imx/rsrc.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/pinctrl/pads-imx8qm.h>
+
+/ {
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		mmc0 = &usdhc1;
+		mmc1 = &usdhc2;
+		mmc2 = &usdhc3;
+		serial0 = &dma_lpuart0;
+	};
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&A53_0>;
+				};
+				core1 {
+					cpu = <&A53_1>;
+				};
+				core2 {
+					cpu = <&A53_2>;
+				};
+				core3 {
+					cpu = <&A53_3>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&A72_0>;
+				};
+				core1 {
+					cpu = <&A72_1>;
+				};
+			};
+		};
+
+		A53_0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53", "arm,armv8";
+			reg = <0x0 0x0>;
+			enable-method = "psci";
+			next-level-cache = <&A53_L2>;
+		};
+
+		A53_1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53", "arm,armv8";
+			reg = <0x0 0x1>;
+			enable-method = "psci";
+			next-level-cache = <&A53_L2>;
+		};
+
+		A53_2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53", "arm,armv8";
+			reg = <0x0 0x2>;
+			enable-method = "psci";
+			next-level-cache = <&A53_L2>;
+		};
+
+		A53_3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53", "arm,armv8";
+			reg = <0x0 0x3>;
+			enable-method = "psci";
+			next-level-cache = <&A53_L2>;
+		};
+
+		A72_0: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a72", "arm,armv8";
+			reg = <0x0 0x100>;
+			enable-method = "psci";
+			next-level-cache = <&A72_L2>;
+		};
+
+		A72_1: cpu@101 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a72", "arm,armv8";
+			reg = <0x0 0x101>;
+			enable-method = "psci";
+			next-level-cache = <&A72_L2>;
+		};
+
+		A53_L2: l2-cache0 {
+			compatible = "cache";
+		};
+
+		A72_L2: l2-cache1 {
+			compatible = "cache";
+		};
+	};
+
+	gic: interrupt-controller@51a00000 {
+		compatible = "arm,gic-v3";
+		reg = <0x0 0x51a00000 0 0x10000>, /* GIC Dist */
+		      <0x0 0x51b00000 0 0xC0000>, /* GICR */
+		      <0x0 0x52000000 0 0x2000>,  /* GICC */
+		      <0x0 0x52010000 0 0x1000>,  /* GICH */
+		      <0x0 0x52020000 0 0x20000>; /* GICV */
+		#interrupt-cells = <3>;
+		interrupt-controller;
+		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-parent = <&gic>;
+	};
+
+	pmu {
+		compatible = "arm,armv8-pmuv3";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>, /* Physical Secure */
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>, /* Physical Non-Secure */
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>, /* Virtual */
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>; /* Hypervisor */
+	};
+
+	scu {
+		compatible = "fsl,imx-scu";
+		mbox-names = "tx0", "tx1", "tx2", "tx3",
+			     "rx0", "rx1", "rx2", "rx3";
+		mboxes = <&lsio_mu1 0 0
+			  &lsio_mu1 0 1
+			  &lsio_mu1 0 2
+			  &lsio_mu1 0 3
+			  &lsio_mu1 1 0
+			  &lsio_mu1 1 1
+			  &lsio_mu1 1 2
+			  &lsio_mu1 1 3>;
+
+		iomuxc: pinctrl {
+			compatible = "fsl,imx8qm-iomuxc";
+		};
+
+		pd: imx8qx-pd {
+			compatible = "fsl,imx8qm-scu-pd", "fsl,scu-pd";
+			#power-domain-cells = <1>;
+		};
+	};
+
+	/* sorted in register address */
+	#include "imx8-ss-dma.dtsi"
+	#include "imx8-ss-conn.dtsi"
+	#include "imx8-ss-lsio.dtsi"
+};
+
+#include "imx8qm-ss-dma.dtsi"
+#include "imx8qm-ss-conn.dtsi"
+#include "imx8qm-ss-lsio.dtsi"
-- 
2.7.4
