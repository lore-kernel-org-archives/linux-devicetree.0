From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCHv4 02/13] ARM: vic: device tree binding
Date: Thu, 10 Nov 2011 14:46:48 +0000
Message-ID: <20111110144648.GC16018@totoro>
References: <1320369010-23428-1-git-send-email-jamie@jamieiles.com>
 <1320369010-23428-3-git-send-email-jamie@jamieiles.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1320369010-23428-3-git-send-email-jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Cc: viresh.kumar-qxv4g6HH51o@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, hsweeten-3FF4nKcrg1dE2c76skzGb0EOCMrvLtNR@public.gmane.org, rajeev-dlh.kumar-qxv4g6HH51o@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rubini-9wsNiZum9E8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 04, 2011 at 01:09:59AM +0000, Jamie Iles wrote:
> This adds a device tree binding for the VIC based on the of_irq_init()
> support.  This adds an irqdomain to the vic and always registers all
> vics in the static vic array rather than for pm only to keep track of
> the irq domain.  struct irq_data::hwirq is used where appropriate rather
> than runtime masking.
> 
> v2:	- use irq_domain_simple_ops
> 	- remove stub implementation of vic_of_init for !CONFIG_OF
> 	- Make VIC select IRQ_DOMAIN
> 
> Reviewed-by: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Reviewed-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> Signed-off-by: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/vic.txt |   29 +++++++
>  arch/arm/common/Kconfig                       |    1 +
>  arch/arm/common/vic.c                         |  106 ++++++++++++++++++-------
>  arch/arm/include/asm/hardware/vic.h           |    7 ++-
>  4 files changed, 114 insertions(+), 29 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/vic.txt
> 
> diff --git a/arch/arm/common/vic.c b/arch/arm/common/vic.c
> index 01f18a4..e689975 100644
> --- a/arch/arm/common/vic.c
> +++ b/arch/arm/common/vic.c
> @@ -22,6 +22,10 @@
[...]
> +#ifdef CONFIG_OF
> +int __init vic_of_init(struct device_node *node, struct device_node *parent)
> +{
> +	void __iomem *regs;
> +	int irq_base;
> +
> +	if (WARN(parent, "non-root VICs are not supported"))
> +		return -EINVAL;
> +
> +	regs = of_iomap(node, 0);
> +	if (WARN_ON(!regs))
> +		return -EIO;
> +
> +	irq_base = irq_alloc_descs(-1, 0, 32, numa_node_id());
> +	if (WARN_ON(irq_base < 0))
> +		goto out_unmap;

Hmm, this appears to need linux/export.h for THIS_MODULE now.  
linux/irq.h has a comment saying it uses a macro to avoid needing an 
include of export.h there so I guess it needs to go in here instead.

Jamie
