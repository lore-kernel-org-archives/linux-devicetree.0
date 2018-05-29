From: thor.thayer@linux.intel.com
Subject: [PATCH 1/2] ARM: dts: Fix SPI node for Arria10
Date: Tue, 29 May 2018 13:08:38 -0500
Message-ID: <1527617319-1936-1-git-send-email-thor.thayer@linux.intel.com>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: dinguyen@kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, Thor Thayer <thor.thayer@linux.intel.com>, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <thor.thayer@linux.intel.com>

Remove the unused bus-num node and change num-chipselect
to num-cs to match SPI bindings.

Fixes: f2d6f8f817814 ("ARM: dts: socfpga: Add SPI Master1 for Arria10 SR chip")
Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
Cc: stable@vger.kernel.org
---
 arch/arm/boot/dts/socfpga_arria10.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/socfpga_arria10.dtsi b/arch/arm/boot/dts/socfpga_arria10.dtsi
index bead79e4b2aa..9138f834bad4 100644
--- a/arch/arm/boot/dts/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10.dtsi
@@ -593,8 +593,7 @@
 			#size-cells = <0>;
 			reg = <0xffda5000 0x100>;
 			interrupts = <0 102 4>;
-			num-chipselect = <4>;
-			bus-num = <0>;
+			num-cs = <4>;
 			/*32bit_access;*/
 			tx-dma-channel = <&pdma 16>;
 			rx-dma-channel = <&pdma 17>;
-- 
2.7.4
