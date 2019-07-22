From: Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: [PATCH v3] arm64: dts: add the console node for DPAA2 platforms
Date: Mon, 22 Jul 2019 13:30:43 +0300
Message-ID: <1563791443-26372-1-git-send-email-ioana.ciornei@nxp.com>
Reply-To: ioana.ciornei@nxp.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>, leoyang.li@nxp.com
List-Id: devicetree@vger.kernel.org

Add the console device tree node for the following
DPAA2 based platforms: LS1088A, LS2080A, LS2088A and LX2160A.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v3:
 - sort the node by unit address

Changes in v2:
 - use a generic node name
 - remove leading zeros and 0x from the unit-address

 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 5 +++++
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi | 5 +++++
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 5 +++++
 3 files changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
index dacd8cf03a7f..20f5ebd74200 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
@@ -609,6 +609,11 @@
 				     <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		console@8340020 {
+			compatible = "fsl,dpaa2-console";
+			reg = <0x00000000 0x08340020 0 0x2>;
+		};
+
 		ptp-timer@8b95000 {
 			compatible = "fsl,dpaa2-ptp";
 			reg = <0x0 0x8b95000 0x0 0x100>;
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
index 3ace91945b72..64101c9962ce 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
@@ -321,6 +321,11 @@
 			};
 		};
 
+		console@8340020 {
+			compatible = "fsl,dpaa2-console";
+			reg = <0x00000000 0x08340020 0 0x2>;
+		};
+
 		ptp-timer@8b95000 {
 			compatible = "fsl,dpaa2-ptp";
 			reg = <0x0 0x8b95000 0x0 0x100>;
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
index e6fdba39453c..4720a8e7304c 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
@@ -848,6 +848,11 @@
 			dma-coherent;
 		};
 
+		console@8340020 {
+			compatible = "fsl,dpaa2-console";
+			reg = <0x00000000 0x08340020 0 0x2>;
+		};
+
 		ptp-timer@8b95000 {
 			compatible = "fsl,dpaa2-ptp";
 			reg = <0x0 0x8b95000 0x0 0x100>;
-- 
1.9.1
