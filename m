From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: [PATCH 4/8] drm/sun4i: add support for sun8i DE2
 mixers and display engines
Date: Thu, 23 Feb 2017 06:04:45 +0800
Message-ID: <5575691487801085@web19h.yandex.ru>
References: <20170222151854.3280-1-icenowy@aosc.xyz> <20170222151854.3280-5-icenowy@aosc.xyz> <7293775.U3DfjPVPeZ@jernej-laptop>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBAEWXDCQKGQE4K2SUUI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <7293775.U3DfjPVPeZ@jernej-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?utf-8?B?SmVybmVqIMWga3JhYmVj?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, "linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org



23.02.2017, 06:01, "Jernej =C5=A0krabec" <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>:
> Hi,
>
> Dne sreda, 22. februar 2017 ob 16:18:50 CET je Icenowy Zheng napisal(a):
>> =C2=A0Allwinner have a new "Display Engine 2.0" in there new SoCs, which=
 comes
>> =C2=A0in a new "Display Engine" (mixers instead of old backends and
>> =C2=A0frontends).
>>
>> =C2=A0Add support for the mixer on Allwinner V3s SoC; it's the simplest =
one.
>>
>> =C2=A0Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
>> =C2=A0---
>> =C2=A0=C2=A0drivers/gpu/drm/sun4i/Kconfig | 8 +
>> =C2=A0=C2=A0drivers/gpu/drm/sun4i/Makefile | 1 +
>> =C2=A0=C2=A0drivers/gpu/drm/sun4i/sun4i_crtc.c | 6 +-
>> =C2=A0=C2=A0drivers/gpu/drm/sun4i/sun4i_drv.c | 38 +++-
>> =C2=A0=C2=A0drivers/gpu/drm/sun4i/sun4i_drv.h | 1 +
>> =C2=A0=C2=A0drivers/gpu/drm/sun4i/sun4i_layer.c | 92 ++++++--
>> =C2=A0=C2=A0drivers/gpu/drm/sun4i/sun4i_layer.h | 1 +
>> =C2=A0=C2=A0drivers/gpu/drm/sun4i/sun8i_mixer.c | 417
>> =C2=A0++++++++++++++++++++++++++++++++++++ drivers/gpu/drm/sun4i/sun8i_m=
ixer.h |
>> =C2=A0133 ++++++++++++
>> =C2=A0=C2=A09 files changed, 674 insertions(+), 23 deletions(-)
>> =C2=A0=C2=A0create mode 100644 drivers/gpu/drm/sun4i/sun8i_mixer.c
>> =C2=A0=C2=A0create mode 100644 drivers/gpu/drm/sun4i/sun8i_mixer.h
>>
>> =C2=A0diff --git a/drivers/gpu/drm/sun4i/Kconfig b/drivers/gpu/drm/sun4i=
/Kconfig
>> =C2=A0index a4b357db8856..8df401fff145 100644
>> =C2=A0--- a/drivers/gpu/drm/sun4i/Kconfig
>> =C2=A0+++ b/drivers/gpu/drm/sun4i/Kconfig
>> =C2=A0@@ -12,3 +12,11 @@ config DRM_SUN4I
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
Choose this option if you have an Allwinner SoC with a
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
Display Engine. If M is selected the module will be called
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
sun4i-drm.
>> =C2=A0+
>> =C2=A0+config DRM_SUN4I_DE2
>> =C2=A0+ bool "Support Display Engine 2.0"
>> =C2=A0+ depends on DRM_SUN4I
>> =C2=A0+ default MACH_SUN8I
>> =C2=A0+ help
>> =C2=A0+ Choose this option if you have an Allwinner SoC with a
>> =C2=A0+ "Display Engine 2.0".
>> =C2=A0diff --git a/drivers/gpu/drm/sun4i/Makefile b/drivers/gpu/drm/sun4=
i/Makefile
>> =C2=A0index d625a82a6e5f..890e6e50dfee 100644
>> =C2=A0--- a/drivers/gpu/drm/sun4i/Makefile
>> =C2=A0+++ b/drivers/gpu/drm/sun4i/Makefile
>> =C2=A0@@ -9,5 +9,6 @@ sun4i-tcon-y +=3D sun4i_dotclock.o
>>
>> =C2=A0=C2=A0obj-$(CONFIG_DRM_SUN4I) +=3D sun4i-drm.o sun4i-tcon.o
>> =C2=A0=C2=A0obj-$(CONFIG_DRM_SUN4I) +=3D sun4i_backend.o
>> =C2=A0+obj-$(CONFIG_DRM_SUN4I) +=3D sun8i_mixer.o
>> =C2=A0=C2=A0obj-$(CONFIG_DRM_SUN4I) +=3D sun6i_drc.o
>> =C2=A0=C2=A0obj-$(CONFIG_DRM_SUN4I) +=3D sun4i_tv.o
>> =C2=A0diff --git a/drivers/gpu/drm/sun4i/sun4i_crtc.c
>> =C2=A0b/drivers/gpu/drm/sun4i/sun4i_crtc.c index 4a192210574f..4d2228454=
726
>> =C2=A0100644
>> =C2=A0--- a/drivers/gpu/drm/sun4i/sun4i_crtc.c
>> =C2=A0+++ b/drivers/gpu/drm/sun4i/sun4i_crtc.c
>> =C2=A0@@ -25,6 +25,7 @@
>> =C2=A0=C2=A0#include <video/videomode.h>
>>
>> =C2=A0=C2=A0#include "sun4i_backend.h"
>> =C2=A0+#include "sun8i_mixer.h"
>> =C2=A0=C2=A0#include "sun4i_crtc.h"
>> =C2=A0=C2=A0#include "sun4i_drv.h"
>> =C2=A0=C2=A0#include "sun4i_tcon.h"
>> =C2=A0@@ -55,7 +56,10 @@ static void sun4i_crtc_atomic_flush(struct drm_=
crtc
>> =C2=A0*crtc,
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0DRM_DEBUG_DR=
IVER("Committing plane changes\n");
>>
>> =C2=A0- sun4i_backend_commit(drv->backend);
>> =C2=A0+ if (drv->backend)
>> =C2=A0+ sun4i_backend_commit(drv->backend);
>> =C2=A0+ else if (drv->mixer)
>> =C2=A0+ sun8i_mixer_commit(drv->mixer);
>
> Does it make sense to have everything in sun4i_{crtc,drv} files? Looking
> further it seems that there is a lot of differentiation based on DE1 vs D=
E2. I
> guess having separate sun8i_{crtc,drv} files would be more clean approach=
. It
> would enable easier extensions later as well.

I think they have few changes here -- sharing code path is very valuable in=
 these
two files.

>
> Regards,
> Jernej Skrabec
>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (event) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0crtc->state->event =3D NULL;
>> =C2=A0diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c
>> =C2=A0b/drivers/gpu/drm/sun4i/sun4i_drv.c index 4ce665349f6b..58af38f5e8=
33 100644
>> =C2=A0--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
>> =C2=A0+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
>> =C2=A0@@ -20,12 +20,17 @@
>> =C2=A0=C2=A0#include <drm/drm_fb_helper.h>
>> =C2=A0=C2=A0#include <drm/drm_of.h>
>>
>> =C2=A0+#include <linux/of_device.h>
>> =C2=A0+
>> =C2=A0=C2=A0#include "sun4i_crtc.h"
>> =C2=A0=C2=A0#include "sun4i_drv.h"
>> =C2=A0=C2=A0#include "sun4i_framebuffer.h"
>> =C2=A0=C2=A0#include "sun4i_layer.h"
>> =C2=A0=C2=A0#include "sun4i_tcon.h"
>>
>> =C2=A0+#define DE_VER_DE 0
>> =C2=A0+#define DE_VER_DE2 1
>> =C2=A0+
>> =C2=A0=C2=A0static int sun4i_drv_enable_vblank(struct drm_device *drm, u=
nsigned int
>> =C2=A0pipe) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct sun4i=
_drv *drv =3D drm->dev_private;
>> =C2=A0@@ -117,7 +122,9 @@ static int sun4i_drv_bind(struct device *dev)
>> =C2=A0=C2=A0{
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct drm_d=
evice *drm;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct sun4i=
_drv *drv;
>> =C2=A0- int ret;
>> =C2=A0+ int ret, de_ver;
>> =C2=A0+
>> =C2=A0+ de_ver =3D (int)of_device_get_match_data(dev);
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm =3D drm_=
dev_alloc(&sun4i_drv_driver, dev);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (IS_ERR(d=
rm))
>> =C2=A0@@ -140,7 +147,10 @@ static int sun4i_drv_bind(struct device *dev)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Create ou=
r layers */
>> =C2=A0- drv->layers =3D sun4i_layers_init(drm);
>> =C2=A0+ if (de_ver =3D=3D DE_VER_DE2)
>> =C2=A0+ drv->layers =3D sun8i_layers_init(drm);
>> =C2=A0+ else
>> =C2=A0+ drv->layers =3D sun4i_layers_init(drm);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (IS_ERR(d=
rv->layers)) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dev_err(drm->dev, "Couldn't create the =
planes\n");
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D PTR_ERR(drv->layers);
>> =C2=A0@@ -323,10 +333,26 @@ static int sun4i_drv_remove(struct platform_=
device
>> =C2=A0*pdev) }
>>
>> =C2=A0=C2=A0static const struct of_device_id sun4i_drv_of_table[] =3D {
>> =C2=A0- { .compatible =3D "allwinner,sun5i-a13-display-engine" },
>> =C2=A0- { .compatible =3D "allwinner,sun6i-a31-display-engine" },
>> =C2=A0- { .compatible =3D "allwinner,sun6i-a31s-display-engine" },
>> =C2=A0- { .compatible =3D "allwinner,sun8i-a33-display-engine" },
>> =C2=A0+ {
>> =C2=A0+ .compatible =3D "allwinner,sun5i-a13-display-engine",
>> =C2=A0+ .data =3D (void *)DE_VER_DE,
>> =C2=A0+ },
>> =C2=A0+ {
>> =C2=A0+ .compatible =3D "allwinner,sun6i-a31-display-engine",
>> =C2=A0+ .data =3D (void *)DE_VER_DE,
>> =C2=A0+ },
>> =C2=A0+ {
>> =C2=A0+ .compatible =3D "allwinner,sun6i-a31s-display-engine",
>> =C2=A0+ .data =3D (void *)DE_VER_DE,
>> =C2=A0+ },
>> =C2=A0+ {
>> =C2=A0+ .compatible =3D "allwinner,sun8i-a33-display-engine",
>> =C2=A0+ .data =3D (void *)DE_VER_DE,
>> =C2=A0+ },
>> =C2=A0+ {
>> =C2=A0+ .compatible =3D "allwinner,sun8i-v3s-display-engine",
>> =C2=A0+ .data =3D (void *)DE_VER_DE2,
>> =C2=A0+ },
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ }
>> =C2=A0=C2=A0};
>> =C2=A0=C2=A0MODULE_DEVICE_TABLE(of, sun4i_drv_of_table);
>> =C2=A0diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.h
>> =C2=A0b/drivers/gpu/drm/sun4i/sun4i_drv.h index 597353eab728..cf1da95b85=
bd 100644
>> =C2=A0--- a/drivers/gpu/drm/sun4i/sun4i_drv.h
>> =C2=A0+++ b/drivers/gpu/drm/sun4i/sun4i_drv.h
>> =C2=A0@@ -18,6 +18,7 @@
>>
>> =C2=A0=C2=A0struct sun4i_drv {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct sun4i=
_backend *backend;
>> =C2=A0+ struct sun8i_mixer *mixer;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct sun4i=
_crtc *crtc;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct sun4i=
_tcon *tcon;
>>
>> =C2=A0diff --git a/drivers/gpu/drm/sun4i/sun4i_layer.c
>> =C2=A0b/drivers/gpu/drm/sun4i/sun4i_layer.c index 5d53c977bca5..6dcdac38=
ab69
>> =C2=A0100644
>> =C2=A0--- a/drivers/gpu/drm/sun4i/sun4i_layer.c
>> =C2=A0+++ b/drivers/gpu/drm/sun4i/sun4i_layer.c
>> =C2=A0@@ -16,52 +16,66 @@
>> =C2=A0=C2=A0#include <drm/drmP.h>
>>
>> =C2=A0=C2=A0#include "sun4i_backend.h"
>> =C2=A0+#include "sun8i_mixer.h"
>> =C2=A0=C2=A0#include "sun4i_drv.h"
>> =C2=A0=C2=A0#include "sun4i_layer.h"
>>
>> =C2=A0=C2=A0struct sun4i_plane_desc {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0enum drm_plane_type type;
>> =C2=A0+ /* Pipe is not used in sun8i-mixer */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u8 pipe;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const uint32_t *formats;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uint32_t nformats;
>> =C2=A0=C2=A0};
>>
>> =C2=A0-static int sun4i_backend_layer_atomic_check(struct drm_plane *pla=
ne,
>> =C2=A0+static int sun4i_layer_atomic_check(struct drm_plane *plane,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct drm_plane_stat=
e *state)
>> =C2=A0=C2=A0{
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
>> =C2=A0=C2=A0}
>>
>> =C2=A0-static void sun4i_backend_layer_atomic_disable(struct drm_plane *=
plane,
>> =C2=A0+static void sun4i_layer_atomic_disable(struct drm_plane *plane,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0str=
uct drm_plane_state *old_state)
>> =C2=A0=C2=A0{
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct sun4i=
_layer *layer =3D plane_to_sun4i_layer(plane);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct sun4i=
_drv *drv =3D layer->drv;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct sun4i=
_backend *backend =3D drv->backend;
>> =C2=A0+ struct sun8i_mixer *mixer =3D drv->mixer;
>>
>> =C2=A0- sun4i_backend_layer_enable(backend, layer->id, false);
>> =C2=A0+ if (backend)
>> =C2=A0+ sun4i_backend_layer_enable(backend, layer->id, false);
>> =C2=A0+ else if (mixer)
>> =C2=A0+ sun8i_mixer_layer_enable(mixer, layer->id, false);
>> =C2=A0=C2=A0}
>>
>> =C2=A0-static void sun4i_backend_layer_atomic_update(struct drm_plane *p=
lane,
>> =C2=A0+static void sun4i_layer_atomic_update(struct drm_plane *plane,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct dr=
m_plane_state *old_state)
>> =C2=A0=C2=A0{
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct sun4i=
_layer *layer =3D plane_to_sun4i_layer(plane);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct sun4i=
_drv *drv =3D layer->drv;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct sun4i=
_backend *backend =3D drv->backend;
>> =C2=A0-
>> =C2=A0- sun4i_backend_update_layer_coord(backend, layer->id, plane);
>> =C2=A0- sun4i_backend_update_layer_formats(backend, layer->id, plane);
>> =C2=A0- sun4i_backend_update_layer_buffer(backend, layer->id, plane);
>> =C2=A0- sun4i_backend_layer_enable(backend, layer->id, true);
>> =C2=A0+ struct sun8i_mixer *mixer =3D drv->mixer;
>> =C2=A0+
>> =C2=A0+ if (backend) {
>> =C2=A0+ sun4i_backend_update_layer_coord(backend, layer->id, plane);
>> =C2=A0+ sun4i_backend_update_layer_formats(backend, layer->id, plane);
>> =C2=A0+ sun4i_backend_update_layer_buffer(backend, layer->id, plane);
>> =C2=A0+ sun4i_backend_layer_enable(backend, layer->id, true);
>> =C2=A0+ } else if (mixer) {
>> =C2=A0+ sun8i_mixer_update_layer_coord(mixer, layer->id, plane);
>> =C2=A0+ sun8i_mixer_update_layer_formats(mixer, layer->id, plane);
>> =C2=A0+ sun8i_mixer_update_layer_buffer(mixer, layer->id, plane);
>> =C2=A0+ sun8i_mixer_layer_enable(mixer, layer->id, true);
>> =C2=A0+ }
>> =C2=A0=C2=A0}
>>
>> =C2=A0-static struct drm_plane_helper_funcs sun4i_backend_layer_helper_f=
uncs =3D {
>> =C2=A0- .atomic_check =3D sun4i_backend_layer_atomic_check,
>> =C2=A0- .atomic_disable =3D sun4i_backend_layer_atomic_disable,
>> =C2=A0- .atomic_update =3D sun4i_backend_layer_atomic_update,
>> =C2=A0+static struct drm_plane_helper_funcs sun4i_layer_helper_funcs =3D=
 {
>> =C2=A0+ .atomic_check =3D sun4i_layer_atomic_check,
>> =C2=A0+ .atomic_disable =3D sun4i_layer_atomic_disable,
>> =C2=A0+ .atomic_update =3D sun4i_layer_atomic_update,
>> =C2=A0=C2=A0};
>>
>> =C2=A0-static const struct drm_plane_funcs sun4i_backend_layer_funcs =3D=
 {
>> =C2=A0+static const struct drm_plane_funcs sun4i_layer_funcs =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.atomic_dest=
roy_state =3D drm_atomic_helper_plane_destroy_state,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.atomic_dupl=
icate_state =3D drm_atomic_helper_plane_duplicate_state,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.destroy =3D=
 drm_plane_cleanup,
>> =C2=A0@@ -88,6 +102,12 @@ static const uint32_t
>> =C2=A0sun4i_backend_layer_formats_overlay[] =3D { DRM_FORMAT_XRGB8888,
>> =C2=A0=C2=A0};
>>
>> =C2=A0+static const uint32_t sun8i_mixer_layer_formats[] =3D {
>> =C2=A0+ DRM_FORMAT_ARGB8888,
>> =C2=A0+ DRM_FORMAT_RGB888,
>> =C2=A0+ DRM_FORMAT_XRGB8888,
>> =C2=A0+};
>> =C2=A0+
>> =C2=A0=C2=A0static const struct sun4i_plane_desc sun4i_backend_planes[] =
=3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.type =3D DRM_PLANE_TYPE_PRIMARY,
>> =C2=A0@@ -103,6 +123,19 @@ static const struct sun4i_plane_desc
>> =C2=A0sun4i_backend_planes[] =3D { },
>> =C2=A0=C2=A0};
>>
>> =C2=A0+static const struct sun4i_plane_desc sun8i_mixer_planes[] =3D {
>> =C2=A0+ {
>> =C2=A0+ .type =3D DRM_PLANE_TYPE_PRIMARY,
>> =C2=A0+ .formats =3D sun8i_mixer_layer_formats,
>> =C2=A0+ .nformats =3D ARRAY_SIZE(sun8i_mixer_layer_formats),
>> =C2=A0+ },
>> =C2=A0+ {
>> =C2=A0+ .type =3D DRM_PLANE_TYPE_OVERLAY,
>> =C2=A0+ .formats =3D sun8i_mixer_layer_formats,
>> =C2=A0+ .nformats =3D ARRAY_SIZE(sun8i_mixer_layer_formats),
>> =C2=A0+ },
>> =C2=A0+};
>> =C2=A0+
>> =C2=A0=C2=A0static struct sun4i_layer *sun4i_layer_init_one(struct drm_d=
evice *drm,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0const struct sun4i_plane_desc *plane)
>> =C2=A0=C2=A0{
>> =C2=A0@@ -115,7 +148,7 @@ static struct sun4i_layer *sun4i_layer_init_on=
e(struct
>> =C2=A0drm_device *drm, return ERR_PTR(-ENOMEM);
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D drm_=
universal_plane_init(drm, &layer->plane, BIT(0),
>> =C2=A0- &sun4i_backend_layer_funcs,
>> =C2=A0+ &sun4i_layer_funcs,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0plane->formats, plane->nformats,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0plane->type, NULL);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret) {
>> =C2=A0@@ -124,7 +157,7 @@ static struct sun4i_layer *sun4i_layer_init_on=
e(struct
>> =C2=A0drm_device *drm, }
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_plane_he=
lper_add(&layer->plane,
>> =C2=A0- &sun4i_backend_layer_helper_funcs);
>> =C2=A0+ &sun4i_layer_helper_funcs);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0layer->drv =
=3D drv;
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (plane->t=
ype =3D=3D DRM_PLANE_TYPE_PRIMARY)
>> =C2=A0@@ -187,3 +220,30 @@ struct sun4i_layer **sun4i_layers_init(struct
>> =C2=A0drm_device *drm)
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return layer=
s;
>> =C2=A0=C2=A0}
>> =C2=A0+
>> =C2=A0+struct sun4i_layer **sun8i_layers_init(struct drm_device *drm)
>> =C2=A0+{
>> =C2=A0+ struct sun4i_layer **layers;
>> =C2=A0+ int i;
>> =C2=A0+
>> =C2=A0+ layers =3D devm_kcalloc(drm->dev, ARRAY_SIZE(sun8i_mixer_planes)=
,
>> =C2=A0+ sizeof(**layers), GFP_KERNEL);
>> =C2=A0+ if (!layers)
>> =C2=A0+ return ERR_PTR(-ENOMEM);
>> =C2=A0+
>> =C2=A0+ for (i =3D 0; i < ARRAY_SIZE(sun8i_mixer_planes); i++) {
>> =C2=A0+ const struct sun4i_plane_desc *plane =3D &sun8i_mixer_planes[i];
>> =C2=A0+ struct sun4i_layer *layer =3D layers[i];
>> =C2=A0+
>> =C2=A0+ layer =3D sun4i_layer_init_one(drm, plane);
>> =C2=A0+ if (IS_ERR(layer)) {
>> =C2=A0+ dev_err(drm->dev, "Couldn't initialize %s plane\n",
>> =C2=A0+ i ? "overlay" : "primary");
>> =C2=A0+ return ERR_CAST(layer);
>> =C2=A0+ };
>> =C2=A0+
>> =C2=A0+ layer->id =3D i;
>> =C2=A0+ };
>> =C2=A0+
>> =C2=A0+ return layers;
>> =C2=A0+}
>> =C2=A0diff --git a/drivers/gpu/drm/sun4i/sun4i_layer.h
>> =C2=A0b/drivers/gpu/drm/sun4i/sun4i_layer.h index a2f65d7a3f4e..f7b9e5da=
ea50
>> =C2=A0100644
>> =C2=A0--- a/drivers/gpu/drm/sun4i/sun4i_layer.h
>> =C2=A0+++ b/drivers/gpu/drm/sun4i/sun4i_layer.h
>> =C2=A0@@ -26,5 +26,6 @@ plane_to_sun4i_layer(struct drm_plane *plane)
>> =C2=A0=C2=A0}
>>
>> =C2=A0=C2=A0struct sun4i_layer **sun4i_layers_init(struct drm_device *dr=
m);
>> =C2=A0+struct sun4i_layer **sun8i_layers_init(struct drm_device *drm);
>>
>> =C2=A0=C2=A0#endif /* _SUN4I_LAYER_H_ */
>> =C2=A0diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c
>> =C2=A0b/drivers/gpu/drm/sun4i/sun8i_mixer.c new file mode 100644
>> =C2=A0index 000000000000..9427b57240d3
>> =C2=A0--- /dev/null
>> =C2=A0+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
>> =C2=A0@@ -0,0 +1,417 @@
>> =C2=A0+/*
>> =C2=A0+ * Copyright (C) 2017 Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
>> =C2=A0+ *
>> =C2=A0+ * Based on sun4i_backend.c, which is:
>> =C2=A0+ * Copyright (C) 2015 Free Electrons
>> =C2=A0+ * Copyright (C) 2015 NextThing Co
>> =C2=A0+ *
>> =C2=A0+ * This program is free software; you can redistribute it and/or
>> =C2=A0+ * modify it under the terms of the GNU General Public License as
>> =C2=A0+ * published by the Free Software Foundation; either version 2 of
>> =C2=A0+ * the License, or (at your option) any later version.
>> =C2=A0+ */
>> =C2=A0+
>> =C2=A0+#include <drm/drmP.h>
>> =C2=A0+#include <drm/drm_atomic_helper.h>
>> =C2=A0+#include <drm/drm_crtc.h>
>> =C2=A0+#include <drm/drm_crtc_helper.h>
>> =C2=A0+#include <drm/drm_fb_cma_helper.h>
>> =C2=A0+#include <drm/drm_gem_cma_helper.h>
>> =C2=A0+#include <drm/drm_plane_helper.h>
>> =C2=A0+
>> =C2=A0+#include <linux/component.h>
>> =C2=A0+#include <linux/reset.h>
>> =C2=A0+#include <linux/of_device.h>
>> =C2=A0+
>> =C2=A0+#include "sun8i_mixer.h"
>> =C2=A0+#include "sun4i_drv.h"
>> =C2=A0+
>> =C2=A0+#define SUN8I_DRAM_OFFSET 0x40000000
>> =C2=A0+
>> =C2=A0+#if defined CONFIG_DRM_SUN4I_DE2
>> =C2=A0+void sun8i_mixer_commit(struct sun8i_mixer *mixer)
>> =C2=A0+{
>> =C2=A0+ DRM_DEBUG_DRIVER("Committing changes\n");
>> =C2=A0+
>> =C2=A0+ regmap_write(mixer->regs, SUN8I_MIXER_GLOBAL_DBUFF,
>> =C2=A0+ SUN8I_MIXER_GLOBAL_DBUFF_ENABLE);
>> =C2=A0+}
>> =C2=A0+EXPORT_SYMBOL(sun8i_mixer_commit);
>> =C2=A0+
>> =C2=A0+void sun8i_mixer_layer_enable(struct sun8i_mixer *mixer,
>> =C2=A0+ int layer, bool enable)
>> =C2=A0+{
>> =C2=A0+ u32 val;
>> =C2=A0+ /* Currently the first UI channel is used */
>> =C2=A0+ int chan =3D mixer->cfg->vi_num;
>> =C2=A0+
>> =C2=A0+ DRM_DEBUG_DRIVER("Enabling layer %d in channel %d\n", layer, cha=
n);
>> =C2=A0+
>> =C2=A0+ if (enable)
>> =C2=A0+ val =3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN;
>> =C2=A0+ else
>> =C2=A0+ val =3D 0;
>> =C2=A0+
>> =C2=A0+ regmap_update_bits(mixer->regs,
>> =C2=A0+ SUN8I_MIXER_CHAN_UI_LAYER_ATTR(chan, layer),
>> =C2=A0+ SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN, val);
>> =C2=A0+
>> =C2=A0+ /* Set the alpha configuration */
>> =C2=A0+ regmap_update_bits(mixer->regs,
>> =C2=A0+ SUN8I_MIXER_CHAN_UI_LAYER_ATTR(chan, layer),
>> =C2=A0+ SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_MASK,
>> =C2=A0+ SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_DEF);
>> =C2=A0+ regmap_update_bits(mixer->regs,
>> =C2=A0+ SUN8I_MIXER_CHAN_UI_LAYER_ATTR(chan, layer),
>> =C2=A0+ SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MASK,
>> =C2=A0+ SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_DEF);
>> =C2=A0+}
>> =C2=A0+EXPORT_SYMBOL(sun8i_mixer_layer_enable);
>> =C2=A0+
>> =C2=A0+static int sun8i_mixer_drm_format_to_layer(struct drm_plane *plan=
e,
>> =C2=A0+ u32 format, u32 *mode)
>> =C2=A0+{
>> =C2=A0+ if ((plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY) &&
>> =C2=A0+ (format =3D=3D DRM_FORMAT_ARGB8888))
>> =C2=A0+ format =3D DRM_FORMAT_XRGB8888;
>> =C2=A0+
>> =C2=A0+ switch (format) {
>> =C2=A0+ case DRM_FORMAT_ARGB8888:
>> =C2=A0+ *mode =3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_ARGB8888;
>> =C2=A0+ break;
>> =C2=A0+
>> =C2=A0+ case DRM_FORMAT_XRGB8888:
>> =C2=A0+ *mode =3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_XRGB8888;
>> =C2=A0+ break;
>> =C2=A0+
>> =C2=A0+ case DRM_FORMAT_RGB888:
>> =C2=A0+ *mode =3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_RGB888;
>> =C2=A0+ break;
>> =C2=A0+
>> =C2=A0+ default:
>> =C2=A0+ return -EINVAL;
>> =C2=A0+ }
>> =C2=A0+
>> =C2=A0+ return 0;
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+int sun8i_mixer_update_layer_coord(struct sun8i_mixer *mixer,
>> =C2=A0+ int layer, struct drm_plane *plane)
>> =C2=A0+{
>> =C2=A0+ struct drm_plane_state *state =3D plane->state;
>> =C2=A0+ struct drm_framebuffer *fb =3D state->fb;
>> =C2=A0+ /* Currently the first UI channel is used */
>> =C2=A0+ int chan =3D mixer->cfg->vi_num;
>> =C2=A0+ int i;
>> =C2=A0+
>> =C2=A0+ DRM_DEBUG_DRIVER("Updating layer %d\n", layer);
>> =C2=A0+
>> =C2=A0+ if (plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY) {
>> =C2=A0+ DRM_DEBUG_DRIVER("Primary layer, updating global size W: %u H: %=
u\n",
>> =C2=A0+ state->crtc_w, state->crtc_h);
>> =C2=A0+ regmap_write(mixer->regs, SUN8I_MIXER_GLOBAL_SIZE,
>> =C2=A0+ SUN8I_MIXER_SIZE(state->crtc_w,
>> =C2=A0+ state->crtc_h));
>> =C2=A0+ DRM_DEBUG_DRIVER("Updating blender size\n");
>> =C2=A0+ for (i =3D 0; i < SUN8I_MIXER_MAX_CHAN_COUNT; i++)
>> =C2=A0+ regmap_write(mixer->regs,
>> =C2=A0+ SUN8I_MIXER_BLEND_ATTR_INSIZE(i),
>> =C2=A0+ SUN8I_MIXER_SIZE(state->crtc_w,
>> =C2=A0+ state->crtc_h));
>> =C2=A0+ regmap_write(mixer->regs, SUN8I_MIXER_BLEND_OUTSIZE,
>> =C2=A0+ SUN8I_MIXER_SIZE(state->crtc_w,
>> =C2=A0+ state->crtc_h));
>> =C2=A0+ DRM_DEBUG_DRIVER("Updating channel size\n");
>> =C2=A0+ regmap_write(mixer->regs, SUN8I_MIXER_CHAN_UI_OVL_SIZE(chan),
>> =C2=A0+ SUN8I_MIXER_SIZE(state->crtc_w,
>> =C2=A0+ state->crtc_h));
>> =C2=A0+ }
>> =C2=A0+
>> =C2=A0+ /* Set the line width */
>> =C2=A0+ DRM_DEBUG_DRIVER("Layer line width: %d bytes\n", fb->pitches[0])=
;
>> =C2=A0+ regmap_write(mixer->regs, SUN8I_MIXER_CHAN_UI_LAYER_PITCH(chan, =
layer),
>> =C2=A0+ fb->pitches[0]);
>> =C2=A0+
>> =C2=A0+ /* Set height and width */
>> =C2=A0+ DRM_DEBUG_DRIVER("Layer size W: %u H: %u\n",
>> =C2=A0+ state->crtc_w, state->crtc_h);
>> =C2=A0+ regmap_write(mixer->regs, SUN8I_MIXER_CHAN_UI_LAYER_SIZE(chan, l=
ayer),
>> =C2=A0+ SUN8I_MIXER_SIZE(state->crtc_w, state->crtc_h));
>> =C2=A0+
>> =C2=A0+ /* Set base coordinates */
>> =C2=A0+ DRM_DEBUG_DRIVER("Layer coordinates X: %d Y: %d\n",
>> =C2=A0+ state->crtc_x, state->crtc_y);
>> =C2=A0+ regmap_write(mixer->regs, SUN8I_MIXER_CHAN_UI_LAYER_COORD(chan, =
layer),
>> =C2=A0+ SUN8I_MIXER_COORD(state->crtc_x, state->crtc_y));
>> =C2=A0+
>> =C2=A0+ return 0;
>> =C2=A0+}
>> =C2=A0+EXPORT_SYMBOL(sun8i_mixer_update_layer_coord);
>> =C2=A0+
>> =C2=A0+int sun8i_mixer_update_layer_formats(struct sun8i_mixer *mixer,
>> =C2=A0+ int layer, struct drm_plane *plane)
>> =C2=A0+{
>> =C2=A0+ struct drm_plane_state *state =3D plane->state;
>> =C2=A0+ struct drm_framebuffer *fb =3D state->fb;
>> =C2=A0+ bool interlaced =3D false;
>> =C2=A0+ u32 val;
>> =C2=A0+ /* Currently the first UI channel is used */
>> =C2=A0+ int chan =3D mixer->cfg->vi_num;
>> =C2=A0+ int ret;
>> =C2=A0+
>> =C2=A0+ if (plane->state->crtc)
>> =C2=A0+ interlaced =3D plane->state->crtc->state->adjusted_mode.flags
>> =C2=A0+ & DRM_MODE_FLAG_INTERLACE;
>> =C2=A0+
>> =C2=A0+ regmap_update_bits(mixer->regs, SUN8I_MIXER_BLEND_OUTCTL,
>> =C2=A0+ SUN8I_MIXER_BLEND_OUTCTL_INTERLACED,
>> =C2=A0+ interlaced ?
>> =C2=A0+ SUN8I_MIXER_BLEND_OUTCTL_INTERLACED : 0);
>> =C2=A0+
>> =C2=A0+ DRM_DEBUG_DRIVER("Switching display mixer interlaced mode %s\n",
>> =C2=A0+ interlaced ? "on" : "off");
>> =C2=A0+
>> =C2=A0+ ret =3D sun8i_mixer_drm_format_to_layer(plane, fb->format->forma=
t,
>> =C2=A0+ &val);
>> =C2=A0+ if (ret) {
>> =C2=A0+ DRM_DEBUG_DRIVER("Invalid format\n");
>> =C2=A0+ return ret;
>> =C2=A0+ }
>> =C2=A0+
>> =C2=A0+ regmap_update_bits(mixer->regs,
>> =C2=A0+ SUN8I_MIXER_CHAN_UI_LAYER_ATTR(chan, layer),
>> =C2=A0+ SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_MASK, val);
>> =C2=A0+
>> =C2=A0+ return 0;
>> =C2=A0+}
>> =C2=A0+EXPORT_SYMBOL(sun8i_mixer_update_layer_formats);
>> =C2=A0+
>> =C2=A0+int sun8i_mixer_update_layer_buffer(struct sun8i_mixer *mixer,
>> =C2=A0+ int layer, struct drm_plane *plane)
>> =C2=A0+{
>> =C2=A0+ struct drm_plane_state *state =3D plane->state;
>> =C2=A0+ struct drm_framebuffer *fb =3D state->fb;
>> =C2=A0+ struct drm_gem_cma_object *gem;
>> =C2=A0+ dma_addr_t paddr;
>> =C2=A0+ uint32_t paddr_u32;
>> =C2=A0+ /* Currently the first UI channel is used */
>> =C2=A0+ int chan =3D mixer->cfg->vi_num;
>> =C2=A0+ int bpp;
>> =C2=A0+
>> =C2=A0+ /* Get the physical address of the buffer in memory */
>> =C2=A0+ gem =3D drm_fb_cma_get_gem_obj(fb, 0);
>> =C2=A0+
>> =C2=A0+ DRM_DEBUG_DRIVER("Using GEM @ %pad\n", &gem->paddr);
>> =C2=A0+
>> =C2=A0+ /* Compute the start of the displayed memory */
>> =C2=A0+ bpp =3D fb->format->cpp[0];
>> =C2=A0+ paddr =3D gem->paddr + fb->offsets[0];
>> =C2=A0+ paddr +=3D (state->src_x >> 16) * bpp;
>> =C2=A0+ paddr +=3D (state->src_y >> 16) * fb->pitches[0];
>> =C2=A0+ paddr -=3D SUN8I_DRAM_OFFSET;
>> =C2=A0+
>> =C2=A0+ DRM_DEBUG_DRIVER("Setting buffer address to %pad\n", &paddr);
>> =C2=A0+
>> =C2=A0+ paddr_u32 =3D (uint32_t) paddr;
>> =C2=A0+
>> =C2=A0+ regmap_write(mixer->regs,
>> =C2=A0+ SUN8I_MIXER_CHAN_UI_LAYER_TOP_LADDR(chan, layer),
>> =C2=A0+ paddr_u32);
>> =C2=A0+
>> =C2=A0+ return 0;
>> =C2=A0+}
>> =C2=A0+EXPORT_SYMBOL(sun8i_mixer_update_layer_buffer);
>> =C2=A0+
>> =C2=A0+static struct regmap_config sun8i_mixer_regmap_config =3D {
>> =C2=A0+ .reg_bits =3D 32,
>> =C2=A0+ .val_bits =3D 32,
>> =C2=A0+ .reg_stride =3D 4,
>> =C2=A0+ .max_register =3D 0xbffc, /* guessed */
>> =C2=A0+};
>> =C2=A0+
>> =C2=A0+static int sun8i_mixer_bind(struct device *dev, struct device *ma=
ster,
>> =C2=A0+ void *data)
>> =C2=A0+{
>> =C2=A0+ struct platform_device *pdev =3D to_platform_device(dev);
>> =C2=A0+ struct drm_device *drm =3D data;
>> =C2=A0+ struct sun4i_drv *drv =3D drm->dev_private;
>> =C2=A0+ struct sun8i_mixer *mixer;
>> =C2=A0+ struct resource *res;
>> =C2=A0+ void __iomem *regs;
>> =C2=A0+ int i, ret;
>> =C2=A0+
>> =C2=A0+ mixer =3D devm_kzalloc(dev, sizeof(*mixer), GFP_KERNEL);
>> =C2=A0+ if (!mixer)
>> =C2=A0+ return -ENOMEM;
>> =C2=A0+ dev_set_drvdata(dev, mixer);
>> =C2=A0+ drv->mixer =3D mixer;
>> =C2=A0+
>> =C2=A0+ mixer->cfg =3D of_device_get_match_data(dev);
>> =C2=A0+ if (!mixer->cfg)
>> =C2=A0+ return -EINVAL;
>> =C2=A0+
>> =C2=A0+ res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> =C2=A0+ regs =3D devm_ioremap_resource(dev, res);
>> =C2=A0+ if (IS_ERR(regs))
>> =C2=A0+ return PTR_ERR(regs);
>> =C2=A0+
>> =C2=A0+ mixer->regs =3D devm_regmap_init_mmio(dev, regs,
>> =C2=A0+ &sun8i_mixer_regmap_config);
>> =C2=A0+ if (IS_ERR(mixer->regs)) {
>> =C2=A0+ dev_err(dev, "Couldn't create the mixer regmap\n");
>> =C2=A0+ return PTR_ERR(mixer->regs);
>> =C2=A0+ }
>> =C2=A0+
>> =C2=A0+ mixer->reset =3D devm_reset_control_get(dev, NULL);
>> =C2=A0+ if (IS_ERR(mixer->reset)) {
>> =C2=A0+ dev_err(dev, "Couldn't get our reset line\n");
>> =C2=A0+ return PTR_ERR(mixer->reset);
>> =C2=A0+ }
>> =C2=A0+
>> =C2=A0+ ret =3D reset_control_deassert(mixer->reset);
>> =C2=A0+ if (ret) {
>> =C2=A0+ dev_err(dev, "Couldn't deassert our reset line\n");
>> =C2=A0+ return ret;
>> =C2=A0+ }
>> =C2=A0+
>> =C2=A0+ mixer->bus_clk =3D devm_clk_get(dev, "bus");
>> =C2=A0+ if (IS_ERR(mixer->bus_clk)) {
>> =C2=A0+ dev_err(dev, "Couldn't get the mixer bus clock\n");
>> =C2=A0+ ret =3D PTR_ERR(mixer->bus_clk);
>> =C2=A0+ goto err_assert_reset;
>> =C2=A0+ }
>> =C2=A0+ clk_prepare_enable(mixer->bus_clk);
>> =C2=A0+
>> =C2=A0+ mixer->mod_clk =3D devm_clk_get(dev, "mod");
>> =C2=A0+ if (IS_ERR(mixer->mod_clk)) {
>> =C2=A0+ dev_err(dev, "Couldn't get the mixer module clock\n");
>> =C2=A0+ ret =3D PTR_ERR(mixer->mod_clk);
>> =C2=A0+ goto err_disable_bus_clk;
>> =C2=A0+ }
>> =C2=A0+ clk_prepare_enable(mixer->mod_clk);
>> =C2=A0+
>> =C2=A0+ /* Reset the registers */
>> =C2=A0+ for (i =3D 0x0; i < 0x20000; i +=3D 4)
>> =C2=A0+ regmap_write(mixer->regs, i, 0);
>> =C2=A0+
>> =C2=A0+ /* Enable the mixer */
>> =C2=A0+ regmap_write(mixer->regs, SUN8I_MIXER_GLOBAL_CTL,
>> =C2=A0+ SUN8I_MIXER_GLOBAL_CTL_RT_EN);
>> =C2=A0+
>> =C2=A0+ /* Initialize blender */
>> =C2=A0+ regmap_write(mixer->regs, SUN8I_MIXER_BLEND_FCOLOR_CTL,
>> =C2=A0+ SUN8I_MIXER_BLEND_FCOLOR_CTL_DEF);
>> =C2=A0+ regmap_write(mixer->regs, SUN8I_MIXER_BLEND_PREMULTIPLY,
>> =C2=A0+ SUN8I_MIXER_BLEND_PREMULTIPLY_DEF);
>> =C2=A0+ regmap_write(mixer->regs, SUN8I_MIXER_BLEND_BKCOLOR,
>> =C2=A0+ SUN8I_MIXER_BLEND_BKCOLOR_DEF);
>> =C2=A0+ regmap_write(mixer->regs, SUN8I_MIXER_BLEND_MODE(0),
>> =C2=A0+ SUN8I_MIXER_BLEND_MODE_DEF);
>> =C2=A0+ regmap_write(mixer->regs, SUN8I_MIXER_BLEND_MODE(1),
>> =C2=A0+ SUN8I_MIXER_BLEND_MODE_DEF);
>> =C2=A0+ regmap_write(mixer->regs, SUN8I_MIXER_BLEND_CK_CTL,
>> =C2=A0+ SUN8I_MIXER_BLEND_CK_CTL_DEF);
>> =C2=A0+
>> =C2=A0+ for (i =3D 0; i < SUN8I_MIXER_MAX_CHAN_COUNT; i++)
>> =C2=A0+ regmap_write(mixer->regs,
>> =C2=A0+ SUN8I_MIXER_BLEND_ATTR_FCOLOR(i),
>> =C2=A0+ SUN8I_MIXER_BLEND_ATTR_FCOLOR_DEF);
>> =C2=A0+
>> =C2=A0+ /* Select the first UI channel */
>> =C2=A0+ DRM_DEBUG_DRIVER("Selecting channel %d (first UI channel)\n",
>> =C2=A0+ mixer->cfg->vi_num);
>> =C2=A0+ regmap_write(mixer->regs, SUN8I_MIXER_BLEND_ROUTE,
>> =C2=A0+ mixer->cfg->vi_num);
>> =C2=A0+
>> =C2=A0+ return 0;
>> =C2=A0+
>> =C2=A0+ clk_disable_unprepare(mixer->mod_clk);
>> =C2=A0+err_disable_bus_clk:
>> =C2=A0+ clk_disable_unprepare(mixer->bus_clk);
>> =C2=A0+err_assert_reset:
>> =C2=A0+ reset_control_assert(mixer->reset);
>> =C2=A0+ return ret;
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+static void sun8i_mixer_unbind(struct device *dev, struct device =
*master,
>> =C2=A0+ void *data)
>> =C2=A0+{
>> =C2=A0+ struct sun8i_mixer *mixer =3D dev_get_drvdata(dev);
>> =C2=A0+
>> =C2=A0+ clk_disable_unprepare(mixer->mod_clk);
>> =C2=A0+ clk_disable_unprepare(mixer->bus_clk);
>> =C2=A0+ reset_control_assert(mixer->reset);
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+static const struct component_ops sun8i_mixer_ops =3D {
>> =C2=A0+ .bind =3D sun8i_mixer_bind,
>> =C2=A0+ .unbind =3D sun8i_mixer_unbind,
>> =C2=A0+};
>> =C2=A0+
>> =C2=A0+static int sun8i_mixer_probe(struct platform_device *pdev)
>> =C2=A0+{
>> =C2=A0+ return component_add(&pdev->dev, &sun8i_mixer_ops);
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+static int sun8i_mixer_remove(struct platform_device *pdev)
>> =C2=A0+{
>> =C2=A0+ component_del(&pdev->dev, &sun8i_mixer_ops);
>> =C2=A0+
>> =C2=A0+ return 0;
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+static const struct sun8i_mixer_cfg sun8i_v3s_mixer_cfg =3D {
>> =C2=A0+ .vi_num =3D 2,
>> =C2=A0+ .ui_num =3D 1,
>> =C2=A0+};
>> =C2=A0+
>> =C2=A0+static const struct of_device_id sun8i_mixer_of_table[] =3D {
>> =C2=A0+ {
>> =C2=A0+ .compatible =3D "allwinner,sun8i-v3s-de2-mixer",
>> =C2=A0+ .data =3D &sun8i_v3s_mixer_cfg
>> =C2=A0+ },
>> =C2=A0+ { }
>> =C2=A0+};
>> =C2=A0+MODULE_DEVICE_TABLE(of, sun8i_mixer_of_table);
>> =C2=A0+
>> =C2=A0+static struct platform_driver sun8i_mixer_platform_driver =3D {
>> =C2=A0+ .probe =3D sun8i_mixer_probe,
>> =C2=A0+ .remove =3D sun8i_mixer_remove,
>> =C2=A0+ .driver =3D {
>> =C2=A0+ .name =3D "sun8i-mixer",
>> =C2=A0+ .of_match_table =3D sun8i_mixer_of_table,
>> =C2=A0+ },
>> =C2=A0+};
>> =C2=A0+module_platform_driver(sun8i_mixer_platform_driver);
>> =C2=A0+
>> =C2=A0+MODULE_AUTHOR("Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>");
>> =C2=A0+MODULE_DESCRIPTION("Allwinner DE2 Mixer driver");
>> =C2=A0+MODULE_LICENSE("GPL");
>> =C2=A0+#else /* DRM_SUN4I_DE2 */
>> =C2=A0+void sun8i_mixer_commit(struct sun8i_mixer *mixer)
>> =C2=A0+{
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+void sun8i_mixer_layer_enable(struct sun8i_mixer *mixer,
>> =C2=A0+ int layer, bool enable)
>> =C2=A0+{
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+int sun8i_mixer_update_layer_coord(struct sun8i_mixer *mixer,
>> =C2=A0+ int layer, struct drm_plane *plane)
>> =C2=A0+{
>> =C2=A0+ return -ENOENT;
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+int sun8i_mixer_update_layer_formats(struct sun8i_mixer *mixer,
>> =C2=A0+ int layer, struct drm_plane *plane)
>> =C2=A0+{
>> =C2=A0+ return -ENOENT;
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+int sun8i_mixer_update_layer_buffer(struct sun8i_mixer *mixer,
>> =C2=A0+ int layer, struct drm_plane *plane)
>> =C2=A0+{
>> =C2=A0+ return -ENOENT;
>> =C2=A0+}
>> =C2=A0+#endif /* CONFIG_DRM_SUN4I_DE2 */
>> =C2=A0diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h
>> =C2=A0b/drivers/gpu/drm/sun4i/sun8i_mixer.h new file mode 100644
>> =C2=A0index 000000000000..0bc134b3bc98
>> =C2=A0--- /dev/null
>> =C2=A0+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
>> =C2=A0@@ -0,0 +1,133 @@
>> =C2=A0+/*
>> =C2=A0+ * Copyright (C) 2017 Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
>> =C2=A0+ *
>> =C2=A0+ * This program is free software; you can redistribute it and/or
>> =C2=A0+ * modify it under the terms of the GNU General Public License as
>> =C2=A0+ * published by the Free Software Foundation; either version 2 of
>> =C2=A0+ * the License, or (at your option) any later version.
>> =C2=A0+ */
>> =C2=A0+
>> =C2=A0+#ifndef _SUN8I_MIXER_H_
>> =C2=A0+#define _SUN8I_MIXER_H_
>> =C2=A0+
>> =C2=A0+#include <linux/clk.h>
>> =C2=A0+#include <linux/regmap.h>
>> =C2=A0+#include <linux/reset.h>
>> =C2=A0+
>> =C2=A0+#include "sun4i_layer.h"
>> =C2=A0+
>> =C2=A0+#define SUN8I_MIXER_MAX_CHAN_COUNT 4
>> =C2=A0+
>> =C2=A0+#define SUN8I_MIXER_SIZE(w, h) (((h) - 1) << 16 | ((w) - 1))
>> =C2=A0+#define SUN8I_MIXER_COORD(x, y) ((y) << 16 | (x))
>> =C2=A0+
>> =C2=A0+#define SUN8I_MIXER_GLOBAL_CTL 0x0
>> =C2=A0+#define SUN8I_MIXER_GLOBAL_STATUS 0x4
>> =C2=A0+#define SUN8I_MIXER_GLOBAL_DBUFF 0x8
>> =C2=A0+#define SUN8I_MIXER_GLOBAL_SIZE 0xc
>> =C2=A0+
>> =C2=A0+#define SUN8I_MIXER_GLOBAL_CTL_RT_EN 0x1
>> =C2=A0+
>> =C2=A0+#define SUN8I_MIXER_GLOBAL_DBUFF_ENABLE 0x1
>> =C2=A0+
>> =C2=A0+#define SUN8I_MIXER_BLEND_FCOLOR_CTL 0x1000
>> =C2=A0+#define SUN8I_MIXER_BLEND_ATTR_FCOLOR(x) (0x1004 + 0x10 * (x) + 0=
x0)
>> =C2=A0+#define SUN8I_MIXER_BLEND_ATTR_INSIZE(x) (0x1004 + 0x10 * (x) + 0=
x4)
>> =C2=A0+#define SUN8I_MIXER_BLEND_ATTR_OFFSET(x) (0x1004 + 0x10 * (x) + 0=
x8)
>> =C2=A0+#define SUN8I_MIXER_BLEND_ROUTE 0x1080
>> =C2=A0+#define SUN8I_MIXER_BLEND_PREMULTIPLY 0x1084
>> =C2=A0+#define SUN8I_MIXER_BLEND_BKCOLOR 0x1088
>> =C2=A0+#define SUN8I_MIXER_BLEND_OUTSIZE 0x108c
>> =C2=A0+#define SUN8I_MIXER_BLEND_MODE(x) (0x1090 + 0x04 * (x))
>> =C2=A0+#define SUN8I_MIXER_BLEND_CK_CTL 0x10b0
>> =C2=A0+#define SUN8I_MIXER_BLEND_CK_CFG 0x10b4
>> =C2=A0+#define SUN8I_MIXER_BLEND_CK_MAX(x) (0x10c0 + 0x04 * (x))
>> =C2=A0+#define SUN8I_MIXER_BLEND_CK_MIN(x) (0x10e0 + 0x04 * (x))
>> =C2=A0+#define SUN8I_MIXER_BLEND_OUTCTL 0x10fc
>> =C2=A0+
>> =C2=A0+/* The following numbers are some still unknown magic numbers */
>> =C2=A0+#define SUN8I_MIXER_BLEND_ATTR_FCOLOR_DEF 0xff000000
>> =C2=A0+#define SUN8I_MIXER_BLEND_FCOLOR_CTL_DEF 0x00000101
>> =C2=A0+#define SUN8I_MIXER_BLEND_PREMULTIPLY_DEF 0x0
>> =C2=A0+#define SUN8I_MIXER_BLEND_BKCOLOR_DEF 0xff000000
>> =C2=A0+#define SUN8I_MIXER_BLEND_MODE_DEF 0x03010301
>> =C2=A0+#define SUN8I_MIXER_BLEND_CK_CTL_DEF 0x0
>> =C2=A0+
>> =C2=A0+#define SUN8I_MIXER_BLEND_OUTCTL_INTERLACED BIT(1)
>> =C2=A0+
>> =C2=A0+/*
>> =C2=A0+ * VI channels are not used now, but the support of them may be i=
ntroduced
>> =C2=A0in + * the future.
>> =C2=A0+ */
>> =C2=A0+
>> =C2=A0+#define SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch, layer) \
>> =C2=A0+ (0x2000 + 0x1000 * (ch) + 0x20 * (layer) + 0x0)
>> =C2=A0+#define SUN8I_MIXER_CHAN_UI_LAYER_SIZE(ch, layer) \
>> =C2=A0+ (0x2000 + 0x1000 * (ch) + 0x20 * (layer) + 0x4)
>> =C2=A0+#define SUN8I_MIXER_CHAN_UI_LAYER_COORD(ch, layer) \
>> =C2=A0+ (0x2000 + 0x1000 * (ch) + 0x20 * (layer) + 0x8)
>> =C2=A0+#define SUN8I_MIXER_CHAN_UI_LAYER_PITCH(ch, layer) \
>> =C2=A0+ (0x2000 + 0x1000 * (ch) + 0x20 * (layer) + 0xc)
>> =C2=A0+#define SUN8I_MIXER_CHAN_UI_LAYER_TOP_LADDR(ch, layer) \
>> =C2=A0+ (0x2000 + 0x1000 * (ch) + 0x20 * (layer) + 0x10)
>> =C2=A0+#define SUN8I_MIXER_CHAN_UI_LAYER_BOT_LADDR(ch, layer) \
>> =C2=A0+ (0x2000 + 0x1000 * (ch) + 0x20 * (layer) + 0x14)
>> =C2=A0+#define SUN8I_MIXER_CHAN_UI_LAYER_FCOLOR(ch, layer) \
>> =C2=A0+ (0x2000 + 0x1000 * (ch) + 0x20 * (layer) + 0x18)
>> =C2=A0+#define SUN8I_MIXER_CHAN_UI_TOP_HADDR(ch) (0x2000 + 0x1000 * (ch)=
 + 0x80)
>> =C2=A0+#define SUN8I_MIXER_CHAN_UI_BOT_HADDR(ch) (0x2000 + 0x1000 * (ch)=
 + 0x84)
>> =C2=A0+#define SUN8I_MIXER_CHAN_UI_OVL_SIZE(ch) (0x2000 + 0x1000 * (ch) =
+ 0x88)
>> =C2=A0+
>> =C2=A0+#define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN BIT(0)
>> =C2=A0+#define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_MASK GENMASK(2,=
 1)
>> =C2=A0+#define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_MASK GENMASK(11, 8)
>> =C2=A0+#define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MASK GENMASK(31, 24)
>> =C2=A0+#define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_DEF (1 << 1)
>> =C2=A0+#define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_ARGB8888 (0 << 8)
>> =C2=A0+#define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_XRGB8888 (4 << 8)
>> =C2=A0+#define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_RGB888 (8 << 8)
>> =C2=A0+#define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_DEF (0xff << 24)
>> =C2=A0+
>> =C2=A0+/*
>> =C2=A0+ * These sun-engines are still unknown now, the EN registers are =
here only
>> =C2=A0to + * be used to disable these sub-engines.
>> =C2=A0+ */
>> =C2=A0+#define SUN8I_MIXER_VSU_EN 0x20000
>> =C2=A0+#define SUN8I_MIXER_GSU1_EN 0x30000
>> =C2=A0+#define SUN8I_MIXER_GSU2_EN 0x40000
>> =C2=A0+#define SUN8I_MIXER_GSU3_EN 0x50000
>> =C2=A0+#define SUN8I_MIXER_FCE_EN 0xa0000
>> =C2=A0+#define SUN8I_MIXER_BWS_EN 0xa2000
>> =C2=A0+#define SUN8I_MIXER_LTI_EN 0xa4000
>> =C2=A0+#define SUN8I_MIXER_PEAK_EN 0xa6000
>> =C2=A0+#define SUN8I_MIXER_ASE_EN 0xa8000
>> =C2=A0+#define SUN8I_MIXER_FCC_EN 0xaa000
>> =C2=A0+#define SUN8I_MIXER_DCSC_EN 0xb0000
>> =C2=A0+
>> =C2=A0+struct sun8i_mixer_cfg {
>> =C2=A0+ int vi_num;
>> =C2=A0+ int ui_num;
>> =C2=A0+};
>> =C2=A0+
>> =C2=A0+struct sun8i_mixer {
>> =C2=A0+ struct regmap *regs;
>> =C2=A0+
>> =C2=A0+ const struct sun8i_mixer_cfg *cfg;
>> =C2=A0+
>> =C2=A0+ struct reset_control *reset;
>> =C2=A0+
>> =C2=A0+ struct clk *bus_clk;
>> =C2=A0+ struct clk *mod_clk;
>> =C2=A0+};
>> =C2=A0+
>> =C2=A0+void sun8i_mixer_commit(struct sun8i_mixer *mixer);
>> =C2=A0+
>> =C2=A0+void sun8i_mixer_layer_enable(struct sun8i_mixer *mixer,
>> =C2=A0+ int layer, bool enable);
>> =C2=A0+int sun8i_mixer_update_layer_coord(struct sun8i_mixer *mixer,
>> =C2=A0+ int layer, struct drm_plane *plane);
>> =C2=A0+int sun8i_mixer_update_layer_formats(struct sun8i_mixer *mixer,
>> =C2=A0+ int layer, struct drm_plane *plane);
>> =C2=A0+int sun8i_mixer_update_layer_buffer(struct sun8i_mixer *mixer,
>> =C2=A0+ int layer, struct drm_plane *plane);
>> =C2=A0+#endif /* _SUN8I_MIXER_H_ */
>> =C2=A0--
>> =C2=A02.11.1

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
