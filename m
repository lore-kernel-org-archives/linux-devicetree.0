From: richard.gong@linux.intel.com
Subject: [PATCHv1 3/6] arm64: dts: stratix10: add remote system update
Date: Tue,  9 Apr 2019 13:45:59 -0500
Message-ID: <1554835562-25056-4-git-send-email-richard.gong@linux.intel.com>
References: <1554835562-25056-1-git-send-email-richard.gong@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554835562-25056-1-git-send-email-richard.gong@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, dinguyen@kernel.org, atull@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, richard.gong@linux.intel.com, Richard Gong <richard.gong@intel.com>
List-Id: devicetree@vger.kernel.org

From: Richard Gong <richard.gong@intel.com>

Add Intel Stratix10 remote system update to the device tree

Signed-off-by: Richard Gong <richard.gong@intel.com>
Reviewed-by: Alan Tull <atull@kernel.org>
---
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
index 7c649f6..79ae522 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
@@ -596,6 +596,10 @@
 				fpga_mgr: fpga-mgr {
 					compatible = "intel,stratix10-soc-fpga-mgr";
 				};
+
+				rsu: rsu {
+					compatible = "intel,stratix10-rsu";
+				};
 			};
 		};
 	};
-- 
2.7.4
