Return-Path: <SRS0=9bdO=TN=nvidia.com=mmaddireddy@kernel.org>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: [PATCH V3 27/29] PCI: OF: Add of_pci_get_reset_gpio() to parse reset-gpios from DT
Date: Mon, 13 May 2019 23:37:42 +0530
Message-ID: <20190513180744.16493-28-mmaddireddy@nvidia.com>
In-Reply-To: <20190513180744.16493-1-mmaddireddy@nvidia.com>
References: <20190513180744.16493-1-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: thierry.reding@gmail.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, Manikanta Maddireddy <mmaddireddy@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

This new helper function could be used by host drivers to get the reset
GPIO descriptor. If the property isn't assigned, it will return NULL to
the caller.

Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
---
V3: New patch to add helper function to parse "reset-gpios"

 drivers/pci/of.c       | 18 ++++++++++++++++++
 include/linux/of_pci.h | 10 ++++++++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index 9454c90980c9..2a0282115ff0 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -6,6 +6,7 @@
  */
 #define pr_fmt(fmt)	"PCI: OF: " fmt
 
+#include <linux/gpio/consumer.h>
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
 #include <linux/pci.h>
@@ -224,6 +225,23 @@ int of_pci_get_max_link_speed(struct device_node *node)
 }
 EXPORT_SYMBOL_GPL(of_pci_get_max_link_speed);
 
+/**
+ * of_pci_get_reset_gpio() - Get PCI reset gpio descriptor.
+ *
+ * @node: device node
+ *
+ * Returns PCI reset gpio descriptor from DT, or an ERR_PTR() if the
+ * required property is invalid.
+ */
+struct gpio_desc *of_pci_get_reset_gpio(struct device *dev,
+					struct device_node *node,
+					int dflags, char *label)
+{
+	return devm_gpiod_get_from_of_node(dev, node, "reset-gpios", 0, dflags,
+					   label);
+}
+EXPORT_SYMBOL_GPL(of_pci_get_reset_gpio);
+
 /**
  * of_pci_check_probe_only - Setup probe only mode if linux,pci-probe-only
  *                           is present and valid
diff --git a/include/linux/of_pci.h b/include/linux/of_pci.h
index 21a89c4880fa..230ddc813ef9 100644
--- a/include/linux/of_pci.h
+++ b/include/linux/of_pci.h
@@ -13,6 +13,9 @@ struct device_node;
 struct device_node *of_pci_find_child_device(struct device_node *parent,
 					     unsigned int devfn);
 int of_pci_get_devfn(struct device_node *np);
+struct gpio_desc *of_pci_get_reset_gpio(struct device *dev,
+					struct device_node *np,
+					int dflags, char *label);
 void of_pci_check_probe_only(void);
 #else
 static inline struct device_node *of_pci_find_child_device(struct device_node *parent,
@@ -26,6 +29,13 @@ static inline int of_pci_get_devfn(struct device_node *np)
 	return -EINVAL;
 }
 
+static inline struct gpio_desc *of_pci_get_reset_gpio(struct device *dev,
+						      struct device_node *np,
+						      int dflags, char *label)
+{
+	return -EINVAL;
+}
+
 static inline void of_pci_check_probe_only(void) { }
 #endif
 
-- 
2.17.1
