From: Lokesh Vutla <lokeshvutla-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 4/6] ARM: dts: keystone-k2g: add MMC0 and MMC1 nodes
Date: Tue, 1 Aug 2017 10:11:17 +0530
Message-ID: <20170801044119.16201-5-lokeshvutla@ti.com>
References: <20170801044119.16201-1-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170801044119.16201-1-lokeshvutla-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Linux ARM Mailing List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Device Tree Mailing List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>, Keerthy <j-keerthy-l0cyMroinI0@public.gmane.org>, Lokesh Vutla <lokeshvutla-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add device tree nodes for MMC0 and MMC1 pesent
on 66AK2G device.

Signed-off-by: Lokesh Vutla <lokeshvutla-l0cyMroinI0@public.gmane.org>
[nsekhar-l0cyMroinI0@public.gmane.org: fix clock-names for mmc1 node]
Signed-off-by: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
---
 arch/arm/boot/dts/keystone-k2g.dtsi | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/keystone-k2g.dtsi b/arch/arm/boot/dts/keystone-k2g.dtsi
index 3f1fd3df76d5..9ecea2c27d76 100644
--- a/arch/arm/boot/dts/keystone-k2g.dtsi
+++ b/arch/arm/boot/dts/keystone-k2g.dtsi
@@ -276,5 +276,37 @@
 			reg =	<0x027b8000 0x400>;
 			power-domains = <&k2g_pds 0x4f>;
 		};
+
+		mmc0: mmc@23000000 {
+			compatible = "ti,k2g-hsmmc", "ti,omap4-hsmmc";
+			reg = <0x23000000 0x400>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_EDGE_RISING>;
+			dmas = <&edma1 24 0>, <&edma1 25 0>;
+			dma-names = "tx", "rx";
+			bus-width = <4>;
+			ti,needs-special-reset;
+			no-1-8-v;
+			max-frequency = <96000000>;
+			power-domains = <&k2g_pds 0xb>;
+			clocks = <&k2g_clks 0xb 1>, <&k2g_clks 0xb 2>;
+			clock-names = "fck", "mmchsdb_fck";
+			status = "disabled";
+		};
+
+		mmc1: mmc@23100000 {
+			compatible = "ti,k2g-hsmmc", "ti,omap4-hsmmc";
+			reg = <0x23100000 0x400>;
+			interrupts = <GIC_SPI 97 IRQ_TYPE_EDGE_RISING>;
+			dmas = <&edma1 26 0>, <&edma1 27 0>;
+			dma-names = "tx", "rx";
+			bus-width = <8>;
+			ti,needs-special-reset;
+			ti,non-removable;
+			max-frequency = <96000000>;
+			power-domains = <&k2g_pds 0xc>;
+			clocks = <&k2g_clks 0xc 1>, <&k2g_clks 0xc 2>;
+			clock-names = "fck", "mmchsdb_fck";
+			status = "disabled";
+		};
 	};
 };
-- 
2.13.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
