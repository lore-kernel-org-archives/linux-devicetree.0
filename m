From: Zhiqiang Hou <Zhiqiang.Hou-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH 0/5] arm64: add ls1012a and ls1046a pcie support
Date: Tue, 19 Sep 2017 17:26:53 +0800
Message-ID: <20170919092658.22482-1-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Mingkai.Hu-3arQi8VN3Tc@public.gmane.org, Minghuan.Lian-3arQi8VN3Tc@public.gmane.org, roy.zang-3arQi8VN3Tc@public.gmane.org
Cc: Hou Zhiqiang <Zhiqiang.Hou-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Hou Zhiqiang <Zhiqiang.Hou-3arQi8VN3Tc@public.gmane.org>

This patch set adds ls1012a MSI and PCIe support, including driver
and device tree nodes. The ls1046a's MSI support patch and PCIe
driver patch has been applied, so only adds the PCIe device tree
nodes.

Hou Zhiqiang (5):
  irqchip/ls-scfg-msi: add LS1012a MSI support
  arm64: dts: ls1012a: Add MSI controller DT node
  PCI: layerscape: Add support for ls1012a
  arm64: dts: ls1012a: Add PCIe controller DT node
  arm64: dts: ls1046a: add PCIe controller DT nodes

 .../interrupt-controller/fsl,ls-scfg-msi.txt       |  1 +
 .../devicetree/bindings/pci/layerscape-pci.txt     |  1 +
 arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi     | 31 +++++++++
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi     | 75 ++++++++++++++++++++++
 drivers/irqchip/irq-ls-scfg-msi.c                  |  1 +
 drivers/pci/dwc/pci-layerscape.c                   |  1 +
 6 files changed, 110 insertions(+)

-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
