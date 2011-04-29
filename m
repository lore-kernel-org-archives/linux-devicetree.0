From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] ARM: Tegra: dt: Set up an OF IRQ translation range
Date: Fri, 29 Apr 2011 17:19:31 -0600
Message-ID: <20110429231931.GK7497@ponder.secretlab.ca>
References: <1304116293-25139-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1304116293-25139-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Apr 29, 2011 at 04:31:33PM -0600, Stephen Warren wrote:
> Without this, none of the devicetree devices in tegra-harmony.dts can
> map interrupts, and the system fails to boot.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Note: This patch is based on Grant's latest
> git://git.secretlab.ca/git/linux-2.6 devicetree/test
> plus all the Tegra fixes I recently posted to linaro-dev, which in
> particular move tegra-harmony.dts to a different location.
> 
> Question: It seems like the call to of_irq_domain_add_simple should be
> part of arch/arm/common/gic.c:gic_init(), rather than each SoC's DT board
> file having to do this. However, that'd require gic_init having an OF
> device node to pass to of_irq_domain_add_simple.

I agree.  We could add a variant of gic_init that accepts a device
node so that it can take care of setting up a simple domain.  I've
actually got a patch that I've been working on that embeds
of_irq_domain in struct gic_chip_data() so that it has direct access
to the hw context, which may end up being a cleaner overall solution.

> Question 2: Should the range of IRQ numbers cover just the IRQs directly
> managed by the GIC itself, or cover the entire range of IRQ numbers for
> the SoC? Put another way, should it include mappings for a GPIO controller
> then aggregates interrupts from N GPIOs into 1 or M GIC interrupts, or not?
> Put yet another way, should the code pass INT_MAIN_NR or NR_IRQS for Tegra?
> I suspect the former, and that child interrupt devices should themselves
> call of_irq_domain_add_simple to set up their mappings?

If you're talking about GPIOs, then probably not since you'll want
your GPIO controller described using a different node from the irq
controller.  If all of the irqs will be described using a single node,
then it makes sense to have a separate of_irq_domain registration for
each node (otherwise you have to jump through all kinds of hoops to
make it work).

>From an SoC perspective, if the chip is documented as having a single
flat irq numberspace, even if it is implemented by multiple gics, then
it makes a certain amount of sense to describe the whole irq complex
with a single node and of_irq_domain().  The flip side is that Russell
wants, and I agree, to have a common binding as must as possible for
all the different irq controllers that are out there; particularly in
light of the irq_chip_generic work that Thomas is carving out.

> 
> Question 3: I'm not sure "arm,gic" is the correct sanctioned compatible value?

I really prefer to name stuff like this after the specific
implementation, like "nvidia,tegra250-gic", with a possible
'compatible' string of the arm logic core: "arm,gic".  Also, I'd be a
lot happier if I knew more about how different versions of the gic
spec are handled, and if some of that version information could be
encoded in the compatible value.

g.

> 
>  arch/arm/boot/dts/tegra-harmony.dts |    2 ++
>  arch/arm/mach-tegra/board-dt.c      |   13 +++++++++++++
>  2 files changed, 15 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/tegra-harmony.dts b/arch/arm/boot/dts/tegra-harmony.dts
> index 6fe09d7..1972f61 100644
> --- a/arch/arm/boot/dts/tegra-harmony.dts
> +++ b/arch/arm/boot/dts/tegra-harmony.dts
> @@ -26,8 +26,10 @@
>  		ranges;
>  
>  		intc: intc {
> +			compatible = "arm,gic";
>  			interrupt-controller;
>  			#interrupt-cells = <1>;
> +			reg = <0x50041000 0x1000 0x50040100 0x100 >;
>  		};
>  	};
>  
> diff --git a/arch/arm/mach-tegra/board-dt.c b/arch/arm/mach-tegra/board-dt.c
> index aa37783..894c7a3 100644
> --- a/arch/arm/mach-tegra/board-dt.c
> +++ b/arch/arm/mach-tegra/board-dt.c
> @@ -22,7 +22,9 @@
>  #include <linux/clk.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/of.h>
> +#include <linux/of_address.h>
>  #include <linux/of_fdt.h>
> +#include <linux/of_irq.h>
>  #include <linux/of_platform.h>
>  #include <linux/pda_power.h>
>  #include <linux/io.h>
> @@ -137,8 +139,19 @@ static struct of_device_id tegra_dt_match_table[] __initdata = {
>  	{}
>  };
>  
> +struct of_device_id gic_match[] = {
> +	{ .compatible = "arm,gic", }, {}
> +};
> +
>  static void __init tegra_dt_init(void)
>  {
> +	struct device_node *node;
> +
> +	node = of_find_matching_node_by_address(NULL, gic_match,
> +						TEGRA_ARM_INT_DIST_BASE);
> +	if (node)
> +		of_irq_domain_add_simple(node, INT_GIC_BASE, INT_MAIN_NR);
> +
>  	/*
>  	 * Before registering devices; tell Linux about which device nodes
>  	 * are intended to be registered so that it doesn't create devices
> -- 
> 1.7.0.4
> 
