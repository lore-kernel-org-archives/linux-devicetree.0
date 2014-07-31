From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: at91: spi: request all csgpio in spi probe
Date: Thu, 31 Jul 2014 17:59:06 +0200
Message-ID: <20140731155906.GH3214@piout.net>
References: <b033d16ec31d26a895726ee72ec89b43943dfbae.1406547656.git.jiri.prchal@aksignal.cz>
 <20140728122103.GR9532@piout.net>
 <53D64ADA.1000102@aksignal.cz>
 <20140728223859.GA3214@piout.net>
 <20140729100017.31f0b1be@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140729100017.31f0b1be@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: =?utf-8?B?SmnFmcOt?= Prchal <jiri.prchal-cKCO0sOKHLPtwjQa/ONI9g@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 29/07/2014 at 10:00:17 +0200, Boris Brezillon wrote :
> Hi Alexandre,
>=20
> > While this solves the particular issue Ji=C5=99=C3=AD is seeing, th=
is will not
> > solve the case where PA14 (CS0) is not used by the spi driver at al=
l. It
> > will remained muxed as CS0 and toggle when the spi master needs to
> > access CS0 until another driver muxes it to something else. I still
> > believe we should explicitly ask pinctrl to mux them as gpios.
> >=20
>=20
> Do we really care about this case ?
> After all, if a given pin needs a specific muxing during kernel boot
> (i.e. a pin connected to a gpio-led that needs to stay in its previou=
s
> state or a pin connected to the reset line of a device that needs to
> stay up and running during kernel boot) the bootloader/bootstrap shou=
ld
> have muxed this pin appropriately before booting the kernel.
>=20

Yeah, you are right.


> What do you mean by "we should explicitly ask pinctrl to mux them as
> gpios" ?
> Do you mean configuring all the pins as GPIOs when the pin controller=
 is
> probed, or just adding a new pinctrl state configuring the pin as an
> output GPIO and reference it in the pinctrl-0 property of the spi
> controller.
>=20
> If the former, you'll break devices that needs their pins to stay in
> the state they were during the bootloader/boostrap phase.
> The latter won't work if the pin you request as GPIO is later request=
ed
> by another device (which, if I'm correct, is exactly the case you're
> trying to solve).
>=20

Again you are right, let's not care about that use case. I still feel
that the pinctrl-0 property has to be filled correctly.

--=20
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
