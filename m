From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 1/8] soc: mediatek: Add PMIC wrapper for MT8135 and MT6397 SoC
Date: Tue, 09 Dec 2014 09:23:18 +0100
Message-ID: <2248330.M654Toyebg@wuerfel>
References: <1417752479-4749-1-git-send-email-flora.fu@mediatek.com> <2751641.o51TuZRl88@wuerfel> <1418091337.5663.9.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418091337.5663.9.camel@mtksdaap41>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Flora Fu <flora.fu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, HenryC Chen <henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Menghui Lin <menghui.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Dongdong Cheng <dongdong.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 09 December 2014 10:15:37 Flora Fu wrote:
> Hi, Arnd,
> 
> On Fri, 2014-12-05 at 11:13 +0100, Arnd Bergmann wrote:
> > On Friday 05 December 2014 12:07:52 Flora Fu wrote:
> > > Add PMIC wrapper of MT8135 to access MT6397 MFD.
> > > 
> > > Signed-off-by: Flora Fu <flora.fu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > > 
> > 
> > Please explain what a PMIC wrapper is and why you need one for MT8135.
> > I don't understand the purpose of this code at all. Is this just another
> > way of accessing the MT6397 when not using i2c or spi like other
> > PMIC drivers do?
> > 
> 
> Yes, MT8135 uses a proprietary hardware to communicate with MT6397. 
> The hardware is called PMIC Wrapper or PWRAP.
> Since it is not standard i2c or spi protocols, a soc related software
> driver is implemented to handle access protocols in AP side.
> 
> +-----------------+           +---------------+
> |                 |           |               |
> | Mediatek AP SoC |           |               |
> | (ex. MT8135)    |           |    MT6397     |
> |                 |           |               |
> |      +--------+ | (SPI bus) | +--------+    |
> |      |        | |-----------| |        |    |
> |      |  PMIC  | |-----------| |  PMIC  |    |
> |      | Wrapper| |-----------| | Wrapper|    |
> |      |        | |-----------| |        |    |
> |      +--------+ |           | +--------+    |
> |                 |           |               |
> +-----------------+           +---------------+
> 

I think we have had a similar case recently where a controller wasn't
actually using I2C, but the sofware protocol was close enough so we decided
to make it appear as i2c in Linux.

Would that work for you, i.e. register the pmic wrapper as a fake spi
master driver in drivers/spi/ and register the rtc/regulator/codec
as SPI clients from DT?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
