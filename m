From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH] of/flattree: Fix crash when device tree absent
Date: Fri, 25 Jun 2010 16:03:06 -0600
Message-ID: <20100625220306.6903.17916.stgit@angua>
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
To: benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Cc: microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch fixes the condition where device tree support is compiled
in, but no device tree was proved by firmware.  It makes
of_platform_bus_probe() explicitly check for a NULL device tree
pointer, and adds an error message if the device tree was unable
to be flattened.

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---
 drivers/of/fdt.c      |    2 ++
 drivers/of/platform.c |    2 ++
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index b6987bb..beda593 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -94,6 +94,8 @@ int __init of_scan_flat_dt(int (*it)(unsigned long node,
 			break;
 	} while (1);
 
+	if (rc)
+		pr_err("Failed to unflatten device tree blob.  rc=%i\n", rc);
 	return rc;
 }
 
diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 3eb4cf6..1f5a210 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -640,6 +640,8 @@ int of_platform_bus_probe(struct device_node *root,
 		root = of_find_node_by_path("/");
 	else
 		of_node_get(root);
+	if (root == NULL)
+		return -EINVAL;
 
 	pr_debug("of_platform_bus_probe()\n");
 	pr_debug(" starting at: %s\n", root->full_name);
