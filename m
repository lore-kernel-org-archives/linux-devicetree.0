Return-Path: <SRS0=zDJw=QF=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:6466 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727339AbfA2WBg (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 29 Jan 2019 17:01:36 -0500
From: thor.thayer@linux.intel.com
Subject: [PATCH 4/4] arm64: dts: stratix10: Use new Stratix10 EDAC bindings
Date: Tue, 29 Jan 2019 16:03:48 -0600
Message-Id: <1548799428-10541-5-git-send-email-thor.thayer@linux.intel.com>
In-Reply-To: <1548799428-10541-1-git-send-email-thor.thayer@linux.intel.com>
References: <1548799428-10541-1-git-send-email-thor.thayer@linux.intel.com>
Sender: devicetree-owner@vger.kernel.org
To: bp@alien8.de, dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org, james.morse@arm.com
Cc: thor.thayer@linux.intel.com, devicetree@vger.kernel.org, linux-edac@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Thor Thayer <thor.thayer@linux.intel.com>

Use the new Stratix10 binding format for EDAC nodes.

Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
---
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 25 ++++++++++++-----------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
index 8253a1a9e985..de6f0507333d 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
@@ -479,11 +479,12 @@
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
@@ -491,31 +492,31 @@
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
