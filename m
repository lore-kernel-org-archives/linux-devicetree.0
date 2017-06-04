From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH v2 04/11] drm: sun4i: add support for H3's TCON0/1
Date: Mon, 05 Jun 2017 03:03:47 +0800
Message-ID: <493AC6F2-3CB3-48F5-9568-A34AA927238F@aosc.io>
References: <20170604160149.30230-1-icenowy@aosc.io> <20170604160149.30230-5-icenowy@aosc.io> <3642057.oKT9kIlu8M@jernej-laptop>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBIFT2HEQKGQEEJAALYQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <3642057.oKT9kIlu8M@jernej-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2017=E5=B9=B46=E6=9C=885=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=882:4=
6:24, "Jernej =C5=A0krabec" <jernej.skrabec-gGgVlfcn5nU@public.gmane.org> =E5=86=99=E5=88=B0:
>Hi,
>
>Dne nedelja, 04. junij 2017 ob 18:01:42 CEST je Icenowy Zheng
>napisal(a):
>> From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
>>=20
>> Allwinner H3 has two special TCONs, both come without channel0. And
>the
>> TCON1 of H3 has no special clocks even for the channel1.
>>=20
>> Add support for these kinds of TCON.
>>=20
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> ---
>> Changes in v2:
>> - Merged TCON0 and TCON1 quirks and compatibles.
>>=20
>>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 52
>> +++++++++++++++++++++++++-------------
>drivers/gpu/drm/sun4i/sun4i_tcon.h |
>>  1 +
>>  2 files changed, 36 insertions(+), 17 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c
>> b/drivers/gpu/drm/sun4i/sun4i_tcon.c index 568cea0e5f8f..62ba4fc19f18
>> 100644
>> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
>> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
>> @@ -59,6 +59,7 @@ void sun4i_tcon_channel_disable(struct sun4i_tcon
>*tcon,
>> int channel)
>>=20
>>  	/* Disable the TCON's channel */
>>  	if (channel =3D=3D 0) {
>> +		WARN_ON(!tcon->quirks->has_channel_0);
>>  		regmap_update_bits(tcon->regs, SUN4I_TCON0_CTL_REG,
>>  				   SUN4I_TCON0_CTL_TCON_ENABLE, 0);
>>  		clk_disable_unprepare(tcon->dclk);
>> @@ -78,6 +79,7 @@ void sun4i_tcon_channel_enable(struct sun4i_tcon
>*tcon,
>> int channel)
>>=20
>>  	/* Enable the TCON's channel */
>>  	if (channel =3D=3D 0) {
>> +		WARN_ON(!tcon->quirks->has_channel_0);
>>  		regmap_update_bits(tcon->regs, SUN4I_TCON0_CTL_REG,
>>  				   SUN4I_TCON0_CTL_TCON_ENABLE,
>>  				   SUN4I_TCON0_CTL_TCON_ENABLE);
>> @@ -159,6 +161,7 @@ void sun4i_tcon0_mode_set(struct sun4i_tcon
>*tcon,
>>=20
>>  	/* Configure the dot clock */
>>  	clk_set_rate(tcon->dclk, mode->crtc_clock * 1000);
>> +	WARN_ON(!tcon->quirks->has_channel_0);
>>=20
>>  	/* Adjust clock delay */
>>  	clk_delay =3D sun4i_tcon_get_clk_delay(mode, 0);
>> @@ -366,10 +369,12 @@ static int sun4i_tcon_init_clocks(struct device
>*dev,
>>  	}
>>  	clk_prepare_enable(tcon->clk);
>>=20
>> -	tcon->sclk0 =3D devm_clk_get(dev, "tcon-ch0");
>> -	if (IS_ERR(tcon->sclk0)) {
>> -		dev_err(dev, "Couldn't get the TCON channel 0 clock\n");
>> -		return PTR_ERR(tcon->sclk0);
>> +	if (tcon->quirks->has_channel_0) {
>> +		tcon->sclk0 =3D devm_clk_get(dev, "tcon-ch0");
>> +		if (IS_ERR(tcon->sclk0)) {
>> +			dev_err(dev, "Couldn't get the TCON channel 0 clock\n");
>> +			return PTR_ERR(tcon->sclk0);
>> +		}
>>  	}
>>=20
>>  	if (tcon->quirks->has_channel_1) {
>> @@ -594,10 +599,12 @@ static int sun4i_tcon_bind(struct device *dev,
>struct
>> device *master, goto err_free_clocks;
>>  	}
>>=20
>> -	ret =3D sun4i_dclk_create(dev, tcon);
>> -	if (ret) {
>> -		dev_err(dev, "Couldn't create our TCON dot clock\n");
>> -		goto err_free_clocks;
>> +	if (tcon->quirks->has_channel_0) {
>> +		ret =3D sun4i_dclk_create(dev, tcon);
>> +		if (ret) {
>> +			dev_err(dev, "Couldn't create our TCON dot clock\n");
>> +			goto err_free_clocks;
>> +		}
>>  	}
>>=20
>>  	ret =3D sun4i_tcon_init_irq(dev, tcon);
>> @@ -622,7 +629,8 @@ static int sun4i_tcon_bind(struct device *dev,
>struct
>> device *master, return 0;
>>=20
>>  err_free_dotclock:
>> -	sun4i_dclk_free(tcon);
>> +	if (tcon->quirks->has_channel_0)
>> +		sun4i_dclk_free(tcon);
>>  err_free_clocks:
>>  	sun4i_tcon_free_clocks(tcon);
>>  err_assert_reset:
>> @@ -636,7 +644,9 @@ static void sun4i_tcon_unbind(struct device *dev,
>struct
>> device *master, struct sun4i_tcon *tcon =3D dev_get_drvdata(dev);
>>=20
>>  	list_del(&tcon->list);
>> -	sun4i_dclk_free(tcon);
>> +
>> +	if (tcon->quirks->has_channel_0)
>> +		sun4i_dclk_free(tcon);
>>  	sun4i_tcon_free_clocks(tcon);
>>  }
>>=20
>> @@ -667,24 +677,32 @@ static int sun4i_tcon_remove(struct
>platform_device
>> *pdev) }
>>=20
>>  static const struct sun4i_tcon_quirks sun5i_a13_quirks =3D {
>> -	.has_unknown_mux =3D true,
>> -	.has_channel_1	=3D true,
>> +	.has_unknown_mux	=3D true,
>> +	.has_channel_0		=3D true,
>> +	.has_channel_1		=3D true,
>>  };
>>=20
>>  static const struct sun4i_tcon_quirks sun6i_a31_quirks =3D {
>> -	.has_channel_1	=3D true,
>> +	.has_channel_0		=3D true,
>> +	.has_channel_1		=3D true,
>>  };
>>=20
>>  static const struct sun4i_tcon_quirks sun6i_a31s_quirks =3D {
>> -	.has_channel_1	=3D true,
>> +	.has_channel_0		=3D true,
>> +	.has_channel_1		=3D true,
>>  };
>>=20
>>  static const struct sun4i_tcon_quirks sun8i_a33_quirks =3D {
>> -	/* nothing is supported */
>> +	.has_channel_0	=3D true,
>>  };
>>=20
>>  static const struct sun4i_tcon_quirks sun8i_v3s_quirks =3D {
>> -	/* nothing is supported */
>> +	.has_channel_0	=3D true,
>> +};
>> +
>> +static const struct sun4i_tcon_quirks sun8i_h3_quirks =3D {
>> +	.has_channel_1		=3D true,
>> +	.swappable_input	=3D true,
>>  };
>>=20
>>  static const struct of_device_id sun4i_tcon_of_table[] =3D {
>> @@ -693,7 +711,7 @@ static const struct of_device_id
>sun4i_tcon_of_table[] =3D
>> { { .compatible =3D "allwinner,sun6i-a31s-tcon", .data =3D
>&sun6i_a31s_quirks
>> }, { .compatible =3D "allwinner,sun8i-a33-tcon", .data =3D
>&sun8i_a33_quirks },
>> { .compatible =3D "allwinner,sun8i-v3s-tcon", .data =3D &sun8i_v3s_quirk=
s
>},
>> -	{ }
>> +	{ .compatible =3D "allwinner,sun8i-h3-tcon", .data =3D &sun8i_h3_quirk=
s
>},
>
>I think you need to leave empty entry as a sentinel.

Sorry.

>
>>  };
>>  MODULE_DEVICE_TABLE(of, sun4i_tcon_of_table);
>>=20
>> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.h
>> b/drivers/gpu/drm/sun4i/sun4i_tcon.h index c3e01c06e9a0..9c706a0bd478
>> 100644
>> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.h
>> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.h
>> @@ -145,6 +145,7 @@
>>=20
>>  struct sun4i_tcon_quirks {
>>  	bool	has_unknown_mux; /* sun5i has undocumented mux */
>> +	bool	has_channel_0;	/* some A83T+ TCONs don't have channel 0*/
>>  	bool	has_channel_1;	/* a33 does not have channel 1 */
>>  	/* Some DE2 can swap the mixer<->TCON connection */
>>  	bool	swappable_input;
>> --
>> 2.12.2
>
>You missed sun4i_rgb_init() function which should also be guarded with
>"if=20
>(tcon->quirks->has_channel_0)".
>

Yes...

>You should also expand function sun4i_drv_node_is_tcon() at sun4i_drv.c
>with=20
>new entries, but I'm not sure if this fits in this patch.

Instead I think it should be renamed to something like
"sun4i_drv_node_is_tcon_with_ch0".

>
>Best regards,
>Jernej

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
