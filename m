From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v6 05/13] drm/sun4i: abstract a engine type
Date: Fri, 5 May 2017 16:38:16 +0800
Message-ID: <CAGb2v65JxaifRt=QXH80Li3RrVzGULpfeYfSW-QeUn7SuNyGew@mail.gmail.com>
References: <20170504114858.9008-1-icenowy@aosc.io> <20170504114858.9008-6-icenowy@aosc.io>
 <CAGb2v65a8+CdO5K_8G2m6uFf22yvXvOdX=3sDcHkYebbOiff-Q@mail.gmail.com> <a6dc783f7bd6e625fe456dffd93c4d57@aosc.io>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCMILY6JWQBBBEHUWDEAKGQEBSIFCII-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <a6dc783f7bd6e625fe456dffd93c4d57-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 5, 2017 at 4:36 PM,  <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
> =E5=9C=A8 2017-05-05 10:56=EF=BC=8CChen-Yu Tsai =E5=86=99=E9=81=93=EF=BC=
=9A
>>
>> On Thu, May 4, 2017 at 7:48 PM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
>>>
>>> As we are going to add support for the Allwinner DE2 engine in sun4i-dr=
m
>>> driver, we will finally have two types of display engines -- the DE1
>>> backend and the DE2 mixer. They both do some display blending and feed
>>> graphics data to TCON, so I choose to call them both "engine" here.
>>
>>
>> These engines composite different layers into a final image which is
>> then sent out to the TCONs. As such, "compositor" would be an accurate
>> name.
>>
>> However, "engine" is OK, since Allwinner calls this stuff Display Engine
>> 1.0 and 2.0. Hope there won't be a 3.0 ...
>>
>> Maybe you should note that in your commit message. That is justifies the
>> name.
>>
>>>
>>> Abstract the engine type to a new struct with an ops struct, which
>>> contains
>>> functions that should be called outside the engine-specified code (in
>>> TCON, CRTC or TV Encoder code).
>>>
>>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>>> ---
>>> Changes in v6:
>>> - Rebased on wens's multi-pipeline patchset.
>>> - Split out Makefile changes.
>>> Changes in v5:
>>> - Really made a sunxi_engine struct type, and moved ops pointer
>>>   into it.
>>> - Added checked ops wrappers.
>>> - Changed the second parameter of layers_init from crtc to engine.
>>> Changes in v4:
>>> - Comments to tag the color correction functions as optional.
>>> - Check before calling the optional functions.
>>> - Change layers_init to satisfy new PATCH v4 04/11.
>>>
>>>  drivers/gpu/drm/sun4i/sun4i_backend.c |  68 ++++++++++++---------
>>>  drivers/gpu/drm/sun4i/sun4i_backend.h |  17 +++---
>>>  drivers/gpu/drm/sun4i/sun4i_crtc.c    |  11 ++--
>>>  drivers/gpu/drm/sun4i/sun4i_crtc.h    |   4 +-
>>>  drivers/gpu/drm/sun4i/sun4i_drv.c     |   2 +-
>>>  drivers/gpu/drm/sun4i/sun4i_drv.h     |   2 +-
>>>  drivers/gpu/drm/sun4i/sun4i_layer.c   |   8 +--
>>>  drivers/gpu/drm/sun4i/sun4i_layer.h   |   5 +-
>>>  drivers/gpu/drm/sun4i/sun4i_tcon.c    |  36 ++++++-----
>>>  drivers/gpu/drm/sun4i/sun4i_tv.c      |   9 ++-
>>>  drivers/gpu/drm/sun4i/sunxi_engine.h  | 112
>>> ++++++++++++++++++++++++++++++++++
>>>  11 files changed, 198 insertions(+), 76 deletions(-)
>>>  create mode 100644 drivers/gpu/drm/sun4i/sunxi_engine.h
>>>

[...]

>>> diff --git a/drivers/gpu/drm/sun4i/sun4i_layer.h
>>> b/drivers/gpu/drm/sun4i/sun4i_layer.h
>>> index 5ea5c994d6ea..004b7cfe8ffb 100644
>>> --- a/drivers/gpu/drm/sun4i/sun4i_layer.h
>>> +++ b/drivers/gpu/drm/sun4i/sun4i_layer.h
>>> @@ -13,6 +13,8 @@
>>>  #ifndef _SUN4I_LAYER_H_
>>>  #define _SUN4I_LAYER_H_
>>>
>>> +struct sunxi_engine;
>>> +
>>>  struct sun4i_layer {
>>>         struct drm_plane        plane;
>>>         struct sun4i_drv        *drv;
>>> @@ -27,6 +29,5 @@ plane_to_sun4i_layer(struct drm_plane *plane)
>>>  }
>>>
>>>  struct drm_plane **sun4i_layers_init(struct drm_device *drm,
>>> -                                    struct sun4i_crtc *crtc);
>>> -
>>> +                                    struct sunxi_engine *engine);
>>
>>
>> Please keep the newline.
>>
>>>  #endif /* _SUN4I_LAYER_H_ */
>>> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c
>>> b/drivers/gpu/drm/sun4i/sun4i_tcon.c
>>> index 29fd829aa54c..c48135a10fda 100644
>>> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
>>> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
>>> @@ -26,12 +26,12 @@
>>>  #include <linux/regmap.h>
>>>  #include <linux/reset.h>
>>>
>>> -#include "sun4i_backend.h"
>>>  #include "sun4i_crtc.h"
>>>  #include "sun4i_dotclock.h"
>>>  #include "sun4i_drv.h"
>>>  #include "sun4i_rgb.h"
>>>  #include "sun4i_tcon.h"
>>> +#include "sunxi_engine.h"
>>
>>
>> Please keep the headers in alphabetical order.
>
>
> sunxi is of course after sun4i.

Sorry. My bad. :(

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
