From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 0/2] Revert support for reserved memory regions defined
 in device tree
Date: Thu, 17 Oct 2013 14:35:43 -0500
Message-ID: <1382038543.17841.111.camel@pasglop>
References: <1381476448-14548-1-git-send-email-m.szyprowski@samsung.com>
	 <1381477716.5630.74.camel@pasglop>
	 <CAHCPf3s63Jh6YSo2vqJ-4OwfTBGRBcQPAVzw_FK1uU3jpTK+Ow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHCPf3s63Jh6YSo2vqJ-4OwfTBGRBcQPAVzw_FK1uU3jpTK+Ow-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Sealey <neko-HhXTZounMxbZATc7fWT8Dg@public.gmane.org>
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Laura Abbott <lauraa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michal Nazarewicz <mina86-deATy8a+UHjQT0dZR+AlfA@public.gmane.org>, linaro-mm-sig-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, Marc <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Nishanth Peethambaran <nishanth.p-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2013-10-17 at 13:37 -0500, Matt Sealey wrote:

> This may be late, but please can you consider re-using the CHRP
> reserved node (i.e. device_type = "reserved")?
> 
> Since it does exactly the same thing, is well defined since the dark ages?
> 
> It's CHRP 1.7 section 5.9 by the way (just before /chosen gets defined).
> 
> It would solve a selection of the issues; and require zero binding
> work except describing perhaps a couple freakish Linux-specific
> properties that may be only as intrusive as, say, linux,initrd would
> be in /chosen.
> 
> The most effective, multi-OS way of using it ("available" property not
> currently implemented in Linux for some reason, but it could come in
> so handy - not only because it matches the way Linux resource
> structures are handled)

First, the original /reserved on CHRP was supposed to be about reserved
bus space for things like hidden HW devices, but yes, it could be used for
that. However it would be nice to enrich the binding to provide at least
some kind of specific identification of what a given reserved area is about,
see my comments about that in the previous threads.

The available property is of no use to us. It purely indicates what is
available while OFW is still running. Once we get rid of OFW its content
is utterly meaningless.

The original OFW was design with the idea that OFW remains alive along
with the operating system, and that has been done on some platforms, but
that idea has been ditched very early on in powerpc space for many
reasons, one of them being that most implementations of OFW around were
way to broken to bother.

> memory@0x70000000 {
>    device_type = "memory";
>    reg = <0x70000000 0x40000000>;
>    available = <0x70000000 0x10000000
>                      0x90000000 0x1ffc00000>; /* top 16KiB of memory
> is where the secure firmware keeps it's mailboxes */
> };

> freaky-codec-memory: reserved@0x80000000 {
>     device_type = "reserved";
>     reg = <0x80000000 0x10000000>;
>     available = <0x80000000 0x8000000
>                       0x88000000 0x8000000>; /* two 128MiB buffers */
>     non-objectionable-mark-as-contiguous-property-name-here;
>     cacheable;
> };
> 
> Any driver that has, previously, required a bunch of it's own memory
> carved out of DDR *should* be gaining a phandle reference to that
> reserved node however it likes (it would be up to that devices'
> binding).
> 
> On Linux under CMA, it may well be ignored and just stuffed into the
> generic CMA regions, and the driver MAY allocate anywhere it likes,
> but it COULD ask for memory based on a region phandle or, horribly, by
> name (since there's no other way to search for it, the OF "name" for
> reserved SHALL be "reserved") and be given memory in that region
> defined by the reserved node if it had any addressing restrictions.
> 
> /videodecoder@0x43f01000 {
>     compatible = "freaky,codec";
>     :
>     decode-buffer = &freaky-codec-memory;
> };
> 
> On another OS it may manually map and use a custom allocator for that
> memory region, since otherwise the OS would not have even looked at
> it.
> 
> Also this discussion of Jeremy Kerr's proposal seems to be 'missing'
> on Google. Do you happen to have a link to it?
> 
> Thanks,
> Matt Sealey <neko-HhXTZounMxbZATc7fWT8Dg@public.gmane.org>


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
