From: thor.thayer@linux.intel.com
Subject: [PATCH 2/4] arm64: dts: stratix10: Add OCRAM EDAC node
Date: Tue, 23 Apr 2019 09:36:35 -0500
Message-ID: <1556030197-24534-3-git-send-email-thor.thayer@linux.intel.com>
References: <1556030197-24534-1-git-send-email-thor.thayer@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556030197-24534-1-git-send-email-thor.thayer@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bp@alien8.de, mchehab@kernel.org, james.morse@arm.com, dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: thor.thayer@linux.intel.com, devicetree@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <thor.thayer@linux.intel.com>

Add the OCRAM ECC node with Stratix10 compatible string.

Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
---
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
index 41109995563c..c28310ff70a0 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
@@ -547,6 +547,14 @@
 				interrupts = <16 4>;
 			};
 
+			ocram-ecc@ff8cc000 {
+				compatible = "altr,socfpga-s10-ocram-ecc",
+					     "altr,socfpga-a10-ocram-ecc";
+				reg = <0xff8cc000 0x100>;
+				altr,ecc-parent = <&ocram>;
+				interrupts = <1 4>;
+			};
+
 			usb0-ecc@ff8c4000 {
 				compatible = "altr,socfpga-s10-usb-ecc",
 					     "altr,socfpga-usb-ecc";
-- 
2.7.4
