From: Richard Genoud <richard.genoud@gmail.com>
Subject: [RFC PATCH 10/13] sound: atmel_ssc_dai: PM: actually stopping clock on suspend/resume
Date: Mon,  1 Jul 2013 10:39:35 +0200
Message-ID: <1372667978-4718-11-git-send-email-richard.genoud@gmail.com>
References: <1372667978-4718-1-git-send-email-richard.genoud@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1372667978-4718-1-git-send-email-richard.genoud@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org, Nicolas Ferre <nicolas.ferre@atmel.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

=46rom: Nicolas Ferre <nicolas.ferre@atmel.com>

Stop SSC clock on suspend/resume cycle checking if the controller is ac=
tually
initialized. This will save power while sleeping.

Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>
Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
---
 sound/soc/atmel/atmel_ssc_dai.c |   20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/sound/soc/atmel/atmel_ssc_dai.c b/sound/soc/atmel/atmel_ss=
c_dai.c
index f3fdfa0..14da27a 100644
--- a/sound/soc/atmel/atmel_ssc_dai.c
+++ b/sound/soc/atmel/atmel_ssc_dai.c
@@ -659,12 +659,10 @@ static int atmel_ssc_prepare(struct snd_pcm_subst=
ream *substream,
 #ifdef CONFIG_PM
 static int atmel_ssc_suspend(struct snd_soc_dai *cpu_dai)
 {
-	struct atmel_ssc_info *ssc_p;
+	struct atmel_ssc_info *ssc_p =3D &ssc_info[cpu_dai->id];
=20
 	if (!cpu_dai->active)
-		return 0;
-
-	ssc_p =3D &ssc_info[cpu_dai->id];
+		goto out;
=20
 	/* Save the status register before disabling transmit and receive */
 	ssc_p->ssc_state.ssc_sr =3D ssc_readl(ssc_p->ssc->regs, SR);
@@ -680,6 +678,11 @@ static int atmel_ssc_suspend(struct snd_soc_dai *c=
pu_dai)
 	ssc_p->ssc_state.ssc_tcmr =3D ssc_readl(ssc_p->ssc->regs, TCMR);
 	ssc_p->ssc_state.ssc_tfmr =3D ssc_readl(ssc_p->ssc->regs, TFMR);
=20
+out:
+	if (ssc_p->initialized) {
+		pr_debug("atmel_ssc_dai: suspend - stop clock\n");
+		clk_disable(ssc_p->ssc->clk);
+	}
 	return 0;
 }
=20
@@ -687,14 +690,17 @@ static int atmel_ssc_suspend(struct snd_soc_dai *=
cpu_dai)
=20
 static int atmel_ssc_resume(struct snd_soc_dai *cpu_dai)
 {
-	struct atmel_ssc_info *ssc_p;
+	struct atmel_ssc_info *ssc_p =3D &ssc_info[cpu_dai->id];
 	u32 cr;
=20
+	if (ssc_p->initialized) {
+		pr_debug("atmel_ssc_dai: resume - restart clock\n");
+		clk_enable(ssc_p->ssc->clk);
+	}
+
 	if (!cpu_dai->active)
 		return 0;
=20
-	ssc_p =3D &ssc_info[cpu_dai->id];
-
 	/* restore SSC register settings */
 	ssc_writel(ssc_p->ssc->regs, TFMR, ssc_p->ssc_state.ssc_tfmr);
 	ssc_writel(ssc_p->ssc->regs, TCMR, ssc_p->ssc_state.ssc_tcmr);
--=20
1.7.10.4
