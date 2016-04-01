From: Stuart Yoder <stuart.yoder@nxp.com>
Subject: [PATCH 2/2] arm64: dts: ls2080a: fsl-mc dt node updates
Date: Fri, 1 Apr 2016 15:54:40 -0500
Message-ID: <1459544080-28598-1-git-send-email-stuart.yoder@nxp.com>
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
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, german.rivera@freescale.com, linux-kernel@vger.kernel.org, Stuart Yoder <stuart.yoder@nxp.com>, robh+dt@kernel.org, leoyang.li@nxp.com
List-Id: devicetree@vger.kernel.org

From: Stuart Yoder <stuart.yoder@nxp.com>

updates to the fsl-mc node for full functionality:
   -msi-parent is needed for interrupt support
   -ranges is needed to enable the bus driver to translate bus addresses
   -dpmac nodes provide a basis for relating dpmac objects to PHYs

Signed-off-by: Stuart Yoder <stuart.yoder@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi |   87 ++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
index 9d746c6..449c635 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
@@ -265,6 +265,93 @@
 			compatible = "fsl,qoriq-mc";
 			reg = <0x00000008 0x0c000000 0 0x40>,	 /* MC portal base */
 			      <0x00000000 0x08340000 0 0x40000>; /* MC control reg */
+			msi-parent = <&its>;
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
+			 * They won't necessarily be all probed, since the
+			 * Data Path Layout file and the MC firmware can put
+			 * fewer actual DPMAC objects on the MC bus.
+			 */
+			dpmacs {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				dpmac1: dpmac@1 {
+					compatible = "fsl,qoriq-mc-dpmac";
+					reg = <1>;
+				};
+				dpmac2: dpmac@2 {
+					compatible = "fsl,qoriq-mc-dpmac";
+					reg = <2>;
+				};
+				dpmac3: dpmac@3 {
+					compatible = "fsl,qoriq-mc-dpmac";
+					reg = <3>;
+				};
+				dpmac4: dpmac@4 {
+					compatible = "fsl,qoriq-mc-dpmac";
+					reg = <4>;
+				};
+				dpmac5: dpmac@5 {
+					compatible = "fsl,qoriq-mc-dpmac";
+					reg = <5>;
+				};
+				dpmac6: dpmac@6 {
+					compatible = "fsl,qoriq-mc-dpmac";
+					reg = <6>;
+				};
+				dpmac7: dpmac@7 {
+					compatible = "fsl,qoriq-mc-dpmac";
+					reg = <7>;
+				};
+				dpmac8: dpmac@8 {
+					compatible = "fsl,qoriq-mc-dpmac";
+					reg = <8>;
+				};
+				dpmac9: dpmac@9 {
+					compatible = "fsl,qoriq-mc-dpmac";
+					reg = <9>;
+				};
+				dpmac10: dpmac@10 {
+					compatible = "fsl,qoriq-mc-dpmac";
+					reg = <0xa>;
+				};
+				dpmac11: dpmac@11 {
+					compatible = "fsl,qoriq-mc-dpmac";
+					reg = <0xb>;
+				};
+				dpmac12: dpmac@12 {
+					compatible = "fsl,qoriq-mc-dpmac";
+					reg = <0xc>;
+				};
+				dpmac13: dpmac@13 {
+					compatible = "fsl,qoriq-mc-dpmac";
+					reg = <0xd>;
+				};
+				dpmac14: dpmac@14 {
+					compatible = "fsl,qoriq-mc-dpmac";
+					reg = <0xe>;
+				};
+				dpmac15: dpmac@15 {
+					compatible = "fsl,qoriq-mc-dpmac";
+					reg = <0xf>;
+				};
+				dpmac16: dpmac@16 {
+					compatible = "fsl,qoriq-mc-dpmac";
+					reg = <0x10>;
+				};
+			};
+
 		};
 
 		smmu: iommu@5000000 {
-- 
1.7.9.5
