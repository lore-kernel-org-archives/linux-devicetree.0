From: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Subject: [PATCH] [TRIVIAL] Drop an uninteresting message to pr_debug level
Date: Mon, 14 Feb 2011 22:34:22 +0100
Message-ID: <1297719274.1793.8.camel@t41.thuisdomein>
References: <1297085223.1741.24.camel@t41.thuisdomein>
	<AANLkTi=n7ogDGzwemR4pP5Uhp-ZoDti+qZ4ubqvjuosK@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTi=n7ogDGzwemR4pP5Uhp-ZoDti+qZ4ubqvjuosK-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Kyle McMartin <kyle-pfcGkIkfWfAsA/PxXw9srA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
---
On Mon, 2011-02-14 at 08:27 -0700, Grant Likely wrote:
> The message is unnecessary.  It can just be dropped altogether, or
> changed to a pr_debug().

Thanks. I picked the second option, as it is enough to address my
concerns.

diff --git a/fs/proc/proc_devtree.c b/fs/proc/proc_devtree.c
index d9396a4..927cbd1 100644
--- a/fs/proc/proc_devtree.c
+++ b/fs/proc/proc_devtree.c
@@ -233,7 +233,7 @@ void __init proc_device_tree_init(void)
 		return;
 	root = of_find_node_by_path("/");
 	if (root == NULL) {
-		printk(KERN_ERR "/proc/device-tree: can't find root\n");
+		pr_debug("/proc/device-tree: can't find root\n");
 		return;
 	}
 	proc_device_tree_add_node(root, proc_device_tree);
