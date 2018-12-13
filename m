From: dwesterg@gmail.com
Subject: [PATCH 2/3] ARM: dts: arria10: Add stmmac ptp_ref clock
Date: Thu, 13 Dec 2018 15:03:01 -0800
Message-ID: <20181213230302.11034-2-dalon.westergreen@linux.intel.com>
References: <20181213230302.11034-1-dalon.westergreen@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181213230302.11034-1-dalon.westergreen@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, thor.thayer@intel.com
Cc: Dalon Westergreen <dalon.westergreen@linux.intel.com>
List-Id: devicetree@vger.kernel.org

From: Dalon Westergreen <dalon.westergreen@linux.intel.com>

Add the default stmmac ptp_ref clock for arria10.  The stmmac
driver defaults the ptp_ref clock to the main stmmac clock
if the ptp_ref clock is not set in the devicetree.  This is inappropriate
for the arria10 device.  The default ptp_ref clock is peri_emac_ptp_clk.

Signed-off-by: Dalon Westergreen <dalon.westergreen@linux.intel.com>
---
 arch/arm/boot/dts/socfpga_arria10.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/socfpga_arria10.dtsi b/arch/arm/boot/dts/socfpga_arria10.dtsi
index 0017bac7f96c..6591def7b225 100644
--- a/arch/arm/boot/dts/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10.dtsi
@@ -426,8 +426,8 @@
 			snps,perfect-filter-entries = <128>;
 			tx-fifo-depth = <4096>;
 			rx-fifo-depth = <16384>;
-			clocks = <&l4_mp_clk>;
-			clock-names = "stmmaceth";
+			clocks = <&l4_mp_clk>, <&peri_emac_ptp_clk>;
+			clock-names = "stmmaceth", "ptp_ref";
 			resets = <&rst EMAC0_RESET>;
 			reset-names = "stmmaceth";
 			snps,axi-config = <&socfpga_axi_setup>;
@@ -446,8 +446,8 @@
 			snps,perfect-filter-entries = <128>;
 			tx-fifo-depth = <4096>;
 			rx-fifo-depth = <16384>;
-			clocks = <&l4_mp_clk>;
-			clock-names = "stmmaceth";
+			clocks = <&l4_mp_clk>, <&peri_emac_ptp_clk>;
+			clock-names = "stmmaceth", "ptp_ref";
 			resets = <&rst EMAC1_RESET>;
 			reset-names = "stmmaceth";
 			snps,axi-config = <&socfpga_axi_setup>;
@@ -466,8 +466,8 @@
 			snps,perfect-filter-entries = <128>;
 			tx-fifo-depth = <4096>;
 			rx-fifo-depth = <16384>;
-			clocks = <&l4_mp_clk>;
-			clock-names = "stmmaceth";
+			clocks = <&l4_mp_clk>, <&peri_emac_ptp_clk>;
+			clock-names = "stmmaceth", "ptp_ref";
 			snps,axi-config = <&socfpga_axi_setup>;
 			status = "disabled";
 		};
-- 
2.19.2
