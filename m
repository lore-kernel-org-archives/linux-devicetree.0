From: Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 1/3] ARM: dts: NSP: Add MSI support on PCI
Date: Thu,  5 May 2016 19:29:30 -0400
Message-ID: <1462490972-13566-1-git-send-email-jonmason@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add MSI support to the PCI driver of the Northstar Plus SoC.  This uses
the existing pcie-iproc driver.  So, all that is needed is device tree
entries in the DTS.

Signed-off-by: Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/bcm-nsp.dtsi | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/bcm-nsp.dtsi b/arch/arm/boot/dts/bcm-nsp.dtsi
index def9e78..a44bf29 100644
--- a/arch/arm/boot/dts/bcm-nsp.dtsi
+++ b/arch/arm/boot/dts/bcm-nsp.dtsi
@@ -290,6 +290,18 @@
 		ranges = <0x82000000 0 0x08000000 0x08000000 0 0x8000000>;
 
 		status = "disabled";
+
+		msi-parent = <&msi0>;
+		msi0: msi@18012000 {
+			compatible = "brcm,iproc-msi";
+			msi-controller;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 127 IRQ_TYPE_NONE>,
+				     <GIC_SPI 128 IRQ_TYPE_NONE>,
+				     <GIC_SPI 129 IRQ_TYPE_NONE>,
+				     <GIC_SPI 130 IRQ_TYPE_NONE>;
+			brcm,pcie-msi-inten;
+		};
 	};
 
 	pcie1: pcie@18013000 {
@@ -314,6 +326,18 @@
 		ranges = <0x82000000 0 0x40000000 0x40000000 0 0x8000000>;
 
 		status = "disabled";
+
+		msi-parent = <&msi1>;
+		msi1: msi@18013000 {
+			compatible = "brcm,iproc-msi";
+			msi-controller;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 133 IRQ_TYPE_NONE>,
+				     <GIC_SPI 134 IRQ_TYPE_NONE>,
+				     <GIC_SPI 135 IRQ_TYPE_NONE>,
+				     <GIC_SPI 136 IRQ_TYPE_NONE>;
+			brcm,pcie-msi-inten;
+		};
 	};
 
 	pcie2: pcie@18014000 {
@@ -338,5 +362,17 @@
 		ranges = <0x82000000 0 0x48000000 0x48000000 0 0x8000000>;
 
 		status = "disabled";
+
+		msi-parent = <&msi2>;
+		msi2: msi@18014000 {
+			compatible = "brcm,iproc-msi";
+			msi-controller;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 139 IRQ_TYPE_NONE>,
+				     <GIC_SPI 140 IRQ_TYPE_NONE>,
+				     <GIC_SPI 141 IRQ_TYPE_NONE>,
+				     <GIC_SPI 142 IRQ_TYPE_NONE>;
+			brcm,pcie-msi-inten;
+		};
 	};
 };
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
