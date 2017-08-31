From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] of: Restrict DMA configuration
Date: Thu, 31 Aug 2017 15:04:45 -0500
Message-ID: <CAL_JsqKC6w_RH6bu3=he28NJn74JO_XLxQPfRLg15k9eSWsiuQ@mail.gmail.com>
References: <5fc6930c9645c934de2586179ca3f80a055689cb.1504175330.git.robin.murphy@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5fc6930c9645c934de2586179ca3f80a055689cb.1504175330.git.robin.murphy-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Cc: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 31, 2017 at 5:32 AM, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org> wrote:
> Moving DMA configuration to happen later at driver probe time had the
> unnoticed side-effect that we now perform DMA configuration for *every*
> device represented in DT, rather than only those explicitly created by
> the of_platform and PCI code.
>
> As Christoph points out, this is not really the best thing to do. Whilst
> there may well be other DMA-capable buses that can benefit from having
> their children automatically configured after the bridge has probed,
> there are also plenty of others like USB, MDIO, etc. that definitely do
> not support DMA and should not be indiscriminately processed.
>
> The good news is that in most cases the DT "dma-ranges" property serves
> as an appropriate indicator - per a strict interpretation of the spec,
> anything lacking a "dma-ranges" property should be considered not to
> have a mapping of DMA address space from its children to its parent,
> thus anything for which of_dma_get_range() does not succeed does not
> need DMA configuration. Certain bus types have a general expectation of
> DMA capability and carry a well-established precedent that an absent
> "dma-ranges" implies the same as the empty property, so we automatically
> opt those in to DMA configuration regardless, to avoid regressing most
> existing platforms.
>
> Fixes: 09515ef5ddad ("of/acpi: Configure dma operations at probe time for platform/amba/pci bus devices")
> Reported-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
> Signed-off-by: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
> ---
>
> v2: Updated commit message to be more reasonable
>
>  drivers/of/device.c | 48 ++++++++++++++++++++++++++++++++----------------
>  1 file changed, 32 insertions(+), 16 deletions(-)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
