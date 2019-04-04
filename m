From: thor.thayer@linux.intel.com
Subject: [RESEND PATCHv3 3/3] arm64: dts: stratix10: Use new Stratix10 EDAC bindings
Date: Thu,  4 Apr 2019 09:36:37 -0500
Message-ID: <1554388597-28019-4-git-send-email-thor.thayer@linux.intel.com>
References: <1554388597-28019-1-git-send-email-thor.thayer@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554388597-28019-1-git-send-email-thor.thayer@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bp@alien8.de, dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: mchehab@kernel.org, james.morse@arm.com, thor.thayer@linux.intel.com, devicetree@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <thor.thayer@linux.intel.com>

Use the new Stratix10 binding format for EDAC nodes.

Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
Acked-by: Dinh Nguyen <dinguyen@kernel.org>
---
v2-3 No change
Resend adds Acked-by.
---
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 25 ++++++++++++-----------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
index e3f5eaa3657d..41109995563c 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
@@ -531,11 +531,12 @@
 		};
 
 		eccmgr {
-			compatible = "altr,socfpga-a10-ecc-manager";
+			compatible = "altr,socfpga-s10-ecc-manager",
+				     "altr,socfpga-a10-ecc-manager";
 			altr,sysmgr-syscon = <&sysmgr>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-			interrupts = <0 15 4>, <0 95 4>;
+			interrupts = <0 15 4>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
 			ranges;
@@ -543,31 +544,31 @@
 			sdramedac {
 				compatible = "altr,sdram-edac-s10";
 				altr,sdr-syscon = <&sdr>;
-				interrupts = <16 4>, <48 4>;
+				interrupts = <16 4>;
 			};
 
 			usb0-ecc@ff8c4000 {
-				compatible = "altr,socfpga-usb-ecc";
+				compatible = "altr,socfpga-s10-usb-ecc",
+					     "altr,socfpga-usb-ecc";
 				reg = <0xff8c4000 0x100>;
 				altr,ecc-parent = <&usb0>;
-				interrupts = <2 4>,
-					     <34 4>;
+				interrupts = <2 4>;
 			};
 
 			emac0-rx-ecc@ff8c0000 {
-				compatible = "altr,socfpga-eth-mac-ecc";
+				compatible = "altr,socfpga-s10-eth-mac-ecc",
+					     "altr,socfpga-eth-mac-ecc";
 				reg = <0xff8c0000 0x100>;
 				altr,ecc-parent = <&gmac0>;
-				interrupts = <4 4>,
-					     <36 4>;
+				interrupts = <4 4>;
 			};
 
 			emac0-tx-ecc@ff8c0400 {
-				compatible = "altr,socfpga-eth-mac-ecc";
+				compatible = "altr,socfpga-s10-eth-mac-ecc",
+					     "altr,socfpga-eth-mac-ecc";
 				reg = <0xff8c0400 0x100>;
 				altr,ecc-parent = <&gmac0>;
-				interrupts = <5 4>,
-					     <37 4>;
+				interrupts = <5 4>;
 			};
 
 		};
-- 
2.7.4
