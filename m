From: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Subject: [PATCH] Print a device-tree message at KERN_WARNING level
Date: Mon, 07 Feb 2011 14:26:57 +0100
Message-ID: <1297085223.1741.24.camel@t41.thuisdomein>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Kyle McMartin <kyle-pfcGkIkfWfAsA/PxXw9srA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

For some time now a laptop tracking Fedora's rawhide prints the message
    /proc/device-tree: can't find root

early in each boot. It turns out that in recent Fedora kernels
CONFIG_PROC_DEVICETREE is set to Y by default. (Note that the config
help for PROC_DEVICETREE tells to "say Y here" if "unsure".) Apparently
this is a consequence of their wish to have one kernel for both OPLC x86
and non-OLPC x86 hardware.

Since the majority of x86 hardware will be non-OLPC, KERN_WARNING seems
to be more appropriate than KERN_ERR. (The main benefit of the
KERN_WARNING level is that Fedora's plymouth bootsplash should now hide
this message.)

Signed-off-by: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
---
Previously discussed in the thread starting here:
http://lists.fedoraproject.org/pipermail/kernel/2011-February/003012.html

As stated in
http://lists.fedoraproject.org/pipermail/kernel/2011-February/003011.html , I have no idea what this message means. I just prefer to not see it. This seems to be the easiest way to achieve that. But maybe there's an elegant way to drop this message all together on hardware for which it's apparently irrelevant.

 fs/proc/proc_devtree.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/proc/proc_devtree.c b/fs/proc/proc_devtree.c
index d9396a4..71dd779 100644
--- a/fs/proc/proc_devtree.c
+++ b/fs/proc/proc_devtree.c
@@ -233,7 +233,7 @@ void __init proc_device_tree_init(void)
 		return;
 	root = of_find_node_by_path("/");
 	if (root == NULL) {
-		printk(KERN_ERR "/proc/device-tree: can't find root\n");
+		printk(KERN_WARNING "/proc/device-tree: can't find root\n");
 		return;
 	}
 	proc_device_tree_add_node(root, proc_device_tree);
-- 
1.7.4
