From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH] of/flattree: Use common ALIGN() macro instead of arch
	specific _ALIGN
Date: Fri, 25 Jun 2010 16:03:00 -0600
Message-ID: <20100625220300.6903.3519.stgit@angua>
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

There's no reason to use the powerpc-specific _ALIGN macro in the fdt
code.  Replace it with ALIGN() from kernel.h

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---
 arch/microblaze/include/asm/page.h |    7 -------
 drivers/of/fdt.c                   |   20 ++++++++++----------
 2 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/arch/microblaze/include/asm/page.h b/arch/microblaze/include/asm/page.h
index 464ff32..2fd4761 100644
--- a/arch/microblaze/include/asm/page.h
+++ b/arch/microblaze/include/asm/page.h
@@ -39,13 +39,6 @@
 #define PAGE_UP(addr)	(((addr)+((PAGE_SIZE)-1))&(~((PAGE_SIZE)-1)))
 #define PAGE_DOWN(addr)	((addr)&(~((PAGE_SIZE)-1)))
 
-/* align addr on a size boundary - adjust address up/down if needed */
-#define _ALIGN_UP(addr, size)	(((addr)+((size)-1))&(~((size)-1)))
-#define _ALIGN_DOWN(addr, size)	((addr)&(~((size)-1)))
-
-/* align addr on a size boundary - adjust address up if needed */
-#define _ALIGN(addr, size)	_ALIGN_UP(addr, size)
-
 #ifndef CONFIG_MMU
 /*
  * PAGE_OFFSET -- the first address of the first page of memory. When not
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index b6987bb..d61fda8 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -69,9 +69,9 @@ int __init of_scan_flat_dt(int (*it)(unsigned long node,
 			u32 sz = be32_to_cpup((__be32 *)p);
 			p += 8;
 			if (be32_to_cpu(initial_boot_params->version) < 0x10)
-				p = _ALIGN(p, sz >= 8 ? 8 : 4);
+				p = ALIGN(p, sz >= 8 ? 8 : 4);
 			p += sz;
-			p = _ALIGN(p, 4);
+			p = ALIGN(p, 4);
 			continue;
 		}
 		if (tag != OF_DT_BEGIN_NODE) {
@@ -80,7 +80,7 @@ int __init of_scan_flat_dt(int (*it)(unsigned long node,
 		}
 		depth++;
 		pathp = (char *)p;
-		p = _ALIGN(p + strlen(pathp) + 1, 4);
+		p = ALIGN(p + strlen(pathp) + 1, 4);
 		if ((*pathp) == '/') {
 			char *lp, *np;
 			for (lp = NULL, np = pathp; *np; np++)
@@ -109,7 +109,7 @@ unsigned long __init of_get_flat_dt_root(void)
 		p += 4;
 	BUG_ON(be32_to_cpup((__be32 *)p) != OF_DT_BEGIN_NODE);
 	p += 4;
-	return _ALIGN(p + strlen((char *)p) + 1, 4);
+	return ALIGN(p + strlen((char *)p) + 1, 4);
 }
 
 /**
@@ -138,7 +138,7 @@ void *__init of_get_flat_dt_prop(unsigned long node, const char *name,
 		noff = be32_to_cpup((__be32 *)(p + 4));
 		p += 8;
 		if (be32_to_cpu(initial_boot_params->version) < 0x10)
-			p = _ALIGN(p, sz >= 8 ? 8 : 4);
+			p = ALIGN(p, sz >= 8 ? 8 : 4);
 
 		nstr = find_flat_dt_string(noff);
 		if (nstr == NULL) {
@@ -151,7 +151,7 @@ void *__init of_get_flat_dt_prop(unsigned long node, const char *name,
 			return (void *)p;
 		}
 		p += sz;
-		p = _ALIGN(p, 4);
+		p = ALIGN(p, 4);
 	} while (1);
 }
 
@@ -184,7 +184,7 @@ static void *__init unflatten_dt_alloc(unsigned long *mem, unsigned long size,
 {
 	void *res;
 
-	*mem = _ALIGN(*mem, align);
+	*mem = ALIGN(*mem, align);
 	res = (void *)*mem;
 	*mem += size;
 
@@ -220,7 +220,7 @@ unsigned long __init unflatten_dt_node(unsigned long mem,
 	*p += 4;
 	pathp = (char *)*p;
 	l = allocl = strlen(pathp) + 1;
-	*p = _ALIGN(*p + l, 4);
+	*p = ALIGN(*p + l, 4);
 
 	/* version 0x10 has a more compact unit name here instead of the full
 	 * path. we accumulate the full path size using "fpsize", we'll rebuild
@@ -299,7 +299,7 @@ unsigned long __init unflatten_dt_node(unsigned long mem,
 		noff = be32_to_cpup((__be32 *)((*p) + 4));
 		*p += 8;
 		if (be32_to_cpu(initial_boot_params->version) < 0x10)
-			*p = _ALIGN(*p, sz >= 8 ? 8 : 4);
+			*p = ALIGN(*p, sz >= 8 ? 8 : 4);
 
 		pname = find_flat_dt_string(noff);
 		if (pname == NULL) {
@@ -333,7 +333,7 @@ unsigned long __init unflatten_dt_node(unsigned long mem,
 			*prev_pp = pp;
 			prev_pp = &pp->next;
 		}
-		*p = _ALIGN((*p) + sz, 4);
+		*p = ALIGN((*p) + sz, 4);
 	}
 	/* with version 0x10 we may not have the name property, recreate
 	 * it here from the unit name if absent
