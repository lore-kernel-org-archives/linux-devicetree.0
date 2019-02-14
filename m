From: <Claudiu.Beznea@microchip.com>
Subject: [PATCH 7/8] ARM: at91: pm: disable RC oscillator in ULP0
Date: Thu, 14 Feb 2019 15:55:01 +0000
Message-ID: <1550159642-26878-8-git-send-email-claudiu.beznea@microchip.com>
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

Disable RC oscillator in ULP0 as datasheet specifies.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 arch/arm/mach-at91/pm_suspend.S | 39 +++++++++++++++++++++++++++++++++++++=
--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-at91/pm_suspend.S b/arch/arm/mach-at91/pm_suspen=
d.S
index 8b18cad1dcf5..5c33023f9129 100644
--- a/arch/arm/mach-at91/pm_suspend.S
+++ b/arch/arm/mach-at91/pm_suspend.S
@@ -178,11 +178,46 @@ ENDPROC(at91_backup_mode)
 	orr	tmp1, tmp1, #AT91_PMC_KEY
 	str	tmp1, [pmc, #AT91_CKGR_MOR]
=20
+	/* Save RC oscillator state */
+	ldr	tmp1, [pmc, #AT91_PMC_SR]
+	str	tmp1, .saved_osc_status
+	tst	tmp1, #AT91_PMC_MOSCRCS
+	bne	1f
+
+	/* Turn off RC oscillator */
+	ldr	tmp1, [pmc, #AT91_CKGR_MOR]
+	bic	tmp1, tmp1, #AT91_PMC_MOSCRCEN
+	bic	tmp1, tmp1, #AT91_PMC_KEY_MASK
+	orr	tmp1, tmp1, #AT91_PMC_KEY
+	str	tmp1, [pmc, #AT91_CKGR_MOR]
+
+	/* Wait main RC disabled done */
+2:	ldr	tmp1, [pmc, #AT91_PMC_SR]
+	tst	tmp1, #AT91_PMC_MOSCRCS
+	bne	2b
+
 	/* Wait for interrupt */
-	at91_cpu_idle
+1:	at91_cpu_idle
=20
-	/* Turn on the crystal oscillator */
+	/* Restore RC oscillator state */
+	ldr	tmp1, .saved_osc_status
+	tst	tmp1, #AT91_PMC_MOSCRCS
+	beq	4f
+
+	/* Turn on RC oscillator */
 	ldr	tmp1, [pmc, #AT91_CKGR_MOR]
+	orr	tmp1, tmp1, #AT91_PMC_MOSCRCEN
+	bic	tmp1, tmp1, #AT91_PMC_KEY_MASK
+	orr	tmp1, tmp1, #AT91_PMC_KEY
+	str	tmp1, [pmc, #AT91_CKGR_MOR]
+
+	/* Wait main RC stabilization */
+3:	ldr	tmp1, [pmc, #AT91_PMC_SR]
+	tst	tmp1, #AT91_PMC_MOSCRCS
+	beq	3b
+
+	/* Turn on the crystal oscillator */
+4:	ldr	tmp1, [pmc, #AT91_CKGR_MOR]
 	orr	tmp1, tmp1, #AT91_PMC_MOSCEN
 	orr	tmp1, tmp1, #AT91_PMC_KEY
 	str	tmp1, [pmc, #AT91_CKGR_MOR]
--=20
2.7.4
