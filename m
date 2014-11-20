From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 2/7] mfd: MT6397: Add regmap for MT8135 and MT6397 SoC
Date: Thu, 20 Nov 2014 10:19:43 +0100
Message-ID: <20141120091943.GJ30369@pengutronix.de>
References: <1416210027-5562-1-git-send-email-flora.fu@mediatek.com>
 <1416210027-5562-3-git-send-email-flora.fu@mediatek.com>
 <20141118114645.GX24004@x1>
 <20141118134618.GF30369@pengutronix.de>
 <20141119170454.GJ1875@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141119170454.GJ1875@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Flora Fu <flora.fu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Joe.C" <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Vladimir Murzin <vladimir.murzin-5wv7dgnIgG8@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Dongdong Cheng <dongdong.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 19, 2014 at 05:04:54PM +0000, Lee Jones wrote:
> On Tue, 18 Nov 2014, Sascha Hauer wrote:
> 
> > On Tue, Nov 18, 2014 at 11:46:45AM +0000, Lee Jones wrote:
> > > On Mon, 17 Nov 2014, Flora Fu wrote:
> > > 
> > > > Add PMIC wrapper of MT8135 to access MFD MT6397.
> > > > This is regmap of MT6397 MFD.
> > > > 
> > > > Signed-off-by: Flora Fu <flora.fu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > > > ---
> > > >  drivers/mfd/Kconfig            |   8 +
> > > >  drivers/mfd/Makefile           |   1 +
> > > >  drivers/mfd/mt8135-pmic-wrap.c | 847 +++++++++++++++++++++++++++++++++++++++++
> > > 
> > > All of the PMIC functionality needs removing from MFD and placed
> > > somewhere else.  I suggest either drivers/power or drivers/regulator.
> > 
> > This is no PMIC functionality. The MT8135 has a unit which is is used to
> > access the PMIC (which is not only a PMIC, but also Touchscreen
> > interface and other stuff). This unit is called pmic-wrapper in the
> > docs. See the introductory mail for a nice picture.
> 
> I saw the picture, it's very nice.  Whatever this is, it's not an
> MFD.  It's a device which is located on an MFD.  There is far too much
> functional (the operative word here) code contained in this patch.

The MT6397 is a classical MFD device. It has a PMIC, an audio amp and a
RTC. It is very tightly coupled to the SoC via SPI, but the SPI itself
is not directly visible on the SoC. It's accessible indirectly via the
PMIC-wrapper. Indeed the PMIC-wrapper is not MFD. Another dumping ground
that comes to my mind is drivers/soc/. We could move over there.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
