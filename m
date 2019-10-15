From: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: [PATCH v2 0/6] Add the Mobiveil EP and Layerscape Gen4 EP driver support
Date: Tue, 15 Oct 2019 16:36:56 +0800
Message-ID: <20191015083702.21792-1-xiaowei.bao@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhiqiang.Hou@nxp.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, leoyang.li@nxp.com, kishon@ti.com, lorenzo.pieralisi@arm.com, Minghuan.Lian@nxp.com, andrew.murray@arm.com, mingkai.hu@nxp.com, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Xiaowei Bao <xiaowei.bao@nxp.com>
List-Id: devicetree@vger.kernel.org

This patch set are for adding Mobiveil EP driver and adding PCIe Gen4
EP driver of NXP Layerscape platform.

This patch set depends on:
https://patchwork.kernel.org/project/linux-pci/list/?series=159139

Xiaowei Bao (6):
  PCI: mobiveil: Add the EP driver support
  dt-bindings: Add DT binding for PCIE GEN4 EP of the layerscape
  PCI: mobiveil: Add PCIe Gen4 EP driver for NXP Layerscape SoCs
  PCI: mobiveil: Add workaround for unsupported request error
  arm64: dts: lx2160a: Add PCIe EP node
  misc: pci_endpoint_test: Add the layerscape PCIe GEN4 EP device
    support

 .../bindings/pci/layerscape-pcie-gen4.txt          |  27 +-
 MAINTAINERS                                        |   3 +
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi     |  56 ++
 drivers/misc/pci_endpoint_test.c                   |   2 +
 drivers/pci/controller/mobiveil/Kconfig            |  22 +-
 drivers/pci/controller/mobiveil/Makefile           |   2 +
 .../controller/mobiveil/pcie-layerscape-gen4-ep.c  | 169 ++++++
 drivers/pci/controller/mobiveil/pcie-mobiveil-ep.c | 569 +++++++++++++++++++++
 drivers/pci/controller/mobiveil/pcie-mobiveil.c    |  99 +++-
 drivers/pci/controller/mobiveil/pcie-mobiveil.h    |  72 +++
 10 files changed, 1009 insertions(+), 12 deletions(-)
 create mode 100644 drivers/pci/controller/mobiveil/pcie-layerscape-gen4-ep.c
 create mode 100644 drivers/pci/controller/mobiveil/pcie-mobiveil-ep.c

-- 
2.9.5
