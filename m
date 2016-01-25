From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v2 1/2] arm64: dts: move juno pcie-controller to base file
Date: Mon, 25 Jan 2016 15:14:08 +0000
Message-ID: <1453734849-13790-1-git-send-email-sudeep.holla@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The PCIe controller is found on all Juno SoC version. However it's not
functional on R0 due to some hardware bug.

In preparation to add Juno R2 support, this patch moves the
pcie-controller defination to base DTS file. It's marked as disabled by
default and is enabled for Juno R1 explicitly.

Acked-by: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm64/boot/dts/arm/juno-base.dtsi | 22 ++++++++++++++++++++++
 arch/arm64/boot/dts/arm/juno-r1.dts    | 25 ++++---------------------
 2 files changed, 26 insertions(+), 21 deletions(-)

v1->v2:
	- Moved pcie-controller to juno-base.dtsi

diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
index dd5158eb5872..b501721baf77 100644
--- a/arch/arm64/boot/dts/arm/juno-base.dtsi
+++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
@@ -75,6 +75,28 @@
 		};
 	};
 
+	pcie_ctlr: pcie-controller@40000000 {
+		compatible = "arm,juno-r1-pcie", "plda,xpressrich3-axi", "pci-host-ecam-generic";
+		device_type = "pci";
+		reg = <0 0x40000000 0 0x10000000>;	/* ECAM config space */
+		bus-range = <0 255>;
+		linux,pci-domain = <0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		dma-coherent;
+		ranges = <0x01000000 0x00 0x5f800000 0x00 0x5f800000 0x0 0x00800000>,
+			 <0x02000000 0x00 0x50000000 0x00 0x50000000 0x0 0x08000000>,
+			 <0x42000000 0x40 0x00000000 0x40 0x00000000 0x1 0x00000000>;
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0 0 0 1 &gic 0 0 0 136 4>,
+				<0 0 0 2 &gic 0 0 0 137 4>,
+				<0 0 0 3 &gic 0 0 0 138 4>,
+				<0 0 0 4 &gic 0 0 0 139 4>;
+		msi-parent = <&v2m_0>;
+		status = "disabled";
+	};
+
 	scpi {
 		compatible = "arm,scpi";
 		mboxes = <&mailbox 1>;
diff --git a/arch/arm64/boot/dts/arm/juno-r1.dts b/arch/arm64/boot/dts/arm/juno-r1.dts
index 8826f834f54f..d95d9e7e2dc0 100644
--- a/arch/arm64/boot/dts/arm/juno-r1.dts
+++ b/arch/arm64/boot/dts/arm/juno-r1.dts
@@ -172,29 +172,12 @@
 	};
 
 	#include "juno-base.dtsi"
-
-	pcie-controller@40000000 {
-		compatible = "arm,juno-r1-pcie", "plda,xpressrich3-axi", "pci-host-ecam-generic";
-		device_type = "pci";
-		reg = <0 0x40000000 0 0x10000000>;	/* ECAM config space */
-		bus-range = <0 255>;
-		linux,pci-domain = <0>;
-		#address-cells = <3>;
-		#size-cells = <2>;
-		dma-coherent;
-		ranges = <0x01000000 0x00 0x5f800000 0x00 0x5f800000 0x0 0x00800000>,
-			 <0x02000000 0x00 0x50000000 0x00 0x50000000 0x0 0x08000000>,
-			 <0x42000000 0x40 0x00000000 0x40 0x00000000 0x1 0x00000000>;
-		#interrupt-cells = <1>;
-		interrupt-map-mask = <0 0 0 7>;
-		interrupt-map = <0 0 0 1 &gic 0 0 0 136 4>,
-				<0 0 0 2 &gic 0 0 0 137 4>,
-				<0 0 0 3 &gic 0 0 0 138 4>,
-				<0 0 0 4 &gic 0 0 0 139 4>;
-		msi-parent = <&v2m_0>;
-	};
 };
 
 &memtimer {
 	status = "okay";
 };
+
+&pcie_ctlr {
+	status = "okay";
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
