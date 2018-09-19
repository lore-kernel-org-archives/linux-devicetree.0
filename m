Return-Path: <SRS0=6+VU=MB=linux.intel.com=thor.thayer@kernel.org>
From: thor.thayer@linux.intel.com
Subject: [PATCH 3/6] arm64: dts: stratix10: Add SDRAM node
Date: Wed, 19 Sep 2018 14:38:58 -0500
Message-Id: <1537385941-11582-4-git-send-email-thor.thayer@linux.intel.com>
In-Reply-To: <1537385941-11582-1-git-send-email-thor.thayer@linux.intel.com>
References: <1537385941-11582-1-git-send-email-thor.thayer@linux.intel.com>
To: dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, bp@alien8.de, mchehab@kernel.org
Cc: thor.thayer@linux.intel.com, devicetree@vger.kernel.org, linux-edac@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Thor Thayer <thor.thayer@linux.intel.com>

Add the SDRAM node to follow the Arria10 layout and
bindings. The Arria10 SDRAM functions expect this
node.

Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
---
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
index 78b4b06e8935..ee1d4b8ba631 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
@@ -467,6 +467,11 @@
 			status = "disabled";
 		};
 
+		sdr: sdr@ffc25000 {
+			compatible = "altr,sdr-ctl", "syscon";
+			reg = <0xf8011100 0xc0>;
+		};
+
 		eccmgr {
 			compatible = "altr,socfpga-s10-ecc-manager";
 			altr,sysmgr-syscon = <&sysmgr>;
@@ -479,6 +484,7 @@
 
 			sdramedac {
 				compatible = "altr,sdram-edac-s10";
+				altr,sdr-syscon = <&sdr>;
 				interrupts = <16 4>, <48 4>;
 			};
 		};
-- 
2.7.4
