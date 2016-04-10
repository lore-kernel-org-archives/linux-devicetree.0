From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/4] support control with using GPIO lines
Date: Sun, 10 Apr 2016 17:38:55 +0200
Message-ID: <20160410153855.GG5377@piout.net>
References: <1460300366-25248-1-git-send-email-akinobu.mita@gmail.com>
 <20160410151237.GD5377@piout.net>
 <1460301781.17404.171.camel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1460301781.17404.171.camel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Ianovich <ynvich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

[Adding Mark]

On 10/04/2016 at 18:23:01 +0300, Sergei Ianovich wrote :
> On Sun, 2016-04-10 at 17:12 +0200, Alexandre Belloni wrote:
> > Hi,
> >=20
> > On 10/04/2016 at 23:59:22 +0900, Akinobu Mita wrote :
> > >=20
> > > This series adds support access to DS1302 with GPIO lines.
> > >=20
> > > Recently rtc-ds1302 is rewritten using SPI 3wire mode.=A0=A0This =
adds
> > > another platform driver using GPIO while supporting both modes.
> > >=20
> > > Thie series first fixes two problems I found while tesing, second=
ly
> > > introduces the abstraction layer for the register access which
> > > enables
> > > to share the most code between spi and platform driver, and adds
> > > the platform driver using GPIO.
> > >=20
> > Well, isn't spi-gpio fitting for that use case? I'd like to avoid
> > open
> > coding gpio bitbanging in the driver.
>=20
> No, unfortunately. I've investigated this possibility for my platform=
=2E
> spi-gpio doesn't support LSB-first and 3-wire options. Adding support
> there is a very big change. The best way to add GPIO support is to
> create spi-gpio-3wire with LSB-first support.

Mark, do you have nay opinion on that?


--=20
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
