From: Ioana Ciocoi Radulescu <ruxandra.radulescu@nxp.com>
Subject: [PATCH 1/2] arm64: dts: lx2160a: Add fsl-mc node
Date: Thu, 20 Dec 2018 17:02:03 +0000
Message-ID: <1545325306-1681-1-git-send-email-ruxandra.radulescu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
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
To: "shawnguo@kernel.org" <shawnguo@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Add the fsl-mc node in the LX2160A device tree.

Signed-off-by: Ioana Radulescu <ruxandra.radulescu@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 117 +++++++++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
index a79f5c1..2366fd6 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
@@ -762,5 +762,122 @@
 				     <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>;
 			dma-coherent;
 		};
+
+		fsl_mc: fsl-mc@80c000000 {
+			compatible = "fsl,qoriq-mc";
+			reg = <0x00000008 0x0c000000 0 0x40>,
+			      <0x00000000 0x08340000 0 0x40000>;
+			msi-parent = <&its>;
+			/* iommu-map property is fixed up by u-boot */
+			iommu-map = <0 &smmu 0 0>;
+			dma-coherent;
+			#address-cells = <3>;
+			#size-cells = <1>;
+
+			/*
+			 * Region type 0x0 - MC portals
+			 * Region type 0x1 - QBMAN portals
+			 */
+			ranges = <0x0 0x0 0x0 0x8 0x0c000000 0x4000000
+				  0x1 0x0 0x0 0x8 0x18000000 0x8000000>;
+
+			/*
+			 * Define the maximum number of MACs present on the SoC.
+			 */
+			dpmacs {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				dpmac1: dpmac@1 {
+					compatible = "fsl,qoriq-mc-dpmac";
+					reg = <0x1>;
+				};
+
+				dpmac2: dpmac@2 {
+					compatible = "fsl,qoriq-mc-dpmac";
+					reg = <0x2>;
+				};
+
+				dpmac3: dpmac@3 {
+					compatible = "fsl,qoriq-mc-dpmac";
+					reg = <0x3>;
+				};
+
+				dpmac4: dpmac@4 {
+					compatible = "fsl,qoriq-mc-dpmac";
+					reg = <0x4>;
+				};
+
+				dpmac5: dpmac@5 {
+					compatible = "fsl,qoriq-mc-dpmac";
+					reg = <0x5>;
+				};
+
+				dpmac6: dpmac@6 {
+					compatible = "fsl,qoriq-mc-dpmac";
+					reg = <0x6>;
+				};
+
+				dpmac7: dpmac@7 {
+					compatible = "fsl,qoriq-mc-dpmac";
+					reg = <0x7>;
+				};
+
+				dpmac8: dpmac@8 {
+					compatible = "fsl,qoriq-mc-dpmac";
+					reg = <0x8>;
+				};
+
+				dpmac9: dpmac@9 {
+					compatible = "fsl,qoriq-mc-dpmac";
+					reg = <0x9>;
+				};
+
+				dpmac10: dpmac@a {
+					compatible = "fsl,qoriq-mc-dpmac";
+					reg = <0xa>;
+				};
+
+				dpmac11: dpmac@b {
+					compatible = "fsl,qoriq-mc-dpmac";
+					reg = <0xb>;
+				};
+
+				dpmac12: dpmac@c {
+					compatible = "fsl,qoriq-mc-dpmac";
+					reg = <0xc>;
+				};
+
+				dpmac13: dpmac@d {
+					compatible = "fsl,qoriq-mc-dpmac";
+					reg = <0xd>;
+				};
+
+				dpmac14: dpmac@e {
+					compatible = "fsl,qoriq-mc-dpmac";
+					reg = <0xe>;
+				};
+
+				dpmac15: dpmac@f {
+					compatible = "fsl,qoriq-mc-dpmac";
+					reg = <0xf>;
+				};
+
+				dpmac16: dpmac@10 {
+					compatible = "fsl,qoriq-mc-dpmac";
+					reg = <0x10>;
+				};
+
+				dpmac17: dpmac@11 {
+					compatible = "fsl,qoriq-mc-dpmac";
+					reg = <0x11>;
+				};
+
+				dpmac18: dpmac@12 {
+					compatible = "fsl,qoriq-mc-dpmac";
+					reg = <0x12>;
+				};
+			};
+		};
 	};
 };
-- 
2.7.4
