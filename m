From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH 1/2] qemu: devicetree: Add 8k instead of double dtb size when
	reserving extra memory
Date: Sat, 03 Apr 2010 01:20:16 -0600
Message-ID: <20100403071930.27923.35947.stgit@angua>
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

If a small 'seed' dtb file is loaded into qemu and then heavily modified
(say for runtime population of all the device nodes), then 2x the dtb
size turns out not to be very much.

This patch changes the device tree loading code to add a fixed 8k of
additional space to the dtb buffer.

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---

 device_tree.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/device_tree.c b/device_tree.c
index 426a631..bad4810 100644
--- a/device_tree.c
+++ b/device_tree.c
@@ -41,8 +41,8 @@ void *load_device_tree(const char *filename_path, int *sizep)
         goto fail;
     }
 
-    /* Expand to 2x size to give enough room for manipulation.  */
-    dt_size *= 2;
+    /* Expand size to give enough room for manipulation.  */
+    dt_size += 8 * 1024;
     /* First allocate space in qemu for device tree */
     fdt = qemu_mallocz(dt_size);
