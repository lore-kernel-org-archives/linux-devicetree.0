From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 05/11] memory: add Atmel EBI (External Bus Interface) driver
Date: Mon, 01 Dec 2014 20:43:31 +0100
Message-ID: <2476626.8iiXDzb2Te@wuerfel>
References: <1417429647-3419-1-git-send-email-boris.brezillon@free-electrons.com> <4214030.Z2iCEM6hVA@wuerfel> <20141201192923.6a85e52b@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141201192923.6a85e52b@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jean-Jacques Hiblot <jjhiblot-dLKeG7h1OhBDOHtkgc7UlQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 01 December 2014 19:29:23 Boris Brezillon wrote:
> Hi Arnd,
> 
> On Mon, 01 Dec 2014 17:26:27 +0100
> Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> 
> > On Monday 01 December 2014 11:27:21 Boris Brezillon wrote:
> > > The EBI (External Bus Interface) is used to access external peripherals
> > > (NOR, SRAM, NAND, and other specific devices like ethernet controllers).
> > > Each device is assigned a CS line and an address range and can have its
> > > own configuration (timings, access mode, bus width, ...).
> > > This driver provides a generic DT binding to configure a device according
> > > to its requirements.
> > > For specific device controllers (like the NAND one) the SMC timings
> > > should be configured by the controller driver through the matrix and
> > > smc syscon regmaps.
> > 
> > Nice!
> > 
> > > +
> > > +#define AT91_EBICSA_REGFIELD(soc)			\
> > > +	REG_FIELD(soc ## _MATRIX_EBICSA_OFF, 0,		\
> > > +		  AT91_MATRIX_EBI_NUM_CS - 1)
> > > +
> > > +#define AT91_MULTI_EBICSA_REGFIELD(soc, n)		\
> > > +	REG_FIELD(soc ## _MATRIX_EBI ## n ## CSA_OFF,	\
> > > +		  0, AT91_MATRIX_EBI_NUM_CS - 1)
> > 
> > I don't like the use macros that concatenate symbol names like
> > this. Why not do either
> > 
> > - open-code the macro contents in the few uses, to allow
> >   grepping for them, or
> 
> I'm not sure to get this one, are you suggesting to do something like
> this:
> 
> #define AT91_EBICSA_REGFIELD(off)			\
> 	REG_FIELD(ebicsa_off, AT91_MATRIX_EBI_NUM_CS - 1)
> 

That would be acceptable too, but what I really meant is one step further:

static const struct reg_field at91sam9260_ebi_csa = 
	REG_FIELD(AT91SAM9260_MATRIX_EBICSA_OFF, 0, AT91_MATRIX_EBI_NUM_CS - 1);

> > - put the register number in the syscon reference and look it
> >   up from there (this would be slightly more complicated for the
> >   second macro)
> 
> I've told several times not to encode register offsets or register ids
> in the DT :-) (and if I'm not mistaken that's what you're suggesting
> here).

I think it's actually fine for syscon references, although in general
I would agree with that. The difference in my opinion is that syscon
by nature is a set of registers.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
