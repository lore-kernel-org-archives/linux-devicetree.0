From: Deepak Saxena <deepak_saxena-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 5/5] of/device: Show even unavailable nodes in procfs
Date: Wed, 8 Dec 2010 11:29:33 -0800
Message-ID: <20101208192933.GD32473@mentor.com>
References: <cover.1291799069.git.deepak_saxena@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cover.1291799069.git.deepak_saxena-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Use the new "raw" of_get_next_child() variant so all device tree nodes
will appear in procfs.

Signed-off-by: Hollis Blanchard <hollis_blanchard-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Signed-off-by: Deepak Saxena <deepak_saxena-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
---
 fs/proc/proc_devtree.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/proc/proc_devtree.c b/fs/proc/proc_devtree.c
index d9396a4..aa914eb 100644
--- a/fs/proc/proc_devtree.c
+++ b/fs/proc/proc_devtree.c
@@ -188,7 +188,7 @@ void proc_device_tree_add_node(struct device_node *np,
 	const char *p;
 
 	set_node_proc_entry(np, de);
-	for (child = NULL; (child = of_get_next_child(np, child));) {
+	for (child = NULL; (child = _of_get_next_child(np, child));) {
 		/* Use everything after the last slash, or the full name */
 		p = strrchr(child->full_name, '/');
 		if (!p)
-- 
1.6.3.3
