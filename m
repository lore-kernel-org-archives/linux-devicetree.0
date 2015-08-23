From: Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v2 07/07] ARM: shmobile: Prioritize r8a7791 DT APMU support
Date: Sun, 23 Aug 2015 16:25:42 +0900
Message-ID: <20150823072542.14156.72834.sendpatchset@little-apple>
References: <20150823072427.14156.1960.sendpatchset@little-apple>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <20150823072427.14156.1960.sendpatchset@little-apple>
Sender: linux-sh-owner@vger.kernel.org
To: linux-sh@vger.kernel.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lorenzo.pieralisi@arm.com, keita.kobayashi.ym@renesas.com, horms@verge.net.au, geert@linux-m68k.org, laurent.pinchart@ideasonboard.com, Magnus Damm <magnus.damm@gmail.com>
List-Id: devicetree@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Adjust the r8a7791 SoC support code to not configure any non-DT SMP code
in case the DT-based enable-method has been installed already.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Changes since V1:
 - Broke out bits from former r8a7791-specific patch.

 arch/arm/mach-shmobile/setup-r8a7791.c |    1 +
 1 file changed, 1 insertion(+)

--- 0001/arch/arm/mach-shmobile/setup-r8a7791.c
+++ work/arch/arm/mach-shmobile/setup-r8a7791.c	2015-08-23 15:46:53.002366518 +0900
@@ -29,6 +29,7 @@ static const char *const r8a7791_boards_
 };
 
 DT_MACHINE_START(R8A7791_DT, "Generic R8A7791 (Flattened Device Tree)")
+	.smp_init	= shmobile_smp_init_fallback_ops,
 	.smp		= smp_ops(r8a7791_smp_ops),
 	.init_early	= shmobile_init_delay,
 	.init_time	= rcar_gen2_timer_init,
