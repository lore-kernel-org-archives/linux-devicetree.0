From: Claudiu Manoil <claudiu.manoil@nxp.com>
Subject: [PATCH net-next v4 1/4] arm64: dts: fsl: ls1028a: Add PCI IERC node
 and ENETC endpoints
Date: Tue, 26 Feb 2019 15:42:20 +0200
Message-ID: <1551188543-28867-2-git-send-email-claudiu.manoil@nxp.com>
References: <1551188543-28867-1-git-send-email-claudiu.manoil@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1551188543-28867-1-git-send-email-claudiu.manoil@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, "David S . Miller" <davem@davemloft.net>
Cc: Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org, netdev@vger.kernel.org, alexandru.marginean@nxp.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The LS1028A SoC features a PCI Integrated Endpoint Root Complex
(IERC) defining several integrated PCI devices, including the ENETC
ethernet controller integrated endpoints (IEPs). The IERC implements
ECAM (Enhanced Configuration Access Mechanism) to provide access
to the PCIe config space of the IEPs. This means the the IEPs
(including ENETC) do not support the standard PCIe BARs, instead
the Enhanced Allocation (EA) capability structures in the ECAM space
are used to fix the base addresses in the system, and the PCI
subsystem uses these structures for device enumeration and discovery.
The "ranges" entries contain basic information from these EA capabily
structures required by the kernel for device enumeration.

The current patch also enables the first 2 ENETC PFs (Physiscal
Functions) and the associated VFs (Virtual Functions), 2 VFs for
each PF.  Each of these ENETC PFs has an external ethernet port
on the LS1028A SoC.

Signed-off-by: Alex Marginean <alexandru.marginean@nxp.com>
Signed-off-by: Claudiu Manoil <claudiu.manoil@nxp.com>
---
v2 - none
v3 - none
v4 - changed enetc node names from "pci" to "ethernet" and
     added compatible string (as requested by Rob H.)

 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 35 ++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
index a8cf92a..2896bbc 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
@@ -335,5 +335,40 @@
 				     <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>;
 		};
+
+		pcie@1f0000000 { /* Integrated Endpoint Root Complex */
+			compatible = "pci-host-ecam-generic";
+			reg = <0x01 0xf0000000 0x0 0x100000>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <1>;
+			msi-parent = <&its>;
+			device_type = "pci";
+			bus-range = <0x0 0x0>;
+			dma-coherent;
+			msi-map = <0 &its 0x17 0xe>;
+			iommu-map = <0 &smmu 0x17 0xe>;
+				  /* PF0-6 BAR0 - non-prefetchable memory */
+			ranges = <0x82000000 0x0 0x00000000  0x1 0xf8000000  0x0 0x160000
+				  /* PF0-6 BAR2 - prefetchable memory */
+				  0xc2000000 0x0 0x00000000  0x1 0xf8160000  0x0 0x070000
+				  /* PF0: VF0-1 BAR0 - non-prefetchable memory */
+				  0x82000000 0x0 0x00000000  0x1 0xf81d0000  0x0 0x020000
+				  /* PF0: VF0-1 BAR2 - prefetchable memory */
+				  0xc2000000 0x0 0x00000000  0x1 0xf81f0000  0x0 0x020000
+				  /* PF1: VF0-1 BAR0 - non-prefetchable memory */
+				  0x82000000 0x0 0x00000000  0x1 0xf8210000  0x0 0x020000
+				  /* PF1: VF0-1 BAR2 - prefetchable memory */
+				  0xc2000000 0x0 0x00000000  0x1 0xf8230000  0x0 0x020000>;
+
+			enetc_port0: ethernet@0,0 {
+				compatible = "fsl,enetc";
+				reg = <0x000000 0 0 0 0>;
+			};
+			enetc_port1: ethernet@0,1 {
+				compatible = "fsl,enetc";
+				reg = <0x000100 0 0 0 0>;
+			};
+		};
 	};
 };
-- 
2.7.4
