From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH] ARM: at91: spi: request all csgpio in spi probe
Date: Fri, 1 Aug 2014 00:10:05 +0800
Message-ID: <C5B462AE-B1D2-4067-91EB-44FDF49D28FA@jcrosoft.com>
References: <b033d16ec31d26a895726ee72ec89b43943dfbae.1406547656.git.jiri.prchal@aksignal.cz> <20140728122103.GR9532@piout.net> <53D64ADA.1000102@aksignal.cz> <20140728223859.GA3214@piout.net> <20140729100017.31f0b1be@bbrezillon> <20140731155906.GH3214@piout.net>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140731155906.GH3214@piout.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Boris BREZILLON <boris.brezillon@free-electrons.com>, devicetree@vger.kernel.org, =?utf-8?Q?Ji=C5=99=C3=AD_Prchal?= <jiri.prchal@aksignal.cz>, Nicolas FERRE <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, voice.shen@atmel.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


On Jul 31, 2014, at 11:59 PM, Alexandre Belloni <alexandre.belloni@free=
-electrons.com> wrote:

> On 29/07/2014 at 10:00:17 +0200, Boris Brezillon wrote :
>> Hi Alexandre,
>>=20
>>> While this solves the particular issue Ji=C5=99=C3=AD is seeing, th=
is will not
>>> solve the case where PA14 (CS0) is not used by the spi driver at al=
l. It
>>> will remained muxed as CS0 and toggle when the spi master needs to
>>> access CS0 until another driver muxes it to something else. I still
>>> believe we should explicitly ask pinctrl to mux them as gpios.

This is not the job of the kernel but to the bootloader
no the pinctrl binding is not here and will never be here the configure=
 a pin as a GPIO or
to a specific state. This the job of the driver or the bootloader

>>>=20
>>=20
>> Do we really care about this case ?
>> After all, if a given pin needs a specific muxing during kernel boot
>> (i.e. a pin connected to a gpio-led that needs to stay in its previo=
us
>> state or a pin connected to the reset line of a device that needs to
>> stay up and running during kernel boot) the bootloader/bootstrap sho=
uld
>> have muxed this pin appropriately before booting the kernel.
>>=20
>=20
> Yeah, you are right.
>=20
>=20
>> What do you mean by "we should explicitly ask pinctrl to mux them as
>> gpios" ?
>> Do you mean configuring all the pins as GPIOs when the pin controlle=
r is
>> probed, or just adding a new pinctrl state configuring the pin as an
>> output GPIO and reference it in the pinctrl-0 property of the spi
>> controller.
>>=20
>> If the former, you'll break devices that needs their pins to stay in
>> the state they were during the bootloader/boostrap phase.
>> The latter won't work if the pin you request as GPIO is later reques=
ted
>> by another device (which, if I'm correct, is exactly the case you're
>> trying to solve).
>>=20
>=20
> Again you are right, let's not care about that use case. I still feel
> that the pinctrl-0 property has to be filled correctly.
>=20
> --=20
> Alexandre Belloni, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
