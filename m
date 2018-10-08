From: Zhiqiang Hou <Zhiqiang.Hou@nxp.com>
Subject: [PATCH 0/4] dts/layerscape-pci: removed unsuitable compatible string
Date: Mon,  8 Oct 2018 11:14:24 +0800
Message-ID: <20181008031428.25293-1-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, leoyang.li@nxp.com, shawnguo@kernel.org, mark.rutland@arm.com, bhelgaas@google.com, Mingkai.Hu@nxp.com, Minghuan.Lian@nxp.com
Cc: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>

Removed the compatible string "snps,dw-pcie" from FSL layerscape-pci compatible
string list.

Hou Zhiqiang (4):
  doc/layerscape-pci: update the PCIe compatible strings
  doc/layerscape-pci: removed unsuitable compatible string
  dts/arm/ls1021a: Clean PCIe controller compatible strings
  dts/arm64/layerscape: Clean PCIe controller compatible strings

 .../devicetree/bindings/pci/layerscape-pci.txt       |  7 ++++---
 arch/arm/boot/dts/ls1021a.dtsi                       |  4 ++--
 arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi       |  2 +-
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi       |  6 +++---
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi       |  6 +++---
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi       |  6 +++---
 arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi       |  8 ++++----
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi       | 12 ++++--------
 8 files changed, 24 insertions(+), 27 deletions(-)

-- 
2.17.1
