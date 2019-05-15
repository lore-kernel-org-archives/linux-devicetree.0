From: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: [PATCH 3/3] PCI: layerscape: Add LS1028a support
Date: Wed, 15 May 2019 15:27:47 +0800
Message-ID: <20190515072747.39941-3-xiaowei.bao@nxp.com>
References: <20190515072747.39941-1-xiaowei.bao@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190515072747.39941-1-xiaowei.bao@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, leoyang.li@nxp.com, kishon@ti.com, lorenzo.pieralisi@arm.com, arnd@arndb.de, gregkh@linuxfoundation.org, minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com, kstewart@linuxfoundation.org, pombredanne@nexb.com, shawn.lin@rock-chips.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Cc: Xiaowei Bao <xiaowei.bao@nxp.com>
List-Id: devicetree@vger.kernel.org

Add support for the LS1028a PCIe controller.

Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
---
 drivers/pci/controller/dwc/pci-layerscape.c |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index 3a5fa26..8c556e1 100644
--- a/drivers/pci/controller/dwc/pci-layerscape.c
+++ b/drivers/pci/controller/dwc/pci-layerscape.c
@@ -236,6 +236,14 @@ static int ls_pcie_msi_host_init(struct pcie_port *pp)
 	.dw_pcie_ops = &dw_ls_pcie_ops,
 };
 
+static const struct ls_pcie_drvdata ls1028a_drvdata = {
+	.lut_offset = 0x80000,
+	.ltssm_shift = 0,
+	.lut_dbg = 0x407fc,
+	.ops = &ls_pcie_host_ops,
+	.dw_pcie_ops = &dw_ls_pcie_ops,
+};
+
 static const struct ls_pcie_drvdata ls1046_drvdata = {
 	.lut_offset = 0x80000,
 	.ltssm_shift = 24,
@@ -263,6 +271,7 @@ static int ls_pcie_msi_host_init(struct pcie_port *pp)
 static const struct of_device_id ls_pcie_of_match[] = {
 	{ .compatible = "fsl,ls1012a-pcie", .data = &ls1046_drvdata },
 	{ .compatible = "fsl,ls1021a-pcie", .data = &ls1021_drvdata },
+	{ .compatible = "fsl,ls1028a-pcie", .data = &ls1028a_drvdata },
 	{ .compatible = "fsl,ls1043a-pcie", .data = &ls1043_drvdata },
 	{ .compatible = "fsl,ls1046a-pcie", .data = &ls1046_drvdata },
 	{ .compatible = "fsl,ls2080a-pcie", .data = &ls2080_drvdata },
-- 
1.7.1
