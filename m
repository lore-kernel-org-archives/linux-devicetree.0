From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v3 04/11] drm/sun4i: abstract the layer type
Date: Mon, 3 Apr 2017 18:51:38 +0800
Message-ID: <CAGb2v66gej-udjXVwrRLwTmVf+G1NL2eLeyTzTq8W1z=wD8NMQ@mail.gmail.com>
References: <20170329194613.55548-1-icenowy@aosc.io> <20170329194613.55548-5-icenowy@aosc.io>
 <20170403081423.p6x4ytfoga2krygv@lukather>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBUWSRDDQKGQEMIRXLTA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170403081423.p6x4ytfoga2krygv@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 3, 2017 at 4:14 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Hi,
>
> On Thu, Mar 30, 2017 at 03:46:06AM +0800, Icenowy Zheng wrote:
>> As we are going to add support for the Allwinner DE2 Mixer in sun4i-drm
>> driver, we will finally have two types of layer.
>>
>> Abstract the layer type to void * and a ops struct, which contains the
>> only function used by crtc -- get the drm_plane struct of the layer.
>>
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> ---
>> Refactored patch in v3.
>>
>>  drivers/gpu/drm/sun4i/sun4i_crtc.c  | 19 +++++++++++--------
>>  drivers/gpu/drm/sun4i/sun4i_crtc.h  |  3 ++-
>>  drivers/gpu/drm/sun4i/sun4i_layer.c | 19 ++++++++++++++++++-
>>  drivers/gpu/drm/sun4i/sun4i_layer.h |  2 +-
>>  drivers/gpu/drm/sun4i/sunxi_layer.h | 17 +++++++++++++++++
>>  5 files changed, 49 insertions(+), 11 deletions(-)
>>  create mode 100644 drivers/gpu/drm/sun4i/sunxi_layer.h
>>
>> diff --git a/drivers/gpu/drm/sun4i/sun4i_crtc.c b/drivers/gpu/drm/sun4i/sun4i_crtc.c
>> index 3c876c3a356a..33854ee7f636 100644
>> --- a/drivers/gpu/drm/sun4i/sun4i_crtc.c
>> +++ b/drivers/gpu/drm/sun4i/sun4i_crtc.c
>> @@ -29,6 +29,7 @@
>>  #include "sun4i_crtc.h"
>>  #include "sun4i_drv.h"
>>  #include "sun4i_layer.h"
>> +#include "sunxi_layer.h"
>>  #include "sun4i_tcon.h"
>>
>>  static void sun4i_crtc_atomic_begin(struct drm_crtc *crtc,
>> @@ -149,7 +150,7 @@ struct sun4i_crtc *sun4i_crtc_init(struct drm_device *drm,
>>       scrtc->tcon = tcon;
>>
>>       /* Create our layers */
>> -     scrtc->layers = sun4i_layers_init(drm, scrtc->backend);
>> +     scrtc->layers = (void **)sun4i_layers_init(drm, scrtc);
>>       if (IS_ERR(scrtc->layers)) {
>>               dev_err(drm->dev, "Couldn't create the planes\n");
>>               return NULL;
>> @@ -157,14 +158,15 @@ struct sun4i_crtc *sun4i_crtc_init(struct drm_device *drm,
>>
>>       /* find primary and cursor planes for drm_crtc_init_with_planes */
>>       for (i = 0; scrtc->layers[i]; i++) {
>> -             struct sun4i_layer *layer = scrtc->layers[i];
>> +             void *layer = scrtc->layers[i];
>> +             struct drm_plane *plane = scrtc->layer_ops->get_plane(layer);
>>
>> -             switch (layer->plane.type) {
>> +             switch (plane->type) {
>>               case DRM_PLANE_TYPE_PRIMARY:
>> -                     primary = &layer->plane;
>> +                     primary = plane;
>>                       break;
>>               case DRM_PLANE_TYPE_CURSOR:
>> -                     cursor = &layer->plane;
>> +                     cursor = plane;
>>                       break;
>>               default:
>>                       break;
>> @@ -190,10 +192,11 @@ struct sun4i_crtc *sun4i_crtc_init(struct drm_device *drm,
>>       /* Set possible_crtcs to this crtc for overlay planes */
>>       for (i = 0; scrtc->layers[i]; i++) {
>>               uint32_t possible_crtcs = BIT(drm_crtc_index(&scrtc->crtc));
>> -             struct sun4i_layer *layer = scrtc->layers[i];
>> +             void *layer = scrtc->layers[i];
>> +             struct drm_plane *plane = scrtc->layer_ops->get_plane(layer);
>>
>> -             if (layer->plane.type == DRM_PLANE_TYPE_OVERLAY)
>> -                     layer->plane.possible_crtcs = possible_crtcs;
>> +             if (plane->type == DRM_PLANE_TYPE_OVERLAY)
>> +                     plane->possible_crtcs = possible_crtcs;
>
> I think the logic should be reversed here, the CRTC shouldn't care
> (much) about the layers at all.

Correct. It shouldn't. However since the layers are tied to a specific
crtc, they get created as part of the crtc init sequence.

> We should modify sun4i_crtc_init to get the argument it needs (primary
> and cursor planes for example) through its parameters, and have the
> caller (which iirc is sun4i_drv) call it with the right parameters

The caller is (now) sun4i_crtc_init.

> depending on whether you're using DE or DE2.

Ack.

>
> If we're doing that, I don't think we even need the pointer to the
> array of layers in struct sun4i_crtc, which will make it easier to
> deal with.

Ack.

ChenYu
