From: Thor Thayer <tthayer-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/3] edac: altera: Add SDRAM EDAC support for
 CycloneV/ArriaV
Date: Tue, 8 Apr 2014 09:00:10 -0500
Message-ID: <1396965610.23349.7.camel@dinh-ubuntu>
References: <1396907649-20212-1-git-send-email-tthayer@altera.com>
	 <1396907649-20212-4-git-send-email-tthayer@altera.com>
	 <20140408104525.GA11876@e106331-lin.cambridge.arm.com>
	 <20140408124541.GA16054@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140408124541.GA16054-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org" <dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org" <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org" <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2014-04-08 at 14:45 +0200, Steffen Trumtrar wrote:
> On Tue, Apr 08, 2014 at 11:45:25AM +0100, Mark Rutland wrote:
> > On Mon, Apr 07, 2014 at 10:54:09PM +0100, tthayer-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org wrote:
> > > From: Thor Thayer <tthayer-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
> > > 
> > > Added EDAC support for reporting ECC errors of CycloneV
> > > and ArriaV SDRAM controller.
> > > - The SDRAM Controller registers are used by the FPGA bridge so
> > >   these are accessed through the syscon interface.
> > > - The configuration of the SDRAM memory size for the EDAC framework
> > >   is discovered from the memory node of the device tree.
> > > - Documentation of the bindings in devicetree/bindings/arm/altera/
> > >   socfpga-sdram-edac.txt
> > > - Correction of single bit errors, detection of double bit errors.
> > > 
> > > Signed-off-by: Thor Thayer <tthayer-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
> > > To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > To: Doug Thompson <dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
> > > To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > > Cc: Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
> > > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > > Cc: linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > > Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > > ---
> > >  drivers/edac/Kconfig          |    9 ++
> > >  drivers/edac/Makefile         |    2 +
> > >  drivers/edac/altera_mc_edac.c |  360 +++++++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 371 insertions(+)
> > >  create mode 100644 drivers/edac/altera_mc_edac.c
> > 
> > [...]
> > 
> > > +/* Get total memory size from Open Firmware DTB */
> > > +static u32 altr_sdram_get_total_mem_size(void)
> > > +{
> > > +       struct device_node *np;
> > > +       u32 retcode, reg_array[2];
> > > +
> > > +       np = of_find_node_by_type(NULL, "memory");
> > > +       if (!np)
> > > +               return 0;
> > > +
> > > +       retcode = of_property_read_u32_array(np, "reg",
> > > +                                            reg_array, ARRAY_SIZE(reg_array));
> > 
> > There's no requirement that #address-cells = <1> or #size-cells = <1>,
> > even if any values in either would fit into 32 bits. If we must read
> > this from the DTB rather than elsewhere, please check
> > of_n_{addr,size}_cells.
> > 
> > Additionally, it's possible that the physical memory might be described
> > over multiple reg entries, or multiple memory nodes for some arbitrary
> > reason.
> > 
> > Can we not get this info from elsewhere rather than having to parse the
> > memory node within a driver?
> > 
> 
> It should be possible to calculate this from the dramaddrw register in the
> SDRAM controller.

Thank you all for the comments. I will look into this further.

> 
> Regards,
> Steffen
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
