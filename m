From: Richard Genoud <richard.genoud@gmail.com>
Subject: [RFC PATCH 12/13] sound: wm8731: rework power management
Date: Mon,  1 Jul 2013 10:39:37 +0200
Message-ID: <1372667978-4718-13-git-send-email-richard.genoud@gmail.com>
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

- preserve crystal oscillator across suspend/resume sequence:
  enabled by default,it should be kept enabled on resume.
- if codec is in active state: set the active bit at resume time.

Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>
Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
---
 sound/soc/codecs/wm8731.c |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8731.c b/sound/soc/codecs/wm8731.c
index 5276062..3cf6b20 100644
--- a/sound/soc/codecs/wm8731.c
+++ b/sound/soc/codecs/wm8731.c
@@ -465,7 +465,9 @@ static int wm8731_set_bias_level(struct snd_soc_cod=
ec *codec,
 		snd_soc_write(codec, WM8731_PWR, reg | 0x0040);
 		break;
 	case SND_SOC_BIAS_OFF:
-		snd_soc_write(codec, WM8731_PWR, 0xffff);
+		snd_soc_write(codec, WM8731_ACTIVE, 0x0);
+		/* standby: keep crystal oscillator enabled */
+		snd_soc_write(codec, WM8731_PWR, 0x00df);
 		regulator_bulk_disable(ARRAY_SIZE(wm8731->supplies),
 				       wm8731->supplies);
 		regcache_mark_dirty(wm8731->regmap);
@@ -516,6 +518,8 @@ static int wm8731_suspend(struct snd_soc_codec *cod=
ec)
 static int wm8731_resume(struct snd_soc_codec *codec)
 {
 	wm8731_set_bias_level(codec, SND_SOC_BIAS_STANDBY);
+	if (codec->active)
+		snd_soc_write(codec, WM8731_ACTIVE, 0x0001);
=20
 	return 0;
 }
--=20
1.7.10.4
