From: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v5 2/2] DW DMAC: add multi-block property to device tree
Date: Fri, 25 Nov 2016 13:48:58 +0200
Message-ID: <1480074538.20074.24.camel@linux.intel.com>
References: <1479999878-19120-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
         <1479999878-19120-3-git-send-email-Eugeniy.Paltsev@synopsys.com>
         <1480002728.20074.15.camel@linux.intel.com>
         <1480003098.20074.18.camel@linux.intel.com>
         <1480074030.2534.46.camel@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1480074030.2534.46.camel-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: "vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "shiraz.linux.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <shiraz.linux.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "vireshk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <vireshk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "christian.ruppert-Yycd8EPnGM5BDgjK7y7TUQ@public.gmane.org" <christian.ruppert-Yycd8EPnGM5BDgjK7y7TUQ@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2016-11-25 at 11:40 +0000, Eugeniy Paltsev wrote:
> On Thu, 2016-11-24 at 17:58 +0200, Andy Shevchenko wrote:
> > On Thu, 2016-11-24 at 17:52 +0200, Andy Shevchenko wrote:
> > > 
> > > On Thu, 2016-11-24 at 18:04 +0300, Eugeniy Paltsev wrote:
> > > > 
> > > > Several versions of DW DMAC have multi block transfers hardware
> > > > support. Hardware support of multi block transfers is disabled
> > > > by default if we use DT to configure DMAC and software emulation
> > > > of multi block transfers used instead.
> > > > Add multi-block property, so it is possible to enable hardware
> > > > multi block transfers (if present) via DT.
> > > > 
> > > > Switch from per device is_nollp variable to multi_block array
> > > > to be able enable/disable multi block transfers separately per
> > > > channel.
> > > 
> > > Thanks for an update. Basically I'm fine with this one.
> > > 
> > > So, we still have question about autoconfiguration in SPEAr SoCs,
> > > and
> > > your ARC SoC but it's a different story. I would expect once you
> > > will
> > > clarify it.
> > > 
> > > Another one is minor listed below, otherwise
> > > 
> > > Acked-by: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> > > 
> > > > 
> > > > @@ -152,6 +154,11 @@ dw_dma_parse_dt(struct platform_device
> > > > *pdev)
> > > >  			pdata->data_width[tmp] = BIT(arr[tmp] &
> > > > 0x07);
> > > >  	}
> > > >  
> > > > +	if (!of_property_read_u32_array(np, "multi-block",
> > > > chan,
> > > > nr_channels)) {
> > > > +		for (tmp = 0; tmp < nr_channels; tmp++)
> > > > +			pdata->multi_block[tmp] = chan[tmp];
> > > 
> > > ...mb (as short of multi-block) would suit better.
> > 
> > Oh, sorry, guys, but one more important thing. If there is no such
> > property, keep a default to "supported". Otherwise you will break
> > old
> > (working) DTBs.
> 
> Should I remove explicit declaration "multi-block" property from
> existing DTS (which I added during v5 patch iteration)?
> 
> I mean that:
> ---------------------->8-----------------------
> +			multi-block = <1 1 1 1 1 1 1 1>;
> ---------------------->8-----------------------
> 
> We don't actually need it, if we use use 1 ("supported") as "multi-
> block" property default value.

My understanding is better to leave to show that the new option has been
introduced.

It would be possible to do when you confirm that your ARC platform along
with SPEAr supports auto configuration including this property.

-- 
Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Intel Finland Oy
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
