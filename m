Return-Path: <SRS0=Bydg=P6=linux.intel.com=thor.thayer@kernel.org>
From: thor.thayer@linux.intel.com
Subject: [PATCHv2 4/4] arm64: dts: stratix10: Add OCRAM EDAC node
Date: Tue, 22 Jan 2019 11:48:07 -0600
Message-Id: <1548179287-21760-5-git-send-email-thor.thayer@linux.intel.com>
In-Reply-To: <1548179287-21760-1-git-send-email-thor.thayer@linux.intel.com>
References: <1548179287-21760-1-git-send-email-thor.thayer@linux.intel.com>
To: bp@alien8.de, dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org, james.morse@arm.com
Cc: thor.thayer@linux.intel.com, devicetree@vger.kernel.org, linux-edac@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Thor Thayer <thor.thayer@linux.intel.com>

Add the OCRAM ECC node following the Arria10 format.

Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
---
v2  No changes
---
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
index 8253a1a9e985..a625dc472b91 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
@@ -494,6 +494,13 @@
 				interrupts = <16 4>, <48 4>;
 			};
 
+			ocram-ecc@ff8cc000 {
+				compatible = "altr,socfpga-a10-ocram-ecc";
+				reg = <0xff8cc000 0x100>;
+				interrupts = <1 4>,
+					     <33 4>;
+			};
+
 			usb0-ecc@ff8c4000 {
 				compatible = "altr,socfpga-usb-ecc";
 				reg = <0xff8c4000 0x100>;
-- 
2.7.4
