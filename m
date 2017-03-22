From: Alistair Popple <alistair@popple.id.au>
Subject: [PATCH 2/3] powerpc/powernv: Add sanity checks to pnv_pci_get_{gpu|npu}_dev
Date: Wed, 22 Mar 2017 14:49:32 +1100
Message-ID: <1490154573-22475-2-git-send-email-alistair@popple.id.au>
References: <1490154573-22475-1-git-send-email-alistair@popple.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1490154573-22475-1-git-send-email-alistair@popple.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: mpe@ellerman.id.au
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, mhairgrove@nvidia.com, shailendras@nvidia.com, Alistair Popple <alistair@popple.id.au>
List-Id: devicetree@vger.kernel.org

The pnv_pci_get_{gpu|npu}_dev functions are used to find associations
between nvlink PCIe devices and standard PCIe devices. However they
lacked basic sanity checking which results in NULL pointer
dereferencing if they are incorrectly called which can be harder to
spot than an explicit WARN_ON.

Signed-off-by: Alistair Popple <alistair@popple.id.au>
---
 arch/powerpc/platforms/powernv/npu-dma.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/npu-dma.c b/arch/powerpc/platforms/powernv/npu-dma.c
index 1c383f3..050bd5d 100644
--- a/arch/powerpc/platforms/powernv/npu-dma.c
+++ b/arch/powerpc/platforms/powernv/npu-dma.c
@@ -37,6 +37,12 @@ struct pci_dev *pnv_pci_get_gpu_dev(struct pci_dev *npdev)
 	struct device_node *dn;
 	struct pci_dev *gpdev;

+	if (WARN_ON(!npdev))
+		return NULL;
+
+	if (WARN_ON(!npdev->dev.of_node))
+		return NULL;
+
 	/* Get assoicated PCI device */
 	dn = of_parse_phandle(npdev->dev.of_node, "ibm,gpu", 0);
 	if (!dn)
@@ -55,6 +61,12 @@ struct pci_dev *pnv_pci_get_npu_dev(struct pci_dev *gpdev, int index)
 	struct device_node *dn;
 	struct pci_dev *npdev;

+	if (WARN_ON(!gpdev))
+		return NULL;
+
+	if (WARN_ON(!gpdev->dev.of_node))
+		return NULL;
+
 	/* Get assoicated PCI device */
 	dn = of_parse_phandle(gpdev->dev.of_node, "ibm,npu", index);
 	if (!dn)
--
2.1.4
