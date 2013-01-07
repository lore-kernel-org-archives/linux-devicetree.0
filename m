From: "Mohammed, Afzal" <afzal-l0cyMroinI0@public.gmane.org>
Subject: RE: [PATCHv16 5/7] fbmon: add of_videomode helpers
Date: Mon, 7 Jan 2013 06:10:13 +0000
Message-ID: <C8443D0743D26F4388EA172BF4E2A7A93EA7FB02@DBDE01.ent.ti.com>
References: <1355850256-16135-1-git-send-email-s.trumtrar@pengutronix.de>
 <1355850256-16135-6-git-send-email-s.trumtrar@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1355850256-16135-6-git-send-email-s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Cc: "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Florian Tobias Schandinat <FlorianSchandinat-Mmb7MZpHnFY@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Valkeinen, Tomi" <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Guennady Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Steffen,

On Tue, Dec 18, 2012 at 22:34:14, Steffen Trumtrar wrote:
> Add helper to get fb_videomode from devicetree.

>  drivers/video/fbmon.c |   42 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/fb.h    |    4 ++++

This breaks DaVinci (da8xx_omapl_defconfig), following change was
required to get it build if OF_VIDEOMODE or/and FB_MODE_HELPERS
is not defined. There may be better solutions, following was the
one that was used by me to test this series.

---8<----------

diff --git a/include/linux/fb.h b/include/linux/fb.h
index 58b9860..0ce30d1 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -716,9 +716,19 @@ extern void fb_destroy_modedb(struct fb_videomode *modedb);
 extern int fb_find_mode_cvt(struct fb_videomode *mode, int margins, int rb);
 extern unsigned char *fb_ddc_read(struct i2c_adapter *adapter);

+#if defined(CONFIG_OF_VIDEOMODE) && defined(CONFIG_FB_MODE_HELPERS)
 extern int of_get_fb_videomode(struct device_node *np,
                               struct fb_videomode *fb,
                               int index);
+#else
+static inline int of_get_fb_videomode(struct device_node *np,
+                                     struct fb_videomode *fb,
+                                     int index)
+{
+       return -EINVAL;
+}
+#endif
+
 extern int fb_videomode_from_videomode(const struct videomode *vm,
                                       struct fb_videomode *fbmode);

---8<----------


> +#if IS_ENABLED(CONFIG_OF_VIDEOMODE)

As _OF_VIDEOMODE is a bool type CONFIG, isn't,

#ifdef CONFIG_OF_VIDEOMODE

sufficient ?

Regards
Afzal
