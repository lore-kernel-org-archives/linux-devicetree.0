From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 06/15] ARM: dts: r8a779x: fix PCI bus dtc warnings
Date: Tue, 21 Mar 2017 21:03:04 -0500
Message-ID: <20170322020313.24338-6-robh@kernel.org>
References: <20170322020313.24338-1-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170322020313.24338-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

dtc recently added PCI bus checks. Fix these warnings.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Cc: Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
Sub-arch maintainers, please apply to your trees unless arm-soc wants 
to take the whole lot.

 arch/arm/boot/dts/r8a7790.dtsi | 16 ++++++----------
 arch/arm/boot/dts/r8a7791.dtsi | 16 ++++++----------
 arch/arm/boot/dts/r8a7794.dtsi | 16 ++++++----------
 3 files changed, 18 insertions(+), 30 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index 6d10450de6d7..c16a37e9fb5d 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -1598,16 +1598,14 @@
 				 0x0800 0 0 1 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH
 				 0x1000 0 0 2 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 
-		usb@0,1 {
+		usb@1,0 {
 			reg = <0x800 0 0 0 0>;
-			device_type = "pci";
 			phys = <&usb0 0>;
 			phy-names = "usb";
 		};
 
-		usb@0,2 {
+		usb@2,0 {
 			reg = <0x1000 0 0 0 0>;
-			device_type = "pci";
 			phys = <&usb0 0>;
 			phy-names = "usb";
 		};
@@ -1654,16 +1652,14 @@
 				 0x0800 0 0 1 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH
 				 0x1000 0 0 2 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
 
-		usb@0,1 {
-			reg = <0x800 0 0 0 0>;
-			device_type = "pci";
+		usb@1,0 {
+			reg = <0x20800 0 0 0 0>;
 			phys = <&usb2 0>;
 			phy-names = "usb";
 		};
 
-		usb@0,2 {
-			reg = <0x1000 0 0 0 0>;
-			device_type = "pci";
+		usb@2,0 {
+			reg = <0x21000 0 0 0 0>;
 			phys = <&usb2 0>;
 			phy-names = "usb";
 		};
diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index 9f9e48511836..a1d8686eaea5 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -1596,16 +1596,14 @@
 				 0x0800 0 0 1 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH
 				 0x1000 0 0 2 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 
-		usb@0,1 {
+		usb@1,0 {
 			reg = <0x800 0 0 0 0>;
-			device_type = "pci";
 			phys = <&usb0 0>;
 			phy-names = "usb";
 		};
 
-		usb@0,2 {
+		usb@2,0 {
 			reg = <0x1000 0 0 0 0>;
-			device_type = "pci";
 			phys = <&usb0 0>;
 			phy-names = "usb";
 		};
@@ -1631,16 +1629,14 @@
 				 0x0800 0 0 1 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH
 				 0x1000 0 0 2 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
 
-		usb@0,1 {
-			reg = <0x800 0 0 0 0>;
-			device_type = "pci";
+		usb@1,0 {
+			reg = <0x10800 0 0 0 0>;
 			phys = <&usb2 0>;
 			phy-names = "usb";
 		};
 
-		usb@0,2 {
-			reg = <0x1000 0 0 0 0>;
-			device_type = "pci";
+		usb@2,0 {
+			reg = <0x11000 0 0 0 0>;
 			phys = <&usb2 0>;
 			phy-names = "usb";
 		};
diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794.dtsi
index 319c1069b7ee..c07495185cc4 100644
--- a/arch/arm/boot/dts/r8a7794.dtsi
+++ b/arch/arm/boot/dts/r8a7794.dtsi
@@ -817,16 +817,14 @@
 				 0x0800 0 0 1 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH
 				 0x1000 0 0 2 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 
-		usb@0,1 {
+		usb@1,0 {
 			reg = <0x800 0 0 0 0>;
-			device_type = "pci";
 			phys = <&usb0 0>;
 			phy-names = "usb";
 		};
 
-		usb@0,2 {
+		usb@2,0 {
 			reg = <0x1000 0 0 0 0>;
-			device_type = "pci";
 			phys = <&usb0 0>;
 			phy-names = "usb";
 		};
@@ -852,16 +850,14 @@
 				 0x0800 0 0 1 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH
 				 0x1000 0 0 2 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
 
-		usb@0,1 {
-			reg = <0x800 0 0 0 0>;
-			device_type = "pci";
+		usb@1,0 {
+			reg = <0x10800 0 0 0 0>;
 			phys = <&usb2 0>;
 			phy-names = "usb";
 		};
 
-		usb@0,2 {
-			reg = <0x1000 0 0 0 0>;
-			device_type = "pci";
+		usb@2,0 {
+			reg = <0x11000 0 0 0 0>;
 			phys = <&usb2 0>;
 			phy-names = "usb";
 		};
-- 
2.10.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
