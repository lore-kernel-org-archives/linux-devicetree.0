From: Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: [PATCH v3] arm64: dts: stratix10: fix multicast filtering
Date: Fri,  2 Nov 2018 21:10:48 +0200
Message-ID: <20181102191048.22657-1-aaro.koskinen@iki.fi>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dinh Nguyen <dinguyen@kernel.org>, Thor Thayer <thor.thayer@linux.intel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, Aaro Koskinen <aaro.koskinen@nokia.com>
List-Id: devicetree@vger.kernel.org

From: Aaro Koskinen <aaro.koskinen@nokia.com>

On Stratix 10, the EMAC has 256 hash buckets for multicast filtering. This
needs to be specified in DTS, otherwise the stmmac driver defaults to 64
buckets and initializes the filter incorrectly. As a result, e.g. valid
IPv6 multicast traffic ends up being dropped.

Fixes: 78cd6a9d8e15 ("arm64: dts: Add base stratix 10 dtsi")
Signed-off-by: Aaro Koskinen <aaro.koskinen@nokia.com>
---
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 3 +++
 1 file changed, 3 insertions(+)

	v3: Send the patch using sane SMTP server to preserve the correct
	    formatting.

diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
index 8253a1a9e985..fef7351e9f67 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
@@ -139,6 +139,7 @@
 			clock-names = "stmmaceth";
 			tx-fifo-depth = <16384>;
 			rx-fifo-depth = <16384>;
+			snps,multicast-filter-bins = <256>;
 			status = "disabled";
 		};
 
@@ -154,6 +155,7 @@
 			clock-names = "stmmaceth";
 			tx-fifo-depth = <16384>;
 			rx-fifo-depth = <16384>;
+			snps,multicast-filter-bins = <256>;
 			status = "disabled";
 		};
 
@@ -169,6 +171,7 @@
 			clock-names = "stmmaceth";
 			tx-fifo-depth = <16384>;
 			rx-fifo-depth = <16384>;
+			snps,multicast-filter-bins = <256>;
 			status = "disabled";
 		};
 
-- 
2.17.0
