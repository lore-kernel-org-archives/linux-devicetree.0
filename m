From: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 01/21] MIPS memblock: Unpin dts memblock sanity check
 method
Date: Fri, 23 Dec 2016 00:57:21 +0300
Message-ID: <20161222215721.GA7817@mobilestation>
References: <1482113266-13207-1-git-send-email-fancer.lancer@gmail.com>
 <1482113266-13207-2-git-send-email-fancer.lancer@gmail.com>
 <CAL_JsqKNZRXzYKVFWRJraEZMvZ0Oj8CBoVFSAy+EWTi5Uavesw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqKNZRXzYKVFWRJraEZMvZ0Oj8CBoVFSAy+EWTi5Uavesw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, rabinv-VrBV9hrLPhE@public.gmane.org, matt.redfearn-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Alexander Sverdlin <alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sergey.Semin-vHJ8rsvMqnUPfZBKTuL5GA@public.gmane.org, Linux-MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 22, 2016 at 02:57:07PM -0600, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Sun, Dec 18, 2016 at 8:07 PM, Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > It's necessary to check whether retrieved from dts memory regions
> > fits to page alignment and limits restrictions. Sometimes it is
> > necessary to perform the same checks, but ito add the memory regions
> 
> s/ito/to/
> 
> > into a different subsystem. MIPS is going to be that case.
> >
> > Signed-off-by: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  drivers/of/fdt.c       | 47 +++++++++++++++++++++++---------
> >  include/linux/of_fdt.h |  1 +
> >  2 files changed, 35 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> > index 1f98156..1ee958f 100644
> > --- a/drivers/of/fdt.c
> > +++ b/drivers/of/fdt.c
> > @@ -983,44 +983,65 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
> >  #define MAX_MEMBLOCK_ADDR      ((phys_addr_t)~0)
> >  #endif
> >
> > -void __init __weak early_init_dt_add_memory_arch(u64 base, u64 size)
> > +int __init sanity_check_dt_memory(phys_addr_t *out_base,
> > +                                 phys_addr_t *out_size)
> 
> As kbuild robot found, you don't want to use phys_addr_t here.
> phys_addr_t varies with kernel config such as LPAE on ARM and the DT
> does not.
> 

Ok, thanks. I'll fix it. I figured it out when got kbuild notification.

> >  {
> > +       phys_addr_t base = *out_base, size = *out_size;
> >         const u64 phys_offset = MIN_MEMBLOCK_ADDR;
> >
> >         if (!PAGE_ALIGNED(base)) {
> >                 if (size < PAGE_SIZE - (base & ~PAGE_MASK)) {
> > -                       pr_warn("Ignoring memory block 0x%llx - 0x%llx\n",
> > +                       pr_err("Memblock 0x%llx - 0x%llx isn't page aligned\n",
> 
> These are not errors. The page alignment is an OS restriction. h/w
> (which the DT describes) generally has little concept of page size
> outside the MMUs.
> 

Ok. Understood. I'll get back the pr_warn() method call.

> Too many unrelated changes in this patch. Add the error return only
> and make anything else a separate patch (though I would just drop
> everything else).
> 

There is no much changes actually. I just unpicked the check function
and switched pr_warn's to pr_error's. Since the last thing is going to
be discarded, then it's not necessary to make any separation.

> I've not looked at the rest of the series, but why can't MIPS migrate
> to using memblock directly and using the default DT functions using
> memblock?
> 
> Rob

Of course there is a reason. Otherwise I wouldn't do it.

A lot of platforms dependent code use MIPS-specific boot_mem_map
structure. So in order to prevent a lot of code modifications MIPS
architecture code needs to support that structure as reflection of
available memory regions. For this purpose I've modified
add_memory_region() method (see patch 0003), which adds a passed
memory region to memblock and boot_mem_map simultaneously.

So in order to simplify the MIPS architecture code, I unpicked the
parameters check function from the default
early_init_dt_add_memory_arch() method, and used it in my callback
method together with MIPS-specific add_memory_region().

Another approach would be to leave the early_init_dt_add_memory_arch()
alone with no modification, and add some new MIPS-specific function,
which would be called right after, for instance, plat_mem_setup().
But in this way we can come up with some errors, since we can't be
absolutely sure, that dts memory nodes scan is performed only there.
The method early_init_dt_scan() can be called from some other places
like device_tree_init() or some place else. It can be fixed by moving
early_init_dt_scan() invocations from chip-specific code to MIPS-
architecture code. But in this case We would have to make
modification at __dt_setup_arch(), which is widely used at the
soc-specific code.

Another option would be to leave early_init_dt_add_memory_arch() alone,
but to develop MIPS-specific parameters check function, or just leave
my callback method without it. But in the first case I would duplicate
the code and in the second case it would leave a window for errors,
since it's wrong to have unaligned memory regions. It may lead to
problems with further buddy allocator initialization.

So to speak I've chosen the easiest option of ones I came up to. If
you have any better suggestion, I would gladly get rid of this patch.
The lesser code modifications the better.

-Sergey

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
