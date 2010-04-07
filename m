From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [RFC PATCH 7/7] devicetree: Add fdt_populate hook to smc91x device
Date: Tue, 06 Apr 2010 22:10:33 -0600
Message-ID: <20100407041033.20274.72493.stgit@angua>
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

 hw/smc91c111.c |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/hw/smc91c111.c b/hw/smc91c111.c
index b7398c9..300d209 100644
--- a/hw/smc91c111.c
+++ b/hw/smc91c111.c
@@ -721,8 +721,28 @@ static int smc91c111_init1(SysBusDevice *dev)
     return 0;
 }
 
+#ifdef CONFIG_FDT
+#include <libfdt.h>
+static int smc91c111_fdt_populate(SysBusDevice *dev, void *fdt, int offset)
+{
+    smc91c111_state *s = FROM_SYSBUS(smc91c111_state, dev);
+    int rc;
+
+    rc = fdt_setprop_string(fdt, offset, "compatible", "smc,91c111");
+    if (rc < 0)
+        return rc;
+
+    rc = fdt_setprop(fdt, offset, "local-mac-address", s->conf.macaddr.a,
+                     sizeof(s->conf.macaddr.a));
+    return 0;
+}
+#endif
+
 static SysBusDeviceInfo smc91c111_info = {
     .init = smc91c111_init1,
+#ifdef CONFIG_FDT
+    .fdt_populate = smc91c111_fdt_populate,
+#endif
     .qdev.name  = "smc91c111",
     .qdev.size  = sizeof(smc91c111_state),
     .qdev.props = (Property[]) {
