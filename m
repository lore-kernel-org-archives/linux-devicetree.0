From: =?UTF-8?B?SmnFmcOtIFByY2hhbA==?= <jiri.prchal-cKCO0sOKHLPtwjQa/ONI9g@public.gmane.org>
Subject: Re: [PATCH] ARM: at91: at91sam9x5: sets NPCS0 (PA14) back to GPIO
Date: Fri, 25 Jul 2014 08:14:40 +0200
Message-ID: <53D1F5D0.1080006@aksignal.cz>
References: <1405074175-22444-1-git-send-email-voice.shen@atmel.com>	<53D10C50.50305@aksignal.cz>	<20140724162645.4e19c26c@bbrezillon>	<53D12103.3020103@aksignal.cz> <20140724175848.44f5da10@bbrezillon>
Reply-To: jiri.prchal-cKCO0sOKHLPtwjQa/ONI9g@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140724175848.44f5da10@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Bo Shen <voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



Dne 24.7.2014 v 17:58 Boris BREZILLON napsal(a):
> On Thu, 24 Jul 2014 17:06:43 +0200
> Ji=C5=99=C3=AD Prchal <jiri.prchal-cKCO0sOKHLPtwjQa/ONI9g@public.gmane.org> wrote:
>
>> Hi,
>>
>> Dne 24.7.2014 v 16:26 Boris BREZILLON napsal(a):
>>> Hello Ji=C5=99=C3=AD,
>>>
>>> First of all, please try to use git format-patch when submitting a
>>> patch to any kernel mailing list.
>> Sorry for that.
>>>
>>> On Thu, 24 Jul 2014 15:38:24 +0200
>>> Ji=C5=99=C3=AD Prchal <jiri.prchal-cKCO0sOKHLPtwjQa/ONI9g@public.gmane.org> wrote:
>>>
>>>> After ROMBOOT tries boot from flash on SPI0 NPCS0, this NPCS0 (PA1=
4) remains set to PERIPH_A.
>>>> Because of that, this pin is unusable to something else.
>>>> This patch sets it back to GPIO.
>>>
>>> The policy is to leave pins in an unknown state till some periphera=
l
>>> need them.
>>>
>>> What are you trying to use this pin for ?
>> For chip select, but #3. And when SPI communicate with cs0 (PA22), i=
t goes down too (PA14), so 2 devices on bus were
>> selected.
>
> Are you using a 9x5ek board or a custom one, in the latter case could
> you paste your spi0 node definition ?
I'm using custom board. My spi node:
			spi0: spi@f0000000 {
				status =3D "okay";
				cs-gpios =3D <&pioA 23 0
					    &pioA 22 0
					    &pioC 29 0
					    &pioA 14 0>;

				fm25@0 {
					compatible =3D "cypress,fm25";
					spi-max-frequency =3D <40000000>;
					reg =3D <0>;
					pagesize =3D <256>;
					size =3D <131072>;
					address-width =3D <24>;
				};
				/* ADC */
				spidev@1 {
					compatible =3D "spidev";
					reg =3D <1>;
					spi-max-frequency =3D <1000000>;
				};
				/* IO expander for busaddr */
				spidev@2 {
					compatible =3D "spidev";
					reg =3D <2>;
					label =3D "busaddr";
					spi-max-frequency =3D <10000000>;
				};
				/* audio codec */
				codec: codec@3 {
					compatible =3D "ti,tlv320aic3x";
					spi-max-frequency =3D <1000000>;
					reg =3D <3>;
				};
			};

This does not work without patch, because of 2 chips selected at one ti=
me because of PA14 is periph_a. Probably ROMBOOT=20
changes that.
>
>>> If you just want to use it as a chip select for an spi device, take=
 a
>>> look at [1].
>> At [1] it's OK until as cs0 is for example PA22 and cs1 is PA14.
>
> If you want PA14 to control cs1 and PA22 to control cs0 (both
> configured as GPIOs), you'll have the following definition:
>
> cs-gpios =3D <&pioA 22 0>, <&pioA 14 0>, <0>, <0>;
See my node.
>
>>>
>>> Here the gpio is requested by the spi core when defining the cs-gpi=
os
>>> property. The gpio controller then request the listed pins to the p=
in
>>> controller (pinctrl driver).
>> GPIO is not set in driver as GPIO, at least I didn't find it.
>
> Take a look at [1], which is set as the gpio_request_enable callback,
> called by pinctrl core when a gpio is requested.
But is this called from spi driver when requesting gpios as cs?
>
>
> [1]http://lxr.free-electrons.com/source/drivers/pinctrl/pinctrl-at91.=
c#L665
>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
