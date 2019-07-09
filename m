Return-Path: <SRS0=cJxD=VG=linux.intel.com=thor.thayer@kernel.org>
From: thor.thayer@linux.intel.com
Subject: [PATCH 2/3] arm64: dts: Stratix10: Include regs in SDRAM ECC node
Date: Tue,  9 Jul 2019 17:24:49 -0500
Message-Id: <1562711090-900-3-git-send-email-thor.thayer@linux.intel.com>
In-Reply-To: <1562711090-900-1-git-send-email-thor.thayer@linux.intel.com>
References: <1562711090-900-1-git-send-email-thor.thayer@linux.intel.com>
To: bp@alien8.de, mchehab@kernel.org, james.morse@arm.com, robh+dt@kernel.org, mark.rutland@arm.com, dinguyen@kernel.org
Cc: devicetree@vger.kernel.org, linux-edac@vger.kernel.org, Thor Thayer <thor.thayer@linux.intel.com>
List-ID: <devicetree@vger.kernel.org>

From: Thor Thayer <thor.thayer@linux.intel.com>

Include the regs directly in the SDRAM node instead of using
a syscon. The Stratix10 SDRAM ECC registers are partitioned
away from other Sys Manager registers so the syscon is no
longer needed for Stratix10.

Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
---
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
index 4b0f674df849..a1e9545de3d3 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
@@ -517,11 +517,6 @@
 			status = "disabled";
 		};
 
-		sdr: sdr@f8011100 {
-			compatible = "altr,sdr-ctl", "syscon";
-			reg = <0xf8011100 0xc0>;
-		};
-
 		eccmgr {
 			compatible = "altr,socfpga-s10-ecc-manager",
 				     "altr,socfpga-a10-ecc-manager";
@@ -533,9 +528,9 @@
 			#interrupt-cells = <2>;
 			ranges;
 
-			sdramedac {
+			sdramedac@0xf8011100 {
 				compatible = "altr,sdram-edac-s10";
-				altr,sdr-syscon = <&sdr>;
+				reg = <0xf8011100 0xc0>;
 				interrupts = <16 4>;
 			};
 
-- 
2.7.4
