From: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 3/4] ARM: DT: Add support for probing platform bus on SMDKV310
	machine
Date: Sun, 06 Feb 2011 18:47:29 +0530
Message-ID: <1296998250-21856-4-git-send-email-thomas.abraham@linaro.org>
References: <1296998250-21856-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-reply-to: <1296998250-21856-1-git-send-email-thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
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
for Samsung's SMDKV310 machine.

Signed-off-by: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/mach-s5pv310/mach-smdkv310-dt.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv310/mach-smdkv310-dt.c b/arch/arm/mach-s5pv310/mach-smdkv310-dt.c
index 367fdb1..f81d88a 100644
--- a/arch/arm/mach-s5pv310/mach-smdkv310-dt.c
+++ b/arch/arm/mach-s5pv310/mach-smdkv310-dt.c
@@ -79,9 +79,15 @@ static void __init smdkv310_map_io(void)
 	s3c24xx_init_uarts(smdkv310_uartcfgs, ARRAY_SIZE(smdkv310_uartcfgs));
 }
 
+static struct of_device_id smdkv310_dt_match_table[] __initdata = {
+	{ .compatible = "simple-bus", },
+	{},
+};
+
 static void __init smdkv310_machine_init(void)
 {
 	platform_add_devices(smdkv310_devices, ARRAY_SIZE(smdkv310_devices));
+	of_platform_bus_probe(NULL, smdkv310_dt_match_table, NULL);
 }
 
 static char const *smdkv310_dt_compat[] = {
-- 
1.6.6.rc2
