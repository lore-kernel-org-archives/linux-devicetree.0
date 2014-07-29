From: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: at91: spi: request all csgpio in spi probe
Date: Tue, 29 Jul 2014 10:00:17 +0200
Message-ID: <20140729100017.31f0b1be@bbrezillon>
References: <b033d16ec31d26a895726ee72ec89b43943dfbae.1406547656.git.jiri.prchal@aksignal.cz>
	<20140728122103.GR9532@piout.net>
	<53D64ADA.1000102@aksignal.cz>
	<20140728223859.GA3214@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140728223859.GA3214-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: =?UTF-8?B?SmnFmcOt?= Prchal <jiri.prchal-cKCO0sOKHLPtwjQa/ONI9g@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Alexandre,

On Tue, 29 Jul 2014 00:38:59 +0200
Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

>=20
> > >>+		if (ret < 0) {
> > >>+			dev_err(&pdev->dev,
> > >>+				"failed to configure csgpio#%u (%d)\n",
> > >>+				i, ret);
> > >>+			goto out_free;
> > >>+		}
> > >>+	}
> > >>+
>=20
> Mark: maybe it would make sense to do devm_gpio_request_one() in
> of_spi_register_master(), after of_get_named_gpio.

Might be the cleanest way to solve this issue, but you'll have to modif=
y
all the drivers that request cs_gpio in their setup method/callback.

>=20
> While this solves the particular issue Ji=C5=99=C3=AD is seeing, this=
 will not
> solve the case where PA14 (CS0) is not used by the spi driver at all.=
 It
> will remained muxed as CS0 and toggle when the spi master needs to
> access CS0 until another driver muxes it to something else. I still
> believe we should explicitly ask pinctrl to mux them as gpios.
>=20

Do we really care about this case ?
After all, if a given pin needs a specific muxing during kernel boot
(i.e. a pin connected to a gpio-led that needs to stay in its previous
state or a pin connected to the reset line of a device that needs to
stay up and running during kernel boot) the bootloader/bootstrap should
have muxed this pin appropriately before booting the kernel.

What do you mean by "we should explicitly ask pinctrl to mux them as
gpios" ?
Do you mean configuring all the pins as GPIOs when the pin controller i=
s
probed, or just adding a new pinctrl state configuring the pin as an
output GPIO and reference it in the pinctrl-0 property of the spi
controller.

If the former, you'll break devices that needs their pins to stay in
the state they were during the bootloader/boostrap phase.
The latter won't work if the pin you request as GPIO is later requested
by another device (which, if I'm correct, is exactly the case you're
trying to solve).

Best Regards,

Boris

--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
