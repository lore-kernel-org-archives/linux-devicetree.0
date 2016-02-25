From: Zhen Lei <thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/2] pci/of: to support explicitly declare interrupt pins unused
Date: Thu, 25 Feb 2016 19:53:27 +0800
Message-ID: <1456401208-10136-1-git-send-email-thunder.leizhen@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-pci <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Zefan Li <lizefan-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Xinwei Hu <huxinwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Tianhong Ding <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Hanjun Guo <guohanjun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Yijing Wang <wangyijing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Zhen Lei <thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Interrupt Pin register is read-only and optional. Some pci devices may use
msi/msix but leave the value of Interrupt Pin non-zero. In this case, the
driver will print information as below:
pci 0000:40:00.0: of_irq_parse_pci() failed with rc=-22

It's easily lead to misinterpret.

Signed-off-by: Zhen Lei <thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
---
 drivers/of/of_pci_irq.c | 43 ++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/drivers/of/of_pci_irq.c b/drivers/of/of_pci_irq.c
index 2306313..a6d51e0 100644
--- a/drivers/of/of_pci_irq.c
+++ b/drivers/of/of_pci_irq.c
@@ -4,6 +4,38 @@
 #include <linux/export.h>

 /**
+ * of_irq_skip_pci - Skip the interrupt pins for a PCI device
+ * @pdev: the device whose interrupt pins may be skipped
+ * @dn: device node of pdev or pdev's ancestral bus
+ *
+ * Interrupt Pin register is read-only and optional. Some pci devices may use
+ * msi/msix but leave the value of Interrupt Pin non-zero. This function give
+ * an opportunity to suppress the warning about of_irq_parse_pci() failed.
+ */
+static int of_irq_skip_pci(const struct pci_dev *pdev,
+			   const struct device_node *dn)
+{
+	const __be32 *skip_mask, *end;
+	u32 addr, mask;
+	int len;
+
+	skip_mask = of_get_property(dn, "interrupt-skip-mask", &len);
+	if (!skip_mask)
+		return 0;
+
+	end = skip_mask + (len / sizeof(__be32));
+	addr = (pdev->bus->number << 16) | (pdev->devfn << 8);
+
+	while (skip_mask < end) {
+		mask = be32_to_cpu(*(skip_mask++));
+		if ((addr & ~mask) == 0)
+			return 1;
+	}
+
+	return 0;
+}
+
+/**
  * of_irq_parse_pci - Resolve the interrupt for a PCI device
  * @pdev:       the device whose interrupt is to be resolved
  * @out_irq:    structure of_irq filled by this function
@@ -30,6 +62,9 @@ int of_irq_parse_pci(const struct pci_dev *pdev, struct of_phandle_args *out_irq
 		rc = of_irq_parse_one(dn, 0, out_irq);
 		if (!rc)
 			return rc;
+
+		if (of_irq_skip_pci(pdev, dn))
+			return -ENODEV;
 	}

 	/* Ok, we don't, time to have fun. Let's start by building up an
@@ -89,9 +124,11 @@ int of_irq_parse_pci(const struct pci_dev *pdev, struct of_phandle_args *out_irq
 	laddr[0] = cpu_to_be32((pdev->bus->number << 16) | (pdev->devfn << 8));
 	laddr[1] = laddr[2] = cpu_to_be32(0);
 	rc = of_irq_parse_raw(laddr, out_irq);
-	if (rc)
-		goto err;
-	return 0;
+	if (!rc)
+		return 0;
+
+	if (of_irq_skip_pci(pdev, ppnode))
+		return -ENODEV;
 err:
 	dev_err(&pdev->dev, "of_irq_parse_pci() failed with rc=%d\n", rc);
 	return rc;
--
2.5.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
