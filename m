From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: mvebu: Added dts defintion for Lenovo Iomega
 ix4-300d NAS
Date: Wed, 23 Jul 2014 19:42:56 -0400
Message-ID: <20140723234256.GN23220@titan.lakedaemon.net>
References: <1406155973-13657-1-git-send-email-yahoo@perenite.com>
 <20140723232715.GL23220@titan.lakedaemon.net>
 <20140723232909.GE28485@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140723232909.GE28485-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Benoit Masson <yahoo-+V3Jd3LB6RBWk0Htik3J/w@public.gmane.org>, benoitm-+V3Jd3LB6RBWk0Htik3J/w@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, sebastian.hesselbarth-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 24, 2014 at 01:29:09AM +0200, Andrew Lunn wrote:
> > On Wed, Jul 23, 2014 at 03:52:53PM -0700, Benoit Masson wrote:
> > > The Lenovo Iomega ix4-300d is a 4-Bay sata NAS with dual Gb,
> > >  USB2.0 & 3.0, powered by a Marvell Armada XP MV78230 dual core CPU.
> > > 
> > > http://shop.lenovo.com/fr/fr/servers/network-storage/lenovoemc/ix4-300d/
> > > Signed-off-by: Benoit Masson <yahoo-+V3Jd3LB6RBWk0Htik3J/w@public.gmane.org>
> > > ---
> > >  arch/arm/boot/dts/Makefile                      |   3 +-
> > >  arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts | 284 ++++++++++++++++++++++++
> > >  2 files changed, 286 insertions(+), 1 deletion(-)
> > >  create mode 100644 arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts
> > ...
> > > diff --git a/arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts b/arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts
> > > new file mode 100644
> > > index 0000000..1f33cbc
> > > --- /dev/null
> > > +++ b/arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts
> > ...
> > > +	/* Warning: you need both eth1 & 0 PHY initialized
> > > +		(i.e having them up does the tweak)
> > > +		for poweroff to shutdown otherwise it reboots */
> > 
> > nit: multi-line comments are like this:
> > 
> > 	/*
> > 	 * Warning: you need both eth1 & 0 PHY initialized (i.e having
> > 	 * them up does the tweak) for poweroff to shutdown otherwise it
> > 	 * reboots
> > 	 */
> > 
> > If that's the only thing left, I'll fix it up when I pull it in.  No
> > need to respin just for this.
> 
> Hi Jason
> 
> We should not really leave the i2c compatibility string as it is.

Agreed.

> Hopefully the OEM moved onto B1 stepping at some point.  Although B1
> devices will work with the workaround, you get better performance
> without it.
> 
> We should wait for Gregory to look at the quirk and soc-id code.

Yep.

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
