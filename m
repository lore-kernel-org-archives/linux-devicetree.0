From: <Claudiu.Beznea@microchip.com>
Subject: [PATCH 8/8] ARM: at91: pm: do not disable/enable PLLA for ULP modes
Date: Thu, 14 Feb 2019 15:55:06 +0000
Message-ID: <1550159642-26878-9-git-send-email-claudiu.beznea@microchip.com>
References: <1550159642-26878-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550159642-26878-1-git-send-email-claudiu.beznea@microchip.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com, Ludovic.Desroches@microchip.com, linux@armlinux.org.uk, mturquette@baylibre.com, sboyd@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Claudiu.Beznea@microchip.com
List-Id: devicetree@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea@microchip.com>

There is no need to disable/enable PLLA when switching to one of the
ULP modes. The PLLA consumers should take care of this.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 arch/arm/mach-at91/pm_suspend.S | 31 -------------------------------
 1 file changed, 31 deletions(-)

diff --git a/arch/arm/mach-at91/pm_suspend.S b/arch/arm/mach-at91/pm_suspen=
d.S
index 5c33023f9129..77e29309cc6e 100644
--- a/arch/arm/mach-at91/pm_suspend.S
+++ b/arch/arm/mach-at91/pm_suspend.S
@@ -51,15 +51,6 @@ tmp2	.req	r5
 	.endm
=20
 /*
- * Wait until PLLA has locked.
- */
-	.macro wait_pllalock
-1:	ldr	tmp1, [pmc, #AT91_PMC_SR]
-	tst	tmp1, #AT91_PMC_LOCKA
-	beq	1b
-	.endm
-
-/*
  * Put the processor to enter the idle state
  */
 	.macro at91_cpu_idle
@@ -351,14 +342,6 @@ ENTRY(at91_ulp_mode)
=20
 	wait_mckrdy
=20
-	/* Save PLLA setting and disable it */
-	ldr	tmp1, [pmc, #AT91_CKGR_PLLAR]
-	str	tmp1, .saved_pllar
-
-	mov	tmp1, #AT91_PMC_PLLCOUNT
-	orr	tmp1, tmp1, #(1 << 29)		/* bit 29 always set */
-	str	tmp1, [pmc, #AT91_CKGR_PLLAR]
-
 	ldr	r0, .pm_mode
 	cmp	r0, #AT91_PM_ULP1
 	beq	ulp1_mode
@@ -373,18 +356,6 @@ ulp1_mode:
 ulp_exit:
 	ldr	pmc, .pmc_base
=20
-	/* Restore PLLA setting */
-	ldr	tmp1, .saved_pllar
-	str	tmp1, [pmc, #AT91_CKGR_PLLAR]
-
-	tst	tmp1, #(AT91_PMC_MUL &  0xff0000)
-	bne	3f
-	tst	tmp1, #(AT91_PMC_MUL & ~0xff0000)
-	beq	4f
-3:
-	wait_pllalock
-4:
-
 	/*
 	 * Restore master clock setting
 	 */
@@ -537,8 +508,6 @@ ENDPROC(at91_sramc_self_refresh)
 	.word 0
 .saved_mckr:
 	.word 0
-.saved_pllar:
-	.word 0
 .saved_sam9_lpr:
 	.word 0
 .saved_sam9_lpr1:
--=20
2.7.4
