From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [RFC PATCH 5/7] devicetree: Add helper to register devices with an
	fdt_populate hook
Date: Tue, 06 Apr 2010 22:10:23 -0600
Message-ID: <20100407041023.20274.14363.stgit@angua>
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

This patch allows simple registration of devices to include a
device tree node populate function.

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---

 hw/sysbus.c |   15 +++++++++++++++
 hw/sysbus.h |    2 ++
 2 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/hw/sysbus.c b/hw/sysbus.c
index 861572f..c63deef 100644
--- a/hw/sysbus.c
+++ b/hw/sysbus.c
@@ -138,6 +138,21 @@ void sysbus_register_dev(const char *name, size_t size, sysbus_initfn init)
     sysbus_register_withprop(info);
 }
 
+#if defined(CONFIG_FDT)
+void sysbus_register_dev_fdt(const char *name, size_t size, sysbus_initfn init,
+                             sysbus_fdt_populatefn fdt_populate)
+{
+    SysBusDeviceInfo *info;
+
+    info = qemu_mallocz(sizeof(*info));
+    info->qdev.name = qemu_strdup(name);
+    info->qdev.size = size;
+    info->init = init;
+    info->fdt_populate = fdt_populate;
+    sysbus_register_withprop(info);
+}
+#endif
+
 DeviceState *sysbus_create_varargs(const char *name,
                                    target_phys_addr_t addr, ...)
 {
diff --git a/hw/sysbus.h b/hw/sysbus.h
index 2c43191..3e20494 100644
--- a/hw/sysbus.h
+++ b/hw/sysbus.h
@@ -39,6 +39,8 @@ typedef struct {
 } SysBusDeviceInfo;
 
 void sysbus_register_dev(const char *name, size_t size, sysbus_initfn init);
+void sysbus_register_dev_fdt(const char *name, size_t size, sysbus_initfn init,
+                             sysbus_fdt_populatefn fdt_populate);
 void sysbus_register_withprop(SysBusDeviceInfo *info);
 void *sysbus_new(void);
 void sysbus_init_mmio(SysBusDevice *dev, target_phys_addr_t size, int iofunc);
