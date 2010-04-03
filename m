From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH 2/2] qemu: arm-dt: auto-populate the device tree with qdev data
Date: Sat, 03 Apr 2010 01:20:32 -0600
Message-ID: <20100403072021.27923.44909.stgit@angua>
References: <20100403071537.27923.48206.stgit@angua>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100403071537.27923.48206.stgit@angua>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds hooks to the qemu device model to auto-generate device
tree nodes from the registered qemu devices.

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---

 hw/arm_boot.c |    3 +
 hw/qdev.c     |  127 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/qdev.h     |    9 ++++
 hw/sysbus.c   |   84 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 223 insertions(+), 0 deletions(-)

diff --git a/hw/arm_boot.c b/hw/arm_boot.c
index 740a446..33c7356 100644
--- a/hw/arm_boot.c
+++ b/hw/arm_boot.c
@@ -13,6 +13,7 @@
 #include "sysemu.h"
 #include "loader.h"
 #include "elf.h"
+#include "qdev.h"
 
 #ifdef CONFIG_FDT
 #include "device_tree.h"
@@ -211,6 +212,8 @@ static int load_dtb(target_phys_addr_t addr, struct arm_boot_info *binfo)
     }
     qemu_free(filename);
 
+    qdev_fdt_populate(fdt);
+
     rc = qemu_devtree_setprop(fdt, "/memory", "reg", mem_reg_property,
                                sizeof(mem_reg_property));
     if (rc < 0)
diff --git a/hw/qdev.c b/hw/qdev.c
index d19d531..44db7b0 100644
--- a/hw/qdev.c
+++ b/hw/qdev.c
@@ -748,3 +748,130 @@ void do_device_del(Monitor *mon, const QDict *qdict)
     }
     qdev_unplug(dev);
 }
+
+#ifdef CONFIG_FDT
+#include <libfdt.h>
+/* Iterate over entire device list looking for the interrupt parent */
+static int __qbus_fdt_irq_to_number(qemu_irq irq, BusState *bus,
+                                    uint32_t *phandle);
+static int __qbus_fdt_irq_to_number_dev(qemu_irq irq, DeviceState *dev,
+                                        uint32_t *phandle)
+{
+    BusState *child;
+    int rc, i;
+
+    for (i = 0; i < dev->num_gpio_in; i++) {
+        if (irq == qdev_get_gpio_in(dev, i)) {
+            if (phandle)
+                *phandle = (uint64_t)dev;
+            return i;
+        }
+    }
+
+    QLIST_FOREACH(child, &dev->child_bus, sibling) {
+        rc = __qbus_fdt_irq_to_number(irq, child, phandle);
+        if (rc >= 0)
+            return rc;
+    }
+
+    return -1;
+}
+
+static int __qbus_fdt_irq_to_number(qemu_irq irq, BusState *bus,
+                                    uint32_t *phandle)
+{
+    struct DeviceState *dev;
+    int rc;
+
+    QLIST_FOREACH(dev, &bus->children, sibling) {
+        rc = __qbus_fdt_irq_to_number_dev(irq, dev, phandle);
+        if (rc >= 0)
+            return rc;
+    }
+
+    return -1;
+}
+
+int qbus_fdt_irq_to_number(qemu_irq irq, uint32_t *phandle)
+{
+    return __qbus_fdt_irq_to_number(irq, main_system_bus, phandle);
+}
+
+
+
+static int qbus_fdt_add_bus(void *fdt, BusState *bus, int dev_offset);
+static int qdev_fdt_add_device(void *fdt, DeviceState *dev, int bus_offset)
+{
+    BusState *child;
+    int dev_offset, rc;
+    char name[sizeof(dev->info->name) + 9];
+    static int unique = 0;
+
+    sprintf(name, "%s@%x", dev->info->name, unique++);
+    dev_offset = fdt_add_subnode(fdt, bus_offset, name);
+    if (dev_offset < 0) {
+        qemu_error("Couldn't add FDT node for device %s\n", dev->info->name);
+        return dev_offset;
+    }
+
+    rc = fdt_setprop_cell(fdt, dev_offset, "phandle", (uint64_t)dev);
+    if (rc < 0) {
+        qemu_error("Could not add phandle property to device %s\n",
+                   dev->info->name);
+        return rc;
+    }
+
+    if (dev->parent_bus->info->fdt_populate_node) {
+        int rc = dev->parent_bus->info->fdt_populate_node(fdt, dev, dev_offset);
+        if (rc < 0)
+            return rc;
+    }
+
+    QLIST_FOREACH(child, &dev->child_bus, sibling) {
+        int rc = qbus_fdt_add_bus(fdt, child, dev_offset);
+        if (rc < 0)
+            return rc;
+    }
+
+    return dev_offset;
+}
+
+static int qbus_fdt_add_bus(void *fdt, BusState *bus, int dev_offset)
+{
+    struct DeviceState *dev;
+    int bus_offset;
+
+    bus_offset = fdt_add_subnode(fdt, dev_offset, bus->name);
+    if (bus_offset < 0) {
+        qemu_error("Couldn't add FDT node for bus %s\n", bus->name);
+        return bus_offset;
+    }
+
+    if (bus->info->fdt_populate_bus) {
+        int rc = bus->info->fdt_populate_bus(fdt, bus, bus_offset);
+        if (rc < 0)
+            return rc;
+    }
+
+    QLIST_FOREACH(dev, &bus->children, sibling) {
+        int rc = qdev_fdt_add_device(fdt, dev, bus_offset);
+        if (rc < 0)
+            return rc;
+    }
+
+    return bus_offset;
+}
+
+int qdev_fdt_populate(void *fdt)
+{
+    int offset = fdt_path_offset(fdt, "/");
+    if (offset < 0)
+        return offset;
+
+    if (main_system_bus)
+        qbus_fdt_add_bus(fdt, main_system_bus, offset);
+
+    return offset;
+}
+#endif /* CONFIG_FDT */
+
diff --git a/hw/qdev.h b/hw/qdev.h
index 41642ee..9947bda 100644
--- a/hw/qdev.h
+++ b/hw/qdev.h
@@ -43,10 +43,14 @@ struct DeviceState {
 };
 
 typedef void (*bus_dev_printfn)(Monitor *mon, DeviceState *dev, int indent);
