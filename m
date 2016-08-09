From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 2/2] ARM64: zynqmp: Add PCIe node
Date: Tue,  9 Aug 2016 15:40:24 +0200
Message-ID: <5930f26f4b5dd129dce09f0a707817d5cf82fde9.1470750018.git.michal.simek@xilinx.com>
References: <c26e914e5a65f22c2dc19dc2f90b4eb59d51828b.1470750018.git.michal.simek@xilinx.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c26e914e5a65f22c2dc19dc2f90b4eb59d51828b.1470750018.git.michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
In-Reply-To: <c26e914e5a65f22c2dc19dc2f90b4eb59d51828b.1470750018.git.michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
References: <c26e914e5a65f22c2dc19dc2f90b4eb59d51828b.1470750018.git.michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Bharat Kumar Gogada <bharatku-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add PCIe node with prefetchable memory which goes beyond 4GB.

Signed-off-by: Bharat Kumar Gogada <bharatku-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---

Changes in v3:
- New patch to show usage of 2/2 on main amba bus

Changes in v2: None

 arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 39 ++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index d24014765111..fbdd6ab98988 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -193,6 +193,45 @@
 			#size-cells = <0>;
 		};
 
+		pcie: pcie@fd0e0000 {
+			compatible = "xlnx,nwl-pcie-2.11";
+			status = "disabled";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <1>;
+			msi-controller;
+			device_type = "pci";
+			interrupt-parent = <&gic>;
+			interrupts = <0 118 4>,
+				    <0 117 4>,
+				    <0 116 4>,
+				    <0 115 4>,	/* MSI_1 [63...32] */
+				    <0 114 4>;	/* MSI_0 [31...0] */
+			interrupt-names = "misc", "dummy", "intx",
+					  "msi1", "msi0";
+			msi-parent = <&pcie>;
+			reg = <0x0 0xfd0e0000 0x0 0x1000>,
+			      <0x0 0xfd480000 0x0 0x1000>,
+			      <0x80 0x00000000 0x0 0x1000000>;
+			reg-names = "breg", "pcireg", "cfg";
+			ranges = <0x02000000 0x00000000 0xe0000000 0x00000000
+				  0xe0000000 0x00000000 0x10000000
+				  /* non-prefetchable memory */
+				  0x43000000 0x00000006 0x00000000 0x00000006
+				  0x00000000 0x00000002 0x00000000>;
+				  /* prefetchable memory */
+			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
+			interrupt-map = <0x0 0x0 0x0 0x1 &pcie_intc 0x1>,
+					<0x0 0x0 0x0 0x2 &pcie_intc 0x2>,
+					<0x0 0x0 0x0 0x3 &pcie_intc 0x3>,
+					<0x0 0x0 0x0 0x4 &pcie_intc 0x4>;
+			pcie_intc: legacy-interrupt-controller {
+				interrupt-controller;
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+			};
+		};
+
 		sata: ahci@fd0c0000 {
 			compatible = "ceva,ahci-1v84";
 			status = "disabled";
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
