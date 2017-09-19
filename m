From: Zhiqiang Hou <Zhiqiang.Hou@nxp.com>
Subject: [PATCH 1/5] irqchip/ls-scfg-msi: add LS1012a MSI support
Date: Tue, 19 Sep 2017 17:26:54 +0800
Message-ID: <20170919092658.22482-2-Zhiqiang.Hou@nxp.com>
References: <20170919092658.22482-1-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170919092658.22482-1-Zhiqiang.Hou@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, marc.zyngier@arm.com, robh+dt@kernel.org, mark.rutland@arm.com, bhelgaas@google.com, shawnguo@kernel.org, Mingkai.Hu@nxp.com, Minghuan.Lian@nxp.com, roy.zang@nxp.com
Cc: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>

The ls1012a implement only 1 msi controller, and it is the same as
ls1043a.

Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
---
 .../devicetree/bindings/interrupt-controller/fsl,ls-scfg-msi.txt         | 1 +
 drivers/irqchip/irq-ls-scfg-msi.c                                        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-scfg-msi.txt b/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-scfg-msi.txt
index 49ccabbfa6f3..a4ff93d6b7f3 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-scfg-msi.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-scfg-msi.txt
@@ -8,6 +8,7 @@ Required properties:
               "fsl,ls1043a-msi"
               "fsl,ls1046a-msi"
               "fsl,ls1043a-v1.1-msi"
+              "fsl,ls1012a-msi"
 - msi-controller: indicates that this is a PCIe MSI controller node
 - reg: physical base address of the controller and length of memory mapped.
 - interrupts: an interrupt to the parent interrupt controller.
diff --git a/drivers/irqchip/irq-ls-scfg-msi.c b/drivers/irqchip/irq-ls-scfg-msi.c
index 119f4ef0d421..57e3d900f19e 100644
--- a/drivers/irqchip/irq-ls-scfg-msi.c
+++ b/drivers/irqchip/irq-ls-scfg-msi.c
@@ -316,6 +316,7 @@ static const struct of_device_id ls_scfg_msi_id[] = {
 	{ .compatible = "fsl,1s1021a-msi", .data = &ls1021_msi_cfg},
 	{ .compatible = "fsl,1s1043a-msi", .data = &ls1021_msi_cfg},
 
+	{ .compatible = "fsl,ls1012a-msi", .data = &ls1021_msi_cfg },
 	{ .compatible = "fsl,ls1021a-msi", .data = &ls1021_msi_cfg },
 	{ .compatible = "fsl,ls1043a-msi", .data = &ls1021_msi_cfg },
 	{ .compatible = "fsl,ls1043a-v1.1-msi", .data = &ls1043_v1_1_msi_cfg },
-- 
2.14.1
