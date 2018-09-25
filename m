From: thor.thayer@linux.intel.com
Subject: [PATCH] ARM: dts: socfpga: Fix SDRAM node address for Arria10
Date: Tue, 25 Sep 2018 10:21:10 -0500
Message-ID: <1537888870-357-1-git-send-email-thor.thayer@linux.intel.com>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thor Thayer <thor.thayer@linux.intel.com>, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <thor.thayer@linux.intel.com>

The address in the SDRAM node was incorrect. Fix this to agree with the
correct address and to match the reg definition block.

Cc: stable@vger.kernel.org
Fixes: 54b4a8f57848b("arm: socfpga: dts: Add Arria10 SDRAM EDAC DTS support")
Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
---
 arch/arm/boot/dts/socfpga_arria10.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/socfpga_arria10.dtsi b/arch/arm/boot/dts/socfpga_arria10.dtsi
index 791ca15c799e..bd1985694bca 100644
--- a/arch/arm/boot/dts/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10.dtsi
@@ -601,7 +601,7 @@
 			status = "disabled";
 		};
 
-		sdr: sdr@ffc25000 {
+		sdr: sdr@ffcfb100 {
 			compatible = "altr,sdr-ctl", "syscon";
 			reg = <0xffcfb100 0x80>;
 		};
-- 
2.7.4
