From: Joyce Ooi <joyce.ooi@intel.com>
Subject: [PATCH] arm64: dts: altera: update QSPI reg addresses for Stratix10
Date: Tue,  8 Oct 2019 01:48:59 -0700
Message-ID: <1570524539-7411-1-git-send-email-joyce.ooi@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Joyce Ooi <joyce.ooi@intel.com>, Ong Hean Loong <hean.loong.ong@intel.com>, See Chin Liang <chin.liang.see@intel.com>, Tan Ley Foon <ley.foon.tan@intel.com>
List-Id: devicetree@vger.kernel.org

From: "Ooi, Joyce" <joyce.ooi@intel.com>

This patch updates the reg addresses for QSPI boot and QSPI rootfs in
the device tree for Stratix10

Signed-off-by: Ooi, Joyce <joyce.ooi@intel.com>
---
 arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts b/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
index 66e4ffb4e929..fb11ef05d556 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
@@ -178,12 +178,12 @@
 
 			qspi_boot: partition@0 {
 				label = "Boot and fpga data";
-				reg = <0x0 0x4000000>;
+				reg = <0x0 0x034B0000>;
 			};
 
 			qspi_rootfs: partition@4000000 {
 				label = "Root Filesystem - JFFS2";
-				reg = <0x4000000 0x4000000>;
+				reg = <0x034B0000 0x0EB50000>;
 			};
 		};
 	};
-- 
2.13.0
