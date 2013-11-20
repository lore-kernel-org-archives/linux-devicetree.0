From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 0/2] Revert support for reserved memory regions defined in device tree
Date: Wed, 20 Nov 2013 13:04:38 +0000
Message-ID: <20131120130438.3A4C5C4079D@trevor.secretlab.ca>
References: <1381476448-14548-1-git-send-email-m.szyprowski@samsung.com> < 20131030134702.19B57C402A0@trevor.secretlab.ca> <528B5949.20204@samsung.com > <20131119151418.8BB2BC4079D@trevor.secretlab.ca> <1384898504.26969.48. camel@pasglop>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384898504.26969.48.camel@pasglop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laura Abbott <lauraa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michal Nazarewicz <mina86-deATy8a+UHjQT0dZR+AlfA@public.gmane.org>, linaro-mm-sig-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, Marc <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Nishanth Peethambaran <nishanth.p-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 20 Nov 2013 09:01:44 +1100, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
> On Tue, 2013-11-19 at 15:14 +0000, Grant Likely wrote:
> > > The proposal look good for me. I'm not convinced that we really need the
> > > support for 'reg' property, as the fixed memory region is a special case
> > > of generic dynamic allocation specified by the size and alloc-ranges, but
> > > I assume that there have been already a long discussion about this, so I
> > > accept the common consensus.
> > 
> > It is absolutely necessary for some use cases. For example, a
> > framebuffer enabled by firmware and passed onto the kernel for
> > flicker-free boot. Some platforms have fixed regions that cannot be
> > moved up.
> 
> Arguably that could be covered with alloc-range and size by making the range be
> the reg property content basically (and thus size == size of range) but I
> prefer the reg property, it's a clearer statement of intent.

True, but I agree on liking 'reg'. Plus I suspect that the simplest
implementation will resolve the size+alloc-ranges property into a
generated 'reg' property during early boot so that the existing decode
APIs work on any reserved range.  :-)

g.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
