From: Dinh Nguyen <dinguyen@kernel.org>
Subject: [PATCH 1/3] arm64: dts: stratix10: use "altr,stratix10-rst-mgr" binding
Date: Mon,  5 Nov 2018 14:05:47 -0600
Message-ID: <20181105200549.17159-1-dinguyen@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: p.zabel@pengutronix.de
Cc: dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinh.nguyen@intel.com>
List-Id: devicetree@vger.kernel.org

From: Dinh Nguyen <dinh.nguyen@intel.com>

The standard reset-simple driver the uses the "altr,rst-mgr" binding is
not getting initialized early enough in the boot process, so timers
that the kernel needs are still left in reset. Thus an early
reset driver was created. This early reset driver is only for the
SoCFPGA 32-bit platform.

The Stratix10 platform does not need any of the timers that in reset to
boot, thus we don't need to early reset driver. Therefore, use the
"altr,stratix10-rst-mgr" binding for the reset-simple platform driver on
the Stratix10 platform.

Also remove the "altr,modrst-offset" property because the driver no
longer needs it.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
index 8253a1a9e985..5f0b18ae5007 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
@@ -308,9 +308,8 @@
 
 		rst: rstmgr@ffd11000 {
 			#reset-cells = <1>;
-			compatible = "altr,rst-mgr";
+			compatible = "altr,stratix10-rst-mgr", "altr,rst-mgr";
 			reg = <0xffd11000 0x1000>;
-			altr,modrst-offset = <0x20>;
 		};
 
 		spi0: spi@ffda4000 {
-- 
2.17.1
