From: Ian Campbell <Ian.Campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] of/fdt: memblock_reserve /memreserve/ regions in the
 case of partial overlap
Date: Wed, 26 Nov 2014 13:14:30 +0000
Message-ID: <1417007670.11944.52.camel@citrix.com>
References: <1416920095-31999-1-git-send-email-ian.campbell@citrix.com>
	 <20141125143750.1BAAAC44343@trevor.secretlab.ca>
	 <CAL_JsqJV6e2oO7uJEUHzep8QAA1YztTgdaUNynKVnr_ABv+-nQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJV6e2oO7uJEUHzep8QAA1YztTgdaUNynKVnr_ABv+-nQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2014-11-25 at 13:31 -0600, Rob Herring wrote:
> On Tue, Nov 25, 2014 at 8:37 AM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > On Tue, 25 Nov 2014 12:54:55 +0000
> > , Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
> >  wrote:
> >> memblock_is_region_reserved() returns true in the case of a partial
> >> overlap, meaning that the current code fails to reserve the
> >> non-overlapping portion.
> >>
> >> I observed this causing a Midway system with a buggy fdt (the header
> >> declares itself to be larger than it really is) failing to boot
> >> because the over-inflated size of the fdt was causing it to seem to
> >> run into the swapper_pg_dir region, meaning the DT wasn't reserved.
> >> The symptoms were failing to find an disks or network and failing to
> >> boot. I think it is work printing a warning in this case.
> >>
> >> However given the ambiguity of whether things like the initrd are
> >> covered by /memreserve/ and similar I think it is best to also
> >> register the region rather than just ignoring it.
> >>
> >> Since memblock_reserve() handles overlaps just fine lets just warn and
> >> carry on.
> >>
> >> Signed-off-by: Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
> >> Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> >> ---
> >>  drivers/of/fdt.c |    3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> >> index 30e97bc..4f0f24c 100644
> >> --- a/drivers/of/fdt.c
> >> +++ b/drivers/of/fdt.c
> >> @@ -965,7 +965,8 @@ int __init __weak early_init_dt_reserve_memory_arch(phys_addr_t base,
> >>                                       phys_addr_t size, bool nomap)
> >>  {
> >>       if (memblock_is_region_reserved(base, size))
> >> -             return -EBUSY;
> >> +             pr_warning("DT reserved region at 0x%pa is already reserved\n",
> >> +                        &base);
> >
> > Since memblock_remove/reserve does the right thing anyway, let's just
> > drop the test entirely.
> 
> If the region completely overlaps, then I agree it is okay to be
> quiet. But if we have partially overlapping region already with the
> dtb, then we should warn here. We want to know if someone passes a dtb
> that is too big.

Unfortunately memblock isn't currently capable of distinguishing partial
vs total overlap.

We could perhaps warn iff only on of the first and last byte of the new
region are already reserved, but not if they both are. i.e. 
	if (memblock_is_region_reserved(base, size) && 
           !!memblock_is_region_reserved(base, 1) != !!memblock_is_region_reserved(base+size-1, 1))

That wouldn't handle 
----RESERVED---|            |----RESERVED-----
            |----- NEW REGION----|

But maybe it's better than nothing.

Or we could pull the warning up to the caller which reserves the DTB but
not for the /memreserve/ loop.

Ian.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
