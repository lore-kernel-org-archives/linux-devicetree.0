From: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 0/2] Revert support for reserved memory regions defined in
 device tree
Date: Tue, 19 Nov 2013 13:27:53 +0100
Message-ID: <528B5949.20204@samsung.com>
References: <1381476448-14548-1-git-send-email-m.szyprowski@samsung.com>
 <20131030134702.19B57C402A0@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20131030134702.19B57C402A0-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linaro-mm-sig-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Michal Nazarewicz <mina86-deATy8a+UHjQT0dZR+AlfA@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Laura Abbott <lauraa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Nishanth Peethambaran <nishanth.p-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marc <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Grant!

On 2013-10-30 14:47, Grant Likely wrote:
> On Fri, 11 Oct 2013 09:27:26 +0200, Marek Szyprowski<m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>  wrote:
> > Hi all!
> >
> > Benjamin Herrenschmidt pointed a few issues in the proposed design of
> > device tree bindings for contiguous memory allocator and reserved memory
> > regions:
> >https://lkml.org/lkml/2013/9/15/151
> >http://www.spinics.net/lists/arm-kernel/msg273548.html
> >
> > Some time has passed, but there is still no consensus on the bindings
> > for the reserved memory and various drawback of this solution has been
> > shown, so in my opinion the best I can do now is to revert them
> > completely and start from scratch again later.
>
> Hi Marek,
>
> At the ARM summit last week in Edinburgh, several of us sat down and
> hammered out a new proposal for handling reserved memory regions based
> on the work that you started here. Below you will find a new binding
> document. I started looking at implementing this, but haven't made much
> progress.
>
> Please take a look and let me know what you think.
>
> Also, while I'm thinking about it, I took another look at the code and I
> think the code supporting reserved regions should go directly into
> drivers/of/fdt.c and drivers/of/memory.c.  Also, the reserved regions
> parsing should be enabled unconditionally insted of filtered by (DMA_CMA
> || (HAVE_GENERIC_DMA_COHERENT && HAVE_MEMBLOCK). If the hardware
> description says to reserve a region, then the kernel must always do so,
> even if it doesn't actually use it for anything.

Thanks for discussing this item. I'm really sorry for the late reply, but
various 'more_imporant_things(tm)' have eaten me completely last weeks.

The proposal look good for me. I'm not convinced that we really need the
support for 'reg' property, as the fixed memory region is a special case
of generic dynamic allocation specified by the size and alloc-ranges, but
I assume that there have been already a long discussion about this, so I
accept the common consensus.

Grant: have you started working on the code, which implements such binding?
If not, I will try to start do it and post the code soon for review.

Best regards
-- 
Marek Szyprowski
Samsung R&D Institute Poland

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
