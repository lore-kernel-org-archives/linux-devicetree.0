From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 2/8] irqchip: Supply new driver for STi based devices
Date: Thu, 27 Nov 2014 09:02:55 +0000
Message-ID: <20141127090255.GD4628@x1>
References: <1416932705-16880-1-git-send-email-lee.jones@linaro.org>
 <1416932705-16880-3-git-send-email-lee.jones@linaro.org>
 <2433040.4NqTrOMmEE@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2433040.4NqTrOMmEE@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, tglx@linutronix.de, kernel@stlinux.com, jason@lakedaemon.net
List-Id: devicetree@vger.kernel.org

On Tue, 25 Nov 2014, Arnd Bergmann wrote:

> On Tuesday 25 November 2014 16:24:59 Lee Jones wrote:
>=20
> > diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> > index b21f12f..e502f15 100644
> > --- a/drivers/irqchip/Kconfig
> > +++ b/drivers/irqchip/Kconfig
> > @@ -93,6 +93,13 @@ config RENESAS_IRQC
> >  	bool
> >  	select IRQ_DOMAIN
> > =20
> > +config ST_IRQCHIP
> > +	bool
> > +	select REGMAP
> > +	select MFD_SYSCON
> > +	help
> > +	  Enables SysCfg Controlled IRQs on STi based platforms.
> > +
>=20
> I'm confused by the purpose of this code. It's apparently a driver
> in drivers/irqchip, the Kconfig symbol contains the string IRQCHIP,
> yet it doesn't actually register an irq_chip.
>=20
> Also, the name is a bit too generic, ST has lots of different irqchip=
s,
> and this apparently isn't even one of them ;-)

Hmm... now you're going to ask me to remember who I had the
conversation with that alluded to this as the best location for this
driver.  Unfortunately, I cannot.  Can you think of a better place to
put it then?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
