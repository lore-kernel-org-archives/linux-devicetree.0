From: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 3/7] ARM: s5pv310-dt: Add support for probing platform bus on
	s5pv310 dt-enabled machine
Date: Sat, 12 Feb 2011 18:17:01 +0530
Message-ID: <1297514825-10345-4-git-send-email-thomas.abraham@linaro.org>
References: <1297514825-10345-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-reply-to: <1297514825-10345-1-git-send-email-thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds support for probing devices from device tree
for Samsung's s5pv310 device-tree enabled machine.

Signed-off-by: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/mach-s5pv310/mach-s5pv310-dt.c |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv310/mach-s5pv310-dt.c b/arch/arm/mach-s5pv310/mach-s5pv310-dt.c
index a5e33ff..2578d73 100644
--- a/arch/arm/mach-s5pv310/mach-s5pv310-dt.c
+++ b/arch/arm/mach-s5pv310/mach-s5pv310-dt.c
@@ -57,6 +57,16 @@ static void s5pv310_dt_init_early(void)
 	s3c24xx_init_uarts(uartcfgs, ARRAY_SIZE(uartcfgs));
 }
 
+static struct of_device_id s5pv310_dt_match_table[] __initdata = {
+	{ .compatible = "simple-bus", },
+	{},
+};
+
+static void __init s5pv310_dt_machine_init(void)
+{
+	of_platform_bus_probe(NULL, s5pv310_dt_match_table, NULL);
+}
+
 static char const *s5pv310_dt_compat[] = {
 	"samsung,s5pv310",
 	NULL
@@ -67,6 +77,7 @@ MACHINE_START(S5PV310_DT, "Samsung's S5PV310 with flattened device tree")
 	/* Maintainer: Changhwan Youn <chaos.youn-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> */
 	.init_irq	= s5pv310_init_irq,
 	.map_io		= s5pv310_dt_map_io,
+	.init_machine	= s5pv310_dt_machine_init,
 	.timer		= &s5pv310_timer,
 	.dt_compat	= s5pv310_dt_compat,
 	.init_early	= s5pv310_dt_init_early,
-- 
1.6.6.rc2
