From: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] of/pdt: fix section mismatch warning
Date: Tue, 27 Dec 2011 23:04:08 +0100
Message-ID: <20111227220408.GA18932@merkur.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

>From faff5f5b55c50e8ea06b62bd6b97f30d38a2da3a Mon Sep 17 00:00:00 2001
From: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
Date: Tue, 27 Dec 2011 22:58:40 +0100
Subject: [PATCH] of/pdt: fix section mismatch warning

Fix the following section mismatch warning - seen when building sparc32:

WARNING: vmlinux.o(.text+0x1ff9c0): Section mismatch in reference from the function kernel_tree_alloc() to the function .init.text:prom_early_alloc()
The function kernel_tree_alloc() references
the function __init prom_early_alloc().
This is often because kernel_tree_alloc lacks a __init
annotation or the annotation of prom_early_alloc is wrong.

prom_early_alloc() is annotated __init, and users of
kernel_tree_alloc() is also annotated __init.
So simply match the annoation of these to fix the warning.

Signed-off-by: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: David S. Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
---
 drivers/of/pdt.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/of/pdt.c b/drivers/of/pdt.c
index bc5b399..07cc1d6 100644
--- a/drivers/of/pdt.c
+++ b/drivers/of/pdt.c
@@ -229,7 +229,7 @@ static struct device_node * __init of_pdt_build_tree(struct device_node *parent,
 	return ret;
 }
 
-static void *kernel_tree_alloc(u64 size, u64 align)
+static void * __init kernel_tree_alloc(u64 size, u64 align)
 {
 	return prom_early_alloc(size);
 }
-- 
1.6.0.6
