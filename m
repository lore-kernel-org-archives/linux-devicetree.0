From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: [PATCH] of: fix autoloading due to broken modalias with no 'compatible'
Date: Mon,  6 Jun 2016 18:48:38 +0200
Message-ID: <1465231718-2577-1-git-send-email-wsa@the-dreams.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Andreas Schwab <schwab-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Because of an improper dereference, a stray 'C' character was output to
the modalias when no 'compatible' was specified. This is the case for
some old PowerMac drivers which only set the 'name' property. Fix it to
let them match again.

Reported-by: Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Signed-off-by: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Tested-by: Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Andreas Schwab <schwab-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Fixes: 6543becf26fff6 ("mod/file2alias: make modalias generation safe for cross compiling")
---

I think it makes sense if this goes in via ppc (with stable tag added).
D'accord?

 scripts/mod/file2alias.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index a9155077feefb9..fec75786f75bbb 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -384,7 +384,7 @@ static void do_of_entry_multi(void *symval, struct module *mod)
 	len = sprintf(alias, "of:N%sT%s", (*name)[0] ? *name : "*",
 		      (*type)[0] ? *type : "*");
 
-	if (compatible[0])
+	if ((*compatible)[0])
 		sprintf(&alias[len], "%sC%s", (*type)[0] ? "*" : "",
 			*compatible);
 
-- 
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
