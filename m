From: icenowy-h8G6r0blFSE@public.gmane.org
Subject: Re: Re: [PATCH v3 04/11] drm/sun4i: abstract the layer type
Date: Thu, 06 Apr 2017 01:14:40 +0800
Message-ID: <f30a838c1c044278cf2062edaf93f6b2@aosc.io>
References: <20170329194613.55548-1-icenowy@aosc.io>
 <20170329194613.55548-5-icenowy@aosc.io>
 <20170404192837.pvlhwyeut45vg2wg@art_vandelay>
 <dbf0f478-ff53-0ced-24a3-e9de7077efd9@aosc.io>
 <CAGb2v66vxP0c3qMTAUCseTCbpJ6gxnKfNGNcC41jPHA_Ye4ggw@mail.gmail.com>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBA6MSTDQKGQEXHHHMJA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v66vxP0c3qMTAUCseTCbpJ6gxnKfNGNcC41jPHA_Ye4ggw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

=E5=9C=A8 2017-04-05 10:27=EF=BC=8CChen-Yu Tsai =E5=86=99=E9=81=93=EF=BC=9A
> On Wed, Apr 5, 2017 at 3:53 AM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
>>=20
>>=20
>> =E5=9C=A8 2017=E5=B9=B404=E6=9C=8805=E6=97=A5 03:28, Sean Paul =E5=86=99=
=E9=81=93:
>>>=20
>>> On Thu, Mar 30, 2017 at 03:46:06AM +0800, Icenowy Zheng wrote:
>>>>=20
>>>> As we are going to add support for the Allwinner DE2 Mixer in=20
>>>> sun4i-drm
>>>> driver, we will finally have two types of layer.
>>>>=20
>>>> Abstract the layer type to void * and a ops struct, which contains=20
>>>> the
>>>> only function used by crtc -- get the drm_plane struct of the layer.
>>>>=20
>>>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>>>> ---
>>>> Refactored patch in v3.
>>>>=20
>>>>  drivers/gpu/drm/sun4i/sun4i_crtc.c  | 19 +++++++++++--------
>>>>  drivers/gpu/drm/sun4i/sun4i_crtc.h  |  3 ++-
>>>>  drivers/gpu/drm/sun4i/sun4i_layer.c | 19 ++++++++++++++++++-
>>>>  drivers/gpu/drm/sun4i/sun4i_layer.h |  2 +-
>>>>  drivers/gpu/drm/sun4i/sunxi_layer.h | 17 +++++++++++++++++
>>>>  5 files changed, 49 insertions(+), 11 deletions(-)
>>>>  create mode 100644 drivers/gpu/drm/sun4i/sunxi_layer.h
>>>>=20
>>>> diff --git a/drivers/gpu/drm/sun4i/sun4i_crtc.c
>>>> b/drivers/gpu/drm/sun4i/sun4i_crtc.c
>>>> index 3c876c3a356a..33854ee7f636 100644
>>>> --- a/drivers/gpu/drm/sun4i/sun4i_crtc.c
>>>> +++ b/drivers/gpu/drm/sun4i/sun4i_crtc.c
>>>> @@ -29,6 +29,7 @@
>>>>  #include "sun4i_crtc.h"
>>>>  #include "sun4i_drv.h"
>>>>  #include "sun4i_layer.h"
>>>> +#include "sunxi_layer.h"
>>>>  #include "sun4i_tcon.h"
>>>>=20
>>>>  static void sun4i_crtc_atomic_begin(struct drm_crtc *crtc,
>>>> @@ -149,7 +150,7 @@ struct sun4i_crtc *sun4i_crtc_init(struct=20
>>>> drm_device
>>>> *drm,
>>>>         scrtc->tcon =3D tcon;
>>>>=20
>>>>         /* Create our layers */
>>>> -       scrtc->layers =3D sun4i_layers_init(drm, scrtc->backend);
>>>> +       scrtc->layers =3D (void **)sun4i_layers_init(drm, scrtc);
>>>>         if (IS_ERR(scrtc->layers)) {
>>>>                 dev_err(drm->dev, "Couldn't create the planes\n");
>>>>                 return NULL;
>>>> @@ -157,14 +158,15 @@ struct sun4i_crtc *sun4i_crtc_init(struct
>>>> drm_device *drm,
>>>>=20
>>>>         /* find primary and cursor planes for=20
>>>> drm_crtc_init_with_planes
>>>> */
>>>>         for (i =3D 0; scrtc->layers[i]; i++) {
>>>> -               struct sun4i_layer *layer =3D scrtc->layers[i];
>>>> +               void *layer =3D scrtc->layers[i];
>>>> +               struct drm_plane *plane =3D
>>>> scrtc->layer_ops->get_plane(layer);
>>>>=20
>>>> -               switch (layer->plane.type) {
>>>> +               switch (plane->type) {
>>>>                 case DRM_PLANE_TYPE_PRIMARY:
>>>> -                       primary =3D &layer->plane;
>>>> +                       primary =3D plane;
>>>>                         break;
>>>>                 case DRM_PLANE_TYPE_CURSOR:
>>>> -                       cursor =3D &layer->plane;
>>>> +                       cursor =3D plane;
>>>>                         break;
>>>>                 default:
>>>>                         break;
>>>> @@ -190,10 +192,11 @@ struct sun4i_crtc *sun4i_crtc_init(struct
>>>> drm_device *drm,
>>>>         /* Set possible_crtcs to this crtc for overlay planes */
>>>>         for (i =3D 0; scrtc->layers[i]; i++) {
>>>>                 uint32_t possible_crtcs =3D
>>>> BIT(drm_crtc_index(&scrtc->crtc));
>>>> -               struct sun4i_layer *layer =3D scrtc->layers[i];
>>>> +               void *layer =3D scrtc->layers[i];
>>>> +               struct drm_plane *plane =3D
>>>> scrtc->layer_ops->get_plane(layer);
>>>>=20
>>>> -               if (layer->plane.type =3D=3D DRM_PLANE_TYPE_OVERLAY)
>>>> -                       layer->plane.possible_crtcs =3D=20
>>>> possible_crtcs;
>>>> +               if (plane->type =3D=3D DRM_PLANE_TYPE_OVERLAY)
>>>> +                       plane->possible_crtcs =3D possible_crtcs;
>>>>         }
>>>>=20
>>>>         return scrtc;
>>>> diff --git a/drivers/gpu/drm/sun4i/sun4i_crtc.h
>>>> b/drivers/gpu/drm/sun4i/sun4i_crtc.h
>>>> index 230cb8f0d601..a4036ee44cf8 100644
>>>> --- a/drivers/gpu/drm/sun4i/sun4i_crtc.h
>>>> +++ b/drivers/gpu/drm/sun4i/sun4i_crtc.h
>>>> @@ -19,7 +19,8 @@ struct sun4i_crtc {
>>>>=20
>>>>         struct sun4i_backend            *backend;
>>>>         struct sun4i_tcon               *tcon;
>>>> -       struct sun4i_layer              **layers;
>>>> +       void                            **layers;
>>>> +       const struct sunxi_layer_ops    *layer_ops;
>>>=20
>>>=20
>>> I think you should probably take a different approach to abstract the
>>> layer
>>> type. How about creating
>>>=20
>>> struct sunxi_layer {
>>>         struct drm_plane plane;
>>> }
>>>=20
>>> base and then subclassing that for sun4i and sun8i? By doing this you=
=20
>>> can
>>> avoid
>>> the nasty casting and you can also get rid of the get_plane() hook=20
>>> and
>>> layer_ops.
>>=20
>>=20
>> For the situation that using ** things are easily to get weird.
>=20
> That code could be reworked, by initializing the layers directly within
> the crtc init code. If you look at rockchip's drm driver, you'll see
> they do this. There is a good reason to do it this way, as you need
> to first create the primary and cursor layers, pass them in when you
> create the crtc, then initialize any additional layers with the
> possible_crtcs bitmap.

I feel that it's still more proper to offload plane creation code
to *_layers_init function, as:

1. We cannot assume the cursor layer's
existance. In fact currently no code in sun4i-drm (including this
patchset) create a cursor layer.

2. The format of planes heavily depend on the engine type (
sun4i-backend or sun8i-mixer).

3. We should create planes according to the type of engine.
Currently the *_layers_init function is part of engine code (See my
Makefile change).

4. If we do so we will have two codes for plane creating -- one for
primary in sun4i_crtc_init, another for overlays in *_layers_init.

>=20
> In our driver we are currently initializing all layers, then going
> back and filling in possible_crtcs for the extra layers.
>=20
> And as Maxime and I mentioned in the other thread, we don't really
> need to keep a reference to **layers.

It's correct, layers doesn't need to be kept.

And the struct sunxi_layer refactor also makes sense.

>=20
> Regards
> ChenYu
>=20
>>=20
>>>=20
>>> Sean
>>>=20
>>>=20
>>>=20
>>>>  };
>>>>=20
>>>>  static inline struct sun4i_crtc *drm_crtc_to_sun4i_crtc(struct=20
>>>> drm_crtc
>>>> *crtc)
>>>> diff --git a/drivers/gpu/drm/sun4i/sun4i_layer.c
>>>> b/drivers/gpu/drm/sun4i/sun4i_layer.c
>>>> index f26bde5b9117..bc4a70d6968b 100644
>>>> --- a/drivers/gpu/drm/sun4i/sun4i_layer.c
>>>> +++ b/drivers/gpu/drm/sun4i/sun4i_layer.c
>>>> @@ -16,7 +16,9 @@
>>>>  #include <drm/drmP.h>
>>>>=20
>>>>  #include "sun4i_backend.h"
>>>> +#include "sun4i_crtc.h"
>>>>  #include "sun4i_layer.h"
>>>> +#include "sunxi_layer.h"
>>>>=20
>>>>  struct sun4i_plane_desc {
>>>>                enum drm_plane_type     type;
>>>> @@ -100,6 +102,17 @@ static const struct sun4i_plane_desc
>>>> sun4i_backend_planes[] =3D {
>>>>         },
>>>>  };
>>>>=20
>>>> +static struct drm_plane *sun4i_layer_get_plane(void *layer)
>>>> +{
>>>> +       struct sun4i_layer *sun4i_layer =3D layer;
>>>> +
>>>> +       return &sun4i_layer->plane;
>>>> +}
>>>> +
>>>> +static const struct sunxi_layer_ops layer_ops =3D {
>>>> +       .get_plane =3D sun4i_layer_get_plane,
>>>> +};
>>>> +
>>>>  static struct sun4i_layer *sun4i_layer_init_one(struct drm_device=20
>>>> *drm,
>>>>                                                 struct sun4i_backend
>>>> *backend,
>>>>                                                 const struct
>>>> sun4i_plane_desc *plane)
>>>> @@ -129,9 +142,10 @@ static struct sun4i_layer
>>>> *sun4i_layer_init_one(struct drm_device *drm,
>>>>  }
>>>>=20
>>>>  struct sun4i_layer **sun4i_layers_init(struct drm_device *drm,
>>>> -                                      struct sun4i_backend=20
>>>> *backend)
>>>> +                                      struct sun4i_crtc *crtc)
>>>>  {
>>>>         struct sun4i_layer **layers;
>>>> +       struct sun4i_backend *backend =3D crtc->backend;
>>>>         int i;
>>>>=20
>>>>         layers =3D devm_kcalloc(drm->dev,=20
>>>> ARRAY_SIZE(sun4i_backend_planes)
>>>> + 1,
>>>> @@ -181,5 +195,8 @@ struct sun4i_layer **sun4i_layers_init(struct
>>>> drm_device *drm,
>>>>                 layers[i] =3D layer;
>>>>         };
>>>>=20
>>>> +       /* Assign layer ops to the CRTC */
>>>> +       crtc->layer_ops =3D &layer_ops;
>>>> +
>>>>         return layers;
>>>>  }
>>>> diff --git a/drivers/gpu/drm/sun4i/sun4i_layer.h
>>>> b/drivers/gpu/drm/sun4i/sun4i_layer.h
>>>> index 4be1f0919df2..425eea7b9e3b 100644
>>>> --- a/drivers/gpu/drm/sun4i/sun4i_layer.h
>>>> +++ b/drivers/gpu/drm/sun4i/sun4i_layer.h
>>>> @@ -27,6 +27,6 @@ plane_to_sun4i_layer(struct drm_plane *plane)
>>>>  }
>>>>=20
>>>>  struct sun4i_layer **sun4i_layers_init(struct drm_device *drm,
>>>> -                                      struct sun4i_backend=20
>>>> *backend);
>>>> +                                      struct sun4i_crtc *crtc);
>>>>=20
>>>>  #endif /* _SUN4I_LAYER_H_ */
>>>> diff --git a/drivers/gpu/drm/sun4i/sunxi_layer.h
>>>> b/drivers/gpu/drm/sun4i/sunxi_layer.h
>>>> new file mode 100644
>>>> index 000000000000..d8838ec39299
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/sun4i/sunxi_layer.h
>>>> @@ -0,0 +1,17 @@
>>>> +/*
>>>> + * Copyright (C) 2017 Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
>>>> + *
>>>> + * This program is free software; you can redistribute it and/or
>>>> + * modify it under the terms of the GNU General Public License as
>>>> + * published by the Free Software Foundation; either version 2 of
>>>> + * the License, or (at your option) any later version.
>>>> + */
>>>> +
>>>> +#ifndef _SUNXI_LAYER_H_
>>>> +#define _SUNXI_LAYER_H_
>>>> +
>>>> +struct sunxi_layer_ops {
>>>> +       struct drm_plane *(*get_plane)(void *layer);
>>>> +};
>>>> +
>>>> +#endif /* _SUNXI_LAYER_H_ */
>>>> --
>>>> 2.12.0
>>>>=20
>>>>=20
>>>> _______________________________________________
>>>> linux-arm-kernel mailing list
>>>> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>>>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>>>=20
>>>=20
>>=20
>> --
>> You received this message because you are subscribed to the Google=20
>> Groups
>> "linux-sunxi" group.
>> To unsubscribe from this group and stop receiving emails from it, send=
=20
>> an
>> email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
>> For more options, visit https://groups.google.com/d/optout.
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
