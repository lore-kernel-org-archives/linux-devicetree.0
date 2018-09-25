From: thor.thayer@linux.intel.com
Subject: [PATCH] arm64: dts: stratix10: Correct System Manager register size
Date: Tue, 25 Sep 2018 10:31:52 -0500
Message-ID: <1537889512-586-1-git-send-email-thor.thayer@linux.intel.com>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thor Thayer <thor.thayer@linux.intel.com>, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <thor.thayer@linux.intel.com>

Correct the register size of the System Manager node.

Cc: stable@vger.kernel.org
Fixes: 78cd6a9d8e154 ("arm64: dts: Add base stratix 10 dtsi")
Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
---
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
index 67dac595dc72..3989876ab699 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
@@ -327,7 +327,7 @@
 
 		sysmgr: sysmgr@ffd12000 {
 			compatible = "altr,sys-mgr", "syscon";
-			reg = <0xffd12000 0x1000>;
+			reg = <0xffd12000 0x228>;
 		};
 
 		/* Local timer */
-- 
2.7.4
