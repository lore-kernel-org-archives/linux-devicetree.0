From: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: [PATCHv3 2/2] PCI: layerscape: Add CONFIG_PCI_LAYERSCAPE_EP to build EP/RC separately
Date: Fri, 28 Jun 2019 09:38:26 +0800
Message-ID: <20190628013826.4705-2-xiaowei.bao@nxp.com>
References: <20190628013826.4705-1-xiaowei.bao@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190628013826.4705-1-xiaowei.bao@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, leoyang.li@nxp.com, kishon@ti.com, lorenzo.pieralisi@arm.com, arnd@arndb.de, gregkh@linuxfoundation.org, minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com, kstewart@linuxfoundation.org, pombredanne@nexb.com, shawn.lin@rock-chips.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Cc: Xiaowei Bao <xiaowei.bao@nxp.com>
List-Id: devicetree@vger.kernel.org

Add CONFIG_PCI_LAYERSCAPE_EP to build EP/RC separately.

Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
---
v2:
 - No change.
v3:
 - modify the commit message.

 drivers/pci/controller/dwc/Kconfig  |   20 ++++++++++++++++++--
 drivers/pci/controller/dwc/Makefile |    3 ++-
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
index a6ce1ee..a41ccf5 100644
--- a/drivers/pci/controller/dwc/Kconfig
+++ b/drivers/pci/controller/dwc/Kconfig
@@ -131,13 +131,29 @@ config PCI_KEYSTONE_EP
 	  DesignWare core functions to implement the driver.
 
 config PCI_LAYERSCAPE
-	bool "Freescale Layerscape PCIe controller"
+	bool "Freescale Layerscape PCIe controller - Host mode"
 	depends on OF && (ARM || ARCH_LAYERSCAPE || COMPILE_TEST)
 	depends on PCI_MSI_IRQ_DOMAIN
 	select MFD_SYSCON
 	select PCIE_DW_HOST
 	help
-	  Say Y here if you want PCIe controller support on Layerscape SoCs.
+	  Say Y here if you want to enable PCIe controller support on Layerscape
+	  SoCs to work in Host mode.
+	  This controller can work either as EP or RC. The RCW[HOST_AGT_PEX]
+	  determines which PCIe controller works in EP mode and which PCIe
+	  controller works in RC mode.
+
+config PCI_LAYERSCAPE_EP
+	bool "Freescale Layerscape PCIe controller - Endpoint mode"
+	depends on OF && (ARM || ARCH_LAYERSCAPE || COMPILE_TEST)
+	depends on PCI_ENDPOINT
+	select PCIE_DW_EP
+	help
+	  Say Y here if you want to enable PCIe controller support on Layerscape
+	  SoCs to work in Endpoint mode.
+	  This controller can work either as EP or RC. The RCW[HOST_AGT_PEX]
+	  determines which PCIe controller works in EP mode and which PCIe
+	  controller works in RC mode.
 
 config PCI_HISI
 	depends on OF && (ARM64 || COMPILE_TEST)
diff --git a/drivers/pci/controller/dwc/Makefile b/drivers/pci/controller/dwc/Makefile
index b085dfd..824fde7 100644
--- a/drivers/pci/controller/dwc/Makefile
+++ b/drivers/pci/controller/dwc/Makefile
@@ -8,7 +8,8 @@ obj-$(CONFIG_PCI_EXYNOS) += pci-exynos.o
 obj-$(CONFIG_PCI_IMX6) += pci-imx6.o
 obj-$(CONFIG_PCIE_SPEAR13XX) += pcie-spear13xx.o
 obj-$(CONFIG_PCI_KEYSTONE) += pci-keystone.o
-obj-$(CONFIG_PCI_LAYERSCAPE) += pci-layerscape.o pci-layerscape-ep.o
+obj-$(CONFIG_PCI_LAYERSCAPE) += pci-layerscape.o
+obj-$(CONFIG_PCI_LAYERSCAPE_EP) += pci-layerscape-ep.o
 obj-$(CONFIG_PCIE_QCOM) += pcie-qcom.o
 obj-$(CONFIG_PCIE_ARMADA_8K) += pcie-armada8k.o
 obj-$(CONFIG_PCIE_ARTPEC6) += pcie-artpec6.o
-- 
1.7.1
