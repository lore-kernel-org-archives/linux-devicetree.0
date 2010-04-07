From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [RFC PATCH 1/7] devicetree: Add 8k instead of double dtb size when
	reserving extra memory
Date: Tue, 06 Apr 2010 22:10:02 -0600
Message-ID: <20100407041002.20274.51604.stgit@angua>
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
