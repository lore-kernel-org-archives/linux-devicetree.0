From: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: [PATCH v3 00/11] *** SUBJECT HERE ***
Date: Mon,  2 Sep 2019 11:17:05 +0800
Message-ID: <20190902031716.43195-1-xiaowei.bao@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, leoyang.li@nxp.com, kishon@ti.com, lorenzo.pieralisi@arm.com, minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Cc: arnd@arndb.de, gregkh@linuxfoundation.org, zhiqiang.hou@nxp.com, Xiaowei Bao <xiaowei.bao@nxp.com>
List-Id: devicetree@vger.kernel.org

*** BLURB HERE ***

Xiaowei Bao (11):
  PCI: designware-ep: Add multiple PFs support for DWC
  PCI: designware-ep: Add the doorbell mode of MSI-X in EP mode
  PCI: designware-ep: Move the function of getting MSI capability
    forward
  PCI: designware-ep: Modify MSI and MSIX CAP way of finding
  dt-bindings: pci: layerscape-pci: add compatible strings for ls1088a
    and ls2088a
  PCI: layerscape: Fix some format issue of the code
  PCI: layerscape: Modify the way of getting capability with different
    PEX
  PCI: layerscape: Modify the MSIX to the doorbell mode
  PCI: layerscape: Add EP mode support for ls1088a and ls2088a
  arm64: dts: layerscape: Add PCIe EP node for ls1088a
  misc: pci_endpoint_test: Add LS1088a in pci_device_id table

 .../devicetree/bindings/pci/layerscape-pci.txt     |   4 +-
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi     |  31 +++
 drivers/misc/pci_endpoint_test.c                   |   1 +
 drivers/pci/controller/dwc/pci-layerscape-ep.c     | 100 ++++++--
 drivers/pci/controller/dwc/pcie-designware-ep.c    | 255 +++++++++++++++++----
 drivers/pci/controller/dwc/pcie-designware.c       |  59 +++--
 drivers/pci/controller/dwc/pcie-designware.h       |  48 +++-
 7 files changed, 404 insertions(+), 94 deletions(-)

-- 
2.9.5
