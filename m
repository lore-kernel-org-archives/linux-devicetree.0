From: Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [RFC PATCH 2/5] soc/fsl/qbman: Use shared-dma-pool for QMan
 private memory allocations
Date: Sat, 01 Apr 2017 02:25:18 -0500
Message-ID: <1491031518.2944.62.camel@buserror.net>
References: <1490822037-6752-1-git-send-email-roy.pledge@nxp.com>
         <1490822037-6752-3-git-send-email-roy.pledge@nxp.com>
         <b1cd8d44-8c74-ab50-5dc9-1f978cae5bdf@arm.com>
         <871ste5dmw.fsf@concordia.ellerman.id.au>
         <dfaa1a28-66d8-15fb-7d2d-75e206161770@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <dfaa1a28-66d8-15fb-7d2d-75e206161770-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, roy.pledge-3arQi8VN3Tc@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, madalin.bucur-3arQi8VN3Tc@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 2017-03-31 at 18:55 +0100, Robin Murphy wrote:
> On 31/03/17 04:27, Michael Ellerman wrote:
> > 
> > Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org> writes:
> > 
> > > 
> > > Hi Roy,
> > > 
> > > On 29/03/17 22:13, Roy Pledge wrote:
> > > > 
> > > > Use the shared-memory-pool mechanism for frame queue descriptor and
> > > > packed frame descriptor record area allocations.
> > > Thanks for persevering with this - in my opinion it's now looking like
> > > it was worth the effort :)
> > > 
> > > AFAICS the ioremap_wc() that this leads to does appear to give back
> > > something non-cacheable on PPC (assuming "pgprot_noncached_wc" isn't
> > > horrendously misnamed), and "no-map" should rule out any cacheable
> > > linear map alias existing, so it would seem that this approach should
> > > avert Scott's concerns about attribute mismatches.
> > How does 'no-map' translate into something being excluded from the
> > linear mapping?
> Reserved regions marked with "no-map" get memblock_remove()d by
> early_init_dt_alloc_reserved_memory_arch(). As I understand things, the
> linear map should only cover memblock areas, and it would be explicitly
> violating the semantics of "no-map" to still cover such a region.

Discontiguous memory isn't supported on these PPC chips.  Everything up to
memblock_end_of_DRAM() gets mapped -- and if that were to change, the
fragmentation would waste TLB1 entries.

This also breaks compatibility with existing device trees.  I suggest putting
an ifdef in the qbman driver to add the new scheme for non-PPC arches only.

-Scott

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
