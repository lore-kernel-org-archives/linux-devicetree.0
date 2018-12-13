From: dwesterg@gmail.com
Subject: [PATCH 1/3] ARM: dts: cyclone5: Add stmmac ptp_ref clock
Date: Thu, 13 Dec 2018 15:03:00 -0800
Message-ID: <20181213230302.11034-1-dalon.westergreen@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, thor.thayer@intel.com
Cc: Dalon Westergreen <dalon.westergreen@linux.intel.com>
List-Id: devicetree@vger.kernel.org

From: Dalon Westergreen <dalon.westergreen@linux.intel.com>

Add the ptp_ref clock to gmac0 / gmac1 specifying the default clk
of osc1.  The stmmac driver defaults the ptp_ref clock to the main
stmmac clock if ptp_ref is not provided.  This is inappropriate for
the Cyclone5 or Arria5 devices.

Signed-off-by: Dalon Westergreen <dalon.westergreen@linux.intel.com>
---
 arch/arm/boot/dts/socfpga.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
index 28ecb4bdf5aa..c1c9d6a2bb91 100644
--- a/arch/arm/boot/dts/socfpga.dtsi
+++ b/arch/arm/boot/dts/socfpga.dtsi
@@ -557,8 +557,8 @@
 			interrupts = <0 115 4>;
 			interrupt-names = "macirq";
 			mac-address = [00 00 00 00 00 00];/* Filled in by U-Boot */
-			clocks = <&emac_0_clk>;
-			clock-names = "stmmaceth";
+			clocks = <&emac_0_clk>, <&osc1>;
+			clock-names = "stmmaceth", "ptp_ref";
 			resets = <&rst EMAC0_RESET>;
 			reset-names = "stmmaceth";
 			snps,multicast-filter-bins = <256>;
@@ -575,8 +575,8 @@
 			interrupts = <0 120 4>;
 			interrupt-names = "macirq";
 			mac-address = [00 00 00 00 00 00];/* Filled in by U-Boot */
-			clocks = <&emac_1_clk>;
-			clock-names = "stmmaceth";
+			clocks = <&emac_1_clk>, <&osc1>;
+			clock-names = "stmmaceth", "ptp_ref";
 			resets = <&rst EMAC1_RESET>;
 			reset-names = "stmmaceth";
 			snps,multicast-filter-bins = <256>;
-- 
2.19.2
