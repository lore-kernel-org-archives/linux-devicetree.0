From: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Subject: [PATCH] of: Print rather than WARN'ing when overlap check fails
Date: Tue, 10 Nov 2015 16:08:33 +1100
Message-ID: <1447132113-31434-1-git-send-email-mpe@ellerman.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, mitchelh-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

__rmem_check_for_overlap() is called very early in boot, and on some
powerpc systems it's not safe to call WARN that early in boot.

If the overlap check fails the system will oops instead of printing a
warning. Furthermore because it's so early in boot the console is not up
and the user doesn't see the oops, they just get a dead system.

Fix it by printing an error instead of calling WARN.

Fixes: ae1add247bf8 ("of: Check for overlap in reserved memory regions")
Signed-off-by: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
---
 drivers/of/of_reserved_mem.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 62f467b8ccae..49703916a30e 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -226,10 +226,9 @@ static void __init __rmem_check_for_overlap(void)
 
 			this_end = this->base + this->size;
 			next_end = next->base + next->size;
-			WARN(1,
-			     "Reserved memory: OVERLAP DETECTED!\n%s (%pa--%pa) overlaps with %s (%pa--%pa)\n",
-			     this->name, &this->base, &this_end,
-			     next->name, &next->base, &next_end);
+			pr_err("Reserved memory: OVERLAP DETECTED!\n%s (%pa--%pa) overlaps with %s (%pa--%pa)\n",
+			       this->name, &this->base, &this_end,
+			       next->name, &next->base, &next_end);
 		}
 	}
 }
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
