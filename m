Return-Path: <SRS0=Tq4V=PY=linux.intel.com=thor.thayer@kernel.org>
From: thor.thayer@linux.intel.com
Subject: [PATCH 4/4] arm64: dts: stratix10: Add OCRAM EDAC node
Date: Wed, 16 Jan 2019 17:11:54 -0600
Message-Id: <1547680314-31045-5-git-send-email-thor.thayer@linux.intel.com>
In-Reply-To: <1547680314-31045-1-git-send-email-thor.thayer@linux.intel.com>
References: <1547680314-31045-1-git-send-email-thor.thayer@linux.intel.com>
To: bp@alien8.de, dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org
Cc: thor.thayer@linux.intel.com, devicetree@vger.kernel.org, linux-edac@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Thor Thayer <thor.thayer@linux.intel.com>

Add the OCRAM ECC node following the Arria10 format.

Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
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
