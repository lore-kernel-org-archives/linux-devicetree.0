From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH] fix off-by-one error in writing the initrd size into the
	device tree
Date: Fri, 23 Jul 2010 16:48:50 -0600
Message-ID: <20100723224850.27182.82619.stgit@angua>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---
 hw/arm_boot.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm_boot.c b/hw/arm_boot.c
index 22fba26..04b29d8 100644
--- a/hw/arm_boot.c
+++ b/hw/arm_boot.c
@@ -220,8 +220,8 @@ static int load_dtb(target_phys_addr_t addr, const struct arm_boot_info *binfo)
             fprintf(stderr, "couldn't set /chosen/linux,initrd-start\n");
 
         rc = qemu_devtree_setprop_cell(fdt, "/chosen", "linux,initrd-end",
-                    binfo->loader_start +INITRD_LOAD_ADDR +
-                    binfo->initrd_size);
+                    binfo->loader_start + INITRD_LOAD_ADDR +
+                    binfo->initrd_size - 1);
         if (rc < 0)
             fprintf(stderr, "couldn't set /chosen/linux,initrd-end\n");
     }
