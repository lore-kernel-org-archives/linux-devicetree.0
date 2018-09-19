Return-Path: <SRS0=6+VU=MB=linux.intel.com=thor.thayer@kernel.org>
From: thor.thayer@linux.intel.com
Subject: [PATCH 1/6] arm64: dts: stratix10: Additions to EDAC System Manager
Date: Wed, 19 Sep 2018 14:38:56 -0500
Message-Id: <1537385941-11582-2-git-send-email-thor.thayer@linux.intel.com>
In-Reply-To: <1537385941-11582-1-git-send-email-thor.thayer@linux.intel.com>
References: <1537385941-11582-1-git-send-email-thor.thayer@linux.intel.com>
To: dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, bp@alien8.de, mchehab@kernel.org
Cc: thor.thayer@linux.intel.com, devicetree@vger.kernel.org, linux-edac@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Thor Thayer <thor.thayer@linux.intel.com>

Add the phandle, address, size and ranges to the
Stratix10 System Manager node to match the existing
Arria10 EDAC implementation.

Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
---
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
index d033da401c26..78b4b06e8935 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
@@ -469,9 +469,13 @@
 
 		eccmgr {
 			compatible = "altr,socfpga-s10-ecc-manager";
+			altr,sysmgr-syscon = <&sysmgr>;
+			#address-cells = <1>;
+			#size-cells = <1>;
 			interrupts = <0 15 4>, <0 95 4>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
+			ranges;
 
 			sdramedac {
 				compatible = "altr,sdram-edac-s10";
-- 
2.7.4
