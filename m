From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Subject: [PATCH 0/4] Layerscape: Remove num-lanes property from PCIe nodes
Date: Mon, 12 Aug 2019 04:22:11 +0000
Message-ID: <20190812042435.25102-1-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>
Cc: "M.h. Lian" <minghuan.lian@nxp.com>, "Z.q. Hou" <zhiqiang.hou@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>

On FSL Layerscape SoCs, the number of lanes assigned to PCIe
controller is not fixed, it is determined by the selected
SerDes protocol. The current num-lanes indicates the max lanes
PCIe controller can support up to, instead of the lanes assigned
to the PCIe controller. This can result in PCIe link training fail
after hot-reset.

Hou Zhiqiang (4):
  dt-bingings: PCI: Remove the num-lanes from Required properties
  PCI: dwc: Return directly when num-lanes is not found
  ARM: dts: ls1021a: Remove num-lanes property from PCIe nodes
  arm64: dts: fsl: Remove num-lanes property from PCIe nodes

 Documentation/devicetree/bindings/pci/designware-pcie.txt | 1 -
 arch/arm/boot/dts/ls1021a.dtsi                            | 2 --
 arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi            | 1 -
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi            | 3 ---
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi            | 6 ------
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi            | 3 ---
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi            | 4 ----
 drivers/pci/controller/dwc/pcie-designware.c              | 6 ++++--
 8 files changed, 4 insertions(+), 22 deletions(-)

--=20
2.17.1
