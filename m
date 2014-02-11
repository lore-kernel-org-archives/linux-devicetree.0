From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/5] drivers: of: add initialization code for reserved memory
Date: Tue, 11 Feb 2014 19:01:04 +0000
Message-ID: <20140211190104.7E6C5C4140E@trevor.secretlab.ca>
References: <1391515773-6112-1-git-send-email-m.szyprowski@samsung.com> < 1391515773-6112-2-git-send-email-m.szyprowski@samsung.com> <20140205110538. 99E47C40A89@trevor.secretlab.ca> <52FA0D6E.9090304@samsung.com> < 20140211121316.24032C40C4D@trevor.secretlab.ca> <52FA33E2.4050004@samsung. com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52FA33E2.4050004-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linaro-mm-sig-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Michal Nazarewicz <mina86-deATy8a+UHjQT0dZR+AlfA@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Laura Abbott <lauraa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Nishanth Peethambaran <nishanth.p-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marc <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 11 Feb 2014 15:29:54 +0100, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> > Yes, if only because it is an define usage of the reg property. If a
> > devtree has multiple tuples in reg, then all of those tuples should be
> > treated as reserved, even if the kernel doesn't know how to use them.
> >
> > I would not do the same for size/align/alloc-ranges unless there is a
> > very specific use case that you can define. These ones are different
> > from the static regions because they aren't ever used to protect
> > something that already exists in the memory.
> 
> Is there a reason why multiple regions could not be used for this 
> purpose, instead of adding extra complexity of having multiple reg 
> entries per region?
> 
> I.e. I don't see a difference between
> 
> reg1: region@00000000 {
> 	reg = <0x00000000 0x1000>;
> };
> 
> reg2: region@10000000 {
> 	reg = <0x10000000 0x1000>;
> };
> 
> user {
> 	regions = <&reg1>, <&reg2>;
> };
> 
> and
> 
> reg: region@00000000 {
> 	reg = <0x00000000 0x1000>, <0x10000000 0x1000>;
> };
> 
> user {
> 	regions = <&reg>;
> };
> 
> except that the former IMHO better suits the definition of memory 
> region, which I see as a single contiguous range of memory and can be 
> simplified to have a single reg entry per region.

My point is rather if multiple reg tuples are found in a reserved memory
node, the kernel must respect them and reserve the memory. I'm not
arguing about whether or not that makes for a good binding.

g.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
