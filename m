From: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 4/6] iio: adc: sun4i-gpadc-iio: add
 support for H3 thermal sensor
Date: Sat, 16 Sep 2017 12:35:01 +0200
Message-ID: <486005c0-3954-bd49-d2e1-072661fe31a7@free-electrons.com>
References: <20170914145251.21784-1-icenowy@aosc.io>
 <20170914145251.21784-5-icenowy@aosc.io>
 <445ea236-35e9-8d5a-e580-b2bdcf5f7776@free-electrons.com>
 <0b395ea1743a14a62855fc2a2dc74411@aosc.io>
Reply-To: quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCLZXSNY5IDBBV746PGQKGQEEF46BIQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <0b395ea1743a14a62855fc2a2dc74411-h8G6r0blFSE@public.gmane.org>
Content-Language: en-US
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: icenowy-h8G6r0blFSE@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Icenowy,

On 16/09/2017 12:14, icenowy-h8G6r0blFSE@public.gmane.org wrote:
> =E5=9C=A8 2017-09-16 17:45=EF=BC=8CQuentin Schulz =E5=86=99=E9=81=93=EF=
=BC=9A
>> Hi Icenowy,
>>
>> On 14/09/2017 16:52, Icenowy Zheng wrote:
>>> This adds support for the Allwinner H3 thermal sensor.
>>>
>>> Allwinner H3 has a thermal sensor like the one in A33, but have its
>>> registers nearly all re-arranged, sample clock moved to CCU and a pair
>>> of bus clock and reset added. It's also the base of newer SoCs' thermal
>>> sensors.
>>>
>>> The thermal sensors on A64 and H5 is like the one on H3, but with of
>>> course different formula factors.
>>>
>>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>>> ---
>>> Changes in v4:
>>> - Splitted out some code refactors.
>>> - Code sequence changed back. (The gpadc_data went back to the start of
>>> =C2=A0 the source file)
>>>
>>> =C2=A0drivers/iio/adc/sun4i-gpadc-iio.c | 48
>>> +++++++++++++++++++++++++++++++++++++++
>>> =C2=A0include/linux/mfd/sun4i-gpadc.h=C2=A0=C2=A0 | 27 ++++++++++++++++=
++++++
>>> =C2=A02 files changed, 75 insertions(+)
[...]
>>> =C2=A0#define SUN4I_GPADC_CTRL3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0c
>>> +/*
>>> + * This register is named "Average filter Control Register" in H3
>>> Datasheet,
>>> + * but the register's definition is the same as the old CTRL3 register=
.
>>> + */
>>> +#define SUN8I_H3_GPADC_CTRL3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x70
>>>
>>
>> I would name it as it is in the documentation:
>> SUN8I_H3_THS_FILTER
>=20
> The definition of this register is the same as the CTRL3.
>=20
> Maybe this name is better, but the similarity between them still needs
> to be documented, as the SUN4I_GPADC_CTRL3_XXX macros will be used to
> populate this register.
>=20
>>
>> No need for comments then.
>>
>>> =C2=A0#define SUN4I_GPADC_CTRL3_FILTER_EN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(2)
>>> =C2=A0#define SUN4I_GPADC_CTRL3_FILTER_TYPE(x)=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 (GENMASK(1, 0) & (x))

They have _FILTER_ in their name, isn't it enough?

Just a matter of taste for me.

>>> @@ -71,6 +84,13 @@
>>> =C2=A0#define SUN4I_GPADC_INT_FIFOC_TP_UP_IRQ_EN=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 BIT(1)
>>> =C2=A0#define SUN4I_GPADC_INT_FIFOC_TP_DOWN_IRQ_EN=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 BIT(0)
>>>
>>> +#define SUN8I_H3_GPADC_INTC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x44
>>> +
>>> +#define SUN8I_H3_GPADC_INTC_TEMP_PERIOD(x)=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ((GENMASK(19, 0) &
>>> (x)) << 12)
>>> +#define SUN8I_H3_GPADC_INTC_TEMP_DATA=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(8)
>>> +#define SUN8I_H3_GPADC_INTC_TEMP_SHUT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(4)
>>> +#define SUN8I_H3_GPADC_INTC_TEMP_ALARM=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(0)
>>> +
>>
>> Since it isn't an ADC anymore but rather just a THS, why don't you use
>> SUN8I_H3_THS instead of SUN8I_H3_GPADC? That way, it also matches the
>> datasheet.
>>
>>> =C2=A0#define SUN4I_GPADC_INT_FIFOS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x14
>>>
>>> =C2=A0#define SUN4I_GPADC_INT_FIFOS_TEMP_DATA_PENDING=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 BIT(18)
>>> @@ -80,9 +100,16 @@
>>> =C2=A0#define SUN4I_GPADC_INT_FIFOS_TP_UP_PENDING=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 BIT(1)
>>> =C2=A0#define SUN4I_GPADC_INT_FIFOS_TP_DOWN_PENDING=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 BIT(0)
>>>
>>> +#define SUN8I_H3_GPADC_INTS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x44
>>
>> 0x48
>>
>> [...]
>>
>> 1) You're not using irqs, why would you define registers that will never
>> be used?
>=20
> I will then rework it to use IRQs, but not now.
>=20
> Maybe I should add it when I use them?
>=20

Why not make it work right away the way we want :)?

>>
>> 2) Why aren't you using irqs? I remember we discussed on IRC that you
>> had some problems with the H3 when resuming or when probing the driver.
>> The register would have a zero in it until you have a first sample that
>> arrived (i.e. after the sample rate you set with T_ACQ) that would make
>> the thermal framework panic since the thermal sensor would return
>> something way too hot and shutdown your board?
>=20
> Nope, it's another problem -- the runtime resume function is even not
> called before the first sample, and the first sample will happen when
> the THS is still suspended.
>=20

As discussed on IRC (a long time ago :) ), it's a combination of two
problems:
1) get_temp (used by thermal framework) uses pm_runtime function that
isn't ready yet <=3D I will send a patch for registering thermal framework
after pm_runtime to you, hopefully in the upcoming hour or tomorrow,

2) The A33 (and H3 in your implementation) does not wait for an
interrupt to read the TEMP_DATA register which resets to 0 when the
sensor is disabled (or until a first sample arrives) i.e. when probing
or when resuming. Using IRQs would get rid of 2). It isn't critical for
A33 as the formula for temp returns something really cold so thermal
does not care. But for the H3, it's critically hot and shuts down your
board. To make it work on the H3, we would have to use a delay in the
pm_resume function equal to the sensor sampling rate and I don't really
like that. If we could use IRQs, it'd be better IMHO (but they aren't
working on A33).

Thanks,
Quentin

>>
>> The H3 apparently supports IRQs, why do you not support them for the
>> temperature? They might be broken as it is on A33 but then it might be a
>> good idea to write it down in a comment in the driver (and not adding
>> the unused registers in the header file) or at least in the commit log.
>>
>> 3) Now that you have support for clocks, wouldn't it be a good idea to
>> disable them during suspend?
>=20
> Interesting... It's meaningful to disable the mod clock during suspend.
>=20
>>
>> Thanks,
>> Quentin
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--=20
Quentin Schulz, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
