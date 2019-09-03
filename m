From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.19 090/167] arm64: dts: stratix10: add the sysmgr-syscon property from the gmac's
Date: Tue,  3 Sep 2019 12:24:02 -0400
Message-ID: <20190903162519.7136-90-sashal@kernel.org>
References: <20190903162519.7136-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190903162519.7136-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Dinh Nguyen <dinguyen@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>, Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Dinh Nguyen <dinguyen@kernel.org>

[ Upstream commit 8efd6365417a044db03009724ecc1a9521524913 ]

The gmac ethernet driver uses the "altr,sysmgr-syscon" property to
configure phy settings for the gmac controller.

Add the "altr,sysmgr-syscon" property to all gmac nodes.

This patch fixes:

[    0.917530] socfpga-dwmac ff800000.ethernet: No sysmgr-syscon node found
[    0.924209] socfpga-dwmac ff800000.ethernet: Unable to parse OF data

Cc: stable@vger.kernel.org
Reported-by: Ley Foon Tan <ley.foon.tan@intel.com>
Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
index 5089aa64088fc..9a1ea8a464057 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
@@ -140,6 +140,7 @@
 			tx-fifo-depth = <16384>;
 			rx-fifo-depth = <16384>;
 			snps,multicast-filter-bins = <256>;
+			altr,sysmgr-syscon = <&sysmgr 0x44 0>;
 			status = "disabled";
 		};
 
@@ -156,6 +157,7 @@
 			tx-fifo-depth = <16384>;
 			rx-fifo-depth = <16384>;
 			snps,multicast-filter-bins = <256>;
+			altr,sysmgr-syscon = <&sysmgr 0x48 0>;
 			status = "disabled";
 		};
 
@@ -172,6 +174,7 @@
 			tx-fifo-depth = <16384>;
 			rx-fifo-depth = <16384>;
 			snps,multicast-filter-bins = <256>;
+			altr,sysmgr-syscon = <&sysmgr 0x4c 0>;
 			status = "disabled";
 		};
 
-- 
2.20.1
