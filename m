From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: Duplicated memory node in the Device-Tree (WAS [XEN] Re:
 Duplicated memory nodes cause the BUG())
Date: Tue, 25 Jul 2017 17:20:54 +0100
Message-ID: <20170725162054.GD12749@leverpostej>
References: <835d808c-9d5e-2dc0-6cf9-8fbecdc49914@epam.com>
 <6d1fb061-03b0-3b58-e70a-3c0e0777d8d7@arm.com>
 <c77f71a3-edd9-3700-001b-feee05165454@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <c77f71a3-edd9-3700-001b-feee05165454-uRwfk40T5oI@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrii Anisov <andrii_anisov-uRwfk40T5oI@public.gmane.org>
Cc: Julien Grall <julien.grall-5wv7dgnIgG8@public.gmane.org>, xen-devel <xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org>, Stefano Stabellini <sstabellini-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrew Cooper <andrew.cooper3-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Ian Jackson <ian.jackson-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org>, Wei Liu <wei.liu2-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Jan Beulich <JBeulich-IBi9RG/b67k@public.gmane.org>, Konrad Rzeszutek Wilk <konrad.wilk-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, George Dunlap <george.dunlap-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Tim Deegan <tim-LM2mM/qkH7s@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 25, 2017 at 06:27:31PM +0300, Andrii Anisov wrote:
> On 25.07.17 17:23, Julien Grall wrote:
> >I think this is by chance rather than by design. The first
> >question to answer is why a Firmware would specify twice the same
> >memory banks? Is it valid from the specification?
> Yep, that is the question.

I beleive that all memory regions described in any memory node's reg
entries should be disjoint (i.e. should not overlap). Per IEEE-1275, reg
entries (within a node) are supposed to be disjoint, and I would expect
this requirement to extend across nodes in the case of memory nodes.

Currently, the DT spec is somewhat sparse in wording, but this can be
corrected.

> >Regardless that, it looks like to me that the device-tree you give
> >to the board should not contain the memory nodes.
> The device-tree is provided by vendor in that form, and u-boot is
> theirs. It seems to me that they do not really care since the kernel
> tolerates duplication.
> 
> >> ps. Linux kernel does tolerate duplicated memory nodes by
> >>merging memory blocks. I.e. memblock_add_range() function is
> >>commented as following:
> >>/**
> >>     * memblock_add_range - add new memblock region
> >>     * @type: memblock type to add new region into
> >>     * @base: base address of the new region
> >>     * @size: size of the new region
> >>     * @nid: nid of the new region
> >>     * @flags: flags of the new region
> >>     *
> >>     * Add new memblock region [@base,@base+@size) into @type. The new
> >>region
> >>     * is allowed to overlap with existing ones - overlaps don't affect
> >>already
> >>     * existing regions.  @type is guaranteed to be minimal (all
> >>neighbouring
> >>     * compatible regions are merged) after the addition.
> >>     *
> >>     * RETURNS:
> >>     * 0 on success, -errno on failure.
> >>     */
> IMO the function description is pretty straight-forward.
> But let us wait for device tree guys feedback.

This might be the designed of *memblock*, but that does not mean that it
is a deliberate part of the DT handling. I beleive this is simply an
implementation detail that happens to mask a DT bug.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
