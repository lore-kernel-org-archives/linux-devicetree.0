From: Vince Bridgers <vbridger@opensource.altera.com>
Subject: [PATCH 1/2] ARM: socfpga: dts: Add multicast bins and unicast filter entries
Date: Mon, 20 Apr 2015 11:24:27 -0500
Message-ID: <1429547068-12501-1-git-send-email-vbridger@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux@arm.linux.org.uk, galak@codeaurora.org, ijc+devicetree@hellion.org.uk, mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org
Cc: vbridger@altera.com, dinguyen@opensource.altera.com, vbridger@opensource.altera.com
List-Id: devicetree@vger.kernel.org

Add multicast-filter-bins and perfect-filter-entries configuration properties
to the socfpga devicetree for the Arria 10 socfpga.

Signed-off-by: Vince Bridgers <vbridger@opensource.altera.com>
---
This patch is based on patches
http://www.spinics.net/lists/devicetree/msg75270.html
http://www.spinics.net/lists/devicetree/msg75273.html
---
 arch/arm/boot/dts/socfpga_arria10.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/socfpga_arria10.dtsi b/arch/arm/boot/dts/socfpga_arria10.dtsi
index e121661..d2ef52b 100644
--- a/arch/arm/boot/dts/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10.dtsi
@@ -395,6 +395,8 @@
 			interrupt-names = "macirq";
 			/* Filled in by bootloader */
 			mac-address = [00 00 00 00 00 00];
+			snps,multicast-filter-bins = <256>;
+			snps,perfect-filter-entries = <128>;
 			clocks = <&l4_mp_clk>;
 			clock-names = "stmmaceth";
 			status = "disabled";
@@ -408,6 +410,8 @@
 			interrupt-names = "macirq";
 			/* Filled in by bootloader */
 			mac-address = [00 00 00 00 00 00];
+			snps,multicast-filter-bins = <256>;
+			snps,perfect-filter-entries = <128>;
 			status = "disabled";
 		};
 
@@ -419,6 +423,8 @@
 			interrupt-names = "macirq";
 			/* Filled in by bootloader */
 			mac-address = [00 00 00 00 00 00];
+			snps,multicast-filter-bins = <256>;
+			snps,perfect-filter-entries = <128>;
 			status = "disabled";
 		};
 
-- 
1.9.1
