From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [RFC PATCH 4/7] devicetree: Add sysbus fdt populate hooks.
Date: Tue, 06 Apr 2010 22:10:18 -0600
Message-ID: <20100407041018.20274.36307.stgit@angua>
References: <20100407040129.20274.44284.stgit@angua>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100407040129.20274.44284.stgit@angua>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds sysbus specific fdt_populate hooks to fill sysbus
device nodes with 'reg' and 'interrupts' properties, and to
provide 'ranges' properties for correct address translations.

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---

 hw/sysbus.c |   92 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/sysbus.h |    2 +
 2 files changed, 94 insertions(+), 0 deletions(-)

diff --git a/hw/sysbus.c b/hw/sysbus.c
index 1f7f138..861572f 100644
--- a/hw/sysbus.c
+++ b/hw/sysbus.c
@@ -22,11 +22,16 @@
 #include "monitor.h"
 
 static void sysbus_dev_print(Monitor *mon, DeviceState *dev, int indent);
+static int sysbus_fdt_populate_node(DeviceState *dev, void *fdt, int offset);
+static int sysbus_fdt_populate_bus(BusState *bus, void *fdt, int offset);
 
 struct BusInfo system_bus_info = {
     .name       = "System",
     .size       = sizeof(BusState),
     .print_dev  = sysbus_dev_print,
+#ifdef CONFIG_FDT
+    .fdt_populate = sysbus_fdt_populate_bus,
+#endif /* CONFIG_FDT */
 };
 
 void sysbus_connect_irq(SysBusDevice *dev, int n, qemu_irq irq)
@@ -115,6 +120,7 @@ static int sysbus_device_init(DeviceState *dev, DeviceInfo *base)
 void sysbus_register_withprop(SysBusDeviceInfo *info)
 {
     info->qdev.init = sysbus_device_init;
+    info->qdev.fdt_populate = sysbus_fdt_populate_node;
     info->qdev.bus_info = &system_bus_info;
 
     assert(info->qdev.size >= sizeof(SysBusDevice));
@@ -170,3 +176,89 @@ static void sysbus_dev_print(Monitor *mon, DeviceState *dev, int indent)
                        indent, "", s->mmio[i].addr, s->mmio[i].size);
     }
 }
+
+#ifdef CONFIG_FDT
+#include <libfdt.h>
+static int sysbus_fdt_populate_bus(BusState *bus, void *fdt, int offset)
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
+static int sysbus_fdt_populate_node(DeviceState *dev, void *fdt, int offset)
+{
+    SysBusDevice *s = sysbus_from_qdev(dev);
+    SysBusDeviceInfo *info = container_of(dev->info, SysBusDeviceInfo, qdev);
+
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
+    if (info->fdt_populate) {
+        rc = info->fdt_populate(s, fdt, offset);
+        if (rc < 0)
+            return rc;
+    }
+
+    return 0;
+}
+#endif /* CONFIG_FDT */
diff --git a/hw/sysbus.h b/hw/sysbus.h
index 1a8f289..2c43191 100644
--- a/hw/sysbus.h
+++ b/hw/sysbus.h
@@ -26,6 +26,7 @@ struct SysBusDevice {
 };
 
 typedef int (*sysbus_initfn)(SysBusDevice *dev);
+typedef int (*sysbus_fdt_populatefn)(SysBusDevice *dev, void *fdt, int node_offset);
 
 /* Macros to compensate for lack of type inheritance in C.  */
 #define sysbus_from_qdev(dev) ((SysBusDevice *)(dev))
@@ -34,6 +35,7 @@ typedef int (*sysbus_initfn)(SysBusDevice *dev);
 typedef struct {
     DeviceInfo qdev;
     sysbus_initfn init;
+    sysbus_fdt_populatefn fdt_populate;
 } SysBusDeviceInfo;
 
 void sysbus_register_dev(const char *name, size_t size, sysbus_initfn init);
