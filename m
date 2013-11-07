From: Zhao Qiang <B45475-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH 1/3] powerpc/p1010rdb:add P1010RDB-PB platform support
Date: Thu, 7 Nov 2013 10:29:27 +0800
Message-ID: <1383791369-29324-1-git-send-email-B45475@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Zhao Qiang <B45475-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The P1010RDB-PB is similar to P1010RDB(P1010RDB-PA).
So, P1010RDB-PB use the same platform file as P1010RDB.
Then Add support for P1010RDB-PB platform.

Signed-off-by: Zhao Qiang <B45475-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/powerpc/platforms/85xx/p1010rdb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/platforms/85xx/p1010rdb.c b/arch/powerpc/platforms/85xx/p1010rdb.c
index 0252961..d6a3dd3 100644
--- a/arch/powerpc/platforms/85xx/p1010rdb.c
+++ b/arch/powerpc/platforms/85xx/p1010rdb.c
@@ -66,6 +66,8 @@ static int __init p1010_rdb_probe(void)
 
 	if (of_flat_dt_is_compatible(root, "fsl,P1010RDB"))
 		return 1;
+	if (of_flat_dt_is_compatible(root, "fsl,P1010RDB-PB"))
+		return 1;
 	return 0;
 }
 
-- 
1.8.4


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
