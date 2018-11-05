From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 08/11] [media] marvell-ccic/mmp: enable clock before accessing registers
Date: Mon,  5 Nov 2018 08:30:51 +0100
Message-ID: <20181105073054.24407-9-lkundrak@v3.sk>
References: <20181105073054.24407-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181105073054.24407-1-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>, linux-media@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>, James Cameron <quozl@laptop.org>, Pavel Machek <pavel@ucw.cz>
List-Id: devicetree@vger.kernel.org

The access to REG_CLKCTRL or REG_CTRL1 without the clock enabled hangs
the machine. Enable the clock first.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 drivers/media/platform/marvell-ccic/mmp-driver.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/marvell-ccic/mmp-driver.c b/drivers/m=
edia/platform/marvell-ccic/mmp-driver.c
index 9e988e527b0d..9c0238f72c40 100644
--- a/drivers/media/platform/marvell-ccic/mmp-driver.c
+++ b/drivers/media/platform/marvell-ccic/mmp-driver.c
@@ -145,6 +145,7 @@ static int mmpcam_power_up(struct mcam_camera *mcam)
  * Turn on power and clocks to the controller.
  */
 	mmpcam_power_up_ctlr(cam);
+	mcam_clk_enable(mcam);
 /*
  * Provide power to the sensor.
  */
@@ -158,8 +159,6 @@ static int mmpcam_power_up(struct mcam_camera *mcam)
 	gpio_set_value(pdata->sensor_reset_gpio, 1); /* reset is active low */
 	mdelay(5);
=20
-	mcam_clk_enable(mcam);
-
 	return 0;
 }
=20
--=20
2.19.1
