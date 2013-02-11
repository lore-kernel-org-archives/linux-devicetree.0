From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH v2 2/4] of/pci: Add of_pci_get_devfn() function
Date: Mon, 11 Feb 2013 09:22:18 +0100
Message-ID: <1360570940-17086-3-git-send-email-thierry.reding@avionic-design.de>
References: <1360570940-17086-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1360570940-17086-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This function can be used to parse the device and function number from a
standard 5-cell PCI resource. PCI_SLOT() and PCI_FUNC() can be used on
the returned value obtain the device and function numbers respectively.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
Changes in v2:
- rename devfn and err variables for clarity

 drivers/of/of_pci.c    | 34 +++++++++++++++++++++++++++++-----
 include/linux/of_pci.h |  1 +
 2 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/of/of_pci.c b/drivers/of/of_pci.c
index 13e37e2..4dd7b9b 100644
--- a/drivers/of/of_pci.c
+++ b/drivers/of/of_pci.c
@@ -5,14 +5,15 @@
 #include <asm/prom.h>
 
 static inline int __of_pci_pci_compare(struct device_node *node,
-				       unsigned int devfn)
+				       unsigned int data)
 {
-	unsigned int size;
-	const __be32 *reg = of_get_property(node, "reg", &size);
+	int devfn;
 
-	if (!reg || size < 5 * sizeof(__be32))
+	devfn = of_pci_get_devfn(node);
+	if (devfn < 0)
 		return 0;
-	return ((be32_to_cpup(&reg[0]) >> 8) & 0xff) == devfn;
+
+	return devfn == data;
 }
 
 struct device_node *of_pci_find_child_device(struct device_node *parent,
@@ -40,3 +41,26 @@ struct device_node *of_pci_find_child_device(struct device_node *parent,
 	return NULL;
 }
 EXPORT_SYMBOL_GPL(of_pci_find_child_device);
+
+/**
+ * of_pci_get_devfn() - Get device and function numbers for a device node
+ * @np: device node
+ *
+ * Parses a standard 5-cell PCI resource and returns an 8-bit value that can
+ * be passed to the PCI_SLOT() and PCI_FUNC() macros to extract the device
+ * and function numbers respectively. On error a negative error code is
+ * returned.
+ */
+int of_pci_get_devfn(struct device_node *np)
+{
+	unsigned int size;
+	const __be32 *reg;
+
+	reg = of_get_property(np, "reg", &size);
+
+	if (!reg || size < 5 * sizeof(__be32))
+		return -EINVAL;
+
+	return (be32_to_cpup(reg) >> 8) & 0xff;
+}
+EXPORT_SYMBOL_GPL(of_pci_get_devfn);
diff --git a/include/linux/of_pci.h b/include/linux/of_pci.h
index bb115de..91ec484 100644
--- a/include/linux/of_pci.h
+++ b/include/linux/of_pci.h
@@ -10,5 +10,6 @@ int of_irq_map_pci(const struct pci_dev *pdev, struct of_irq *out_irq);
 struct device_node;
 struct device_node *of_pci_find_child_device(struct device_node *parent,
 					     unsigned int devfn);
+int of_pci_get_devfn(struct device_node *np);
 
 #endif
-- 
1.8.1.2
