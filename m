From: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv4][ 1/6] fbdev: Add the lacking FB_SYNC_* for matching the DISPLAY_FLAGS_*
Date: Mon,  4 Nov 2013 17:15:19 +0100
Message-ID: <1383581724-14817-1-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, =?UTF-8?q?Eric=20B=C3=A9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Without that fix, drivers using the fb_videomode_from_videomode
  function will not be able to get certain information because
  some DISPLAY_FLAGS_* have no corresponding FB_SYNC_*.

Cc: Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Cc: linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Eric B=C3=A9nard <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Acked-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
---
ChangeLog v3->v4:
- Fixed the issue with FB_SYNC_PIXDAT_HIGH_ACT value.

ChangeLog v2->v3:
- Added Jean-Christophe PLAGNIOL-VILLARD's ACK.
---
 drivers/video/fbmon.c   |    4 ++++
 include/uapi/linux/fb.h |    2 ++
 2 files changed, 6 insertions(+)

diff --git a/drivers/video/fbmon.c b/drivers/video/fbmon.c
index 6103fa6..29a9ed0 100644
--- a/drivers/video/fbmon.c
+++ b/drivers/video/fbmon.c
@@ -1402,6 +1402,10 @@ int fb_videomode_from_videomode(const struct vid=
eomode *vm,
 		fbmode->sync |=3D FB_SYNC_HOR_HIGH_ACT;
 	if (vm->flags & DISPLAY_FLAGS_VSYNC_HIGH)
 		fbmode->sync |=3D FB_SYNC_VERT_HIGH_ACT;
+	if (vm->flags & DISPLAY_FLAGS_DE_HIGH)
+		fbmode->sync |=3D FB_SYNC_DE_HIGH_ACT;
+	if (vm->flags & DISPLAY_FLAGS_PIXDATA_POSEDGE)
+		fbmode->sync |=3D FB_SYNC_PIXDAT_HIGH_ACT;
 	if (vm->flags & DISPLAY_FLAGS_INTERLACED)
 		fbmode->vmode |=3D FB_VMODE_INTERLACED;
 	if (vm->flags & DISPLAY_FLAGS_DOUBLESCAN)
diff --git a/include/uapi/linux/fb.h b/include/uapi/linux/fb.h
index fb795c3..c618cfc 100644
--- a/include/uapi/linux/fb.h
+++ b/include/uapi/linux/fb.h
@@ -215,6 +215,8 @@ struct fb_bitfield {
 					/* vtotal =3D 144d/288n/576i =3D> PAL  */
 					/* vtotal =3D 121d/242n/484i =3D> NTSC */
 #define FB_SYNC_ON_GREEN	32	/* sync on green */
+#define FB_SYNC_DE_HIGH_ACT	64	/* data enable high active */
+#define FB_SYNC_PIXDAT_HIGH_ACT	128	/* data enable high active */
=20
 #define FB_VMODE_NONINTERLACED  0	/* non interlaced */
 #define FB_VMODE_INTERLACED	1	/* interlaced	*/
--=20
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
