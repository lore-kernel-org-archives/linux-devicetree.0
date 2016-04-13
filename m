From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 4/6] staging: fsl-mc: Use platform_msi_* infrastructure
Date: Wed, 13 Apr 2016 11:56:29 +0100
Message-ID: <570E25DD.9070106@arm.com>
References: <1460543456-11345-1-git-send-email-mbrugger@suse.com>
 <1460543456-11345-5-git-send-email-mbrugger@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460543456-11345-5-git-send-email-mbrugger-IBi9RG/b67k@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <mbrugger-IBi9RG/b67k@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, German.Rivera-KZfg59tc24xl57MIdRCFDg@public.gmane.org, jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org
Cc: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, stuart.yoder-3arQi8VN3Tc@public.gmane.org, jroedel-l3A5Bk7waGM@public.gmane.org, agraf-l3A5Bk7waGM@public.gmane.org, bp-l3A5Bk7waGM@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bhaktipriya96-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 13/04/16 11:30, Matthias Brugger wrote:
> From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> The fsl-mc driver can't be build as a module because it uses msi_*
> functions directly. Port the driver to use the platform_msi_*
> infrastructure instead, to allow it to be build as a module.
> 
> Signed-off-by: Matthias Brugger <mbrugger-IBi9RG/b67k@public.gmane.org>
> ---
>  .../staging/fsl-mc/bus/irq-gic-v3-its-fsl-mc-msi.c |   5 +-
>  drivers/staging/fsl-mc/bus/mc-allocator.c          |   9 +-
>  drivers/staging/fsl-mc/bus/mc-msi.c                | 169 +--------------------
>  drivers/staging/fsl-mc/include/mc-sys.h            |   3 +
>  4 files changed, 14 insertions(+), 172 deletions(-)
> 
> diff --git a/drivers/staging/fsl-mc/bus/irq-gic-v3-its-fsl-mc-msi.c b/drivers/staging/fsl-mc/bus/irq-gic-v3-its-fsl-mc-msi.c
> index 720e2b0..0eecb7e 100644
> --- a/drivers/staging/fsl-mc/bus/irq-gic-v3-its-fsl-mc-msi.c
> +++ b/drivers/staging/fsl-mc/bus/irq-gic-v3-its-fsl-mc-msi.c
> @@ -25,7 +25,6 @@ static struct irq_chip its_msi_irq_chip = {
>  	.irq_mask = irq_chip_mask_parent,
>  	.irq_unmask = irq_chip_unmask_parent,
>  	.irq_eoi = irq_chip_eoi_parent,
> -	.irq_set_affinity = msi_domain_set_affinity
>  };
>  
>  static int its_fsl_mc_msi_prepare(struct irq_domain *msi_domain,
> @@ -86,7 +85,7 @@ int __init its_fsl_mc_msi_init(void)
>  			continue;
>  		}
>  
> -		mc_msi_domain = fsl_mc_msi_create_irq_domain(
> +		mc_msi_domain = platform_msi_create_irq_domain(
>  						 of_node_to_fwnode(np),
>  						 &its_fsl_mc_msi_domain_info,
>  						 parent);

What? We are already creating a platform MSI domain for the ITS. How is
that going to work? If you want to convert this set of drivers to
platform ITS, fine. But you can't randomly hack in the ITS code and pray
for things not to fall apart.

	M.
-- 
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
