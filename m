From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 5/6] staging: board: kzm9d: Use "arm,pl390"
Date: Fri, 20 Nov 2015 13:36:56 +0100
Message-ID: <1448023017-21816-6-git-send-email-geert+renesas@glider.be>
References: <1448023017-21816-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1448023017-21816-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
Must be applied together with "ARM: shmobile: emev2 dtsi: Use
"arm,pl390" for GIC"!

Greg: Can you please provide your ack? Thanks!
---
 drivers/staging/board/kzm9d.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/board/kzm9d.c b/drivers/staging/board/kzm9d.c
index 8d1eb09bc66ef413..05a6d434d307fe0f 100644
--- a/drivers/staging/board/kzm9d.c
+++ b/drivers/staging/board/kzm9d.c
@@ -11,7 +11,7 @@ static struct resource usbs1_res[] __initdata = {
 
 static void __init kzm9d_init(void)
 {
-	board_staging_gic_setup_xlate("arm,cortex-a9-gic", 32);
+	board_staging_gic_setup_xlate("arm,pl390", 32);
 
 	if (!board_staging_dt_node_available(usbs1_res,
 					     ARRAY_SIZE(usbs1_res))) {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
