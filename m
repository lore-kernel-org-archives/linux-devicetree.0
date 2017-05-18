From: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH] arm64: dts: juno: Enable some SMMUs
Date: Thu, 18 May 2017 13:23:36 +0100
Message-ID: <eeb81dbbd7ddfbbccb961c0f20c5cb90f120e89f.1495110010.git.robin.murphy@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: liviu.dudau-5wv7dgnIgG8@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, sudeep.holla-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

The IOMMU-backed DMA API support has now been in place for a while and
proven stable, so there's no real need to keep most of Juno's SMMUs
disabled. The USB, HDLCDs, and CoreSight ETR all just need to map RAM
buffers for DMA - enabling their SMMUs obviates CPU bounce buffering for
USB's streaming DMA to the upper memory bank, and lets the other two
allocate their relatively large coherent buffers without pressuring CMA.

Some more software work is still needed for the DMA-330 and PCIe before
those can accommodate SMMU translation correctly in all cases, so we
leave those alone for now.

Signed-off-by: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm64/boot/dts/arm/juno-base.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
index bfe7d683a42e..02aea43238fc 100644
--- a/arch/arm64/boot/dts/arm/juno-base.dtsi
+++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
@@ -53,7 +53,6 @@
 		#global-interrupts = <1>;
 		dma-coherent;
 		power-domains = <&scpi_devpd 0>;
-		status = "disabled";
 	};
 
 	gic: interrupt-controller@2c010000 {
@@ -546,7 +545,6 @@
 			     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
 		#iommu-cells = <1>;
 		#global-interrupts = <1>;
-		status = "disabled";
 	};
 
 	smmu_hdlcd0: iommu@7fb20000 {
@@ -556,7 +554,6 @@
 			     <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
 		#iommu-cells = <1>;
 		#global-interrupts = <1>;
-		status = "disabled";
 	};
 
 	smmu_usb: iommu@7fb30000 {
@@ -567,7 +564,6 @@
 		#iommu-cells = <1>;
 		#global-interrupts = <1>;
 		dma-coherent;
-		status = "disabled";
 	};
 
 	dma@7ff00000 {
-- 
2.12.2.dirty

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
