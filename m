From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 1/5] ARM: vexpress: Get rid of MMIO_P2V
Date: Thu, 17 Nov 2011 15:43:09 +0000
Message-ID: <20111117154308.GS9581@n2100.arm.linux.org.uk>
References: <1321036026-23411-1-git-send-email-pawel.moll@arm.com>
 <1321036026-23411-2-git-send-email-pawel.moll@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1321036026-23411-2-git-send-email-pawel.moll-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 11, 2011 at 06:27:02PM +0000, Pawel Moll wrote:
> @@ -17,3 +14,12 @@ struct amba_device name##_device = {		\
>  	.irq		= IRQ_##base,		\
>  	/* .dma		= DMA_##base,*/		\
>  }
> +
> +/* 2MB large area for motherboard's peripherals static mapping */
> +#define V2M_PERIPH 0xf8000000
> +#define V2M_PERIPH_P2V(offset) ((void __iomem *)(V2M_PERIPH | (offset)))
> +
> +/* Tile's peripherals static mappings should start here */
> +#define V2T_PERIPH 0xf8200000
> +#define V2T_PERIPH_P2V(offset) ((void __iomem *)(V2T_PERIPH | (offset)))
> +

Please get rid of these blank lines at the end of files.

> diff --git a/arch/arm/mach-vexpress/v2m.c b/arch/arm/mach-vexpress/v2m.c
> index 1fafc32..b84fa45 100644
> --- a/arch/arm/mach-vexpress/v2m.c
> +++ b/arch/arm/mach-vexpress/v2m.c
> @@ -39,29 +39,41 @@
>  
>  static struct map_desc v2m_io_desc[] __initdata = {
>  	{
> -		.virtual	= __MMIO_P2V(V2M_PA_CS7),
> +		.virtual	= V2M_PERIPH,
>  		.pfn		= __phys_to_pfn(V2M_PA_CS7),
>  		.length		= SZ_128K,
>  		.type		= MT_DEVICE,
>  	},
>  };
>  
> +static void __iomem *v2m_sysreg_base;
> +
> +
> +

More useless blank lines.

>  static void __init v2m_timer_init(void)
>  {
> +	void *sysctl_base;
> +	void *timer01_base;

Do you not use sparse?  __iomem.

> +	unsigned int timer01_irq;
>  	u32 scctrl;
>  
> +		sysctl_base = ioremap(V2M_SYSCTL, SZ_4K);
> +		BUG_ON(!sysctl_base);
> +		timer01_base = ioremap(V2M_TIMER01, SZ_4K);
> +		BUG_ON(!timer01_base);
> +		timer01_irq = IRQ_V2M_TIMER0;

What's going on with the indentation here?

> @@ -413,6 +431,10 @@ static void __init v2m_populate_ct_desc(void)
>  static void __init v2m_map_io(void)
>  {
>  	iotable_init(v2m_io_desc, ARRAY_SIZE(v2m_io_desc));
> +
> +	/* Will become an ioremap() when possible */
> +	v2m_sysreg_base = V2M_PERIPH_P2V(V2M_SYSREGS);

It won't if it stays here.