+typedef int (*fdt_populate_busfn)(void *fdt, BusState *bus, int offset);
+typedef int (*fdt_populate_devicefn)(void *fdt, DeviceState *dev, int offset);
 struct BusInfo {
     const char *name;
     size_t size;
     bus_dev_printfn print_dev;
+    fdt_populate_devicefn fdt_populate_node;
+    fdt_populate_busfn fdt_populate_bus;
     Property *props;
 };
 
@@ -272,4 +276,9 @@ void qdev_prop_set_compat(DeviceState *dev);
 /* This is a nasty hack to allow passing a NULL bus to qdev_create.  */
 extern struct BusInfo system_bus_info;
 
+#ifdef CONFIG_FDT
+int qbus_fdt_irq_to_number(qemu_irq irq, uint32_t *phandle);
+int qdev_fdt_populate(void *fdt);
+#endif
+
 #endif
diff --git a/hw/sysbus.c b/hw/sysbus.c
index 1f7f138..666f93f 100644
--- a/hw/sysbus.c
+++ b/hw/sysbus.c
@@ -22,11 +22,17 @@
 #include "monitor.h"
 
 static void sysbus_dev_print(Monitor *mon, DeviceState *dev, int indent);
+static int sysbus_fdt_populate_node(void *fdt, DeviceState *dev, int offset);
+static int sysbus_fdt_populate_bus(void *fdt, BusState *bus, int offset);
 
 struct BusInfo system_bus_info = {
     .name       = "System",
     .size       = sizeof(BusState),
     .print_dev  = sysbus_dev_print,
+#ifdef CONFIG_FDT
+    .fdt_populate_node = sysbus_fdt_populate_node,
+    .fdt_populate_bus = sysbus_fdt_populate_bus,
+#endif /* CONFIG_FDT */
 };
 
 void sysbus_connect_irq(SysBusDevice *dev, int n, qemu_irq irq)
@@ -170,3 +176,81 @@ static void sysbus_dev_print(Monitor *mon, DeviceState *dev, int indent)
                        indent, "", s->mmio[i].addr, s->mmio[i].size);
     }
 }
+
+#ifdef CONFIG_FDT
+#include <libfdt.h>
+static int sysbus_fdt_populate_bus(void *fdt, BusState *bus, int offset)
+{
+    int rc;
+
+    rc = fdt_setprop_string(fdt, offset, "compatible", "simple-bus");
+    if (rc < 0)
+        return rc;
+
+    rc = fdt_setprop_cell(fdt, offset, "#address-cells", 1);
+    if (rc < 0)
+        return rc;
+    rc = fdt_setprop_cell(fdt, offset, "#size-cells", 1);
+    if (rc < 0)
+        return rc;
+    rc = fdt_setprop(fdt, offset, "ranges", NULL, 0);
+    if (rc < 0)
+        return rc;
+    return 0;
+}
+
+static int sysbus_fdt_populate_node(void *fdt, DeviceState *dev, int offset)
+{
+    SysBusDevice *s = sysbus_from_qdev(dev);
+    uint32_t reg_data[s->num_mmio * 2]; /* one cell each address and size */
+    uint32_t irq_data[s->num_irq];
+    uint32_t *pos;
+    uint32_t phandle;
+    int i, rc;
+
+    /* Create 'reg' property */
+    pos = reg_data;
+    for (i = 0; i < s->num_mmio; i++) {
+        /* By convention, the name is appended with '@<first reg addr>' */
+        if (i == 0) {
+            char n[sizeof(dev->info->name) + 10];
+            sprintf(n, "%s@%x", dev->info->name, (uint32_t)s->mmio[i].addr);
+            rc = fdt_set_name(fdt, offset, n);
+            if (rc < 0)
+                return rc;
+        }
+        *pos++ = cpu_to_be32(s->mmio[i].addr);
+        *pos++ = cpu_to_be32(s->mmio[i].size);
+    }
+    rc = fdt_setprop(fdt, offset, "reg", reg_data, sizeof(reg_data));
+    if (rc < 0)
+        return rc;
+
+    /* Is this an interrupt controller? */
+    if (dev->num_gpio_in) {
+        rc = fdt_setprop(fdt, offset, "interrupt-controller", NULL, 0);
+        if (rc < 0)
+            return rc;
+        rc = fdt_setprop_cell(fdt, offset, "#interrupt-cells", 1);
+        if (rc < 0)
+            return rc;
+    }
+
+    /* Create 'interrupts' property */
+    phandle = 0;
+    pos = irq_data;
+    for (i = 0; i < s->num_irq; i++) {
+        *pos++ = cpu_to_be32(qbus_fdt_irq_to_number(*s->irqp[i], &phandle));
+    }
+    if (phandle) {
+        rc = fdt_setprop_cell(fdt, offset, "interrupt-parent", phandle);
+        if (rc < 0)
+            return rc;
+        rc = fdt_setprop(fdt, offset, "interrupts", irq_data, sizeof(irq_data));
+        if (rc < 0)
+            return rc;
+    }
+
+    return 0;
+}
+#endif /* CONFIG_FDT */
