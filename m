From: Liu Jason <Hui.Liu@freescale.com>
Subject: RE: The alignment mismatch issues between the of_reserved_mem and the
 CMA setup requirement
Date: Tue, 10 Nov 2015 03:08:09 +0000
Message-ID: <DM2PR0301MB12131BEF8C317FC929E04CE2F3140@DM2PR0301MB1213.namprd03.prod.outlook.com>
References: <DM2PR0301MB1213832E956A5414482EDD74F3150@DM2PR0301MB1213.namprd03.prod.outlook.com>
 <CAL_JsqKdXeTKSb=J09eYyGEa1MQ7bXod=jQr-pLSi11J9hM3MQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_JsqKdXeTKSb=J09eYyGEa1MQ7bXod=jQr-pLSi11J9hM3MQ@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>
Cc: "grant.likely@linaro.org" <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Rob Herring [mailto:robh+dt@kernel.org]
> Sent: Monday, November 09, 2015 10:26 PM
> To: Liu Hui-R64343
> Cc: devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; m.szyprowski@samsung.com;
> grant.likely@linaro.org
> Subject: Re: The alignment mismatch issues between the of_reserved_mem
> and the CMA setup requirement
> 
> On Mon, Nov 9, 2015 at 3:39 AM, Liu Jason <Hui.Liu@freescale.com> wrote:
> > There is an alignment mismatch issue between the of_reserved_mem and
> the CMA setup requirement.
> >
> > The alignment in
> > Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> >
> >
> > alignment (optional) - length based on parent's #size-cells
> >                         - Address boundary for alignment of allocation.
> >
> >
> > But this is not exactly match the CMA setup requirement if the
> alignment not set or set it not correctly.
> >
> > The of_reserved_mem will get the alignment from the DTS and pass it to
> > __memblock_alloc_base to do the memory block allocation. If no
> > alignment property in the DTS, the align will be SMP_CACHE_BYTES
> 
> IMO, any alignment requirement in the DTB should reflect h/w alignment
> requirements. We can't know what alignment the OS wants. So if the OS
> needs to further increase the alignment, it should adjust the alignment.
> 

Agree.

> >
> > BUT, The CMA setup require the alignment as the following in the code:
> >
> > align = PAGE_SIZE << max(MAX_ORDER - 1, pageblock_order)
> >
> > static int __init rmem_cma_setup(struct reserved_mem *rmem) {
> >         phys_addr_t align = PAGE_SIZE << max(MAX_ORDER - 1,
> pageblock_order);
> >         phys_addr_t mask = align - 1;
> >         unsigned long node = rmem->fdt_node;
> >         struct cma *cma;
> >         int err;
> >
> >         if (!of_get_flat_dt_prop(node, "reusable", NULL) ||
> >             of_get_flat_dt_prop(node, "no-map", NULL))
> >                 return -EINVAL;
> >
> >         if ((rmem->base & mask) || (rmem->size & mask)) {
> >                 pr_err("Reserved memory: incorrect alignment of CMA
> region\n");
> >                 return -EINVAL;
> >         }
> >         <snip>
> > }
> >
> > So, there is very likely that the alignment mismatch between the
> of_reserved_mem and the CMA setup requirement.
> > The sanity check in the rmem_cma_setup will fail and CMA not get set up
> in the end, this is not expected for CMA.
> >
> > In the test, there will be following err log when this mismatch happen.
> >
> > Reserved memory: incorrect alignment of CMA region.
> >
> > The following patch to fix this issue, any comments?
> >
> > ======================================================================
> > =================
> >
> > diff --git a/drivers/of/of_reserved_mem.c
> > b/drivers/of/of_reserved_mem.c index 62f467b..a20d4d3 100644
> > --- a/drivers/of/of_reserved_mem.c
> > +++ b/drivers/of/of_reserved_mem.c
> > @@ -124,6 +124,15 @@ static int __init
> __reserved_mem_alloc_size(unsigned long node,
> >                 align = dt_mem_next_cell(dt_root_addr_cells, &prop);
> >         }
> >
> > +       if (of_flat_dt_is_compatible(node,"shared-dma-pool")) {
> > +               phys_addr_t align_required = PAGE_SIZE << max(MAX_ORDER
> - 1, pageblock_order);
> > +                if (!align || align != ALIGN(align, align_required)) {
> > +                        pr_warn("Reserved memory: the alignment not
> set up correctly in '%s' node."
> > +                               "change from %pa to %pa \n", uname,
> &align, &align_required);
> > +                        align = align_required;
> > +                }
> > +        }
> 
> You simply need the max required from the DT (which could be more) or CMA,
> so this can be simplified to:
> 
> align = max(align, PAGE_SIZE << max(MAX_ORDER - 1, pageblock_order));
> 
> I don't think you should warn here either.

If don't want to give some message to tell that the alignment in the DTS specified has been
Updated, the code can be simpler as you said. 


I can submit one patch for this if there is no more comments on this. 

> 
> Rob
