From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [linux-sunxi] Re: [PATCH v7 05/13] drm/sun4i: abstract a engine type
Date: Mon, 15 May 2017 17:35:02 +0800
Message-ID: <4F7E36DB-B5F9-4DDE-A80D-0C1A75F0A882@aosc.io>
References: <20170514163045.40366-1-icenowy@aosc.io> <20170514163045.40366-6-icenowy@aosc.io> <20170515092001.ik7qrqmg5pgtp2ct@flea.home>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170515092001.ik7qrqmg5pgtp2ct-YififvaboMKzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.orgMaxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org



于 2017年5月15日 GMT+08:00 下午5:20:01, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> 写到:
>On Mon, May 15, 2017 at 12:30:37AM +0800, Icenowy Zheng wrote:
>> As we are going to add support for the Allwinner DE2 engine in
>sun4i-drm
>> driver, we will finally have two types of display engines -- the DE1
>> backend and the DE2 mixer. They both do some display blending and
>feed
>> graphics data to TCON, and is part of the "Display Engine" called by
>> Allwinner, so I choose to call them both "engine" here.
>> 
>> Abstract the engine type to a new struct with an ops struct, which
>contains
>> functions that should be called outside the engine-specified code (in
>> TCON, CRTC or TV Encoder code).
>> 
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>> ---
>> Changes in v7:
>> - Mention "Display Engine" for the name "engine".
>> - Fixed some small issues found by Chen-Yu and added his ACK.
>> Changes in v6:
>> - Rebased on wens's multi-pipeline patchset.
>> - Split out Makefile changes.
>
>You also added a get_id callback here...
>
>> +static const struct sunxi_engine_ops sun4i_backend_engine_ops = {
>> +	.commit				= sun4i_backend_commit,
>> +	.layers_init			= sun4i_layers_init,
>> +	.apply_color_correction		= sun4i_backend_apply_color_correction,
>> +	.disable_color_correction	= sun4i_backend_disable_color_correction,
>> +};
>> +
>
>... that you don't populate ...
>
>> @@ -477,7 +481,7 @@ static int sun4i_tcon_bind(struct device *dev,
>struct device *master,
>>  	dev_set_drvdata(dev, tcon);
>>  	tcon->drm = drm;
>>  	tcon->dev = dev;
>> -	tcon->id = backend->id;
>> +	tcon->id = sunxi_engine_get_id(engine);
>
>... that you call to fill the TCON ID ...
>
>> +/**
>> + * sunxi_engine_get_id - Get the ID of the engine.
>> + * @engine:	pointer to the engine
>> + *
>> + * If the ID is not necessary, just do not implement it in
>sunxi_engine_ops,
>> + * and a default -1 will be returned.
>> + */
>> +static inline int
>> +sunxi_engine_get_id(struct sunxi_engine *engine)
>> +{
>> +	if (engine->ops && engine->ops->get_id)
>> +		return engine->ops->get_id(engine);
>> +
>> +	return -1;
>
>... and will return -1 if not populated, which essentially means that
>instead of having 0 or 1, we're now having -1 as our id.
>
>This is a regression, and I'm even wondering if we can't just store
>the ID in the sunxi_engine structure. Is anything preventing us to do
>that, instead of using a callback?

Some engines (de2 mixer) doesn't use the ID. But 0 is a valid ID here.

If we just store it in sunxi_engine, it should be assigned -1 for de2 mixer.
Is this applicable?

If it's okay I will do so.

>
>Maxime
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
