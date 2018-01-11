From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH 1/7] pinctrl: sunxi: add support for pin
 controllers without bus gate
Date: Thu, 11 Jan 2018 21:21:06 +0800
Message-ID: <3A97A26E-0774-4279-B7B9-8312225E2C72@aosc.io>
References: <20180106042326.46519-1-icenowy@aosc.io> <ef82983f-6f91-46c2-1f67-7d4efc10c905@arm.com>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRB46J3XJAKGQEONWAXIQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <ef82983f-6f91-46c2-1f67-7d4efc10c905-5wv7dgnIgG8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2018=E5=B9=B41=E6=9C=8811=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=887:=
48:40, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org> =E5=86=99=E5=88=B0:
>Hi,
>
>another take to avoid this patch at all, I just remembered this from an
>IRC discussion before:
>
>On 06/01/18 04:23, Icenowy Zheng wrote:
>> The Allwinner H6 pin controllers (both the main one and the CPUs one)
>> have no bus gate clocks.
>
>I don't think this is true. The pin controller *needs* an APB clock,
>it's just not gate-able or not exposed or documented.
>The "system bus tree" on page 90 in the manual shows that the "GPIO"
>block is located on the APB1 bus.
>So can't we just reference this apb clock directly? That would be much
>cleaner, "more" correct and require less changes: "The best patch is no
>patch":

I can accept this. (In fact I have considered this, but
I don't dare to directly use bus clock in a device, as it's not
exported before.

Maxime, Chen-Yu, can you agree the following code?

>
>	clocks =3D <&ccu APB1>, <&osc24M>, <&osc32k>;
>	/* or whatever this APB clock is actually called. */
>	clock-names =3D "apb", "hosc", "losc";
>
>Cheers,
>Andre.
>
>>=20
>> Add support for this kind of pin controllers.
>>=20
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> ---
>>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 30
>++++++++++++++++++++----------
>>  drivers/pinctrl/sunxi/pinctrl-sunxi.h |  1 +
>>  2 files changed, 21 insertions(+), 10 deletions(-)
>>=20
>> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
>b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
>> index 4b6cb25bc796..68cd505679d9 100644
>> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
>> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
>> @@ -1182,7 +1182,12 @@ static int sunxi_pinctrl_setup_debounce(struct
>sunxi_pinctrl *pctl,
>>  	unsigned int hosc_div, losc_div;
>>  	struct clk *hosc, *losc;
>>  	u8 div, src;
>> -	int i, ret;
>> +	int i, ret, clk_count;
>> +
>> +	if (pctl->desc->without_bus_gate)
>> +		clk_count =3D 2;
>> +	else
>> +		clk_count =3D 3;
>> =20
>>  	/* Deal with old DTs that didn't have the oscillators */
>>  	if (of_count_phandle_with_args(node, "clocks", "#clock-cells") !=3D
>3)
>> @@ -1360,15 +1365,19 @@ int sunxi_pinctrl_init_with_variant(struct
>platform_device *pdev,
>>  			goto gpiochip_error;
>>  	}
>> =20
>> -	clk =3D devm_clk_get(&pdev->dev, NULL);
>> -	if (IS_ERR(clk)) {
>> -		ret =3D PTR_ERR(clk);
>> -		goto gpiochip_error;
>> -	}
>> +	if (!desc->without_bus_gate) {
>> +		clk =3D devm_clk_get(&pdev->dev, NULL);
>> +		if (IS_ERR(clk)) {
>> +			ret =3D PTR_ERR(clk);
>> +			goto gpiochip_error;
>> +		}
>> =20
>> -	ret =3D clk_prepare_enable(clk);
>> -	if (ret)
>> -		goto gpiochip_error;
>> +		ret =3D clk_prepare_enable(clk);
>> +		if (ret)
>> +			goto gpiochip_error;
>> +	} else {
>> +		clk =3D NULL;
>> +	}
>> =20
>>  	pctl->irq =3D devm_kcalloc(&pdev->dev,
>>  				 pctl->desc->irq_banks,
>> @@ -1425,7 +1434,8 @@ int sunxi_pinctrl_init_with_variant(struct
>platform_device *pdev,
>>  	return 0;
>> =20
>>  clk_error:
>> -	clk_disable_unprepare(clk);
>> +	if (clk)
>> +		clk_disable_unprepare(clk);
>>  gpiochip_error:
>>  	gpiochip_remove(pctl->chip);
>>  	return ret;
>> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
>b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
>> index 11b128f54ed2..ccb6230f0bb5 100644
>> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
>> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
>> @@ -113,6 +113,7 @@ struct sunxi_pinctrl_desc {
>>  	unsigned			irq_bank_base;
>>  	bool				irq_read_needs_mux;
>>  	bool				disable_strict_mode;
>> +	bool				without_bus_gate;
>>  };
>> =20
>>  struct sunxi_pinctrl_function {
>>=20
>
>_______________________________________________
>linux-arm-kernel mailing list
>linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
