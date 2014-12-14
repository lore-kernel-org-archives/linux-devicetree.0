From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 1/8] soc: mediatek: Add PMIC wrapper for MT8135 and MT6397 SoC
Date: Sun, 14 Dec 2014 21:18:34 +0100
Message-ID: <5375041.4IGZ3lO9Xc@wuerfel>
References: <1417752479-4749-1-git-send-email-flora.fu@mediatek.com> <3015972.tvmzP0zTdv@wuerfel> <1418292255.2315.12.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418292255.2315.12.camel@mtksdaap41>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Flora Fu <flora.fu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, HenryC Chen <henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Menghui Lin <menghui.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant
List-Id: devicetree@vger.kernel.org

On Thursday 11 December 2014 18:04:15 Flora Fu wrote:
> On Tue, 2014-12-09 at 12:20 +0100, Arnd Bergmann wrote:
> > On Tuesday 09 December 2014 11:30:15 Matthias Brugger wrote:
> > > 2014-12-09 11:13 GMT+01:00 Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>:
> > > > On Tue, Dec 09, 2014 at 09:23:18AM +0100, Arnd Bergmann wrote:
> > > >>
> > > >> I think we have had a similar case recently where a controller wasn't
> > > >> actually using I2C, but the sofware protocol was close enough so we decided
> > > >> to make it appear as i2c in Linux.
> > > >>
> > > >> Would that work for you, i.e. register the pmic wrapper as a fake spi
> > > >> master driver in drivers/spi/ and register the rtc/regulator/codec
> > > >> as SPI clients from DT?
> > > >
> > > > I don't think that's appropriate. I mean technically that could even
> > > > work, but in software you really don't see anything from the underlying
> > > > SPI bus. The SoC and the PMIC are really tightly coupled via the PMIC
> > > > wrapper. This goes to the point where pins of the SoCs internal I2C and
> > > > keypad controllers are routed over the SPI bus out of the PMIC. In
> > > > software you do this by setting a bit in the I2C controller. If it's
> > > > set, the signals are routed out of the PMIC instead of the main die.
> > > > As said, technically we probably could create a fake SPI master, but
> > > > that wouldn't really fit to this situation.
> > 
> > Ok, I see.
> > 
> > > I agree with Sascha. Although from the hardware point of view, the
> > > communication between the PMIC and the SOC is done through SPI from
> > > the point of view of the software everything looks like I2C commands
> > > which will be "transalted" into SPI messages by the PMIC wrapper.
> > 
> > If it looks like i2c messages, would it be more appropriate to make
> > it appear as an i2c controller then?
> 
> 
> Although the message looks like I2C command, it is not I2C.
> Form source code, the software does not touch any I2C i/o or protocols.
> It depends SoC and has specific initial flow, read and write transfer
> state. It is not able to an i2c controller.
> That's why we consider its a proprietary hardware with specific
> protocols. How about let it appear in driver/soc?

Ok, I've looked a lot more at other drivers now, and I see that one
of my main objections which was about the way that the drivers look
into dev->parent->drvdata is in fact common practice for pmic drivers,
and using i2c wouldn't change anything here. Based on this, using
drivers/soc is probably best as you say.

I still think the relation between the mt8135 pmic wrapper and the
mt6397 mfd driver could be improved. I don't like the way that
include/linux/soc/mediatek/mtk-pmic-wrap.h exposes an internal
data structure of the pmic-wrap driver to the mfd driver, which
really only needs the regmap pointer from it, and I think it would
be better to pass that pointer using platform_data here in one way
or another. The easiest way to do that is probably using an auxdata
table in of_platform_populate, while another method might be to
restructure the relationship between the wrapper driver and the
mfd driver in some form to take out the extra device node and make
the mfd cells children of the wrapper itself.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
