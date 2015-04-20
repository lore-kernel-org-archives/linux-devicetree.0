From: <dinguyen@opensource.altera.com>
Subject: [PATCHv2 2/4] ARM: socfpga: disable the sdmmc, and uart nodes in the base arria10
Date: Mon, 20 Apr 2015 13:50:23 -0500
Message-ID: <1429555825-23560-3-git-send-email-dinguyen@opensource.altera.com>
References: <1429555825-23560-1-git-send-email-dinguyen@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429555825-23560-1-git-send-email-dinguyen@opensource.altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, mark.rutland@arm.com, pawel.moll@arm.com
Cc: dinh.linux@gmail.com, arnd@arndb.de, olof@lixom.net, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

From: Dinh Nguyen <dinguyen@opensource.altera.com>

Add status = "disabled" in the base DTSI for Arria10.  The SDMMC and uart
nodes should be enabled in the appropriate board file.

Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
---
 arch/arm/boot/dts/socfpga_arria10.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/socfpga_arria10.dtsi b/arch/arm/boot/dts/socfpga_arria10.dtsi
index 69d616a..d843609 100644
--- a/arch/arm/boot/dts/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10.dtsi
@@ -268,6 +268,7 @@
 			reg = <0xff808000 0x1000>;
 			interrupts = <0 98 IRQ_TYPE_LEVEL_HIGH>;
 			fifo-depth = <0x400>;
+			status = "disabled";
 		};
 
 		ocram: sram@ffe00000 {
@@ -324,6 +325,7 @@
 			interrupts = <0 110 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			status = "disabled";
 		};
 
 		uart1: serial1@ffc02100 {
@@ -332,6 +334,7 @@
 			interrupts = <0 111 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			status = "disabled";
 		};
 
 		usbphy0: usbphy@0 {
-- 
2.2.1
