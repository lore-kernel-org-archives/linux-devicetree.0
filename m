From: dwesterg@gmail.com
Subject: [PATCH 3/3] ARM64: dts: stratix10: Add stmmac ptp_ref clock
Date: Thu, 13 Dec 2018 15:03:02 -0800
Message-ID: <20181213230302.11034-3-dalon.westergreen@linux.intel.com>
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

Add the default stmmac ptp_ref clock for stratix10.  The stmmac
driver defaults the ptp_ref clock to the main stmmac clock
if the ptp_ref clock is not set in the devicetree.  This is
inappropriate for the stratix10.  The default ptp_ref clock is
STRATIX10_PERI_EMAC_PTP_CLK in the clock manager.

Signed-off-by: Dalon Westergreen <dalon.westergreen@linux.intel.com>
---
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
index adedd563125a..f464e7ba3402 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
@@ -160,8 +160,8 @@
 			mac-address = [00 00 00 00 00 00];
 			resets = <&rst EMAC0_RESET>, <&rst EMAC0_OCP_RESET>;
 			reset-names = "stmmaceth", "stmmaceth-ocp";
-			clocks = <&clkmgr STRATIX10_EMAC0_CLK>;
-			clock-names = "stmmaceth";
+			clocks = <&clkmgr STRATIX10_EMAC0_CLK>, <&clkmgr STRATIX10_PERI_EMAC_PTP_CLK>;
+			clock-names = "stmmaceth", "ptp_ref";
 			tx-fifo-depth = <16384>;
 			rx-fifo-depth = <16384>;
 			snps,multicast-filter-bins = <256>;
@@ -176,8 +176,8 @@
 			mac-address = [00 00 00 00 00 00];
 			resets = <&rst EMAC1_RESET>, <&rst EMAC1_OCP_RESET>;
 			reset-names = "stmmaceth", "stmmaceth-ocp";
-			clocks = <&clkmgr STRATIX10_EMAC1_CLK>;
-			clock-names = "stmmaceth";
+			clocks = <&clkmgr STRATIX10_EMAC1_CLK>, <&clkmgr STRATIX10_PERI_EMAC_PTP_CLK>;
+			clock-names = "stmmaceth", "ptp_ref";
 			tx-fifo-depth = <16384>;
 			rx-fifo-depth = <16384>;
 			snps,multicast-filter-bins = <256>;
@@ -192,8 +192,8 @@
 			mac-address = [00 00 00 00 00 00];
 			resets = <&rst EMAC2_RESET>, <&rst EMAC2_OCP_RESET>;
 			reset-names = "stmmaceth", "stmmaceth-ocp";
-			clocks = <&clkmgr STRATIX10_EMAC2_CLK>;
-			clock-names = "stmmaceth";
+			clocks = <&clkmgr STRATIX10_EMAC2_CLK>, <&clkmgr STRATIX10_PERI_EMAC_PTP_CLK>;
+			clock-names = "stmmaceth", "ptp_ref";
 			tx-fifo-depth = <16384>;
 			rx-fifo-depth = <16384>;
 			snps,multicast-filter-bins = <256>;
-- 
2.19.2
