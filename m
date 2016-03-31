From: Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: [RESEND PATCH v10 3/6] ARM: hisi: add compatible string for Hi3519 soc
Date: Thu, 31 Mar 2016 16:10:08 +0800
Message-ID: <1459411811-12390-4-git-send-email-xuejiancheng@hisilicon.com>
References: <1459411811-12390-1-git-send-email-xuejiancheng@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1459411811-12390-1-git-send-email-xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, yanhaifeng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, yanghongwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, suwenping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, raojun-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, ml.yang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, gaofei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, zhangzhenxing-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>

add compatible string for Hi3519 soc.

Signed-off-by: Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-hisi/hisilicon.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/arch/arm/mach-hisi/hisilicon.c b/arch/arm/mach-hisi/hisilicon.c
index 8cc6215..00dae89 100644
--- a/arch/arm/mach-hisi/hisilicon.c
+++ b/arch/arm/mach-hisi/hisilicon.c
@@ -54,30 +54,15 @@ DT_MACHINE_START(HI3620, "Hisilicon Hi3620 (Flattened Device Tree)")
 	.dt_compat	= hi3xxx_compat,
 MACHINE_END
 
-static const char *const hix5hd2_compat[] __initconst = {
+static const char *const hisilicon_compat[] __initconst = {
 	"hisilicon,hix5hd2",
-	NULL,
-};
-
-DT_MACHINE_START(HIX5HD2_DT, "Hisilicon HIX5HD2 (Flattened Device Tree)")
-	.dt_compat	= hix5hd2_compat,
-MACHINE_END
-
-static const char *const hip04_compat[] __initconst = {
 	"hisilicon,hip04-d01",
-	NULL,
-};
-
-DT_MACHINE_START(HIP04, "Hisilicon HiP04 (Flattened Device Tree)")
-	.dt_compat	= hip04_compat,
-MACHINE_END
-
-static const char *const hip01_compat[] __initconst = {
 	"hisilicon,hip01",
 	"hisilicon,hip01-ca9x2",
+	"hisilicon,hi3519",
 	NULL,
 };
 
-DT_MACHINE_START(HIP01, "Hisilicon HIP01 (Flattened Device Tree)")
-	.dt_compat      = hip01_compat,
+DT_MACHINE_START(HISILICON_DT, "HiSilicon Soc")
+	.dt_compat	= hisilicon_compat,
 MACHINE_END
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
