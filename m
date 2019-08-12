From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Subject: [PATCH 4/4] arm64: dts: fsl: Remove num-lanes property from PCIe
 nodes
Date: Mon, 12 Aug 2019 04:22:33 +0000
Message-ID: <20190812042435.25102-5-Zhiqiang.Hou@nxp.com>
References: <20190812042435.25102-1-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190812042435.25102-1-Zhiqiang.Hou@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>
Cc: "M.h. Lian" <minghuan.lian@nxp.com>, "Z.q. Hou" <zhiqiang.hou@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>

On FSL Layerscape SoCs, the number of lanes assigned to PCIe
controller is not fixed, it is determined by the selected
SerDes protocol in the RCW (Reset Configuration Word), and
the PCIe link training is completed automatically base on
the selected SerDes protocol, and the link width set-up is
updated by hardware. So the num-lanes is not needed to
specify the link width.

The current num-lanes indicates the max lanes PCIe controller
can support up to, instead of the lanes assigned to the PCIe
controller. This can result in PCIe link training fail after
hot-reset. So remove the num-lanes to avoid set-up to incorrect
link width.

Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi | 1 -
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 3 ---
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 6 ------
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 3 ---
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi | 4 ----
 5 files changed, 17 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi b/arch/arm64/bo=
ot/dts/freescale/fsl-ls1012a.dtsi
index ec6257a5b251..119c597ca867 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
@@ -486,7 +486,6 @@
 			#address-cells =3D <3>;
 			#size-cells =3D <2>;
 			device_type =3D "pci";
-			num-lanes =3D <4>;
 			num-viewport =3D <2>;
 			bus-range =3D <0x0 0xff>;
 			ranges =3D <0x81000000 0x0 0x00000000 0x40 0x00010000 0x0 0x00010000   =
/* downstream I/O */
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi b/arch/arm64/bo=
ot/dts/freescale/fsl-ls1043a.dtsi
index 71d9ed9ff985..c084c7a4b6a6 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
@@ -677,7 +677,6 @@
 			#size-cells =3D <2>;
 			device_type =3D "pci";
 			dma-coherent;
-			num-lanes =3D <4>;
 			num-viewport =3D <6>;
 			bus-range =3D <0x0 0xff>;
 			ranges =3D <0x81000000 0x0 0x00000000 0x40 0x00010000 0x0 0x00010000   =
/* downstream I/O */
@@ -704,7 +703,6 @@
 			#size-cells =3D <2>;
 			device_type =3D "pci";
 			dma-coherent;
-			num-lanes =3D <2>;
 			num-viewport =3D <6>;
 			bus-range =3D <0x0 0xff>;
 			ranges =3D <0x81000000 0x0 0x00000000 0x48 0x00010000 0x0 0x00010000   =
/* downstream I/O */
@@ -731,7 +729,6 @@
 			#size-cells =3D <2>;
 			device_type =3D "pci";
 			dma-coherent;
-			num-lanes =3D <2>;
 			num-viewport =3D <6>;
 			bus-range =3D <0x0 0xff>;
 			ranges =3D <0x81000000 0x0 0x00000000 0x50 0x00010000 0x0 0x00010000   =
/* downstream I/O */
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/bo=
ot/dts/freescale/fsl-ls1046a.dtsi
index b0ef08b090dd..d4c1da3d4bde 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -649,7 +649,6 @@
 			#size-cells =3D <2>;
 			device_type =3D "pci";
 			dma-coherent;
-			num-lanes =3D <4>;
 			num-viewport =3D <8>;
 			bus-range =3D <0x0 0xff>;
 			ranges =3D <0x81000000 0x0 0x00000000 0x40 0x00010000 0x0 0x00010000   =
/* downstream I/O */
@@ -671,7 +670,6 @@
 			reg-names =3D "regs", "addr_space";
 			num-ib-windows =3D <6>;
 			num-ob-windows =3D <8>;
-			num-lanes =3D <2>;
 			status =3D "disabled";
 		};
