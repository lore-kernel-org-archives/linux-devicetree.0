Return-Path: <SRS0=/eZE=QE=ysoft.com=michal.vokac@kernel.org>
From: =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
Subject: [PATCH RESEND v2 2/4] video: ssd1307fb: Do not hard code active-low reset sequence
Date: Mon, 28 Jan 2019 12:53:01 +0100
Message-Id: <1548676383-29685-3-git-send-email-michal.vokac@ysoft.com>
In-Reply-To: <1548676383-29685-1-git-send-email-michal.vokac@ysoft.com>
References: <1548676383-29685-1-git-send-email-michal.vokac@ysoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Ripard <maxime.ripard@bootlin.com>, linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
List-ID: <devicetree@vger.kernel.org>

The SSD130x OLED display reset signal is active low. Now the reset
sequence is implemented in such a way that users are forced to
define reset-gpios as GPIO_ACTIVE_HIGH in DT to make the reset work.

Do not hard code the active-low sequence into the driver but instead
allow the user to specify the gpio as GPIO_ACTIVE_LOW to reflect
the real world.

Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
---
Changes in v2 resend:
 - Add R-by from Alexandre.

Changes from v1:
 - Add R-by from Rob

 drivers/video/fbdev/ssd1307fb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
index 4061a20..3b361bc 100644
--- a/drivers/video/fbdev/ssd1307fb.c
+++ b/drivers/video/fbdev/ssd1307fb.c
@@ -667,10 +667,10 @@ static int ssd1307fb_probe(struct i2c_client *client,
 
 	if (par->reset) {
 		/* Reset the screen */
-		gpiod_set_value_cansleep(par->reset, 0);
-		udelay(4);
 		gpiod_set_value_cansleep(par->reset, 1);
 		udelay(4);
+		gpiod_set_value_cansleep(par->reset, 0);
+		udelay(4);
 	}
 
 	if (par->vbat_reg) {
-- 
2.1.4
