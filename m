From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Subject: [PATCHv3 2/5] arm64: dts: layerscape: add num-viewport property for
 PCIe DT nodes
Date: Tue, 18 Dec 2018 04:19:32 +0000
Message-ID: <20181218041956.41809-3-Zhiqiang.Hou@nxp.com>
References: <20181218041956.41809-1-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181218041956.41809-1-Zhiqiang.Hou@nxp.com>
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
To: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>, Leo Li <leoyang.li@nxp.com>
Cc: Roy Zang <roy.zang@nxp.com>, "Z.q. Hou" <zhiqiang.hou@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>

Add num-viewport property for PCIe DT nodes to specify how many
viewports are implemented.

Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
---
V3:
 - New patch 

 arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi | 1 +
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 3 +++
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 3 +++
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 3 +++
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi | 4 ++++
 5 files changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
index 21f2b3ba6b58..7ce0aa52292c 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
@@ -486,6 +486,7 @@
 			#size-cells = <2>;
 			device_type = "pci";
 			num-lanes = <4>;
+			num-viewport = <2>;
 			bus-range = <0x0 0xff>;
 			ranges = <0x81000000 0x0 0x00000000 0x40 0x00010000 0x0 0x00010000   /* downstream I/O */
 				  0x82000000 0x0 0x40000000 0x40 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
index 760d510d78de..f42368afeea9 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
@@ -673,6 +673,7 @@
 			device_type = "pci";
 			dma-coherent;
 			num-lanes = <4>;
+			num-viewport = <6>;
 			bus-range = <0x0 0xff>;
 			ranges = <0x81000000 0x0 0x00000000 0x40 0x00010000 0x0 0x00010000   /* downstream I/O */
 				  0x82000000 0x0 0x40000000 0x40 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
@@ -699,6 +700,7 @@
 			device_type = "pci";
 			dma-coherent;
 			num-lanes = <2>;
+			num-viewport = <6>;
 			bus-range = <0x0 0xff>;
 			ranges = <0x81000000 0x0 0x00000000 0x48 0x00010000 0x0 0x00010000   /* downstream I/O */
 				  0x82000000 0x0 0x40000000 0x48 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
@@ -725,6 +727,7 @@
 			device_type = "pci";
 			dma-coherent;
 			num-lanes = <2>;
+			num-viewport = <6>;
 			bus-range = <0x0 0xff>;
 			ranges = <0x81000000 0x0 0x00000000 0x50 0x00010000 0x0 0x00010000   /* downstream I/O */
 				  0x82000000 0x0 0x40000000 0x50 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
index 64d334c6b0b4..10be89168793 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -642,6 +642,7 @@
 			device_type = "pci";
 			dma-coherent;
 			num-lanes = <4>;
+			num-viewport = <8>;
 			bus-range = <0x0 0xff>;
 			ranges = <0x81000000 0x0 0x00000000 0x40 0x00010000 0x0 0x00010000   /* downstream I/O */
 				  0x82000000 0x0 0x40000000 0x40 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
@@ -668,6 +669,7 @@
 			device_type = "pci";
 			dma-coherent;
 			num-lanes = <2>;
+			num-viewport = <8>;
 			bus-range = <0x0 0xff>;
 			ranges = <0x81000000 0x0 0x00000000 0x48 0x00010000 0x0 0x00010000   /* downstream I/O */
 				  0x82000000 0x0 0x40000000 0x48 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
@@ -694,6 +696,7 @@
 			device_type = "pci";
 			dma-coherent;
 			num-lanes = <2>;
+			num-viewport = <8>;
 			bus-range = <0x0 0xff>;
 			ranges = <0x81000000 0x0 0x00000000 0x50 0x00010000 0x0 0x00010000   /* downstream I/O */
 				  0x82000000 0x0 0x40000000 0x50 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
index 9deb9cb83046..7d303bd40047 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
@@ -523,6 +523,7 @@
 			device_type = "pci";
 			dma-coherent;
 			num-lanes = <4>;
+			num-viewport = <256>;
 			bus-range = <0x0 0xff>;
 			ranges = <0x81000000 0x0 0x00000000 0x20 0x00010000 0x0 0x00010000   /* downstream I/O */
 				  0x82000000 0x0 0x40000000 0x20 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
@@ -548,6 +549,7 @@
 			device_type = "pci";
 			dma-coherent;
 			num-lanes = <4>;
+			num-viewport = <6>;
 			bus-range = <0x0 0xff>;
 			ranges = <0x81000000 0x0 0x00000000 0x28 0x00010000 0x0 0x00010000   /* downstream I/O */
 				  0x82000000 0x0 0x40000000 0x28 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
@@ -573,6 +575,7 @@
 			device_type = "pci";
 			dma-coherent;
 			num-lanes = <8>;
+			num-viewport = <6>;
 			bus-range = <0x0 0xff>;
 			ranges = <0x81000000 0x0 0x00000000 0x30 0x00010000 0x0 0x00010000   /* downstream I/O */
 				  0x82000000 0x0 0x40000000 0x30 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
index 5732e3b48be7..4bb9aa2dd8b2 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
@@ -640,6 +640,7 @@
 			device_type = "pci";
 			dma-coherent;
 			num-lanes = <4>;
+			num-viewport = <6>;
 			bus-range = <0x0 0xff>;
 			msi-parent = <&its>;
 			#interrupt-cells = <1>;
@@ -662,6 +663,7 @@
 			device_type = "pci";
 			dma-coherent;
 			num-lanes = <4>;
+			num-viewport = <6>;
 			bus-range = <0x0 0xff>;
 			msi-parent = <&its>;
 			#interrupt-cells = <1>;
@@ -684,6 +686,7 @@
 			device_type = "pci";
 			dma-coherent;
 			num-lanes = <8>;
+			num-viewport = <256>;
 			bus-range = <0x0 0xff>;
 			msi-parent = <&its>;
 			#interrupt-cells = <1>;
@@ -706,6 +709,7 @@
 			device_type = "pci";
 			dma-coherent;
 			num-lanes = <4>;
+			num-viewport = <6>;
 			bus-range = <0x0 0xff>;
 			msi-parent = <&its>;
 			#interrupt-cells = <1>;
-- 
2.17.1
