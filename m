From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 08/10] ARM: shmobile: r8a7740: Use DT initialisation of INTC
Date: Sat, 15 Dec 2012 18:03:42 +0900
Message-ID: <1355562224-29448-9-git-send-email-horms+renesas@verge.net.au>
References: <1355562224-29448-1-git-send-email-horms+renesas@verge.net.au>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1355562224-29448-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-sh-owner@vger.kernel.org
To: linux-sh@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, Paul Mundt <lethal@linux-sh.org>, Magnus Damm <magnus.damm@gmail.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Bastian Hecht <hechtb@gmail.com>, Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>, Magnus Damm <damm@opensource.se>, Simon Horman <horms+renesas@verge.net.au>
List-Id: devicetree@vger.kernel.org

From: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>

Cc: Magnus Damm <damm@opensource.se>
Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/mach-shmobile/setup-r8a7740.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-shmobile/setup-r8a7740.c b/arch/arm/mach-shmobile/setup-r8a7740.c
index 11bb1d9..a8e57ab 100644
--- a/arch/arm/mach-shmobile/setup-r8a7740.c
+++ b/arch/arm/mach-shmobile/setup-r8a7740.c
@@ -750,7 +750,7 @@ static const char *r8a7740_boards_compat_dt[] __initdata = {
 DT_MACHINE_START(SH7372_DT, "Generic R8A7740 (Flattened Device Tree)")
 	.map_io		= r8a7740_map_io,
 	.init_early	= r8a7740_add_early_devices_dt,
-	.init_irq	= r8a7740_init_irq,
+	.init_irq	= r8a7740_init_irq_of,
 	.handle_irq	= shmobile_handle_irq_intc,
 	.init_machine	= r8a7740_add_standard_devices_dt,
 	.timer		= &shmobile_timer,
-- 
1.7.10.4

