From: thor.thayer@linux.intel.com
Subject: [PATCH] arm64: dts: stratix10: Fix SPI nodes for Stratix10
Date: Thu,  5 Jul 2018 17:02:19 -0500
Message-ID: <1530828139-16120-1-git-send-email-thor.thayer@linux.intel.com>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: stable@vger.kernel.org
Cc: dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thor Thayer <thor.thayer@linux.intel.com>, #@vger.kernel.org, 4.14.x@vger.kernel.org, 4.9.x@vger.kernel.org, Olof Johansson <olof@lixom.net>
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <thor.thayer@linux.intel.com>

Patch did not apply cleanly to 4.9 and 4.14 stable branches
because of additional node properties added after 4.14. So
backport patch and cleanup commit 4595299c5eae ("arm64: dts:
   stratix10: Fix SPI nodes for Stratix10")

Remove the unused bus-num node and change num-chipselect
to num-cs to match SPI bindings.

Cc: stable@vger.kernel.org # 4.14.x
Cc: stable@vger.kernel.org # 4.9.x
Fixes: 78cd6a9d8e154 ("arm64: dts: Add base stratix 10 dtsi")
Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
Signed-off-by: Olof Johansson <olof@lixom.net>
---
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
index c2b9bcb0ef61..57f75453ee93 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
@@ -231,8 +231,7 @@
 			#size-cells = <0>;
 			reg = <0xffda4000 0x1000>;
 			interrupts = <0 101 4>;
-			num-chipselect = <4>;
-			bus-num = <0>;
+			num-cs = <4>;
 			status = "disabled";
 		};
 
@@ -242,8 +241,7 @@
 			#size-cells = <0>;
 			reg = <0xffda5000 0x1000>;
 			interrupts = <0 102 4>;
-			num-chipselect = <4>;
-			bus-num = <0>;
+			num-cs = <4>;
 			status = "disabled";
 		};
 
-- 
2.7.4
