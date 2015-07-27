From: <dinguyen@opensource.altera.com>
Subject: [PATCH 4/4] ARM: socfpga: dts: Add resets for EMACs on Arria10
Date: Mon, 27 Jul 2015 13:57:24 -0500
Message-ID: <1438023444-11881-5-git-send-email-dinguyen@opensource.altera.com>
References: <1438023444-11881-1-git-send-email-dinguyen@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438023444-11881-1-git-send-email-dinguyen@opensource.altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: p.zabel@pengutronix.de
Cc: dinh.linux@gmail.com, robh+dt@kernel.org, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, mark.rutland@arm.com, pawel.moll@arm.com, s.trumtrar@pengutronix.de, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Dinh Nguyen <dinguyen@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

From: Dinh Nguyen <dinguyen@opensource.altera.com>

Add the reset property for the EMAC controllers on Arria10.

Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
---
 arch/arm/boot/dts/socfpga_arria10.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/socfpga_arria10.dtsi b/arch/arm/boot/dts/socfpga_arria10.dtsi
index 22e7d82..2340fcb 100644
--- a/arch/arm/boot/dts/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10.dtsi
@@ -16,6 +16,7 @@
 
 #include "skeleton.dtsi"
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/reset/altr,rst-mgr-a10.h>
 
 / {
 	#address-cells = <1>;
@@ -414,6 +415,8 @@
 			rx-fifo-depth = <16384>;
 			clocks = <&l4_mp_clk>;
 			clock-names = "stmmaceth";
+			resets = <&rst EMAC0_RESET>;
+			reset-names = "stmmaceth";
 			status = "disabled";
 		};
 
@@ -431,6 +434,8 @@
 			rx-fifo-depth = <16384>;
 			clocks = <&l4_mp_clk>;
 			clock-names = "stmmaceth";
+			resets = <&rst EMAC1_RESET>;
+			reset-names = "stmmaceth";
 			status = "disabled";
 		};
 
-- 
2.4.5
