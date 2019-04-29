From: Dinh Nguyen <dinguyen@kernel.org>
Subject: [PATCH] ARM: dts: arria10: Add EMAC OCP reset property
Date: Mon, 29 Apr 2019 15:43:14 -0500
Message-ID: <20190429204314.21220-1-dinguyen@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com
Cc: dinguyen@kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the EMAC's OCP reset property on Arria10. The OCP reset bits are
also needed to correctly bring the EMACs out of reset correctly.

Cc: stable@vger.kernel.org
Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 arch/arm/boot/dts/socfpga_arria10.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/socfpga_arria10.dtsi b/arch/arm/boot/dts/socfpga_arria10.dtsi
index ae24599d5829..a6206a0d5763 100644
--- a/arch/arm/boot/dts/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10.dtsi
@@ -431,8 +431,8 @@
 			rx-fifo-depth = <16384>;
 			clocks = <&l4_mp_clk>;
 			clock-names = "stmmaceth";
-			resets = <&rst EMAC0_RESET>;
-			reset-names = "stmmaceth";
+			resets = <&rst EMAC0_RESET>, <&rst EMAC0_OCP_RESET>;
+			reset-names = "stmmaceth", "stmmaceth-ocp";
 			snps,axi-config = <&socfpga_axi_setup>;
 			status = "disabled";
 		};
@@ -451,8 +451,8 @@
 			rx-fifo-depth = <16384>;
 			clocks = <&l4_mp_clk>;
 			clock-names = "stmmaceth";
-			resets = <&rst EMAC1_RESET>;
-			reset-names = "stmmaceth";
+			resets = <&rst EMAC1_RESET>, <&rst EMAC1_OCP_RESET>;
+			reset-names = "stmmaceth", "stmmaceth-ocp";
 			snps,axi-config = <&socfpga_axi_setup>;
 			status = "disabled";
 		};
@@ -470,8 +470,8 @@
 			tx-fifo-depth = <4096>;
 			rx-fifo-depth = <16384>;
 			clocks = <&l4_mp_clk>;
-			resets = <&rst EMAC2_RESET>;
-			clock-names = "stmmaceth";
+			resets = <&rst EMAC2_RESET>, <&rst EMAC2_OCP_RESET>;
+			clock-names = "stmmaceth", "stmmaceth-ocp";
 			snps,axi-config = <&socfpga_axi_setup>;
 			status = "disabled";
 		};
-- 
2.20.0
