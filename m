From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 10/11] arm64: dts: marvell: remove *-clock-output-names on cp110
Date: Wed, 31 May 2017 15:41:54 +0200
Message-ID: <161fdab8848052b8cd6e2ef630c1a2bbab6532d5.1496237893.git-series.gregory.clement@free-electrons.com>
References: <cover.d3a417499f4e5f039deaa27832bf6eccdd090a6f.1496237893.git-series.gregory.clement@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.d3a417499f4e5f039deaa27832bf6eccdd090a6f.1496237893.git-series.gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
In-Reply-To: <cover.d3a417499f4e5f039deaa27832bf6eccdd090a6f.1496237893.git-series.gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
References: <cover.d3a417499f4e5f039deaa27832bf6eccdd090a6f.1496237893.git-series.gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Kostya Porotchkin <kostap-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Neta Zur Hershkovits <neta-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Marcin Wojtas <mw-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>, Omri Itach <omrii-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Shadi Ammouri <shadi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The *-clock-output-names of the cp110-system-controller0 node are not
used anymore, so remove them.

Reviewed-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi | 13 +-------------
 arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi  | 13 +-------------
 2 files changed, 26 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi b/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
index 59259270964c..a0f57a8e5dcb 100644
--- a/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
@@ -101,19 +101,6 @@
 					     "syscon";
 				reg = <0x440000 0x1000>;
 				#clock-cells = <2>;
-				core-clock-output-names =
-					"cpm-apll", "cpm-ppv2-core", "cpm-eip",
-					"cpm-core", "cpm-nand-core";
-				gate-clock-output-names =
-					"cpm-audio", "cpm-communit", "cpm-nand",
-					"cpm-ppv2", "cpm-sdio", "cpm-mg-domain",
-					"cpm-mg-core", "cpm-xor1", "cpm-xor0",
-					"cpm-gop-dp", "none", "cpm-pcie_x10",
-					"cpm-pcie_x11", "cpm-pcie_x4", "cpm-pcie-xor",
-					"cpm-sata", "cpm-sata-usb", "cpm-main",
-					"cpm-gop", "none", "none",
-					"cpm-slow-io", "cpm-usb3h0", "cpm-usb3h1",
-					"cpm-usb3dev", "cpm-eip150", "cpm-eip197";
 			};
 
 			cpm_rtc: rtc@284000 {
diff --git a/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi b/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi
index 046d3fe53cda..9584bc8d8b3f 100644
--- a/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi
@@ -108,19 +108,6 @@
 					     "syscon";
 				reg = <0x440000 0x1000>;
 				#clock-cells = <2>;
-				core-clock-output-names =
-					"cps-apll", "cps-ppv2-core", "cps-eip",
-					"cps-core", "cps-nand-core";
-				gate-clock-output-names =
-					"cps-audio", "cps-communit", "cps-nand",
-					"cps-ppv2", "cps-sdio", "cps-mg-domain",
-					"cps-mg-core", "cps-xor1", "cps-xor0",
-					"cps-gop-dp", "none", "cps-pcie_x10",
-					"cps-pcie_x11", "cps-pcie_x4", "cps-pcie-xor",
-					"cps-sata", "cps-sata-usb", "cps-main",
-					"cps-gop", "none", "none",
-					"cps-slow-io", "cps-usb3h0", "cps-usb3h1",
-					"cps-usb3dev", "cps-eip150", "cps-eip197";
 			};
 
 			cps_sata0: sata@540000 {
-- 
git-series 0.9.1
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
