From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 0/3] Add Oxalis board support
Date: Mon, 14 Jan 2019 15:50:50 +0530
Message-ID: <20190114102053.16013-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, leoyang.li@nxp.com, robh+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, a.tropschug@ebs-systart.com, m.bittner@ebs-systart.com, amit.kucheria@linaro.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Hello,

This patchset adds Oxalis board support. This board is one of the
96Boards Enterprise Edition platform from EBS-SYSTART GmbH. Below are some
of the key features of this board:

* SoC: NXP Layerscape LS1012A
* RAM: 1GB DDR3L
* PMU: NXP VR5100
* Storage: 64MByte SPI Flash for bootloader and RCW, MicroSD Card, SATA
* Connectivity: 2x Ethernet
* USB: 2x USB3.0

More information about this board can be found in 96Boards product
page: https://www.96boards.org/product/oxalis/

Ethernet and SPI flash are not supported yet!

Thanks,
Mani

Changes in v2:

As per Rob's review:

* Adopted the Oxalis board binding to JSON format.
* Sorted the EBS-SYSTART vendor prefix alphabetically.
* Used the generic node name for audio codec.

Manivannan Sadhasivam (3):
  dt-bindings: vendor-prefixes: Add EBS-SYSTART GmbH Vendor Prefix
  dt-bindings: arm: fsl: Add devicetree binding for Oxalis
  arm64: dts: freescale: Add devicetree for Oxalis

 .../devicetree/bindings/arm/fsl.yaml          |  3 +-
 .../devicetree/bindings/vendor-prefixes.txt   |  1 +
 arch/arm64/boot/dts/freescale/Makefile        |  1 +
 .../boot/dts/freescale/fsl-ls1012a-oxalis.dts | 96 +++++++++++++++++++
 4 files changed, 100 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1012a-oxalis.dts

-- 
2.17.1
