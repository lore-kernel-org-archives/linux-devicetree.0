From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH v4 05/11] drm/sun4i: abstract a engine type
Date: Tue, 18 Apr 2017 19:05:12 +0800
Message-ID: <5F52665D-8A24-40D3-B84B-E8991B3BE457@aosc.io>
References: <20170416120849.54542-1-icenowy@aosc.io> <20170416120849.54542-6-icenowy@aosc.io> <20170418085548.4cisone2yfcuizcp@lukather>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRB6XF27DQKGQED3UHKAQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170418085548.4cisone2yfcuizcp@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2017=E5=B9=B44=E6=9C=8818=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=884:=
55:48, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> =E5=86=99=E5=88=B0:
>Hi,
>
>Thanks for that rework.
>
>On Sun, Apr 16, 2017 at 08:08:43PM +0800, Icenowy Zheng wrote:
>> As we are going to add support for the Allwinner DE2 engine in
>sun4i-drm
>> driver, we will finally have two types of display engines -- the DE1
>> backend and the DE2 mixer. They both do some display blending and
>feed
>> graphics data to TCON, so I choose to call them both "engine" here.
>>=20
>> Abstract the engine type to void * and a ops struct, which contains
>> functions that should be called outside the engine-specified code (in
>> TCON, CRTC or TV Encoder code).
>>=20
>> A dedicated Kconfig option is also added to control whether
>> sun4i-backend-specified code (sun4i_backend.c and sun4i_layer.c)
>should
>> be built. As we removed the codes in CRTC code that directly call the
>> layer code, we can now extract the layer part and combine it with the
>> backend part into a new module, sun4i-backend.ko.
>>=20
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> ---
>> Changes in v4:
>> - Comments to tag the color correction functions as optional.
>> - Check before calling the optional functions.
>> - Change layers_init to satisfy new PATCH v4 04/11.
>>=20
>>  drivers/gpu/drm/sun4i/Kconfig         | 10 ++++++++++
>>  drivers/gpu/drm/sun4i/Makefile        |  6 ++++--
>>  drivers/gpu/drm/sun4i/sun4i_backend.c | 26
>+++++++++++++++++++-------
>>  drivers/gpu/drm/sun4i/sun4i_backend.h |  5 -----
>>  drivers/gpu/drm/sun4i/sun4i_crtc.c    | 14 +++++++-------
>>  drivers/gpu/drm/sun4i/sun4i_crtc.h    |  7 ++++---
>>  drivers/gpu/drm/sun4i/sun4i_drv.h     |  3 ++-
>>  drivers/gpu/drm/sun4i/sun4i_layer.c   |  2 +-
>>  drivers/gpu/drm/sun4i/sun4i_layer.h   |  3 ++-
>>  drivers/gpu/drm/sun4i/sun4i_tcon.c    |  2 +-
>>  drivers/gpu/drm/sun4i/sun4i_tv.c      | 11 ++++++-----
>>  drivers/gpu/drm/sun4i/sunxi_engine.h  | 35
>+++++++++++++++++++++++++++++++++++
>>  12 files changed, 91 insertions(+), 33 deletions(-)
>>  create mode 100644 drivers/gpu/drm/sun4i/sunxi_engine.h
>>=20
>> diff --git a/drivers/gpu/drm/sun4i/Kconfig
>b/drivers/gpu/drm/sun4i/Kconfig
>> index a4b357db8856..5a8227f37cc4 100644
>> --- a/drivers/gpu/drm/sun4i/Kconfig
>> +++ b/drivers/gpu/drm/sun4i/Kconfig
>> @@ -12,3 +12,13 @@ config DRM_SUN4I
>>  	  Choose this option if you have an Allwinner SoC with a
>>  	  Display Engine. If M is selected the module will be called
>>  	  sun4i-drm.
>> +
>> +config DRM_SUN4I_BACKEND
>> +	tristate "Support for Allwinner A10 Display Engine Backend"
>> +	depends on DRM_SUN4I
>> +	default DRM_SUN4I
>> +	help
>> +	  Choose this option if you have an Allwinner SoC with the
>> +	  original Allwinner Display Engine, which has a backend to
>> +	  do some alpha blending and feed graphics to TCON. If M is
>> +	  selected the module will be called sun4i-backend.
>> diff --git a/drivers/gpu/drm/sun4i/Makefile
>b/drivers/gpu/drm/sun4i/Makefile
>> index 59b757350a1f..1db1068b9be1 100644
>> --- a/drivers/gpu/drm/sun4i/Makefile
>> +++ b/drivers/gpu/drm/sun4i/Makefile
>> @@ -5,9 +5,11 @@ sun4i-tcon-y +=3D sun4i_tcon.o
>>  sun4i-tcon-y +=3D sun4i_rgb.o
>>  sun4i-tcon-y +=3D sun4i_dotclock.o
>>  sun4i-tcon-y +=3D sun4i_crtc.o
>> -sun4i-tcon-y +=3D sun4i_layer.o
>> +
>> +sun4i-backend-y +=3D sun4i_layer.o
>> +sun4i-backend-y +=3D sun4i_backend.o
>> =20
>>  obj-$(CONFIG_DRM_SUN4I)		+=3D sun4i-drm.o sun4i-tcon.o
>> -obj-$(CONFIG_DRM_SUN4I)		+=3D sun4i_backend.o
>> +obj-$(CONFIG_DRM_SUN4I_BACKEND)	+=3D sun4i-backend.o
>>  obj-$(CONFIG_DRM_SUN4I)		+=3D sun6i_drc.o
>>  obj-$(CONFIG_DRM_SUN4I)		+=3D sun4i_tv.o
>> diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c
>b/drivers/gpu/drm/sun4i/sun4i_backend.c
>> index d660741ba475..a16c96a002a4 100644
>> --- a/drivers/gpu/drm/sun4i/sun4i_backend.c
>> +++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
>> @@ -23,6 +23,8 @@
>> =20
>>  #include "sun4i_backend.h"
>>  #include "sun4i_drv.h"
>> +#include "sun4i_layer.h"
>> +#include "sunxi_engine.h"
>> =20
>>  static const u32 sunxi_rgb2yuv_coef[12] =3D {
>>  	0x00000107, 0x00000204, 0x00000064, 0x00000108,
>> @@ -30,9 +32,10 @@ static const u32 sunxi_rgb2yuv_coef[12] =3D {
>>  	0x000001c1, 0x00003e88, 0x00003fb8, 0x00000808
>>  };
>> =20
>> -void sun4i_backend_apply_color_correction(struct sun4i_backend
>*backend)
>> +static void sun4i_backend_apply_color_correction(void *engine)
>>  {
>>  	int i;
>> +	struct sun4i_backend *backend =3D engine;
>
>I'm not really fond of passing an opaque pointer here, and hope that
>things will work out.
>
>I think having a common structure, holding the common thingsand a more
>specific structure for that one would work better.
>
>Something like
>
>struct sunxi_engine {
>       struct regmap	*regs;
>};
>
>struct sun4i_backend {
>       struct sunxi_engine	engine;
>
>	struct clk		*sat_clk;
>	struct reset_control	*sat_reset;
>=09
>};

Sounds good ;-)

>
>static void sun4i_backend_apply_color_correction(struct sunxi_engine
>*engine)
>struct sun4i_backend *backend =3D container_of(engine, struct
>sun4i_backend, engine);
>
>...
>
>> +static const struct sunxi_engine_ops sun4i_backend_engine_ops =3D {
>> +	.commit =3D sun4i_backend_commit,
>> +	.layers_init =3D sun4i_layers_init,
>> +	.apply_color_correction =3D sun4i_backend_apply_color_correction,
>> +	.disable_color_correction =3D sun4i_backend_disable_color_correction,
>
>Please align the values with tabs, like done in the other structures
>created that way in this driver.
>
>>  static void sun4i_crtc_atomic_begin(struct drm_crtc *crtc,
>> @@ -56,7 +55,7 @@ static void sun4i_crtc_atomic_flush(struct drm_crtc
>*crtc,
>> =20
>>  	DRM_DEBUG_DRIVER("Committing plane changes\n");
>> =20
>> -	sun4i_backend_commit(scrtc->backend);
>> +	scrtc->engine_ops->commit(scrtc->engine);
>
>You rely on the backend having setup things properly, which is pretty
>fragile. Ideally, you should have a function to check that engine_ops
>and commit is !NULL, and call it, and the consumers would use that
>function...

If it's really NULL how should the function return?

>
>> @@ -362,7 +361,9 @@ static void sun4i_tv_disable(struct drm_encoder
>*encoder)
>>  	regmap_update_bits(tv->regs, SUN4I_TVE_EN_REG,
>>  			   SUN4I_TVE_EN_ENABLE,
>>  			   0);
>> -	sun4i_backend_disable_color_correction(backend);
>> +
>> +	if (crtc->engine_ops->disable_color_correction)
>> +		crtc->engine_ops->disable_color_correction(crtc->engine);
>>  }
>
>... Instead of having to do it in some cases, but not always ...
>
>>  static void sun4i_tv_enable(struct drm_encoder *encoder)
>> @@ -370,11 +371,11 @@ static void sun4i_tv_enable(struct drm_encoder
>*encoder)
>>  	struct sun4i_tv *tv =3D drm_encoder_to_sun4i_tv(encoder);
>>  	struct sun4i_crtc *crtc =3D drm_crtc_to_sun4i_crtc(encoder->crtc);
>>  	struct sun4i_tcon *tcon =3D crtc->tcon;
>> -	struct sun4i_backend *backend =3D crtc->backend;
>> =20
>>  	DRM_DEBUG_DRIVER("Enabling the TV Output\n");
>> =20
>> -	sun4i_backend_apply_color_correction(backend);
>> +	if (crtc->engine_ops->apply_color_correction)
>> +		crtc->engine_ops->apply_color_correction(crtc->engine);
>> =20
>>  	regmap_update_bits(tv->regs, SUN4I_TVE_EN_REG,
>>  			   SUN4I_TVE_EN_ENABLE,
>> diff --git a/drivers/gpu/drm/sun4i/sunxi_engine.h
>b/drivers/gpu/drm/sun4i/sunxi_engine.h
>> new file mode 100644
>> index 000000000000..a9128abda66f
>> --- /dev/null
>> +++ b/drivers/gpu/drm/sun4i/sunxi_engine.h
>> @@ -0,0 +1,35 @@
>> +/*
>> + * Copyright (C) 2017 Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> + *
>> + * This program is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU General Public License as
>> + * published by the Free Software Foundation; either version 2 of
>> + * the License, or (at your option) any later version.
>> + */
>> +
>> +#ifndef _SUNXI_ENGINE_H_
>> +#define _SUNXI_ENGINE_H_
>> +
>> +struct sun4i_crtc;
>> +
>> +struct sunxi_engine_ops {
>> +	/* Commit the changes to the engine */
>> +	void (*commit)(void *engine);
>> +	/* Initialize layers (planes) for this engine */
>> +	struct drm_plane **(*layers_init)(struct drm_device *drm,
>> +					  struct sun4i_crtc *crtc);
>> +
>> +	/*
>> +	 * These are optional functions for the TV Encoder. Please check
>> +	 * their presence before calling them.
>> +	 *
>> +	 * The first function applies the color space correction needed
>> +	 * for outputing correct TV signal.
>> +	 *
>> +	 * The second function disabled the correction.
>> +	 */
>> +	void (*apply_color_correction)(void *engine);
>> +	void (*disable_color_correction)(void *engine);
>
>... And have to document it.
>
>Please also use kerneldoc for those comments.
>
>Thanks again!
>Maxime

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
