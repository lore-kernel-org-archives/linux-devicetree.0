From: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH] of: Fix the section mismatch warnings.
Date: Tue, 8 Apr 2014 13:48:07 +0800
Message-ID: <1396936087-23043-1-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In tag next-20140407, building with CONFIG_DEBUG_SECTION_MISMATCH
enabled, the following WARNING is occured:

WARNING: drivers/built-in.o(.text.unlikely+0x2220): Section mismatch
in reference from the function __reserved_mem_check_root() to the
function .init.text:of_get_flat_dt_prop()
The function __reserved_mem_check_root() references
the function __init of_get_flat_dt_prop().
This is often because __reserved_mem_check_root lacks a __init
annotation or the annotation of of_get_flat_dt_prop is wrong.

WARNING: vmlinux.o(.text.unlikely+0xb9d0): Section mismatch in reference
from the function __reserved_mem_check_root() to the (unknown reference)
.init.data:(unknown)
The function __reserved_mem_check_root() references
the (unknown reference) __initdata (unknown).
This is often because __reserved_mem_check_root lacks a __initdata
annotation or the annotation of (unknown) is wrong.

This is cause by :
'drivers: of: add initialization code for dynamic reserved memory'.

Signed-off-by: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 drivers/of/fdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index fa16a91..7a2ef7b 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -491,7 +491,7 @@ static int __init __reserved_mem_reserve_reg(unsigned long node,
  * in /reserved-memory matches the values supported by the current implementation,
  * also check if ranges property has been provided
  */
-static int __reserved_mem_check_root(unsigned long node)
+static int __init __reserved_mem_check_root(unsigned long node)
 {
 	__be32 *prop;
 
-- 
1.8.4


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
