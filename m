Return-Path: <SRS0=6+VU=MB=linux.intel.com=thor.thayer@kernel.org>
From: thor.thayer@linux.intel.com
Subject: [PATCH 6/6] arm64: dts: stratix10: Add peripheral EDAC nodes
Date: Wed, 19 Sep 2018 14:39:01 -0500
Message-Id: <1537385941-11582-7-git-send-email-thor.thayer@linux.intel.com>
In-Reply-To: <1537385941-11582-1-git-send-email-thor.thayer@linux.intel.com>
References: <1537385941-11582-1-git-send-email-thor.thayer@linux.intel.com>
To: dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, bp@alien8.de, mchehab@kernel.org
Cc: thor.thayer@linux.intel.com, devicetree@vger.kernel.org, linux-edac@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Thor Thayer <thor.thayer@linux.intel.com>

Add the usb and ethernet peripheral ECC nodes using the
Arria10 format.

Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
---
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 27 ++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
index ee1d4b8ba631..f9cdbb82deeb 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
@@ -473,7 +473,7 @@
 		};
 
 		eccmgr {
-			compatible = "altr,socfpga-s10-ecc-manager";
+			compatible = "altr,socfpga-a10-ecc-manager";
 			altr,sysmgr-syscon = <&sysmgr>;
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -487,6 +487,31 @@
 				altr,sdr-syscon = <&sdr>;
 				interrupts = <16 4>, <48 4>;
 			};
+
+			usb0-ecc@ff8c4000 {
+				compatible = "altr,socfpga-usb-ecc";
+				reg = <0xff8c4000 0x100>;
+				altr,ecc-parent = <&usb0>;
+				interrupts = <2 4>,
+					     <34 4>;
+			};
+
+			emac0-rx-ecc@ff8c0000 {
+				compatible = "altr,socfpga-eth-mac-ecc";
+				reg = <0xff8c0000 0x100>;
+				altr,ecc-parent = <&gmac0>;
+				interrupts = <4 4>,
+					     <36 4>;
+			};
+
+			emac0-tx-ecc@ff8c0400 {
+				compatible = "altr,socfpga-eth-mac-ecc";
+				reg = <0xff8c0400 0x100>;
+				altr,ecc-parent = <&gmac0>;
+				interrupts = <5 4>,
+					     <37 4>;
+			};
+
 		};
 
 		qspi: spi@ff8d2000 {
-- 
2.7.4
