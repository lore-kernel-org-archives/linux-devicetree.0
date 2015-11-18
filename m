From: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Subject: [PATCH] of: Fix comparison of reserved memory regions
Date: Wed, 18 Nov 2015 21:46:38 +1100
Message-ID: <1447843598-9355-1-git-send-email-mpe@ellerman.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, mitchelh-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

In order to check for overlapping reserved memory regions, we first need
to sort the array of memory regions. This is implemented using sort(),
and a custom comparison function __rmem_cmp().

Unfortunatley __rmem_cmp() doesn't work in all cases. Because the two
base values are phys_addr_t, they may be u64 on some platforms, in which
case subtracting one from the other and then (implicitly) casting to int
does not give us the -ve/0/+ve value we need.

This leads to incorrect reports about overlaps, eg:

  ibm,slw-image@1ffe600000 (0x0000001ffe600000--0x0000001ffe700000) overlaps with
  ibm,firmware-allocs-memory@1000000000 (0x0000001000000000--0x0000001000dc0200)

Fix it by just doing the standard double if and return 0 logic.

Fixes: ae1add247bf8 ("of: Check for overlap in reserved memory regions")
Signed-off-by: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
---
 drivers/of/of_reserved_mem.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index be77e75c587d..1a3556a9e9ea 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -206,7 +206,13 @@ static int __init __rmem_cmp(const void *a, const void *b)
 {
 	const struct reserved_mem *ra = a, *rb = b;
 
-	return ra->base - rb->base;
+	if (ra->base < rb->base)
+		return -1;
+
+	if (ra->base > rb->base)
+		return 1;
+
+	return 0;
 }
 
 static void __init __rmem_check_for_overlap(void)
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
