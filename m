From: Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: lpc4337-ciaa: enable SCT-PWM
Date: Wed, 16 Dec 2015 09:55:39 -0300
Message-ID: <56715F4B.7050109@vanguardiasur.com.ar>
References: <1448282225-2635-1-git-send-email-ariel@vanguardiasur.com.ar>
 <1448282225-2635-3-git-send-email-ariel@vanguardiasur.com.ar>
 <5655A977.1040408@vanguardiasur.com.ar>
 <CAGhQ9Vxqpe4QQn1+d6bOCQH9q6evignVR_+U4NK7HqSNhBg4qA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGhQ9Vxqpe4QQn1+d6bOCQH9q6evignVR_+U4NK7HqSNhBg4qA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Joachim,

El 14/12/15 a las 19:48, Joachim Eastwood escribi=C3=B3:
> Hi Ariel,
>=20
> Sorry for the late reply. I have just started to put together my DT
> for 4.5 branch now.
>=20
> On 25 November 2015 at 13:28, Ariel D'Alessandro
> <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org> wrote:
>> (+To: Joachim)
>>
>> El 23/11/15 a las 09:37, Ariel D'Alessandro escribi=C3=B3:
>>> Enable the PWM based on the State Configurable Timer (SCT) included=
 in
>>> the LPC4337 SoC of the CIAA-NXP board.
>>>
>>> Signed-off-by: Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
>>> ---
>>>  arch/arm/boot/dts/lpc4337-ciaa.dts | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/lpc4337-ciaa.dts b/arch/arm/boot/dts=
/lpc4337-ciaa.dts
>>> index 03bdf77..1a23589 100644
>>> --- a/arch/arm/boot/dts/lpc4337-ciaa.dts
>>> +++ b/arch/arm/boot/dts/lpc4337-ciaa.dts
>>> @@ -170,6 +170,10 @@
>>>       pinctrl-0 =3D <&enet_rmii_pins>;
>>>  };
>>>
>>> +&sct_pwm {
>>> +     status =3D "okay";
>>> +};
>>> +
>=20
> Isn't this a bit useless without any pinmux setup?

Yes, it might be kind of useless. Do you think it shouldn't be enabled =
then?

--=20
Ariel D'Alessandro, VanguardiaSur
www.vanguardiasur.com.ar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
