From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/8] gpio: pxa: add OF support
Date: Thu, 1 Mar 2012 09:40:36 +0000
Message-ID: <201203010940.37123.arnd@arndb.de>
References: <1330582228-12424-1-git-send-email-haojian.zhuang@marvell.com>
 <1330582228-12424-2-git-send-email-haojian.zhuang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1330582228-12424-2-git-send-email-haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Haojian Zhuang <haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Cc: eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 01 March 2012, Haojian Zhuang wrote:
> +#ifdef CONFIG_OF
> +static int __devinit pxa_gpio_probe_dt(struct platform_device *pdev,
> +                                      int *irq0, int *irq1, int *irq_mux)
> +{
> +       struct device_node *np = pdev->dev.of_node;
> +       const __be32 *irq;
> +
> +       irq = of_get_property(np, "mrvl,gpio-irq0", NULL);
> +       if (irq)
> +               *irq0 = be32_to_cpup(irq);
> +       irq = of_get_property(np, "mrvl,gpio-irq1", NULL);
> +       if (irq)
> +               *irq1 = be32_to_cpup(irq);
> +       *irq_mux = platform_get_irq(pdev, 0);
> +       return 0;
> +}
> +#else
> +static int __devinit pxa_gpio_probe_dt(struct platform_device *pdev,
> +                                      int *irq0, int *irq1, int *irq_mux)
> +{
> +       return 1;
> +}
> +#endif
> +

It seems that you are not following the regular IRQ binding. This should
probably use irq_of_parse_and_map().

For other code like the one above, I suggest you use
of_property_read_u32_array(), which will already compile to nothing
if CONFIG_OF is not set, so you don't have to provide two versions of
the fucntion.

	Arnd
