From: thor.thayer-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Subject: [PATCH] ARM: dts: Add EMAC AXI settings for Arria10
Date: Thu,  2 Feb 2017 11:09:05 -0600
Message-ID: <1486055345-2894-1-git-send-email-thor.thayer@linux.intel.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, dinh.nguyen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thor.thayer-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <thor.thayer-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>

Add the device tree entries needed to support the EMAC AXI
bus settings on the Arria10 SoCFPGA chip.

Signed-off-by: Thor Thayer <thor.thayer-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
---
 arch/arm/boot/dts/socfpga_arria10.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/socfpga_arria10.dtsi b/arch/arm/boot/dts/socfpga_arria10.dtsi
index f520cbf..f05dd15 100644
--- a/arch/arm/boot/dts/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10.dtsi
@@ -400,6 +400,12 @@
 				};
 		};
 
+		socfpga_axi_setup: stmmac-axi-config {
+			snps,wr_osr_lmt = <0xf>;
+			snps,rd_osr_lmt = <0xf>;
+			snps,blen = <0 0 0 0 16 0 0>;
+		};
+
 		gmac0: ethernet@ff800000 {
 			compatible = "altr,socfpga-stmmac", "snps,dwmac-3.72a", "snps,dwmac";
 			altr,sysmgr-syscon = <&sysmgr 0x44 0>;
@@ -416,6 +422,7 @@
 			clock-names = "stmmaceth";
 			resets = <&rst EMAC0_RESET>;
 			reset-names = "stmmaceth";
+			snps,axi-config = <&socfpga_axi_setup>;
 			status = "disabled";
 		};
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
