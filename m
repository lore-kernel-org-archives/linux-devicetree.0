From: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v7 10/50] powerpc/powernv: Simplify pnv_ioda_setup_pe_seg()
Date: Thu,  5 Nov 2015 00:12:10 +1100
Message-ID: <1446642770-4681-11-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1446642770-4681-1-git-send-email-gwshan@linux.vnet.ibm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446642770-4681-1-git-send-email-gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org, aik-sLpHqDYs0B2HXe+LvDLADg@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The original implementation of pnv_ioda_setup_pe_seg() configures
IO and M32 segments by separate logics, which can be merged by
by caching @segmap, @seg_size, @win in advance. This shouldn't
cause any behavioural changes.

Signed-off-by: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 62 ++++++++++++++-----------------
 1 file changed, 28 insertions(+), 34 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 7ee7cfe..553d3f3 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -2752,8 +2752,10 @@ static void pnv_ioda_setup_pe_seg(struct pci_controller *hose,
 	struct pnv_phb *phb = hose->private_data;
 	struct pci_bus_region region;
 	struct resource *res;
-	int i, index;
-	int rc;
+	unsigned int segsize;
+	int *segmap, index, i;
+	uint16_t win;
+	int64_t rc;
 
 	/*
 	 * NOTE: We only care PCI bus based PE for now. For PCI
@@ -2770,23 +2772,9 @@ static void pnv_ioda_setup_pe_seg(struct pci_controller *hose,
 		if (res->flags & IORESOURCE_IO) {
 			region.start = res->start - phb->ioda.io_pci_base;
 			region.end   = res->end - phb->ioda.io_pci_base;
-			index = region.start / phb->ioda.io_segsize;
-
-			while (index < phb->ioda.total_pe_num &&
-			       region.start <= region.end) {
-				phb->ioda.io_segmap[index] = pe->pe_number;
-				rc = opal_pci_map_pe_mmio_window(phb->opal_id,
-					pe->pe_number, OPAL_IO_WINDOW_TYPE, 0, index);
-				if (rc != OPAL_SUCCESS) {
-					pr_err("%s: OPAL error %d when mapping IO "
-					       "segment #%d to PE#%d\n",
-					       __func__, rc, index, pe->pe_number);
-					break;
-				}
-
-				region.start += phb->ioda.io_segsize;
-				index++;
-			}
+			segsize      = phb->ioda.io_segsize;
+			segmap       = phb->ioda.io_segmap;
+			win          = OPAL_IO_WINDOW_TYPE;
 		} else if ((res->flags & IORESOURCE_MEM) &&
 			   !pnv_pci_is_mem_pref_64(res->flags)) {
 			region.start = res->start -
@@ -2795,23 +2783,29 @@ static void pnv_ioda_setup_pe_seg(struct pci_controller *hose,
 			region.end   = res->end -
 				       hose->mem_offset[0] -
 				       phb->ioda.m32_pci_base;
-			index = region.start / phb->ioda.m32_segsize;
-
-			while (index < phb->ioda.total_pe_num &&
-			       region.start <= region.end) {
-				phb->ioda.m32_segmap[index] = pe->pe_number;
-				rc = opal_pci_map_pe_mmio_window(phb->opal_id,
-					pe->pe_number, OPAL_M32_WINDOW_TYPE, 0, index);
-				if (rc != OPAL_SUCCESS) {
-					pr_err("%s: OPAL error %d when mapping M32 "
-					       "segment#%d to PE#%d",
-					       __func__, rc, index, pe->pe_number);
-					break;
-				}
+			segsize      = phb->ioda.m32_segsize;
+			segmap       = phb->ioda.m32_segmap;
+			win          = OPAL_M32_WINDOW_TYPE;
+		} else {
+			continue;
+		}
 
-				region.start += phb->ioda.m32_segsize;
-				index++;
+		index = region.start / segsize;
+		while (index < phb->ioda.total_pe_num &&
+		       region.start <= region.end) {
+			segmap[index] = pe->pe_number;
+			rc = opal_pci_map_pe_mmio_window(phb->opal_id,
+					pe->pe_number, win, 0, index);
+			if (rc != OPAL_SUCCESS) {
+				pr_warn("%s: Error %lld mapping (%d) seg#%d to PHB#%d-PE#%d\n",
+					__func__, rc, win, index,
+					pe->phb->hose->global_number,
+					pe->pe_number);
+				break;
 			}
+
+			region.start += segsize;
+			index++;
 		}
 	}
 }
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
