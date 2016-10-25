From: Minghuan Lian <Minghuan.Lian@nxp.com>
Subject: [PATCH 3/6] arm64: dts: ls1043a: update MSI and PCIe node
Date: Tue, 25 Oct 2016 20:35:42 +0800
Message-ID: <1477398945-22774-3-git-send-email-Minghuan.Lian@nxp.com>
References: <1477398945-22774-1-git-send-email-Minghuan.Lian@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1477398945-22774-1-git-send-email-Minghuan.Lian@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Marc Zyngier <marc.zyngier@arm.com>, Stuart Yoder <stuart.yoder@nxp.com>, Yang-Leo Li <leoyang.li@nxp.com>, Minghuan Lian <Minghuan.Lian@nxp.com>, Scott Wood <scott.wood@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Mingkai Hu <mingkai.hu@nxp.com>
List-Id: devicetree@vger.kernel.org

1. Change compatible to "fsl,ls-scfg-msi"
2. Move three MSI dts node into the parent node "msi-controller".
So a PCIe device can request the MSI from the three MSI controllers.
3. The rev1.1 of LS1043a moves PCIe INTB/C/D interrupts to MSI controller.

Signed-off-by: Minghuan Lian <Minghuan.Lian@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 64 +++++++++++++-------------
 1 file changed, 33 insertions(+), 31 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
index 41e5dc1..5295bb9 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
@@ -587,25 +587,36 @@
 			dma-coherent;
 		};
 
-		msi1: msi-controller1@1571000 {
-			compatible = "fsl,1s1043a-msi";
-			reg = <0x0 0x1571000 0x0 0x8>;
+		msi: msi-controller {
+			compatible = "fsl,ls-scfg-msi";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
 			msi-controller;
-			interrupts = <0 116 0x4>;
-		};
 
-		msi2: msi-controller2@1572000 {
-			compatible = "fsl,1s1043a-msi";
-			reg = <0x0 0x1572000 0x0 0x8>;
-			msi-controller;
-			interrupts = <0 126 0x4>;
-		};
+			msi0@1571000 {
+				reg = <0x0 0x1571000 0x0 0x1000>;
+				interrupts = <0 116 0x4>,
+					     <0 111 0x4>,
+					     <0 112 0x4>,
+					     <0 113 0x4>;
+			};
 
-		msi3: msi-controller3@1573000 {
-			compatible = "fsl,1s1043a-msi";
-			reg = <0x0 0x1573000 0x0 0x8>;
-			msi-controller;
-			interrupts = <0 160 0x4>;
+			msi1@1572000 {
+				reg = <0x0 0x1572000 0x0 0x1000>;
+				interrupts = <0 126 0x4>,
+					     <0 121 0x4>,
+					     <0 122 0x4>,
+					     <0 123 0x4>;
+			};
+
+			msi2@1573000 {
+				reg = <0x0 0x1573000 0x0 0x1000>;
+				interrupts = <0 160 0x4>,
+					     <0 155 0x4>,
+					     <0 156 0x4>,
+					     <0 157 0x4>;
+			};
 		};
 
 		pcie@3400000 {
@@ -624,13 +635,10 @@
 			bus-range = <0x0 0xff>;
 			ranges = <0x81000000 0x0 0x00000000 0x40 0x00010000 0x0 0x00010000   /* downstream I/O */
 				  0x82000000 0x0 0x40000000 0x40 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
-			msi-parent = <&msi1>;
+			msi-parent = <&msi>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
-			interrupt-map = <0000 0 0 1 &gic 0 110 0x4>,
-					<0000 0 0 2 &gic 0 111 0x4>,
-					<0000 0 0 3 &gic 0 112 0x4>,
-					<0000 0 0 4 &gic 0 113 0x4>;
+			interrupt-map = <0000 0 0 1 &gic 0 110 0x4>;
 		};
 
 		pcie@3500000 {
@@ -649,13 +657,10 @@
 			bus-range = <0x0 0xff>;
 			ranges = <0x81000000 0x0 0x00000000 0x48 0x00010000 0x0 0x00010000   /* downstream I/O */
 				  0x82000000 0x0 0x40000000 0x48 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
-			msi-parent = <&msi2>;
+			msi-parent = <&msi>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
-			interrupt-map = <0000 0 0 1 &gic 0 120  0x4>,
-					<0000 0 0 2 &gic 0 121 0x4>,
-					<0000 0 0 3 &gic 0 122 0x4>,
-					<0000 0 0 4 &gic 0 123 0x4>;
+			interrupt-map = <0000 0 0 1 &gic 0 120  0x4>;
 		};
 
 		pcie@3600000 {
@@ -674,13 +679,10 @@
 			bus-range = <0x0 0xff>;
 			ranges = <0x81000000 0x0 0x00000000 0x50 0x00010000 0x0 0x00010000   /* downstream I/O */
 				  0x82000000 0x0 0x40000000 0x50 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
-			msi-parent = <&msi3>;
+			msi-parent = <&msi>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
-			interrupt-map = <0000 0 0 1 &gic 0 154 0x4>,
-					<0000 0 0 2 &gic 0 155 0x4>,
-					<0000 0 0 3 &gic 0 156 0x4>,
-					<0000 0 0 4 &gic 0 157 0x4>;
+			interrupt-map = <0000 0 0 1 &gic 0 154 0x4>;
 		};
 	};
 
-- 
1.9.1
