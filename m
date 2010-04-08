From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [RFC PATCH] devicetree: Fix buffer overflow on setting device node
	name
Date: Wed, 07 Apr 2010 19:51:42 -0600
Message-ID: <20100408015013.18100.89239.stgit@angua>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
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

Fix bug where temporary buffer for sprintf() was not large enough
when setting a device tree node name.

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---

Hi Jeremy.  Here's the fix I promised.  With this change your current tree
works beautifully.  I've pushed out the kernel that works with this QEMU
branch to my Linux kernel git tree:

git://git.secretlab.ca/git/linux-2.6 test-devicetree

Cheers,
g.

 hw/qdev.c   |    2 +-
 hw/sysbus.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/qdev.c b/hw/qdev.c
index caa5b35..36582ec 100644
--- a/hw/qdev.c
+++ b/hw/qdev.c
@@ -868,7 +868,7 @@ static int qdev_fdt_add_device(void *fdt, DeviceState *dev, int bus_offset)
 {
     BusState *child;
     int dev_offset, rc;
-    char name[sizeof(dev->info->name) + 9];
+    char name[sizeof(dev->info->name) + 20];
     static int unique = 0;
 
     sprintf(name, "%s@%x", dev->info->name, unique++);
diff --git a/hw/sysbus.c b/hw/sysbus.c
index c63deef..c17d12d 100644
--- a/hw/sysbus.c
+++ b/hw/sysbus.c
@@ -230,7 +230,7 @@ static int sysbus_fdt_populate_node(DeviceState *dev, void *fdt, int offset)
     for (i = 0; i < s->num_mmio; i++) {
         /* By convention, the name is appended with '@<first reg addr>' */
         if (i == 0) {
-            char n[sizeof(dev->info->name) + 10];
+            char n[sizeof(dev->info->name) + 20];
             sprintf(n, "%s@%x", dev->info->name, (uint32_t)s->mmio[i].addr);
             rc = fdt_set_name(fdt, offset, n);
             if (rc < 0)
