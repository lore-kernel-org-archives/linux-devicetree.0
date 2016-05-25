From: <tthayer@opensource.altera.com>
Subject: [PATCH 5/5] ARM: dts: Move Arria10 SDRAM as child of ECC Manager
Date: Wed, 25 May 2016 11:29:43 -0500
Message-ID: <1464193783-5071-6-git-send-email-tthayer@opensource.altera.com>
References: <1464193783-5071-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1464193783-5071-1-git-send-email-tthayer@opensource.altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: bp@alien8.de, dougthompson@xmission.com, m.chehab@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@opensource.altera.com, grant.likely@linaro.org
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tthayer.linux@gmail.com, tthayer@opensource.altera.com
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <tthayer@opensource.altera.com>

Changes to support ECC Manager as SDRAM IRQ parent by
1) updating IRQ property values to correct child IRQs
2) moving node under ECC Manager.

Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
---
 arch/arm/boot/dts/socfpga_arria10.dtsi |   13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/socfpga_arria10.dtsi b/arch/arm/boot/dts/socfpga_arria10.dtsi
index 0901090..605c21e 100644
--- a/arch/arm/boot/dts/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10.dtsi
@@ -568,12 +568,6 @@
 			reg = <0xffcfb100 0x80>;
 		};
 
-		sdramedac {
-			compatible = "altr,sdram-edac-a10";
-			altr,sdr-syscon = <&sdr>;
-			interrupts = <0 2 4>, <0 0 4>;
-		};
-
 		L2: l2-cache@fffff000 {
 			compatible = "arm,pl310-cache";
 			reg = <0xfffff000 0x1000>;
@@ -610,6 +604,13 @@
 			#interrupt-cells = <2>;
 			ranges;
 
+			sdramedac {
+				compatible = "altr,sdram-edac-a10";
+				altr,sdr-syscon = <&sdr>;
+				interrupts = <17 IRQ_TYPE_LEVEL_HIGH>,
+					     <49 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
 			l2-ecc@ffd06010 {
 				compatible = "altr,socfpga-a10-l2-ecc";
 				reg = <0xffd06010 0x4>;
-- 
1.7.9.5

