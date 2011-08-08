From: Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org>
Subject: [PATCH 6/9] arch/powerpc/platforms/pseries/iommu.c: add missing kfree
Date: Mon,  8 Aug 2011 13:18:00 +0200
Message-ID: <1312802283-9107-6-git-send-email-julia@diku.dk>
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
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Milton Miller <miltonm-ogEGBHC/i9Y@public.gmane.org>, Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>, Will Schmidt <will_schmidt-DhXWPJtHtuFWk0Htik3J/w@public.gmane.org>, Nishanth Aravamudan <nacc-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org>

At this point, window has not been stored anywhere, so it has to be freed
before leaving the function.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@exists@
local idexpression x;
statement S,S1;
expression E;
identifier fl;
expression *ptr != NULL;
@@

x = \(kmalloc\|kzalloc\|kcalloc\)(...);
...
if (x == NULL) S
<... when != x
     when != if (...) { <+...kfree(x)...+> }
     when any
     when != true x == NULL
x->fl
...>
(
if (x == NULL) S1
|
if (...) { ... when != x
               when forall
(
 return \(0\|<+...x...+>\|ptr\);
|
* return ...;
)
}
)
// </smpl>

Signed-off-by: Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org>

---
 arch/powerpc/platforms/pseries/iommu.c |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 2b20b05..6351af8 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -940,14 +940,14 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	if (ret) {
 		dev_info(&dev->dev, "failed to map direct window for %s: %d\n",
 			 dn->full_name, ret);
-		goto out_clear_window;
+		goto out_free_window;
 	}
 
 	ret = prom_add_property(pdn, win64);
 	if (ret) {
 		dev_err(&dev->dev, "unable to add dma window property for %s: %d",
 			 pdn->full_name, ret);
-		goto out_clear_window;
+		goto out_free_window;
 	}
 
 	window->device = pdn;
@@ -959,6 +959,9 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	dma_addr = of_read_number(&create.addr_hi, 2);
 	goto out_unlock;
 
+out_free_window:
+	kfree(window);
+
 out_clear_window:
 	remove_ddw(pdn);
