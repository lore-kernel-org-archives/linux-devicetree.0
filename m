From: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v9 01/13] [media] exynos5-is: Adding media device driver
 for exynos5
Date: Mon, 11 Nov 2013 20:25:51 +0100
Message-ID: <20131111192515.GP17929@book.gsilab.sittig.org>
References: <1380279558-21651-1-git-send-email-arun.kk@samsung.com>
 <1380279558-21651-2-git-send-email-arun.kk@samsung.com>
 <20131111161213.GK21201@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131111161213.GK21201-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

[ reduced the CC: list to device tree people ]

On Mon, Nov 11, 2013 at 16:12 +0000, Mark Rutland wrote:
> 
> On Fri, Sep 27, 2013 at 11:59:06AM +0100, Arun Kumar K wrote:
> > 
> > +Required properties:
> > +
> > +- compatible           : must be "samsung,exynos5250-fimc"
> > +- clocks               : list of clock specifiers, corresponding to entries in
> > +                          the clock-names property
> 
> Minor nit: clocks are references by phandle + clock-specifier pairs, as
> the clock-specifier is separate from the phandle to the clock. 

Out of interest, and to learn the correct terminology for future
reference, I thought I'd ask:

Are the integer cells _the_ "specifier" which complements the
"phandle"?  Or does the "specifier" _consist_ of a phandle _and_
a (potentially empty) set of integer cells which all together
uniqely specify the resource?

For clocks and gpios I would tend towards the latter model, it
feels more intuitive to me.  I always felt interrupts to be the
exception in that their parent and the integer cells are spread
across individual properties.  Which in itself poses a
limitation, and I've seen patches trying to bring those two parts
of the specification together, such that members of a list of
interrupts can reference items from different parents.


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office-ynQEQJNshbs@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
