From: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v6 2/3] of/pci: Add helper function to parse max-link-speed from dt
Date: Tue, 11 Oct 2016 12:26:26 +0800
Message-ID: <1476159987-31372-2-git-send-email-shawn.lin@rock-chips.com>
References: <1476159987-31372-1-git-send-email-shawn.lin@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1476159987-31372-1-git-send-email-shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rajat Jain <rajatja-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Wenrui Li <wenrui.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This new helper function could be used by host drivers to
get the limitaion of max link speed provided by dt. If the
property isn't assigned or is invalid, it will return -EINVAL
to the caller.

Signed-off-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---

Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 drivers/of/of_pci.c    | 27 +++++++++++++++++++++++++++
 include/linux/of_pci.h |  7 +++++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/of/of_pci.c b/drivers/of/of_pci.c
index 589b30c..91fd465 100644
--- a/drivers/of/of_pci.c
+++ b/drivers/of/of_pci.c
@@ -120,6 +120,33 @@ int of_get_pci_domain_nr(struct device_node *node)
 EXPORT_SYMBOL_GPL(of_get_pci_domain_nr);
 
 /**
+ * This function will try to find the limitation of link speed by finding
+ * a property called "max-link-speed" of the given device node.
+ *
+ * @node: device tree node with the max link speed information
+ *
+ * Returns the associated max link speed from DT, or a negative value if the
+ * required property is not found or is invalid.
+ */
+int of_get_pci_max_link_speed(struct device_node *node)
+{
+	const __be32 *value;
+	int len;
+	u16 max_link_speed;
+
+	value = of_get_property(node, "max-link-speed", &len);
+	if (!value || len < sizeof(*value))
+		return -EINVAL;
+
+	max_link_speed = (u16)be32_to_cpup(value);
+	if (max_link_speed > 4)
+		return -EINVAL;
+
+	return max_link_speed;
+}
+EXPORT_SYMBOL_GPL(of_get_pci_max_link_speed);
+
+/**
  * of_pci_check_probe_only - Setup probe only mode if linux,pci-probe-only
  *                           is present and valid
  */
diff --git a/include/linux/of_pci.h b/include/linux/of_pci.h
index b969e94..a8946d7 100644
--- a/include/linux/of_pci.h
+++ b/include/linux/of_pci.h
@@ -16,6 +16,7 @@ int of_pci_get_devfn(struct device_node *np);
 int of_irq_parse_and_map_pci(const struct pci_dev *dev, u8 slot, u8 pin);
 int of_pci_parse_bus_range(struct device_node *node, struct resource *res);
 int of_get_pci_domain_nr(struct device_node *node);
+int of_get_pci_max_link_speed(struct device_node *node);
 void of_pci_check_probe_only(void);
 #else
 static inline int of_irq_parse_pci(const struct pci_dev *pdev, struct of_phandle_args *out_irq)
@@ -52,6 +53,12 @@ of_get_pci_domain_nr(struct device_node *node)
 	return -1;
 }
 
+static inline int
+of_get_pci_max_link_speed(struct device_node *node)
+{
+	return -EINVAL;
+}
+
 static inline void of_pci_check_probe_only(void) { }
 #endif
 
-- 
2.3.7


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
