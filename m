From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v9 01/13] [media] exynos5-is: Adding media device
 driver for exynos5
Date: Tue, 12 Nov 2013 09:54:40 +0000
Message-ID: <20131112095440.GC2976@e106331-lin.cambridge.arm.com>
References: <1380279558-21651-1-git-send-email-arun.kk@samsung.com>
 <1380279558-21651-2-git-send-email-arun.kk@samsung.com>
 <20131111161213.GK21201@e106331-lin.cambridge.arm.com>
 <20131111192515.GP17929@book.gsilab.sittig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131111192515.GP17929-kDjWylLy9wD0K7fsECOQyeGNnDKD8DIp@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 11, 2013 at 07:25:51PM +0000, Gerhard Sittig wrote:
> [ reduced the CC: list to device tree people ]
> 
> On Mon, Nov 11, 2013 at 16:12 +0000, Mark Rutland wrote:
> > 
> > On Fri, Sep 27, 2013 at 11:59:06AM +0100, Arun Kumar K wrote:
> > > 
> > > +Required properties:
> > > +
> > > +- compatible           : must be "samsung,exynos5250-fimc"
> > > +- clocks               : list of clock specifiers, corresponding to entries in
> > > +                          the clock-names property
> > 
> > Minor nit: clocks are references by phandle + clock-specifier pairs, as
> > the clock-specifier is separate from the phandle to the clock. 
> 
> Out of interest, and to learn the correct terminology for future
> reference, I thought I'd ask:
> 
> Are the integer cells _the_ "specifier" which complements the
> "phandle"?  Or does the "specifier" _consist_ of a phandle _and_
> a (potentially empty) set of integer cells which all together
> uniqely specify the resource?

The integer cells constitute the specifier, complementing the phandle.

> 
> For clocks and gpios I would tend towards the latter model, it
> feels more intuitive to me.  I always felt interrupts to be the
> exception in that their parent and the integer cells are spread
> across individual properties.  Which in itself poses a
> limitation, and I've seen patches trying to bring those two parts
> of the specification together, such that members of a list of
> interrupts can reference items from different parents.

Arguably it would might make more sense to refer to the phandle +
integer cells as a whole as a specifier, but it would screw up a lot of
existing documentation.

Each of the #${x}-cells properties define the size of their respective
${x}-specifiers. If we were to declare the specifier to include the
phandle, then each #${x}-cells property would be the size of the
specifier minus one (in some cases, but not all as interrupts would
still exist). I suspect this would lead to more confusion.

All of our existing documentation and mailing lists posts wouldn't match
the new way of referring to things. I don't see any value to be had in
trying to adjust the terminology now.

If you have a suggestion for a term for the composite phandle +
specifier pair, then perhaps that would be useful.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
