From: Laurent Gregoire <laurent.gregoire-Jdzig1fPfSTQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] libfdt: Fix C++ compile-time cast error on gnu 4.2.1
Date: Tue, 03 Mar 2009 14:23:59 +0100
Message-ID: <1236086639.17001.428.camel@pc-laurentg.intra.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Allow the inclusion of libfdt.h in C++ source.
---
Signed-off-by: Laurent Gregoire <laurent.gregoire-Jdzig1fPfSTQT0dZR+AlfA@public.gmane.org>
---
diff -uprN a/libfdt/libfdt.h b/libfdt/libfdt.h
--- a/libfdt/libfdt.h 2008-07-25 23:17:04.000000000 +0200
+++ b/libfdt/libfdt.h 2009-03-03 14:01:38.000000000 +0100
@@ -156,7 +156,7 @@ int fdt_next_node(const void *fdt, int o
 #define __fdt_set_hdr(name) \
 	static inline void fdt_set_##name(void *fdt, uint32_t val) \
 	{ \
-		struct fdt_header *fdth = fdt; \
+		struct fdt_header *fdth = (struct fdt_header*)fdt; \
 		fdth->name = cpu_to_fdt32(val); \
 	}
 __fdt_set_hdr(magic);
