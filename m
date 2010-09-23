From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 6/7] Samsung:SMDKV210: Init Uart Using Device Tree
Date: Thu, 23 Sep 2010 14:02:59 -0600
Message-ID: <20100923200259.GF17400@angua.secretlab.ca>
References: <1284978008-30837-1-git-send-email-shaju.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1284978008-30837-1-git-send-email-shaju.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shaju Abraham <shaju.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 20, 2010 at 03:50:08PM +0530, Shaju Abraham wrote:
> The SMDKV210 has 4 UARTs. Get the uart virtual address and irq numbers from
> the Device tree. Fill the  platform structure witht hese values and the serial
> driver makesuse of these parameters while initialising the uart driver.
> 
> Signed-off-by: Shaju Abraham <shaju.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  Makefile                   |    6 +-
>  arch/arm/plat-s5p/irq_dt.c |   96 +++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 98 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/plat-s5p/irq_dt.c b/arch/arm/plat-s5p/irq_dt.c
> index 317348f..e10fa42 100644
> --- a/arch/arm/plat-s5p/irq_dt.c
> +++ b/arch/arm/plat-s5p/irq_dt.c
> @@ -58,6 +58,100 @@ static struct s3c_uart_irq uart_irqs[] = {
>  	},
>  #endif
>  };
> +/*HACK..this will go once the hardware irq-> linux irq infrastructure
> +	is in place*/

Since this is a hack, I'll hold off on reviewing this one until the
virq infrastructure is sorted out.

> +int s5p_of_map_irq(int controller, int irq)
> +{
> +	switch (controller) {
> +
> +	case 0:
> +		return S5P_IRQ_VIC0(irq);
> +	break;
> +
> +	case 1:
> +		return S5P_IRQ_VIC1(irq);
> +	break;
> +
> +	case 2:
> +		return S5P_IRQ_VIC2(irq);
> +	break;
> +
> +	case 3:
> +		return S5P_IRQ_VIC3(irq);
> +	break;
> +	default:
> +		printk(KERN_ERR"No controller defined for %d irq %d controller\n",
> +			irq, controller);
> +	}
> +	return 0;
> +}
> +
> +
> +int s5p_of_get_virt_irq(struct device_node *node)
> +{
> +	const phandle *parp;
> +	struct device_node *p;
> +	int irq;
> +	const u32 *prop;
> +
> +	prop = of_get_property(node, "interrupts", NULL);
> +	if (prop == NULL) {
> +		printk(KERN_ERR"No interrupt property defined for %s\n",
> +				node->name);
> +		return -EINVAL;
> +	}
> +	irq = of_read_ulong(prop, 1);
> +	parp = of_get_property(node, "interrupt-parent", NULL);
> +	if (parp == NULL) {
> +		printk(KERN_ERR"No phandle for interrupt parent\n");
> +		return irq;
> +	} else {
> +		p = of_find_node_by_phandle(*parp);
> +		if (p == NULL) {
> +			printk(KERN_ERR"No parent for %s\n", node->name);
> +			return irq;
> +		}
> +
> +	}
> +/*handle onli VIC0~3, GPIO and External Irq logic tobe added*/
> +	if (strcmp(p->name, "vic0") == 0)
> +		return s5p_of_map_irq(0, irq);
> +
> +	if (strcmp(p->name, "vic1") == 0)
> +		return s5p_of_map_irq(1, irq);
> +
> +	if (strcmp(p->name, "vic2") == 0)
> +		return s5p_of_map_irq(2, irq);
> +
> +	if (strcmp(p->name, "vic3") == 0)
> +		return s5p_of_map_irq(3, irq);
> +
> +	return 0;
> +}
> +
> +
> +void __init s5p_dt_init_uart(void)
> +{
> +	struct device_node *node;
> +	int irq;
> +	int i = 0;
> +	const u32 *prop;
> +	u32 virt_reg = 0;
> +
> +	for_each_compatible_node(node , NULL , "samsung,s3c-uart") {
> +		prop = of_get_property(node, "virtual-reg", NULL);
> +	if (prop)
> +		virt_reg = of_read_number(prop, 1);
> +		uart_irqs[i].regs = (void __iomem __force *) virt_reg;
> +		irq = s5p_of_get_virt_irq(node);
> +		uart_irqs[i].parent_irq = irq;
> +		i++;
> +	}
> +
> +	of_node_put(node);
> +}
> +
> +
>  int s5p_dt_init_vic_timer_irq(void)
>  {
>  	struct device_node *node;
> @@ -111,5 +205,5 @@ void __init s5p_dt_init_irq(void)
>  	s5p_dt_vic_init();
>  	if (s5p_dt_init_vic_timer_irq())
>  		printk(KERN_ERR"s5p_dt Timer init Failed\n");
> -	s3c_init_uart_irqs(uart_irqs, ARRAY_SIZE(uart_irqs));
> +	s5p_dt_init_uart();
>  }
> -- 
> 1.7.2
> 
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
