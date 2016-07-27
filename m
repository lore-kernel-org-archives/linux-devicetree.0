From: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v2 1/4] iio: adc: rockchip_saradc: reset saradc controller
 before programming it
Date: Wed, 27 Jul 2016 10:11:30 +0800
Message-ID: <57981852.1040006@rock-chips.com>
References: <1469535195-5227-1-git-send-email-wxt@rock-chips.com> <57976814.3040605@roeck-us.net> <579777F4.2090002@rock-chips.com> <20160726170023.GA6590@roeck-us.net> <57980362.3000406@rock-chips.com> <579815B2.5010205@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <579815B2.5010205-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, john-HooS5bfzL4hWk0Htik3J/w@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


On 2016=E5=B9=B407=E6=9C=8827=E6=97=A5 10:00, Guenter Roeck wrote:
> On 07/26/2016 05:42 PM, Caesar Wang wrote:
>>
>> On 2016=E5=B9=B407=E6=9C=8827=E6=97=A5 01:00, Guenter Roeck wrote:
>>> On Tue, Jul 26, 2016 at 10:47:16PM +0800, Caesar Wang wrote:
>>>> On 2016=E5=B9=B407=E6=9C=8826=E6=97=A5 21:39, Guenter Roeck wrote:
>>>>>> static int rockchip_saradc_probe(struct platform_device *pdev)
>>>>>> {
>>>>>> struct rockchip_saradc *info =3D NULL;
>>>>>> @@ -218,6 +231,21 @@ static int rockchip_saradc_probe(struct
>>>>>> platform_device *pdev)
>>>>>> if (IS_ERR(info->regs))
>>>>>> return PTR_ERR(info->regs);
>>>>>>
>>>>>> + /*
>>>>>> + * The reset should be an optional property, as it should work
>>>>>> + * with old devicetrees as well
>>>>>> + */
>>>>>> + info->reset =3D devm_reset_control_get_optional(&pdev->dev,
>>>>>> + "saradc-apb");
>>>>> Does anyone know what the _optional API is for ? It seems to be=20
>>>>> exactly
>>>>> the same
>>>>> as devm_reset_control_get().
>>>> =E2=80=9C
>>>> As far as I see, the difference is WARN_ON(1)
>>>> when  is not defined.
>>>>
>>>>
>>>> The _optional functions were introduced by the following commit:
>>>>
>>>> ----------------->8-----------------
>>>> commit b424080a9e086e683ad5fdc624a7cf3c024e0c0f
>>>> Author: Philipp Zabel <p.zabel@xxxxxxxxxxxxxx>
>>>> Date: Fri Mar 7 15:18:47 2014 +0100
>>>>
>>>> reset: Add optional resets and stubs
>>>>
>>>> This patch adds device_reset_optional and
>>>> variants that drivers can use to indicate they can function withou=
t=20
>>>> control
>>>> over the reset line. For those functions, stubs are added so the=20
>>>> drivers can
>>>> be compiled with CONFIG_RESET_CONTROLLER disabled.
>>>> Also, device_reset is annotated with __must_check. Drivers
>>>> ignoring the return
>>>> value should use device_reset_optional instead.
>>>>
>>> Is that really what we are looking for here ? CONFIG_RESET_CONTROLL=
ER
>>> is required for other functions of rk3399, isn't it ?
>>
>> Right, as the DRM and thermal are depend on the=20
>> CONFIG_RESET_CONTROLLER .....
>>
>
> Since "optional" doesn't really mean "the reset property is optional"
> but "CONFIG_RESET_CONTROLLER is optional", I would suggest to use
> devm_reset_control_get().

Agree, free riding.
Maybe the API (_optional) will be changed in later.
As someone make a point present an idea on=20
http://www.spinics.net/lists/kernel/msg2306677.html

Okay,  devm_reset_control_get() will be better, anyway the driver has=20
been depend on the CONFIG_RESET_CONTROLLER.
--

I will send a new patch for upstream if nobody object it on today.


Sorry for noisy!


>
> Guenter
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip


--=20
caesar wang | software engineer | wxt-TNX95d0MmH73oGB3hsPCZA@public.gmane.org
