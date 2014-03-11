From: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/5] mfd: add bcm590xx pmu driver
Date: Tue, 11 Mar 2014 19:25:45 -0400
Message-ID: <20140311232545.GP25092@beef>
References: <1394552775-31264-1-git-send-email-mporter@linaro.org>
 <1394552775-31264-3-git-send-email-mporter@linaro.org>
 <20140311160837.GP21216@lee--X1>
 <20140311221938.GO25092@beef>
 <20140311224517.GA5672@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140311224517.GA5672@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 11, 2014 at 10:45:17PM +0000, Lee Jones wrote:
> > > > Add a driver for the BCM590xx PMU multi-function devices. The driver
> > > > initially supports regmap initialization and instantiation of the
> > > > voltage regulator device function of the PMU.
> > > > 
> > > > Signed-off-by: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > > > Reviewed-by: Tim Kryger <tim.kryger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > > > Reviewed-by: Markus Mayer <markus.mayer-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > > > ---
> > > >  drivers/mfd/Kconfig          |  8 ++++
> > > >  drivers/mfd/Makefile         |  1 +
> > > >  drivers/mfd/bcm590xx.c       | 93 ++++++++++++++++++++++++++++++++++++++++++++
> > > >  include/linux/mfd/bcm590xx.h | 31 +++++++++++++++
> > > >  4 files changed, 133 insertions(+)
> > > >  create mode 100644 drivers/mfd/bcm590xx.c
> > > >  create mode 100644 include/linux/mfd/bcm590xx.h
> > > 
> > > I have a tiny nit that 'ret' doesn't need to be initialised before
> > > use in probe(), but apart from that...
> > > 
> > > Looks pretty sensible:
> > >   Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > 
> > Ok, thanks. When I get back in front of my desktop I'll send a v4 of
> > just this patch to address that nit. Mark already applied the regulator
> > driver from this series, will you be taking this through your tree? For
> > that matter, I wonder if the binding would also go through your tree
> > with this driver.
> 
> At least the MFD portion and the DT binding doc will go through the
> MFD tree.
> 
> Are there any inter-patch dependencies in the set? If so, we should
> know about them so we can coordinate a sensible solution.

Yes, the regulator driver (3/5) that Mark applied is dependent on this
patch...the regulator driver includes include/linux/mfd/bcm590xx.h.

-Matt
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
