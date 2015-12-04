From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 08/12] drm/etnaviv: add GPU MMU handling functionality
Date: Fri, 4 Dec 2015 14:59:53 +0000
Message-ID: <CACvgo50UW734S12xH=oszkNhgf53x5gbdeUxCdLZ0kGq1G=2Pg@mail.gmail.com>
References: <1449237604-19064-1-git-send-email-l.stach@pengutronix.de>
	<1449237604-19064-9-git-send-email-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449237604-19064-9-git-send-email-l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Lucas,

On 4 December 2015 at 14:00, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:

> --- /dev/null
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c

> +struct iommu_domain *etnaviv_iommu_v2_domain_alloc(struct etnaviv_gpu *gpu)
> +{
> +       /* TODO */
> +       return NULL;
> +}

I thought you guys removed this since there is pretty much no
implementation ? Note the duplicate function declaration in
etnaviv_iommu.h and etnaviv_iommu_v2.h.

-Emil
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
