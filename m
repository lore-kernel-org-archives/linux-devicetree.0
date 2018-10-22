From: thor.thayer@linux.intel.com
Subject: [PATCH 1/2] arm64: dts: stratix10: Support for Ethernet Jumbo frame
Date: Mon, 22 Oct 2018 12:29:11 -0500
Message-ID: <1540229352-26010-1-git-send-email-thor.thayer@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com, davem@davemloft.net, dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Thor Thayer <thor.thayer@linux.intel.com>
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <thor.thayer@linux.intel.com>

Properly specify the RX and TX FIFO size which is important
for Jumbo frames.
Update the max-frame-size to support Jumbo frames.

Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
---
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi      | 6 ++++++
 arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
index d033da401c26..8a2641c742ae 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
@@ -137,6 +137,8 @@
 			reset-names = "stmmaceth", "stmmaceth-ocp";
 			clocks = <&clkmgr STRATIX10_EMAC0_CLK>;
 			clock-names = "stmmaceth";
+			tx-fifo-depth = <16384>;
+			rx-fifo-depth = <16384>;
 			status = "disabled";
 		};
 
@@ -150,6 +152,8 @@
 			reset-names = "stmmaceth", "stmmaceth-ocp";
 			clocks = <&clkmgr STRATIX10_EMAC1_CLK>;
 			clock-names = "stmmaceth";
+			tx-fifo-depth = <16384>;
+			rx-fifo-depth = <16384>;
 			status = "disabled";
 		};
 
@@ -163,6 +167,8 @@
 			reset-names = "stmmaceth", "stmmaceth-ocp";
 			clocks = <&clkmgr STRATIX10_EMAC2_CLK>;
 			clock-names = "stmmaceth";
+			tx-fifo-depth = <16384>;
+			rx-fifo-depth = <16384>;
 			status = "disabled";
 		};
 
diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts b/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
index 6edc4fa9fd42..7c661753bfaf 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
@@ -76,7 +76,7 @@
 	phy-mode = "rgmii";
 	phy-handle = <&phy0>;
 
-	max-frame-size = <3800>;
+	max-frame-size = <9000>;
 
 	mdio0 {
 		#address-cells = <1>;
-- 
2.7.4
