From: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RFC/PATCH v2 2/2] drivers: dma-contiguous: add initialization
 from device tree
Date: Tue, 30 Apr 2013 10:53:55 +0200
Message-ID: <517F86A3.6040104@samsung.com>
References: <1365679330-2514-1-git-send-email-m.szyprowski@samsung.com>
 <1365679330-2514-3-git-send-email-m.szyprowski@samsung.com>
 <CAO1A-8DiZoMVGcjOqK6VYP5Qito55i=gsKApQM=LGbQVx3iCwg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <CAO1A-8DiZoMVGcjOqK6VYP5Qito55i=gsKApQM=LGbQVx3iCwg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Marc C <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Nishanth Peethambaran <nishanth.p-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michal Nazarewicz <mina86-deATy8a+UHjQT0dZR+AlfA@public.gmane.org>, linaro-mm-sig-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

On 4/29/2013 11:21 PM, Marc C wrote:
> >  /**
> >   * dma_contiguous_reserve() - reserve area(s) for contiguous memory handling
> >   * @limit: End address of the reserved memory (optional, 0 for any).
> > @@ -149,6 +200,10 @@ void __init dma_contiguous_reserve(phys_addr_t limit)
> >
> >         pr_debug("%s(limit %08lx)\n", __func__, (unsigned long)limit);
> >
> > +#ifdef CONFIG_OF
> > +       of_scan_flat_dt(cma_fdt_scan, NULL);
> > +#endif
> > +
>
> What is your expectation with the contention between default region
> setup via the kernel config (CONFIG_CMA_SIZE_SEL_*) and via the DT?
> Could the call to 'of_scan_flat_dt()' be done before the setup of the
> kernel config early regions, followed by a return code check
> 'fail-over' scheme, or were you intending for the default region
> setups to be mutually-exclusive?

In the proposed patch the default/global cma region setup from device tree
had higher priority than kernel command line parameter and .config saved 
values,
but now as I think of this, it looks that it would make more sense to 
have the
following priority for setting up the default cma region:

1. kernel cmd line - if not available, then use:
2. device tree - if not available, then use:
3. kernel compiled .config

I will update this in the next version of the CMA DT patches.

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center
