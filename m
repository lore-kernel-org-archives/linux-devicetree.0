From: Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dts: lpc4337-ciaa: enable EEPROM memory
Date: Wed, 16 Dec 2015 09:53:18 -0300
Message-ID: <56715EBE.9080002@vanguardiasur.com.ar>
References: <1448282225-2635-1-git-send-email-ariel@vanguardiasur.com.ar>
 <1448282225-2635-2-git-send-email-ariel@vanguardiasur.com.ar>
 <5655A950.3000003@vanguardiasur.com.ar>
 <CAGhQ9VzdWSoPbXv-pJUuz7GkM7PuYSz8+Np7Gz1h4MkXVzDeEA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGhQ9VzdWSoPbXv-pJUuz7GkM7PuYSz8+Np7Gz1h4MkXVzDeEA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Joachim,

El 14/12/15 a las 19:52, Joachim Eastwood escribi=C3=B3:
> Hi Ariel,
>=20
> On 25 November 2015 at 13:28, Ariel D'Alessandro
> <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org> wrote:
>> (+To: Joachim)
>>
>> El 23/11/15 a las 09:37, Ariel D'Alessandro escribi=C3=B3:
>>> The CIAA-NXP board has a NXP LPC4337 SoC that includes a 16 KiB
>>> EEPROM memory.
>>>
>>> Signed-off-by: Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
>>> ---
>>>  arch/arm/boot/dts/lpc4337-ciaa.dts | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/lpc4337-ciaa.dts b/arch/arm/boot/dts=
/lpc4337-ciaa.dts
>>> index 5f500c1..03bdf77 100644
>>> --- a/arch/arm/boot/dts/lpc4337-ciaa.dts
>>> +++ b/arch/arm/boot/dts/lpc4337-ciaa.dts
>>> @@ -155,6 +155,10 @@
>>>       };
>>>  };
>>>
>>> +&eeprom {
>>> +     status =3D "okay";
>>> +};
>>> +
>=20
> I already had a patch that enabled the eeprom for all boards that
> included the lpc4357.dtsi from when I tested your driver. So opted to
> use that patch instead of this one. This is really a SoC device
> feature that doesn't require any board resources so I think it is
> better to have this entry in lpc4357.dtsi.

Yeah, you're right. Fine for me, thanks.

--=20
Ariel D'Alessandro, VanguardiaSur
www.vanguardiasur.com.ar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
