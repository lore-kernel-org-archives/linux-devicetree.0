From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 1/9] mtd: nand: define struct nand_timings
Date: Tue, 20 May 2014 11:13:12 -0700
Message-ID: <20140520181312.GR28907@ld-irv-0074>
References: <1394647664-8258-1-git-send-email-b.brezillon.dev@gmail.com>
 <1394647664-8258-2-git-send-email-b.brezillon.dev@gmail.com>
 <20140430175157.GB2497@norris-Latitude-E6410>
 <20140508142930.GC5767@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140508142930.GC5767@lee--X1>
Sender: linux-doc-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Boris BREZILLON <b.brezillon.dev@gmail.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org, dev@linux-sunxi.org, linux-kernel@vger.kernel.org, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Rob Herring <robherring2@gmail.com>, Grant Likely <grant.likely@linaro.org>, linux-mtd@lists.infradead.org, Maxime Ripard <maxime.ripard@free-electrons.com>, David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, May 08, 2014 at 03:29:30PM +0100, Lee Jones wrote:
> > 
> > Please document the units for these fields here. It looks like you're
> > using picoseconds.
> 
> Can't we leave this open to interpretation?  For instance, it's more
> convenient for our driver to handle these as nano second values.

No, their values will be determined by the nand_base core, and we must
have something consistent for drivers to rely on. However, I don't
really have a hard preference on nanoseconds versus picoseconds. If we
see that many of the values reach low-digit nanosecons, or fractional
nanoseconds, it probably makes sense to have the higher resolution.

> > > +struct nand_sdr_timings {
...
> > > +	u32 tCS_min;
> 
> 	u32 tCSD_min;

Is this a suggested addition, Lee? I agree with Boris that this looks
like a DDR mode, which should not be covered here.

> > > +	u32 tDH_min;
> > > +	u32 tDS_min;
> > > +	u32 tFEAT_max;
> > > +	u32 tIR_min;
> > > +	u32 tITC_max;
> 
> 	u32 tR_max;

Same here, is this a suggested new field? If you need it, then we can
follow up like Boris suggested, with a different method, since tR is not
part of the electrical parameters of the timing mode.

...
> > > +};
> > > +
> > >  #endif /* __LINUX_MTD_NAND_H */

Brian
