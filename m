From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: mvebu: Added dts defintion for Lenovo Iomega
 ix4-300d NAS
Date: Thu, 24 Jul 2014 10:56:21 -0400
Message-ID: <20140724145621.GX23220@titan.lakedaemon.net>
References: <20140723224236.GC28485@lunn.ch>
 <94F87063-D717-435B-B7C5-EDAC9B26742C@perenite.com>
 <20140723225841.GD28485@lunn.ch>
 <10A7C530-7CD2-4ED0-889A-7FAC1922320F@perenite.com>
 <20140723231535.GK23220@titan.lakedaemon.net>
 <53D0FA2F.6050209@free-electrons.com>
 <20140724124520.GV23220@titan.lakedaemon.net>
 <C2E7C8C1-1198-4785-AB9C-C27B5E27A8D4@perenite.com>
 <20140724140757.GW23220@titan.lakedaemon.net>
 <20140724142918.GG28485@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140724142918.GG28485-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Benoit Masson <benoitm-+V3Jd3LB6RBWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Benoit Masson <yahoo-+V3Jd3LB6RBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 24, 2014 at 04:29:18PM +0200, Andrew Lunn wrote:
> > The only outstanding point (Arnd?), is that I think it's ok to have the
> > i2c...a0 compatible string in the dts files, but Andrew seems to think
> > otherwise.  Is that still true Andrew?
> 
> Hi Jason
> 
> I can live with i2c...a0 compatible string, but it has minor problems:
> 
> 1) The binding Documentation says not to do it. So we are ignoring our
>    own documentation.

This can be updated.

> 2) It seems likely that at some point the OEM will swap to B1 revision
>    SoCs. The i2c device then does not require this quirk, but we have
>    hard coded in the DT file that it is required. B1 revision would
>    work, but not optimally.

The quirk can go both ways.  eg, we can detect that we *aren't* on an A0
and need to remove the compatible string.

> So i would prefer not to explicitly enable the quirk, but determine at
> run time if the quirk is needed for the SoC revision it is running on.

I agree, but that is Linux-centric.  We need to handle it coherently in
the binding docs for *BSD, bootloaders, etc.

I suggest we update the binding to allow using the compatible string,
and advise that to avoid end-user frustration, implementations should
detect the SoC revision at runtime and either add or remove the
compatible string.

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
