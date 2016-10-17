From: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 1/3] arm64/dts: Add SMMUs to Juno
Date: Mon, 17 Oct 2016 13:13:34 +0100
Message-ID: <acf4f770eab43fec8c5b6e9cddb6dd0defc52138.1476706244.git.robin.murphy@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Juno has seperate MMU-401 instances in front of the DMA-330, both HDLCD
controllers, the USB host controller, the PCIe root complex, and the
CoreSight ETR. Since there is still work to do to make all the relevant
subsystems interact nicely with the presence of an IOMMU, add the nodes
to aid develompent and testing but leave them disabled by default to
avoid nasty surprises.

CC: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
CC: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
CC: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Signed-off-by: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm64/boot/dts/arm/juno-base.dtsi | 80 ++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
index 334271a25f70..100810a8b929 100644
--- a/arch/arm64/boot/dts/arm/juno-base.dtsi
+++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
@@ -29,6 +29,28 @@
 		clock-names = "apb_pclk";
 	};
 
+	smmu_pcie: iommu@2b500000 {
+		compatible = "arm,mmu-401", "arm,smmu-v1";
+		reg = <0x0 0x2b500000 0x0 0x10000>;
+		interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+		#iommu-cells = <1>;
+		#global-interrupts = <1>;
+		dma-coherent;
+		status = "disabled";
+	};
+
+	smmu_etr: iommu@2b600000 {
+		compatible = "arm,mmu-401", "arm,smmu-v1";
+		reg = <0x0 0x2b600000 0x0 0x10000>;
+		interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
+		#iommu-cells = <1>;
+		#global-interrupts = <1>;
+		dma-coherent;
+		status = "disabled";
+	};
+
 	gic: interrupt-controller@2c010000 {
 		compatible = "arm,gic-400", "arm,cortex-a15-gic";
 		reg = <0x0 0x2c010000 0 0x1000>,
@@ -146,6 +168,7 @@
 	etr@20070000 {
 		compatible = "arm,coresight-tmc", "arm,primecell";
 		reg = <0 0x20070000 0 0x1000>;
+		iommus = <&smmu_etr 0>;
 
 		clocks = <&soc_smc50mhz>;
 		clock-names = "apb_pclk";
@@ -404,6 +427,8 @@
 				<0 0 0 4 &gic 0 0 0 139 4>;
 		msi-parent = <&v2m_0>;
 		status = "disabled";
+		iommu-map-mask = <0x0>;	/* RC has no means to output PCI RID */
+		iommu-map = <0x0 &smmu_pcie 0x0 0x1>;
 	};
 
 	scpi {
@@ -484,6 +509,48 @@
 
 	/include/ "juno-clocks.dtsi"
 
+	smmu_dma: iommu@7fb00000 {
+		compatible = "arm,mmu-401", "arm,smmu-v1";
+		reg = <0x0 0x7fb00000 0x0 0x10000>;
+		interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+		#iommu-cells = <1>;
+		#global-interrupts = <1>;
+		dma-coherent;
+		status = "disabled";
+	};
+
+	smmu_hdlcd1: iommu@7fb10000 {
+		compatible = "arm,mmu-401", "arm,smmu-v1";
+		reg = <0x0 0x7fb10000 0x0 0x10000>;
+		interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
+		#iommu-cells = <1>;
+		#global-interrupts = <1>;
+		status = "disabled";
+	};
+
+	smmu_hdlcd0: iommu@7fb20000 {
+		compatible = "arm,mmu-401", "arm,smmu-v1";
+		reg = <0x0 0x7fb20000 0x0 0x10000>;
+		interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+		#iommu-cells = <1>;
+		#global-interrupts = <1>;
+		status = "disabled";
+	};
+
+	smmu_usb: iommu@7fb30000 {
+		compatible = "arm,mmu-401", "arm,smmu-v1";
+		reg = <0x0 0x7fb30000 0x0 0x10000>;
+		interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
+		#iommu-cells = <1>;
+		#global-interrupts = <1>;
+		dma-coherent;
+		status = "disabled";
+	};
+
 	dma@7ff00000 {
 		compatible = "arm,pl330", "arm,primecell";
 		reg = <0x0 0x7ff00000 0 0x1000>;
@@ -499,6 +566,15 @@
 			     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
+		iommus = <&smmu_dma 0>,
+			 <&smmu_dma 1>,
+			 <&smmu_dma 2>,
+			 <&smmu_dma 3>,
+			 <&smmu_dma 4>,
+			 <&smmu_dma 5>,
+			 <&smmu_dma 6>,
+			 <&smmu_dma 7>,
+			 <&smmu_dma 8>;
 		clocks = <&soc_faxiclk>;
 		clock-names = "apb_pclk";
 	};
@@ -507,6 +583,7 @@
 		compatible = "arm,hdlcd";
 		reg = <0 0x7ff50000 0 0x1000>;
 		interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
+		iommus = <&smmu_hdlcd1 0>;
 		clocks = <&scpi_clk 3>;
 		clock-names = "pxlclk";
 
@@ -521,6 +598,7 @@
 		compatible = "arm,hdlcd";
 		reg = <0 0x7ff60000 0 0x1000>;
 		interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+		iommus = <&smmu_hdlcd0 0>;
 		clocks = <&scpi_clk 3>;
 		clock-names = "pxlclk";
 
@@ -574,6 +652,7 @@
 		compatible = "generic-ohci";
 		reg = <0x0 0x7ffb0000 0x0 0x10000>;
 		interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
+		iommus = <&smmu_usb 0>;
 		clocks = <&soc_usb48mhz>;
 	};
 
@@ -581,6 +660,7 @@
 		compatible = "generic-ehci";
 		reg = <0x0 0x7ffc0000 0x0 0x10000>;
 		interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+		iommus = <&smmu_usb 0>;
 		clocks = <&soc_usb48mhz>;
 	};
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
