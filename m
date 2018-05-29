Return-Path: <SRS0=1TfY=IQ=linux.intel.com=thor.thayer@kernel.org>
From: thor.thayer@linux.intel.com
Subject: [PATCH 2/2] ARM: dts: Add SPI0 node for Arria10
Date: Tue, 29 May 2018 13:08:39 -0500
Message-Id: <1527617319-1936-2-git-send-email-thor.thayer@linux.intel.com>
In-Reply-To: <1527617319-1936-1-git-send-email-thor.thayer@linux.intel.com>
References: <1527617319-1936-1-git-send-email-thor.thayer@linux.intel.com>
To: dinguyen@kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, Thor Thayer <thor.thayer@linux.intel.com>
List-ID: <devicetree@vger.kernel.org>

From: Thor Thayer <thor.thayer@linux.intel.com>

Add the SPI0 node for Arria10.

Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
---
 arch/arm/boot/dts/socfpga_arria10.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/socfpga_arria10.dtsi b/arch/arm/boot/dts/socfpga_arria10.dtsi
index 9138f834bad4..ee9a5fc616a8 100644
--- a/arch/arm/boot/dts/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10.dtsi
@@ -587,6 +587,18 @@
 			status = "disabled";
 		};
 
+		spi0: spi@ffda4000 {
+			compatible = "snps,dw-apb-ssi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0xffda4000 0x100>;
+			interrupts = <0 101 4>;
+			num-cs = <4>;
+			/*32bit_access;*/
+			clocks = <&spi_m_clk>;
+			status = "disabled";
+		};
+
 		spi1: spi@ffda5000 {
 			compatible = "snps,dw-apb-ssi";
 			#address-cells = <1>;
-- 
2.7.4
