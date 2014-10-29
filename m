From: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: socfpga: Add driver for the L3 interconnect
Date: Wed, 29 Oct 2014 21:51:03 +0100
Message-ID: <20141029205103.GF10262@pengutronix.de>
References: <1414582436-12772-1-git-send-email-s.trumtrar@pengutronix.de>
 <alpine.DEB.2.02.1410291521290.29374@atx-linux-37>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1410291521290.29374@atx-linux-37>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: atull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Cc: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi!

On Wed, Oct 29, 2014 at 03:30:10PM -0500, atull wrote:
> On Wed, 29 Oct 2014, Steffen Trumtrar wrote:
> 
> > The L3 interconnect provides Global Programmer View (GPV) registers for every
> > AXI master and slave on the SoC.
> > Although this is just a bunch of bits, syscon is not the right approach for
> > this IP core.
> > The L3 interconnect is configured with a lot of reserved "holes" in its memory
> > space. Just mapping this with regmap, what syscon would do, would lead to the
> > system completely hanging, if one of those areas would be touched.
> > One example for when this might happen is the regmap registers dump in the
> > debugfs.
> > 
> > This driver specifies also the valid readable and writable ranges of the L3
> > interconnect. Other drivers that want to access their GPV registers can do
> > so with this driver via socfpga_l3nic_regmap_by_phandle.
> > 
> > Signed-off-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > ---
> >  .../bindings/soc/socfpga/altr,l3-nic.txt           |  15 ++
> >  drivers/soc/Kconfig                                |   1 +
> >  drivers/soc/Makefile                               |   1 +
> >  drivers/soc/socfpga/Kconfig                        |  11 +
> >  drivers/soc/socfpga/Makefile                       |   1 +
> >  drivers/soc/socfpga/l3nic.c                        | 221 +++++++++++++++++++++
> >  include/soc/socfpga/gpv.h                          |  63 ++++++
> >  include/soc/socfpga/l3regs.h                       | 194 ++++++++++++++++++
> >  8 files changed, 507 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/socfpga/altr,l3-nic.txt
> >  create mode 100644 drivers/soc/socfpga/Kconfig
> >  create mode 100644 drivers/soc/socfpga/Makefile
> >  create mode 100644 drivers/soc/socfpga/l3nic.c
> >  create mode 100644 include/soc/socfpga/gpv.h
> >  create mode 100644 include/soc/socfpga/l3regs.h
> > 
> 
> Hi Steffen,
> 
> This looks really nice and useful.
> 
> I tried it out with my bridge driver and at least with my superficial
> testing it looked good.
> 

\o/

Thanks for testing.

> > +
> > +int socfpga_l3nic_regmap_by_phandle(struct device_node *np,
> > +				    struct regmap **regmap,
> > +				    const char *name)
> > +{
> 
> This could return the regmap or ERR_PTR(-ENODEV) and just
> have the np and name parameter, similar to 
> syscon_regmap_lookup_by_phandle.
>

I wanted to do that, but I also want to propagate the return
value of socfpga_gpv_device_by_phandle and this doesn't
seem to work than. Open for suggestions, though.

Regards,
Steffen

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
