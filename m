From: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv5][ 1/5] fbdev: Add the lacking FB_SYNC_* for matching the DISPLAY_FLAGS_*
Date: Fri,  8 Nov 2013 14:01:29 +0100
Message-ID: <1383915693-9422-1-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, =?UTF-8?q?Eric=20B=C3=A9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Without that fix, drivers using the fb_videomode_from_videomode
  function will not be able to get certain information because
  some DISPLAY_FLAGS_* have no corresponding FB_SYNC_*.

Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Cc: linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Eric B=C3=A9nard <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Acked-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
---
ChangeLog v4->v5:
- Added Geert Uytterhoeven, Grant Likely and Shawn Guo in the Cc list.
- Moved the definitions to a non-userspace header.
- Corrected the comment of the second define.

ChangeLog v3->v4:
- Fixed the issue with FB_SYNC_PIXDAT_HIGH_ACT value.

ChangeLog v2->v3:
- Added Jean-Christophe PLAGNIOL-VILLARD's ACK.
---
 drivers/video/fbmon.c |    4 ++++
 include/linux/fb.h    |    3 +++
 2 files changed, 7 insertions(+)

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
diff --git a/include/linux/fb.h b/include/linux/fb.h
index ffac70a..cf2ad5d 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -45,6 +45,9 @@ struct device_node;
 #define FB_SIGNAL_SYNC_ON_GREEN	8
 #define FB_SIGNAL_SERRATION_ON	16
=20
+#define FB_SYNC_DE_HIGH_ACT     64      /* data enable active high fla=
g */
+#define FB_SYNC_PIXDAT_HIGH_ACT 128     /* drive data on positive edge=
 */
+
 #define FB_MISC_PRIM_COLOR	1
 #define FB_MISC_1ST_DETAIL	2	/* First Detailed Timing is preferred */
 struct fb_chroma {
--=20
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
