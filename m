From: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: DT vs ARM static mappings
Date: Wed, 21 Sep 2011 10:59:37 +0100
Message-ID: <20110921095926.GA2041@arm.com>
References: <1316519479.4611.150.camel@hornet.cambridge.arm.com>
	<4E78A546.9040604@gmail.com>
	<1316535403.4611.534.camel@hornet.cambridge.arm.com>
	<201109202128.55517.arnd@arndb.de>
	<1316598109.4611.613.camel@hornet.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1316598109.4611.613.camel-okZbbLrgpR/YkXV2EHHjLW3o5bpOHsLO@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 21, 2011 at 10:41:49AM +0100, Pawel Moll wrote:
> > > 2. Single DT_MACHINE_START matching (the most generic) "arm,vexpress"
> > > and doing (rougly) this in v2m_map_io:
> > > 
> > > of_scan_flat_dt(v2m_dt_iotable_init, NULL);
> > > 
> > > v2m_dt_iotable_init(...)
> > > {
> > > 	if (depth != 0)
> > > 		return 0;
> > > 	if (of_flat_dt_is_compatible(node, "arm,vexpress-legacy"))
> > > 		iotable_init(v2m_io_desc_legacy);
> > > 	else (of_flat_dt_is_compatible(node, "arm,vexpress-rs1"))
> > > 		iotable_init(v2m_io_desc_rs1);
> > > 	else
> > > 		panic();
> > > }
> > > 
> > > Neither of them seem particularly appealing... ;-)
> > 
> > But I think both ways would be acceptable in the end. It's not a lot
> > of extra code either way. In the second case, I would probably have
> > the legacy case as a special variant of the map_io function and have
> > all others be the default instead of falling back to panic though.
> 
> Ok, I'll go (roughly) that way.
> 
> > > In my case it's sysreg and sysctl. There are two more users of static
> > > mappings: timer01 and timer23, but they could at some point do ioremap()
> > > on their own (especially with Nico's changes).
> > 
> > Well, I think with Nico's cahnges, you /can/ actually do ioremap for
> > areas that have been mapped through the iotable before kmalloc is up.
> > IIRC, omap does this for a number of peripherals.
> > 
> > It's a bit of a hack, but I think it's much better than taking hardcoded
> > addresses.
> 
> Yes, I was thinking about that last night. If you think it's acceptable
> I'll do this (killing MMIO_P2V on the way ;-)
> 
> > With the combination of the points mentioned above, you should be
> > able to do:
> > 
> > - map the entire I/O area in map_io(), depending on the board
> > - have an __iomem pointer for the sysreg
> > - populate that pointer using of_iomap from the device tree address
> >   before you first access it.
> > 
> > Do you think that would work?
> 
> Yes, I suppose so. The last bit (getting the offset from DT) will be a
> little ugly, I think, but let's wait till I get some code done.

I won't attempt to modify the rest of the patch yet, but we can roll
changes in when you've decided on a way forward.

Alternatively, the requisite changes can be done as patches on top of
the basic patch -- since the initial patch doesn't attempt to support
multiple core tiles anyway.

Cheers
---Dave
