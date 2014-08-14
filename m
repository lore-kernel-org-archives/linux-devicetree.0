From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH 4/4] ARM: dts: keystone-k2hk: add dsp gpio controllers
 nodes
Date: Thu, 14 Aug 2014 19:54:09 +0300
Message-ID: <53ECE9B1.4060303@ti.com>
References: <1407946582-20927-1-git-send-email-grygorii.strashko@ti.com> <1408018321.928492982@f270.i.mail.ru> <53ECDC54.3060005@ti.com> <1408029982.880621027@f126.i.mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1408029982.880621027@f126.i.mail.ru>
Sender: linux-gpio-owner@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>, Rob Herring <robh+dt@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, santosh.shilimkar@ti.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 08/14/2014 06:26 PM, Alexander Shiyan wrote:
> Thu, 14 Aug 2014 18:57:08 +0300 =D0=BE=D1=82 Grygorii Strashko <grygo=
rii.strashko@ti.com>:
> ...
>>>>>> +		dspgpio7: keystone_dsp_gpio@262025C {
>>>>>> +			compatible =3D "ti,keystone-mctrl-gpio";
>>>>>> +			gpio-controller;
>>>>>> +			#gpio-cells =3D <2>;
>>>>>> +			gpio,syscon-dev =3D <&devctrl 0x25c>;
>>>>>> +		};
>>>>>
>>>>> So, devctrl is a syscon device and this DTS introduce several
>>>>> identical GPIO descriptions?
>>>>>
>>>>> On my opinion this should be placed in the gpio-syscon.c,
>>>>> where you can add support for ti,keystone-dsp0{..7}-gpio.
>>>>> Such change will avoid parts 2 and 3 of this patch.
>>>>>
>>>>> static const struct syscon_gpio_data ti_keystone_dsp0_gpio =3D {
>>>>>      .compatible =3D "ti,keystone-syscon",
>>>>>      .dat_bit_offset =3D 0x240 * 8,
>>>>>      ...
>>>>>      .set =3D etc...
>>>>> };
>>>>
>>>> So, if I understand you right, you propose to add 8 additional com=
patible
>>>> strings just to encode different register offsets. Is it?
>>>> 1) add "ti,keystone-mctrl-gpio0"..."ti,keystone-mctrl-gpio7"
>>>
>>> Yes, but replace "mctrl" with "dsp" since mctrl is not applicable h=
ere.
>>>
>>>> 2) add 8 structures keystone_mctrl_gpio0..keystone_mctrl_gpio7 in =
gpio-syscon.c
>>>>      (which will have only different values of field - .dat_bit_of=
fset =3D 0x2yy * 8,)
>>>>
>>>> 3) add 8 additional items in array syscon_gpio_ids
>>>> 	{
>>>> 		.compatible	=3D "ti,keystone-mctrl-gpio0",
>>>> 		.data		=3D &keystone_mctrl_gpio0,
>>>> 	}, ...
>>>>
>>>> I can do it if you strictly insist, BUT I don't like it :(
>>>> - just imagine how your driver will look look like if 5 or 6 SoCs =
will re-use it ;)
>>>> - as I mentioned in cover letter and commit messages even each SoC=
 revision can have
>>>>     different Syscon implementation with different registers offse=
ts and with different
>>>>     number of Syscon register ranges (for example for Keystone 2 w=
e already have two
>>>>     Syscon devices defined in DT).
>>>
>>> The initial version of this driver contains addresses and offsets i=
n, but this approach has
>>> been criticized by DT maintainers.
>>
>> Could you provide link on this thread^, pls?
>=20
> Here is a link to first version:
> https://www.mail-archive.com/linux-gpio@vger.kernel.org/msg01616.html

10x

>=20
> Unfortunately, I lost thread for DT-related stuffs.
>=20

Oh, I've just checked ARM dts directory and found that=20
constructions like this:
	vendor,syscon =3D <&syscon_phandle>; /// or even this vendor,syscon =3D=
 <&syscon_phandle 0x60 2>;
are widely used as of now.
Also, According to the bindings doc, the Syscon is not a Linux specific=
 definition (mfd/syscon.txt).

Regards,
-grygorii

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
