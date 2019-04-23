From: thor.thayer@linux.intel.com
Subject: [PATCH 4/4] arm64: dts: stratix10: Add SDMMC EDAC node
Date: Tue, 23 Apr 2019 09:36:37 -0500
Message-ID: <1556030197-24534-5-git-send-email-thor.thayer@linux.intel.com>
References: <1556030197-24534-1-git-send-email-thor.thayer@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556030197-24534-1-git-send-email-thor.thayer@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bp@alien8.de, mchehab@kernel.org, james.morse@arm.com, dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: thor.thayer@linux.intel.com, devicetree@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <thor.thayer@linux.intel.com>

Add the Stratix10 SDMMC EDAC node.

Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
---
 arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts b/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
index 2e3863ee12b3..91fed85cf8e5 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
@@ -67,6 +67,17 @@
 				clock-frequency = <25000000>;
 			};
 		};
+
+		eccmgr {
+			sdmmca-ecc@ff8c8c00 {
+				compatible = "altr,socfpga-s10-sdmmc-ecc",
+					     "altr,socfpga-sdmmc-ecc";
+				reg = <0xff8c8c00 0x100>;
+				altr,ecc-parent = <&mmc>;
+				interrupts = <14 4>,
+					     <15 4>;
+			};
+		};
 	};
 };
 
-- 
2.7.4
