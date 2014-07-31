From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: at91: spi: request all csgpio in spi probe
Date: Thu, 31 Jul 2014 18:48:37 +0200
Message-ID: <20140731164836.GI3214@piout.net>
References: <b033d16ec31d26a895726ee72ec89b43943dfbae.1406547656.git.jiri.prchal@aksignal.cz>
 <20140728122103.GR9532@piout.net>
 <53D64ADA.1000102@aksignal.cz>
 <20140728223859.GA3214@piout.net>
 <20140729100017.31f0b1be@bbrezillon>
 <20140731155906.GH3214@piout.net>
 <C5B462AE-B1D2-4067-91EB-44FDF49D28FA@jcrosoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <C5B462AE-B1D2-4067-91EB-44FDF49D28FA-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?utf-8?B?SmnFmcOt?= Prchal <jiri.prchal-cKCO0sOKHLPtwjQa/ONI9g@public.gmane.org>, Nicolas FERRE <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/08/2014 at 00:10:05 +0800, Jean-Christophe PLAGNIOL-VILLARD wrote=
 :
> >>> While this solves the particular issue Ji=C5=99=C3=AD is seeing, =
this will not
> >>> solve the case where PA14 (CS0) is not used by the spi driver at =
all. It
> >>> will remained muxed as CS0 and toggle when the spi master needs t=
o
> >>> access CS0 until another driver muxes it to something else. I sti=
ll
> >>> believe we should explicitly ask pinctrl to mux them as gpios.
>=20
> This is not the job of the kernel but to the bootloader
> no the pinctrl binding is not here and will never be here the configu=
re a pin as a GPIO or

This is exactly what AT91_PERIPH_GPIO does though. Anyway, not request
the pinmuxing in the driver is not a good idea, then nothing prevents
another driver to request them to do something completely different.

> to a specific state. This the job of the driver or the bootloader
>=20

I agree that it must not allow to set the state, we are talking about
muxing.


--=20
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
