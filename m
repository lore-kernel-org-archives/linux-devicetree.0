From: Tsung-Han Lin <tsunghan.tw-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2] staging:board: remove unnecessary function
Date: Thu, 18 Dec 2014 02:33:24 +0800
Message-ID: <1418841204-25271-1-git-send-email-tsunghan.tw@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Remove the unnecessary 'of_can_translate_address',
which is already removed in commit
d9c6866be8a145e32da616d8dcbae806032d75b5 ("of: kill off
of_can_translate_address").

Signed-off-by: Tsung-Han Lin <tsunghan.tw-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/staging/board/board.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/board/board.c b/drivers/staging/board/board.c
index 6050fbdfd31f..d5a6abc84519 100644
--- a/drivers/staging/board/board.c
+++ b/drivers/staging/board/board.c
@@ -11,8 +11,7 @@ static bool find_by_address(u64 base_address)
 	struct resource res;
 
 	while (dn) {
-		if (of_can_translate_address(dn)
-		    && !of_address_to_resource(dn, 0, &res)) {
+		if (!of_address_to_resource(dn, 0, &res)) {
 			if (res.start == base_address) {
 				of_node_put(dn);
 				return true;
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
