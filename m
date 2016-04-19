From: Stuart Yoder <stuart.yoder@nxp.com>
Subject: [PATCH 2/2 v3] arm64: dts: ls2080a: fsl-mc dt node updates
Date: Tue, 19 Apr 2016 16:53:17 -0500
Message-ID: <1461102797-30632-1-git-send-email-stuart.yoder@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: leoyang.li@nxp.com, robh+dt@kernel.org, german.rivera@freescale.com, linux-kernel@vger.kernel.org, shawnguo@kernel.org, Stuart Yoder <stuart.yoder@nxp.com>
List-Id: devicetree@vger.kernel.org

updates to the fsl-mc node for full functionality:
   -msi-parent is needed for interrupt support
   -ranges is needed to enable the bus driver to translate bus addresses
   -dpmac nodes provide a basis for relating dpmac objects to PHYs

Signed-off-by: Stuart Yoder <stuart.yoder@nxp.com>
---
-v3
   -updated unit addresses to be hex to match the reg properties.

 arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi | 98 ++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
index 9d746c6..0f21caf 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
@@ -265,6 +265,104 @@
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
+			};
 		};
 
 		smmu: iommu@5000000 {
-- 
1.9.0
