From: Bharat Bhushan <Bharat.Bhushan-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH] RM64: dts: ls208xa: Add iommu-map property for pci
Date: Thu, 31 Aug 2017 14:53:44 +0530
Message-ID: <1504171424-15536-1-git-send-email-Bharat.Bhushan@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ark.rutland-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org, Gang.Liu-3arQi8VN3Tc@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org
Cc: Bharat Bhushan <Bharat.Bhushan-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds iommu-map property for PCIe, which enables
SMMU for these devices on LS208xA devices.

Signed-off-by: Bharat Bhushan <Bharat.Bhushan-3arQi8VN3Tc@public.gmane.org>
---
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
index 94cdd30..67cf605 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
@@ -606,6 +606,7 @@
 			num-lanes = <4>;
 			bus-range = <0x0 0xff>;
 			msi-parent = <&its>;
+			iommu-map = <0 &smmu 0 1>;	/* This is fixed-up by u-boot */
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
 			interrupt-map = <0000 0 0 1 &gic 0 0 0 109 4>,
@@ -627,6 +628,7 @@
 			num-lanes = <4>;
 			bus-range = <0x0 0xff>;
 			msi-parent = <&its>;
+			iommu-map = <0 &smmu 0 1>;	/* This is fixed-up by u-boot */
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
 			interrupt-map = <0000 0 0 1 &gic 0 0 0 114 4>,
@@ -648,6 +650,7 @@
 			num-lanes = <8>;
 			bus-range = <0x0 0xff>;
 			msi-parent = <&its>;
+			iommu-map = <0 &smmu 0 1>;	/* This is fixed-up by u-boot */
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
 			interrupt-map = <0000 0 0 1 &gic 0 0 0 119 4>,
@@ -669,6 +672,7 @@
 			num-lanes = <4>;
 			bus-range = <0x0 0xff>;
 			msi-parent = <&its>;
+			iommu-map = <0 &smmu 0 1>;	/* This is fixed-up by u-boot */
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
 			interrupt-map = <0000 0 0 1 &gic 0 0 0 124 4>,
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
