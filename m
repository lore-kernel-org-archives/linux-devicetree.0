From: dwesterg@gmail.com
Subject: [PATCH] arch: arm: socfpga: arria10: Add stmmac ptp_ref clock to socdk devicetree
Date: Thu, 13 Dec 2018 12:59:10 -0800
Message-ID: <20181213205910.26359-1-dalon.westergreen@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, thor.thayer@intel.com
Cc: Dalon Westergreen <dalon.westergreen@linux.intel.com>
List-Id: devicetree@vger.kernel.org

From: Dalon Westergreen <dalon.westergreen@linux.intel.com>

Add the stmmac ptp_ref clock as it is configured in the arria10 socdk.
The stmmac driver defaults the ptp_ref clock to the main stmmac clock
if the ptp_ref clock is not set in the devicetree.  This is inapprotiate
for the arria10 socdk.

Signed-off-by: Dalon Westergreen <dalon.westergreen@linux.intel.com>
---
 arch/arm/boot/dts/socfpga_arria10_socdk.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi b/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi
index 2a7466891d0e..58bfa84dcdb3 100644
--- a/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi
@@ -74,7 +74,8 @@
 &gmac0 {
 	phy-mode = "rgmii";
 	phy-addr = <0xffffffff>; /* probe for phy addr */
-
+	clocks = <&l4_mp_clk>, <&peri_emac_ptp_clk>;
+	clock-names = "stmmaceth", "ptp_ref";
 	/*
 	 * These skews assume the user's FPGA design is adding 600ps of delay
 	 * for TX_CLK on Arria 10.
-- 
2.19.2
