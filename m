From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 3/3] arm64: dts: marvell: enable MSI for PCIe on Armada 7K/8K
Date: Tue, 30 Aug 2016 14:57:10 +0200
Message-ID: <1472561830-20932-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1472561830-20932-1-git-send-email-thomas.petazzoni@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472561830-20932-1-git-send-email-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joao Pinto <jpinto-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pratyush Anand <pratyush.anand-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Shadi Ammouri <shadi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This commit adds a reference to the appropriate MSI controller in the
description of the PCIe controllers on Marvel Armada 7K and 8K
platforms.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
Please only apply once the DT binding and the driver change have been
accepted.

 arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi | 3 +++
 arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi  | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi b/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
index ceb83b0..ff469e1 100644
--- a/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
@@ -177,6 +177,7 @@
 			#interrupt-cells = <1>;
 			device_type = "pci";
 			dma-coherent;
+			msi-parent = <&gic_v2m0>;
 
 			bus-range = <0 0xff>;
 			ranges =
@@ -202,6 +203,7 @@
 			#interrupt-cells = <1>;
 			device_type = "pci";
 			dma-coherent;
+			msi-parent = <&gic_v2m0>;
 
 			bus-range = <0 0xff>;
 			ranges =
@@ -228,6 +230,7 @@
 			#interrupt-cells = <1>;
 			device_type = "pci";
 			dma-coherent;
+			msi-parent = <&gic_v2m0>;
 
 			bus-range = <0 0xff>;
 			ranges =
diff --git a/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi b/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi
index 2d863f2..43cecf0 100644
--- a/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi
@@ -177,6 +177,7 @@
 			#interrupt-cells = <1>;
 			device_type = "pci";
 			dma-coherent;
+			msi-parent = <&gic_v2m0>;
 
 			bus-range = <0 0xff>;
 			ranges =
@@ -202,6 +203,7 @@
 			#interrupt-cells = <1>;
 			device_type = "pci";
 			dma-coherent;
+			msi-parent = <&gic_v2m0>;
 
 			bus-range = <0 0xff>;
 			ranges =
@@ -228,6 +230,7 @@
 			#interrupt-cells = <1>;
 			device_type = "pci";
 			dma-coherent;
+			msi-parent = <&gic_v2m0>;
 
 			bus-range = <0 0xff>;
 			ranges =
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
