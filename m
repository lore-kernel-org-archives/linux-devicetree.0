From: icenowy-h8G6r0blFSE@public.gmane.org
Subject: Re: [PATCH v2 07/11] drm: sun4i: add support for the TV encoder in H3
 SoC
Date: Sun, 11 Jun 2017 14:43:42 +0800
Message-ID: <362bb72d74cd7181ae02dbf73b0e724e@aosc.io>
References: <20170604160149.30230-1-icenowy@aosc.io>
 <20170604160149.30230-8-icenowy@aosc.io>
 <20170607093845.cu5kk55nj72roysf@flea.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170607093845.cu5kk55nj72roysf-ZC1Zs529Oq4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

在 2017-06-07 17:38，Maxime Ripard 写道：
> On Mon, Jun 05, 2017 at 12:01:45AM +0800, Icenowy Zheng wrote:
>> Allwinner H3 features a TV encoder similar to the one in earlier SoCs,
>> but has a internal fixed clock divider that divides the TCON1 clock
>> (called TVE clock in datasheet) by 11.
>> 
>> Add support for it.
>> 
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> ---
>> Changes in v2:
>> - Quirk part rewritten.
>> 
>>  drivers/gpu/drm/sun4i/sun4i_tv.c | 35 
>> ++++++++++++++++++++++++++++++++++-
>>  1 file changed, 34 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c 
>> b/drivers/gpu/drm/sun4i/sun4i_tv.c
>> index 338b9e5bb2a3..b9ff6d5ea67a 100644
>> --- a/drivers/gpu/drm/sun4i/sun4i_tv.c
>> +++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
>> @@ -13,6 +13,7 @@
>>  #include <linux/clk.h>
>>  #include <linux/component.h>
>>  #include <linux/of_address.h>
>> +#include <linux/of_device.h>
>>  #include <linux/regmap.h>
>>  #include <linux/reset.h>
>> 
>> @@ -169,14 +170,21 @@ struct tv_mode {
>>  	const struct resync_parameters	*resync_params;
>>  };
>> 
>> +struct sun4i_tv_quirks {
>> +	int fixed_divider;
>> +};
>> +
>>  struct sun4i_tv {
>>  	struct drm_connector	connector;
>>  	struct drm_encoder	encoder;
>> 
>>  	struct clk		*clk;
>> +	struct clk		*mod_clk;
>>  	struct regmap		*regs;
>>  	struct reset_control	*reset;
>> 
>> +	const struct sun4i_tv_quirks *quirks;
>> +
>>  	struct sun4i_drv	*drv;
>>  };
>> 
>> @@ -391,6 +399,12 @@ static void sun4i_tv_mode_set(struct drm_encoder 
>> *encoder,
>>  	struct sun4i_tcon *tcon = crtc->tcon;
>>  	const struct tv_mode *tv_mode = sun4i_tv_find_tv_by_mode(mode);
>> 
>> +	if (tv->quirks->fixed_divider) {
>> +		DRM_DEBUG_DRIVER("Applying fixed divider %d on TVE clock\n",
>> +				 tv->quirks->fixed_divider);
>> +		mode->crtc_clock *= tv->quirks->fixed_divider;
>> +	}
>> +
> 
> You're not allowed to change the mode in mode_set, and you shouldn't
> even change it. The output pixel clock is still 27MHz.
> 
> You should implement that using the states, as we discussed already.

After reading the comments at include/drm/drm_modeset_helper_vtables.h,
I think the atomic_check function is allowed to directly change
the adjust_mode of crtc_state.

And according to other comments at include/drm/drm_modes.h, the
crtc_clock in adjust_mode should be the clock to be really feed
to the hardware.

So I think I can just change this in atomic_check.

However, the mode_set function of sun4i_tv seems to be not
regarding adjusted_mode and still use original mode.

So my current design is:
- Multiply adjusted_mode in atomic_check.
- Feed adjust_mode to TCON code in mode_set function.

Is this proper?

(From my own understanding to the comments I think so.)

> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
