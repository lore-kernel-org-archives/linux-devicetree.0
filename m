From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH v6 08/13] drm/sun4i: add support for
 Allwinner DE2 mixers
Date: Fri, 05 May 2017 20:39:31 +0800
Message-ID: <185C1948-541D-4198-9A56-E3F0DFF08734@aosc.io>
References: <20170504114858.9008-1-icenowy@aosc.io> <20170504114858.9008-9-icenowy@aosc.io> <20170504130535.6nokhni5a3uxwy66@lukather> <522ab8cb2939f0017917c5e9b4065089@aosc.io> <20170505123618.5vztqx2vdwsgnrxt@lukather>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBDPFWHEAKGQEWHYJBNY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170505123618.5vztqx2vdwsgnrxt@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2017=E5=B9=B45=E6=9C=885=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=888:3=
6:18, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> =E5=86=99=E5=88=B0:
>On Fri, May 05, 2017 at 12:50:51AM +0800, icenowy-h8G6r0blFSE@public.gmane.org wrote:
>> > > +void sun8i_mixer_layer_enable(struct sun8i_mixer *mixer,
>> > > +				int layer, bool enable)
>> > > +{
>> > > +	u32 val;
>> > > +	/* Currently the first UI channel is used */
>> > > +	int chan =3D mixer->cfg->vi_num;
>> > > +
>> > > +	DRM_DEBUG_DRIVER("Enabling layer %d in channel %d\n", layer,
>chan);
>> > > +
>> > > +	if (enable)
>> > > +		val =3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN;
>> > > +	else
>> > > +		val =3D 0;
>> > > +
>> > > +	regmap_update_bits(mixer->engine.regs,
>> > > +			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR(chan, layer),
>> > > +			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN, val);
>> > > +
>> > > +	/* Set the alpha configuration */
>> > > +	regmap_update_bits(mixer->engine.regs,
>> > > +			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR(chan, layer),
>> > > +			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_MASK,
>> > > +			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_DEF);
>> > > +	regmap_update_bits(mixer->engine.regs,
>> > > +			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR(chan, layer),
>> > > +			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MASK,
>> > > +			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_DEF);
>> > > +}
>> >=20
>> > This one too.
>>=20
>> It's called from sun8i_layer.c, so it cannot be static.
>
>Fair enough.
>
>> > > +	/* Set base coordinates */
>> > > +	DRM_DEBUG_DRIVER("Layer coordinates X: %d Y: %d\n",
>> > > +			 state->crtc_x, state->crtc_y);
>> > > +	regmap_write(mixer->engine.regs,
>> > > +		     SUN8I_MIXER_CHAN_UI_LAYER_COORD(chan, layer),
>> > > +		     SUN8I_MIXER_COORD(state->crtc_x, state->crtc_y));
>> >=20
>> > X and Y are fixed point numbers. You want to keep only the higher
>16
>> > bits there.
>>=20
>> Do you mean "lower 16 bits"? Thus should I (x & 0xffff) or ((u16)x) ?
>
>Nevermind, I got confused with src_x and src_y.
>
>> P.S. The negative coordinates are broken, how should I deal with it?
>or
>> is the coordinates promised to be not negative?
>
>Adjust the buffer base address, and use a shorter line. You have such
>an example in the sun4i code.

Are they these two lines:
```
paddr +=3D (state->src_x >> 16) * bpp;
paddr +=3D (state->src_y >> 16) * fb->pitches[0];
```

I think I copied them here, so I don't need to mind this problem any more, =
right?

>
>Maxime

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
