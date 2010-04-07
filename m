From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [RFC PATCH 3/7] devicetree: add helper for determining IRQ properties
	in the device tree
Date: Tue, 06 Apr 2010 22:10:13 -0600
Message-ID: <20100407041013.20274.26545.stgit@angua>
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

This patch adds the qbus_fdt_irq_to_number() helper to determine the
interrupt number and phandle needed for adding the interrupts property
to a device node in the device tree.

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---

 hw/qdev.c |   48 ++++++++++++++++++++++++++++++++++++++++++++++++
 hw/qdev.h |    1 +
 2 files changed, 49 insertions(+), 0 deletions(-)

diff --git a/hw/qdev.c b/hw/qdev.c
index b177c3d..ed68a70 100644
--- a/hw/qdev.c
+++ b/hw/qdev.c
@@ -751,6 +751,54 @@ void do_device_del(Monitor *mon, const QDict *qdict)
 
 #ifdef CONFIG_FDT
 #include <libfdt.h>
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
 static int qbus_fdt_add_bus(void *fdt, BusState *bus, int dev_offset);
 static int qdev_fdt_add_device(void *fdt, DeviceState *dev, int bus_offset)
 {
diff --git a/hw/qdev.h b/hw/qdev.h
index d549d43..84544c7 100644
--- a/hw/qdev.h
+++ b/hw/qdev.h
@@ -277,6 +277,7 @@ void qdev_prop_set_compat(DeviceState *dev);
 extern struct BusInfo system_bus_info;
 
 #ifdef CONFIG_FDT
+int qbus_fdt_irq_to_number(qemu_irq irq, uint32_t *phandle);
 int qdev_fdt_populate(void *fdt);
 #endif
