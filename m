From: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [PATCH] of/flattree: use OF_ROOT_NODE_{SIZE,
	ADDR}_CELLS DEFAULT for fdt parsing
Date: Mon, 14 Dec 2009 11:30:36 +0800
Message-ID: <1260761436.150950.303060241099.1.gpush@pororo>
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
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

At present we're using hard-coded values for defaults when parsing the
FDT. This change uses the #defines instead.

Signed-off-by: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>

---
 drivers/of/fdt.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 4071639..4d089a1 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -439,11 +439,11 @@ int __init early_init_dt_scan_root(unsigned long node, const char *uname,
 		return 0;
 
 	prop = of_get_flat_dt_prop(node, "#size-cells", NULL);
-	dt_root_size_cells = (prop == NULL) ? 1 : *prop;
+	dt_root_size_cells = prop ? *prop : OF_ROOT_NODE_SIZE_CELLS_DEFAULT;
 	pr_debug("dt_root_size_cells = %x\n", dt_root_size_cells);
 
 	prop = of_get_flat_dt_prop(node, "#address-cells", NULL);
-	dt_root_addr_cells = (prop == NULL) ? 2 : *prop;
+	dt_root_addr_cells = prop ? *prop : OF_ROOT_NODE_ADDR_CELLS_DEFAULT;
 	pr_debug("dt_root_addr_cells = %x\n", dt_root_addr_cells);
 
 	/* break now */
