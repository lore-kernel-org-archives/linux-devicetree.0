From: Alistair Popple <alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>
Subject: [PATCH v2 2/3] powerpc/powernv: Add sanity checks to pnv_pci_get_{gpu|npu}_dev
Date: Mon,  3 Apr 2017 19:51:43 +1000
Message-ID: <1491213104-24450-2-git-send-email-alistair@popple.id.au>
References: <1491213104-24450-1-git-send-email-alistair@popple.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1491213104-24450-1-git-send-email-alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mhairgrove-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, shailendras-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Alistair Popple <alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The pnv_pci_get_{gpu|npu}_dev functions are used to find associations
between nvlink PCIe devices and standard PCIe devices. However they
lacked basic sanity checking which results in NULL pointer
dereferencing if they are incorrect called can be harder to spot than
an explicit WARN_ON.

Signed-off-by: Alistair Popple <alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