=20
@@ -687,7 +685,6 @@
 			#size-cells =3D <2>;
 			device_type =3D "pci";
 			dma-coherent;
-			num-lanes =3D <2>;
 			num-viewport =3D <8>;
 			bus-range =3D <0x0 0xff>;
 			ranges =3D <0x81000000 0x0 0x00000000 0x48 0x00010000 0x0 0x00010000   =
/* downstream I/O */
@@ -709,7 +706,6 @@
 			reg-names =3D "regs", "addr_space";
 			num-ib-windows =3D <6>;
 			num-ob-windows =3D <8>;
-			num-lanes =3D <2>;
 			status =3D "disabled";
 		};
=20
@@ -725,7 +721,6 @@
 			#size-cells =3D <2>;
 			device_type =3D "pci";
 			dma-coherent;
-			num-lanes =3D <2>;
 			num-viewport =3D <8>;
 			bus-range =3D <0x0 0xff>;
 			ranges =3D <0x81000000 0x0 0x00000000 0x50 0x00010000 0x0 0x00010000   =
/* downstream I/O */
@@ -747,7 +742,6 @@
 			reg-names =3D "regs", "addr_space";
 			num-ib-windows =3D <6>;
 			num-ob-windows =3D <8>;
-			num-lanes =3D <2>;
 			status =3D "disabled";
 		};
=20
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/bo=
ot/dts/freescale/fsl-ls1088a.dtsi
index dfbead405783..76c87afeba1e 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
@@ -456,7 +456,6 @@
 			#size-cells =3D <2>;
 			device_type =3D "pci";
 			dma-coherent;
-			num-lanes =3D <4>;
 			num-viewport =3D <256>;
 			bus-range =3D <0x0 0xff>;
 			ranges =3D <0x81000000 0x0 0x00000000 0x20 0x00010000 0x0 0x00010000   =
/* downstream I/O */
@@ -482,7 +481,6 @@
 			#size-cells =3D <2>;
 			device_type =3D "pci";
 			dma-coherent;
-			num-lanes =3D <4>;
 			num-viewport =3D <6>;
 			bus-range =3D <0x0 0xff>;
 			ranges =3D <0x81000000 0x0 0x00000000 0x28 0x00010000 0x0 0x00010000   =
/* downstream I/O */
@@ -508,7 +506,6 @@
 			#size-cells =3D <2>;
 			device_type =3D "pci";
 			dma-coherent;
-			num-lanes =3D <8>;
 			num-viewport =3D <6>;
 			bus-range =3D <0x0 0xff>;
 			ranges =3D <0x81000000 0x0 0x00000000 0x30 0x00010000 0x0 0x00010000   =
/* downstream I/O */
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi b/arch/arm64/bo=
ot/dts/freescale/fsl-ls208xa.dtsi
index 64101c9962ce..7a0be8eaa84a 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
@@ -639,7 +639,6 @@
 			#size-cells =3D <2>;
 			device_type =3D "pci";
 			dma-coherent;
-			num-lanes =3D <4>;
 			num-viewport =3D <6>;
 			bus-range =3D <0x0 0xff>;
 			msi-parent =3D <&its>;
@@ -661,7 +660,6 @@
 			#size-cells =3D <2>;
 			device_type =3D "pci";
 			dma-coherent;
-			num-lanes =3D <4>;
 			num-viewport =3D <6>;
 			bus-range =3D <0x0 0xff>;
 			msi-parent =3D <&its>;
@@ -683,7 +681,6 @@
 			#size-cells =3D <2>;
 			device_type =3D "pci";
 			dma-coherent;
-			num-lanes =3D <8>;
 			num-viewport =3D <256>;
 			bus-range =3D <0x0 0xff>;
 			msi-parent =3D <&its>;
@@ -705,7 +702,6 @@
 			#size-cells =3D <2>;
 			device_type =3D "pci";
 			dma-coherent;
-			num-lanes =3D <4>;
 			num-viewport =3D <6>;
 			bus-range =3D <0x0 0xff>;
 			msi-parent =3D <&its>;
--=20
2.17.1
