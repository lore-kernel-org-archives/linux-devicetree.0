From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Subject: [PATCHv3 0/5] PCI: dwc: add prefetchable memory range support
Date: Tue, 18 Dec 2018 04:19:20 +0000
Message-ID: <20181218041956.41809-1-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>, Leo Li <leoyang.li@nxp.com>
Cc: Roy Zang <roy.zang@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>, "Z.q. Hou" <zhiqiang.hou@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>

This patch set is to add prefetchable memory range support, patch 5/5.
Patch 1/5 and 2/5 are to initialize the number of viewport for
layerscape PCIe.
BTW, fix 2 bugs, see patch 3/5 and 4/5.

Hou Zhiqiang (5):
  ARM: dts: ls1021a: add num-viewport property for PCIe DT nodes
  arm64: dts: layerscape: add num-viewport property for PCIe DT nodes
  PCI: dwc: fix potential memory leak
  PCI: dwc: fix 4GiB outbound window size truncated to zero issue
  PCI: dwc: add prefetchable memory range support

 arch/arm/boot/dts/ls1021a.dtsi                |   2 +
 .../arm64/boot/dts/freescale/fsl-ls1012a.dtsi |   1 +
 .../arm64/boot/dts/freescale/fsl-ls1043a.dtsi |   3 +
 .../arm64/boot/dts/freescale/fsl-ls1046a.dtsi |   3 +
 .../arm64/boot/dts/freescale/fsl-ls1088a.dtsi |   3 +
 .../arm64/boot/dts/freescale/fsl-ls208xa.dtsi |   4 +
 .../pci/controller/dwc/pcie-designware-host.c | 135 +++++++++++++-----
 drivers/pci/controller/dwc/pcie-designware.c  |   4 +-
 drivers/pci/controller/dwc/pcie-designware.h  |  11 +-
 9 files changed, 128 insertions(+), 38 deletions(-)

--=20
2.17.1
