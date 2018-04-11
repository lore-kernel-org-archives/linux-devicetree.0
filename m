From: Giulio Benetti <giulio.benetti-W14uJ/fiAyBY2hyreNRi6g@public.gmane.org>
Subject: Re: Re: [PATCH 2/3] ARM: dts: sun7i: Add RGB666 pins definition
Date: Thu, 12 Apr 2018 01:19:54 +0200
Message-ID: <1f71f768-2c3d-a241-a368-e55f4677a279@micronovasrl.com>
References: <20180410213129.24049-1-contact@paulk.fr>
 <20180410213129.24049-2-contact@paulk.fr>
 <e7f68882-c333-12ac-c122-20b0d7b65666@micronovasrl.com>
 <588060914d3b6899f6812daa4969f61bf750c91b.camel@paulk.fr>
Reply-To: giulio.benetti-W14uJ/fiAyBY2hyreNRi6g@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCV5B5VKVYCRBKNQXLLAKGQEEQS4CBQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <588060914d3b6899f6812daa4969f61bf750c91b.camel-W9ppeneeCTY@public.gmane.org>
Content-Language: it
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

Il 12/04/2018 01:09, Paul Kocialkowski ha scritto:
> Hi,
>=20
> Le jeudi 12 avril 2018 =C3=A0 00:22 +0200, Giulio Benetti a =C3=A9crit :
>> Hi,
>>
>> Il 10/04/2018 23:31, Paul Kocialkowski ha scritto:
>>> This adds the pins definition for RGB666 LCD panels on the A20. It
>>> was
>>> imported from the A33 definition, that concernes the same set of
>>> pins.
>>>
>>> Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
>>> ---
>>>    arch/arm/boot/dts/sun7i-a20.dtsi | 8 ++++++++
>>>    1 file changed, 8 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi
>>> b/arch/arm/boot/dts/sun7i-a20.dtsi
>>> index e529e4ff2174..f46af8675cfa 100644
>>> --- a/arch/arm/boot/dts/sun7i-a20.dtsi
>>> +++ b/arch/arm/boot/dts/sun7i-a20.dtsi
>>> @@ -781,6 +781,14 @@
>>>    				function =3D "ir1";
>>>    			};
>>>   =20
>>> +			lcd_rgb666_pins: lcd_rgb666@0 {
>>
>> I point you to this Thread and back:
>> https://lists.freedesktop.org/archives/dri-devel/2018-March/170688.htm
>> l
>>
>> I did the same for rgb888, so good part is discussed.
>>
>> IMHO I would:
>> - call lcd0_rgb666_pins, since this is for LCD0 interface
>> - same as above, call lcd0-rgb666, take care about using "-" instad
>> of
>> "_" that can cause DTC warnings.
>> - remove @0 since only this set can achieve LCD0 RGB666, and I
>>     don't think there will be other combinations.
>=20
> I even responded to that discussion but overlooked these aspects when
> crafting this patch. Thanks for the summary :)

You're welcome, I've forgotten you've been involved discussing
that patch so i've pointed you something yours :)
Anyway it should help.

Best regards

--=20
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale =E2=82=AC 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642

>=20
>> Kind regards
>>
>> --=20
>> Giulio Benetti
>> CTO
>>
>> MICRONOVA SRL
>> Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
>> Tel. 049/8931563 - Fax 049/8931346
>> Cod.Fiscale - P.IVA 02663420285
>> Capitale Sociale =E2=82=AC 26.000 i.v.
>> Iscritta al Reg. Imprese di Padova N. 02663420285
>> Numero R.E.A. 258642
>>
>>
>>> +				pins =3D "PD2", "PD3", "PD4", "PD5",
>>> "PD6", "PD7",
>>> +				       "PD10", "PD11", "PD12",
>>> "PD13", "PD14", "PD15",
>>> +				       "PD18", "PD19", "PD20",
>>> "PD21", "PD22", "PD23",
>>> +				       "PD24", "PD25", "PD26",
>>> "PD27";
>>> +				function =3D "lcd0";
>>> +			};
>>> +
>>>    			mmc0_pins_a: mmc0@0 {
>>>    				pins =3D "PF0", "PF1", "PF2",
>>>    				       "PF3", "PF4", "PF5";
>>>
>>
>>

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
