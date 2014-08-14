From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH 4/4] ARM: dts: keystone-k2hk: add dsp gpio controllers
 nodes
Date: Thu, 14 Aug 2014 15:13:39 +0300
Message-ID: <53ECA7F3.7030702@ti.com>
References: <1407946582-20927-1-git-send-email-grygorii.strashko@ti.com> <1407946582-20927-5-git-send-email-grygorii.strashko@ti.com> <1407945984.545232249@f170.i.mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1407945984.545232249@f170.i.mail.ru>
Sender: linux-gpio-owner@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: Rob Herring <robh+dt@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, santosh.shilimkar@ti.com, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Alexander,

On 08/13/2014 07:06 PM, Alexander Shiyan wrote:
> Wed, 13 Aug 2014 19:16:22 +0300 =D0=BE=D1=82 Grygorii Strashko <grygo=
rii.strashko@ti.com>:
>> Add Keystone 2 DSP GPIO nodes.
>> DSP GPIO banks 0-7 correspond to DSP0-DSP7
>>
>> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
>> ---
>>   arch/arm/boot/dts/k2hk.dtsi |   56 +++++++++++++++++++++++++++++++=
++++++++++++
>>   1 file changed, 56 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/k2hk.dtsi b/arch/arm/boot/dts/k2hk.dt=
si
>> index 321ba2f..009e180 100644
>> --- a/arch/arm/boot/dts/k2hk.dtsi
>> +++ b/arch/arm/boot/dts/k2hk.dtsi
>> @@ -50,5 +50,61 @@
>>   			#interrupt-cells =3D <1>;
>>   			ti,syscon-dev =3D <&devctrl 0x2a0>;
>>   		};
>> +
>> +		dspgpio0: keystone_dsp_gpio@02620240 {
>> +			compatible =3D "ti,keystone-mctrl-gpio";
>> +			gpio-controller;
>> +			#gpio-cells =3D <2>;
>> +			gpio,syscon-dev =3D <&devctrl 0x240>;
>> +		};
>> +
>> +		dspgpio1: keystone_dsp_gpio@2620244 {
>> +			compatible =3D "ti,keystone-mctrl-gpio";
>> +			gpio-controller;
>> +			#gpio-cells =3D <2>;
>> +			gpio,syscon-dev =3D <&devctrl 0x244>;
>> +		};
> ...
>> +		dspgpio7: keystone_dsp_gpio@262025C {
>> +			compatible =3D "ti,keystone-mctrl-gpio";
>> +			gpio-controller;
>> +			#gpio-cells =3D <2>;
>> +			gpio,syscon-dev =3D <&devctrl 0x25c>;
>> +		};
>=20
> So, devctrl is a syscon device and this DTS introduce several
> identical GPIO descriptions?
>=20
> On my opinion this should be placed in the gpio-syscon.c,
> where you can add support for ti,keystone-dsp0{..7}-gpio.
> Such change will avoid parts 2 and 3 of this patch.
>=20
> static const struct syscon_gpio_data ti_keystone_dsp0_gpio =3D {
>    .compatible =3D "ti,keystone-syscon",
>    .dat_bit_offset =3D 0x240 * 8,
>    ...
>    .set =3D etc...
> };

So, if I understand you right, you propose to add 8 additional compatib=
le
strings just to encode different register offsets. Is it?
1) add "ti,keystone-mctrl-gpio0"..."ti,keystone-mctrl-gpio7"

2) add 8 structures keystone_mctrl_gpio0..keystone_mctrl_gpio7 in gpio-=
syscon.c
   (which will have only different values of field - .dat_bit_offset =3D=
 0x2yy * 8,)

3) add 8 additional items in array syscon_gpio_ids
	{
		.compatible	=3D "ti,keystone-mctrl-gpio0",
		.data		=3D &keystone_mctrl_gpio0,
	}, ...

I can do it if you strictly insist, BUT I don't like it :(
- just imagine how your driver will look look like if 5 or 6 SoCs will =
re-use it ;)
- as I mentioned in cover letter and commit messages even each SoC revi=
sion can have
  different Syscon implementation with different registers offsets and =
with different
  number of Syscon register ranges (for example for Keystone 2 we alrea=
dy have two
  Syscon devices defined in DT).

Now we already have 3 Keystone 2 SoC revisions (K2HK, K2L, K2E)  and th=
ere are no guarantee
that the next revision k2X will have the same register offset for GPIO0=
=2E

Best regards,
-grygorii

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
