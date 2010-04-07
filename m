From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [RFC PATCH 2/7] devicetree: auto-populate the device tree with qdev
	data
Date: Tue, 06 Apr 2010 22:10:08 -0600
Message-ID: <20100407041007.20274.1368.stgit@angua>
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

This patch adds hooks to the qemu device model to auto-generate device
tree nodes from the registered qemu devices, and calls the device tree
populate hook when booting ARM platforms.

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---

 hw/arm_boot.c |    3 ++
 hw/qdev.c     |   91 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/qdev.h     |    8 +++++
 3 files changed, 102 insertions(+), 0 deletions(-)

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
index d19d531..b177c3d 100644
--- a/hw/qdev.c
+++ b/hw/qdev.c
@@ -748,3 +748,94 @@ void do_device_del(Monitor *mon, const QDict *qdict)
     }
     qdev_unplug(dev);
 }
+
+#ifdef CONFIG_FDT
+#include <libfdt.h>
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
+    if (dev->info->fdt_populate) {
+        int rc = dev->info->fdt_populate(dev, fdt, dev_offset);
+        if (rc < 0) {
+            qemu_error("dev->info->fdt_populate() failed on %s\n",
+                       dev->info->name);
+            return rc;
+        }
+    }
+
+    QLIST_FOREACH(child, &dev->child_bus, sibling) {
+        int rc = qbus_fdt_add_bus(fdt, child, dev_offset);
+        if (rc < 0) {
+            qemu_error("qbus_fdt_add_bus() failed on dev:%s bus:%s\n",
+                       dev->info->name, child->info->name);
+            return rc;
+        }
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
+    if (bus->info->fdt_populate) {
+        int rc = bus->info->fdt_populate(bus, fdt, bus_offset);
+        if (rc < 0) {
+            qemu_error("bus->info->fdt_populate() failed on %s\n",
+                       bus->info->name);
+            return rc;
+        }
+    }
+
+    QLIST_FOREACH(dev, &bus->children, sibling) {
+        int rc = qdev_fdt_add_device(fdt, dev, bus_offset);
+        if (rc < 0) {
+            qemu_error("qbus_fdt_add_device() failed on bus:%s dev:%s\n",
+                       bus->info->name, dev->info->name);
+            return rc;
+        }
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
index 41642ee..d549d43 100644
--- a/hw/qdev.h
+++ b/hw/qdev.h
@@ -43,10 +43,12 @@ struct DeviceState {
 };
 
 typedef void (*bus_dev_printfn)(Monitor *mon, DeviceState *dev, int indent);
+typedef int (*bus_fdt_populatefn)(BusState *bus, void *fdt, int offset);
 struct BusInfo {
     const char *name;
     size_t size;
     bus_dev_printfn print_dev;
+    bus_fdt_populatefn fdt_populate;
     Property *props;
 };
 
@@ -119,6 +121,7 @@ BusState *qdev_get_child_bus(DeviceState *dev, const char *name);
 typedef int (*qdev_initfn)(DeviceState *dev, DeviceInfo *info);
 typedef int (*qdev_event)(DeviceState *dev);
 typedef void (*qdev_resetfn)(DeviceState *dev);
+typedef int (*qdev_fdt_populatefn)(DeviceState *dev, void *fdt, int offset);
 
 struct DeviceInfo {
     const char *name;
@@ -130,6 +133,7 @@ struct DeviceInfo {
 
     /* callbacks */
     qdev_resetfn reset;
+    qdev_fdt_populatefn fdt_populate;
 
     /* device state */
     const VMStateDescription *vmsd;
@@ -272,4 +276,8 @@ void qdev_prop_set_compat(DeviceState *dev);
 /* This is a nasty hack to allow passing a NULL bus to qdev_create.  */
 extern struct BusInfo system_bus_info;
 
+#ifdef CONFIG_FDT
+int qdev_fdt_populate(void *fdt);
+#endif
+
 #endif
