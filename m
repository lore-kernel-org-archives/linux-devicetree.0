From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [RFC PATCH 6/7] devicetree: Add fdt_populate hook to pl011 device
Date: Tue, 06 Apr 2010 22:10:28 -0600
Message-ID: <20100407041028.20274.67952.stgit@angua>
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

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---

 hw/pl011.c |   29 +++++++++++++++++++++++++----
 1 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/hw/pl011.c b/hw/pl011.c
index 81de91e..efc06d2 100644
--- a/hw/pl011.c
+++ b/hw/pl011.c
@@ -286,6 +286,27 @@ static int pl011_load(QEMUFile *f, void *opaque, int version_id)
     return 0;
 }
 
+#ifdef CONFIG_FDT
+#include <libfdt.h>
+static int pl011_fdt_populate(SysBusDevice *dev, void *fdt, int offset)
+{
+    pl011_state *s = FROM_SYSBUS(pl011_state, dev);
+    int rc;
+
+    rc = fdt_setprop_string(fdt, offset, "compatible", "arm,amba-device");
+    if (rc < 0)
+        return rc;
+
+    rc = fdt_setprop(fdt, offset, "arm,amba-deviceid", s->id, sizeof(s->id));
+    if (rc < 0)
+        return rc;
+
+    return 0;
+}
+#else
+#define pl011_fdt_populate NULL
+#endif
+
 static int pl011_init(SysBusDevice *dev, const unsigned char *id)
 {
     int iomemtype;
@@ -322,10 +343,10 @@ static int pl011_init_luminary(SysBusDevice *dev)
 
 static void pl011_register_devices(void)
 {
-    sysbus_register_dev("pl011", sizeof(pl011_state),
-                        pl011_init_arm);
-    sysbus_register_dev("pl011_luminary", sizeof(pl011_state),
-                        pl011_init_luminary);
+    sysbus_register_dev_fdt("pl011", sizeof(pl011_state),
+                            pl011_init_arm, pl011_fdt_populate);
+    sysbus_register_dev_fdt("pl011_luminary", sizeof(pl011_state),
+                            pl011_init_luminary, pl011_fdt_populate);
 }
 
 device_init(pl011_register_devices)
