From: Minghuan Lian <Minghuan.Lian@nxp.com>
Subject: [PATCH 2/6] arm: dts: ls1021a: update MSI node
Date: Tue, 25 Oct 2016 20:35:41 +0800
Message-ID: <1477398945-22774-2-git-send-email-Minghuan.Lian@nxp.com>
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
2. Move two MSI dts node into the parent node "msi-controller".
So a PCIe device can request the MSI from the two MSI controllers.

Signed-off-by: Minghuan Lian <Minghuan.Lian@nxp.com>
---
 arch/arm/boot/dts/ls1021a.dtsi | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
index 368e219..7a3b510 100644
--- a/arch/arm/boot/dts/ls1021a.dtsi
+++ b/arch/arm/boot/dts/ls1021a.dtsi
@@ -119,18 +119,22 @@
 
 		};
 
-		msi1: msi-controller@1570e00 {
-			compatible = "fsl,1s1021a-msi";
-			reg = <0x0 0x1570e00 0x0 0x8>;
+		msi: msi-controller {
+			compatible = "fsl,ls-scfg-msi";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
 			msi-controller;
-			interrupts =  <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH>;
-		};
 
-		msi2: msi-controller@1570e08 {
-			compatible = "fsl,1s1021a-msi";
-			reg = <0x0 0x1570e08 0x0 0x8>;
-			msi-controller;
-			interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
+			msi0@1570e00 {
+				reg = <0x0 0x1570e00 0x0 0x8>;
+				interrupts = <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			msi1@1570e08 {
+				reg = <0x0 0x1570e08 0x0 0x8>;
+				interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
+			};
 		};
 
 		ifc: ifc@1530000 {
@@ -643,7 +647,7 @@
 			bus-range = <0x0 0xff>;
 			ranges = <0x81000000 0x0 0x00000000 0x40 0x00010000 0x0 0x00010000   /* downstream I/O */
 				  0x82000000 0x0 0x40000000 0x40 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
-			msi-parent = <&msi1>;
+			msi-parent = <&msi>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
 			interrupt-map = <0000 0 0 1 &gic GIC_SPI 91  IRQ_TYPE_LEVEL_HIGH>,
@@ -666,7 +670,7 @@
 			bus-range = <0x0 0xff>;
 			ranges = <0x81000000 0x0 0x00000000 0x48 0x00010000 0x0 0x00010000   /* downstream I/O */
 				  0x82000000 0x0 0x40000000 0x48 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
-			msi-parent = <&msi2>;
+			msi-parent = <&msi>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
 			interrupt-map = <0000 0 0 1 &gic GIC_SPI 92  IRQ_TYPE_LEVEL_HIGH>,
-- 
1.9.1
