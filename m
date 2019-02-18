From: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: [PATCH 5/6] arm64: dts: freescale: lx2160a: add pcie EP mode DT nodes
Date: Mon, 18 Feb 2019 17:46:42 +0800
Message-ID: <20190218094643.2692-5-xiaowei.bao@nxp.com>
References: <20190218094643.2692-1-xiaowei.bao@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190218094643.2692-1-xiaowei.bao@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bhelgaas@google.com, Zhiqiang.Hou@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, leoyang.li@nxp.com, kishon@ti.com, lorenzo.pieralisi@arm.com, gregkh@linuxfoundation.org, l.subrahmanya@mobiveil.co.in, arnd@arndb.de, Minghuan.Lian@nxp.com, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Xiaowei Bao <xiaowei.bao@nxp.com>
List-Id: devicetree@vger.kernel.org

The LX2160A PCIe EP mode node.

Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
---
depends on: http://patchwork.ozlabs.org/project/linux-pci/list/?series=88754

 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi |   56 ++++++++++++++++++++++++
 1 files changed, 56 insertions(+), 0 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
index 3a64f6e..5fee592 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
@@ -923,6 +923,15 @@
 			status = "disabled";
 		};
 
+		pcie_ep@3400000 {
+			compatible = "fsl,lx2160a-pcie-ep";
+			reg = <0x00 0x03400000 0x0 0x00100000
+			       0x80 0x00000000 0x8 0x00000000>;
+			reg-names = "regs", "addr_space";
+			num-ob-windows = <256>;
+			status = "disabled";
+		};
+
 		pcie@3500000 {
 			compatible = "fsl,lx2160a-pcie";
 			reg = <0x00 0x03500000 0x0 0x00100000   /* controller registers */
@@ -950,6 +959,15 @@
 			status = "disabled";
 		};
 
+		pcie_ep@3500000 {
+			compatible = "fsl,lx2160a-pcie-ep";
+			reg = <0x00 0x03500000 0x0 0x00100000
+			       0x88 0x00000000 0x8 0x00000000>;
+			reg-names = "regs", "addr_space";
+			num-ob-windows = <256>;
+			status = "disabled";
+		};
+
 		pcie@3600000 {
 			compatible = "fsl,lx2160a-pcie";
 			reg = <0x00 0x03600000 0x0 0x00100000   /* controller registers */
@@ -977,6 +995,16 @@
 			status = "disabled";
 		};
 
+		pcie_ep@3600000 {
+			compatible = "fsl,lx2160a-pcie-ep";
+			reg = <0x00 0x03600000 0x0 0x00100000
+			       0x90 0x00000000 0x8 0x00000000>;
+			reg-names = "regs", "addr_space";
+			num-ob-windows = <256>;
+			max-functions = <2>;
+			status = "disabled";
+		};
+
 		pcie@3700000 {
 			compatible = "fsl,lx2160a-pcie";
 			reg = <0x00 0x03700000 0x0 0x00100000   /* controller registers */
@@ -1004,6 +1032,15 @@
 			status = "disabled";
 		};
 
+		pcie_ep@3700000 {
+			compatible = "fsl,lx2160a-pcie-ep";
+			reg = <0x00 0x03700000 0x0 0x00100000
+			       0x98 0x00000000 0x8 0x00000000>;
+			reg-names = "regs", "addr_space";
+			num-ob-windows = <256>;
+			status = "disabled";
+		};
+
 		pcie@3800000 {
 			compatible = "fsl,lx2160a-pcie";
 			reg = <0x00 0x03800000 0x0 0x00100000   /* controller registers */
@@ -1031,6 +1068,16 @@
 			status = "disabled";
 		};
 
+		pcie_ep@3800000 {
+			compatible = "fsl,lx2160a-pcie-ep";
+			reg = <0x00 0x03800000 0x0 0x00100000
+			       0xa0 0x00000000 0x8 0x00000000>;
+			reg-names = "regs", "addr_space";
+			num-ob-windows = <256>;
+			max-functions = <2>;
+			status = "disabled";
+		};
+
 		pcie@3900000 {
 			compatible = "fsl,lx2160a-pcie";
 			reg = <0x00 0x03900000 0x0 0x00100000   /* controller registers */
@@ -1058,5 +1105,14 @@
 			status = "disabled";
 		};
 
+		pcie_ep@3900000 {
+			compatible = "fsl,lx2160a-pcie-ep";
+			reg = <0x00 0x03900000 0x0 0x00100000
+			       0xa8 0x00000000 0x8 0x00000000>;
+			reg-names = "regs", "addr_space";
+			num-ob-windows = <256>;
+			status = "disabled";
+		};
+
 	};
 };
-- 
1.7.1
