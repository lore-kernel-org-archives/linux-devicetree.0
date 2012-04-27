From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/9] ARM: mmp: fix build issue on mmp with device tree
Date: Fri, 27 Apr 2012 20:15:49 +0000
Message-ID: <201204272015.49611.arnd@arndb.de>
References: <1335515957-1798-1-git-send-email-haojian.zhuang@gmail.com>
 <1335515957-1798-2-git-send-email-haojian.zhuang@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1335515957-1798-2-git-send-email-haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 27 April 2012, Haojian Zhuang wrote:
> Since irq_domain_add_simple() is removed, remove it in mmp-dt.c also.
> 
> Signed-off-by: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

This should also be fixed for v3.4, right?


> diff --git a/arch/arm/mach-mmp/mmp-dt.c b/arch/arm/mach-mmp/mmp-dt.c
> index 6707539..ca22e3c0 100644
> --- a/arch/arm/mach-mmp/mmp-dt.c
> +++ b/arch/arm/mach-mmp/mmp-dt.c
> @@ -32,31 +32,9 @@ static const struct of_dev_auxdata mmp_auxdata_lookup[] __initconst = {
>         {}
>  };
>  
> -static int __init mmp_intc_add_irq_domain(struct device_node *np,
> -                                          struct device_node *parent)
> -{
> -       irq_domain_add_simple(np, 0);
> -       return 0;
> -}
> -
> -static int __init mmp_gpio_add_irq_domain(struct device_node *np,
> -                                          struct device_node *parent)
> -{
> -       irq_domain_add_simple(np, IRQ_GPIO_START);
> -       return 0;
> -}
> -
> -static const struct of_device_id mmp_irq_match[] __initconst = {
> -       { .compatible = "mrvl,mmp-intc", .data = mmp_intc_add_irq_domain, },
> -       { .compatible = "mrvl,mmp-gpio", .data = mmp_gpio_add_irq_domain, },
> -       {}
> -};
> -
>  static void __init mmp_dt_init(void)
>  {
>  
> -       of_irq_init(mmp_irq_match);
> -
>         of_platform_populate(NULL, of_default_bus_match_table,
>                              mmp_auxdata_lookup, NULL);
>  }

Shouldn't you be calling irq_domain_add_legacy now?

	Arnd
