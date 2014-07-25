From: =?UTF-8?B?SmnFmcOtIFByY2hhbA==?= <jiri.prchal-cKCO0sOKHLPtwjQa/ONI9g@public.gmane.org>
Subject: Re: [PATCH] ARM: at91: at91sam9x5: sets NPCS0 (PA14) back to GPIO
Date: Fri, 25 Jul 2014 10:59:03 +0200
Message-ID: <53D21C57.3010805@aksignal.cz>
References: <1405074175-22444-1-git-send-email-voice.shen@atmel.com> <53D10C50.50305@aksignal.cz> <20140724162645.4e19c26c@bbrezillon> <53D12103.3020103@aksignal.cz> <20140724175848.44f5da10@bbrezillon> <53D1F5D0.1080006@aksignal.cz> <20140725083053.GD9532@piout.net> <53D2174B.4020403@aksignal.cz> <20140725085436.GF9532@piout.net>
Reply-To: jiri.prchal-cKCO0sOKHLPtwjQa/ONI9g@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140725085436.GF9532-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Bo Shen <voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



Dne 25.7.2014 v 10:54 Alexandre Belloni napsal(a):
> On 25/07/2014 at 10:37:31 +0200, Ji=C5=99=C3=AD Prchal wrote :
>>
>>
>> Dne 25.7.2014 v 10:30 Alexandre Belloni napsal(a):
>>> Hi,
>>>
>>> On 25/07/2014 at 08:14:40 +0200, Ji=C5=99=C3=AD Prchal wrote :
>>>> I'm using custom board. My spi node:
>>>> 			spi0: spi@f0000000 {
>>>
>>> You should override the pinctrl here as you are using gpios for the=
 cs.
>>> 				pinctrl-0 =3D <&pinctrl_spi0_custom>;
>>>
>>>> 				status =3D "okay";
>>>> 				cs-gpios =3D <&pioA 23 0
>>>> 					    &pioA 22 0
>>>> 					    &pioC 29 0
>>>> 					    &pioA 14 0>;
>>>>
>>>
>>> 		pinctrl@fffff400 {
>>> 				spi0 {
>>> 					 pinctrl_spi0_custom: spi0-custom {
>>> 							 atmel,pins =3D
>>> 									 <AT91_PIOA 23 AT91_PERIPH_GPIO AT91_PINCTRL_NONE>,
>>> 									 <AT91_PIOA 22 AT91_PERIPH_GPIO AT91_PINCTRL_NONE>,
>>> 									 <AT91_PIOC 29 AT91_PERIPH_GPIO AT91_PINCTRL_NONE>,
>>> 									 <AT91_PIOA 14 AT91_PERIPH_GPIO AT91_PINCTRL_NONE>;
>>> 					 };
>>> 				};
>>> 		};
>>>
>> Of course, it's the way, but in all other drivers, for example LEDS,
>> it's not needed. And in other way, if I will not use PA14 at all,
>> the pin will goes down every spi transfer.
>
> You must not assumed that the pins are muxed to their default state
> which is gpio and you should set the pinctrl accordingly for each
> device.
>
> If you don't use PA14 at all, then you don't really care about its
> state...
Yes and no, what about on board is populated some chip on PA14, but for=
 some reason at this time I don't need it and not=20
defined in DT?
>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
