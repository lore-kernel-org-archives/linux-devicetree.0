From: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv11][ 2/7] video: imxfb: Also add pwmr for the device tree.
Date: Tue,  5 Nov 2013 15:39:09 +0100
Message-ID: <1383662354-22417-2-git-send-email-denis@eukrea.com>
References: <1383662354-22417-1-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383662354-22417-1-git-send-email-denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Eric=20B=C3=A9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

pwmr has to be set to get the imxfb backlight work,
though pwmr was only configurable trough the platform data.

Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Cc: linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Eric B=C3=A9nard <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Acked-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Acked-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/video/fsl,imx-fb.txt       |    3 +++
 drivers/video/imxfb.c                              |    2 ++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/video/fsl,imx-fb.txt b/D=
ocumentation/devicetree/bindings/video/fsl,imx-fb.txt
index 46da08d..ac457ae 100644
--- a/Documentation/devicetree/bindings/video/fsl,imx-fb.txt
+++ b/Documentation/devicetree/bindings/video/fsl,imx-fb.txt
@@ -17,6 +17,9 @@ Required nodes:
 Optional properties:
 - fsl,dmacr: DMA Control Register value. This is optional. By default,=
 the
 	register is not modified as recommended by the datasheet.
+- fsl,pwmr:  LCDC PWM Contrast Control Register value. That property i=
s
+	optional, but defining it is necessary to get the backlight working. =
If that
+	property is ommited, the register is zeroed.
 - fsl,lscr1: LCDC Sharp Configuration Register value.
=20
 Example:
diff --git a/drivers/video/imxfb.c b/drivers/video/imxfb.c
index a2fe8bd..d2447d2 100644
--- a/drivers/video/imxfb.c
+++ b/drivers/video/imxfb.c
@@ -835,6 +835,8 @@ static int imxfb_init_fbinfo(struct platform_device=
 *pdev)
=20
 		of_property_read_u32(np, "fsl,dmacr", &fbi->dmacr);
=20
+		of_property_read_u32(np, "fsl,pwmr", &fbi->pwmr);
+
 		/* These two function pointers could be used by some specific
 		 * platforms. */
 		fbi->lcd_power =3D NULL;
--=20
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
