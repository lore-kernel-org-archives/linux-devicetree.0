From: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/3 v3] USB: ohci-exynos: Add support for device tree
Date: Mon, 16 Jul 2012 15:38:13 +0900
Message-ID: <002701cd631d$9372fb40$ba58f1c0$%han@samsung.com>
References: <1342418138-6192-1-git-send-email-gautam.vivek@samsung.com>
 <1342418138-6192-2-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1342418138-6192-2-git-send-email-gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Content-language: ko
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Vivek Gautam' <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: l.majewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, prashanth.g-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kmpark-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org, 'Jingoo Han' <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday, July 16, 2012 2:56 PM, Vivek Gautam wrote:
> 
> This patch adds support to parse probe data for
> ohci driver for exynos using device tree.
> 
> Signed-off-by: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Acked-by: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

> 
> diff --git a/drivers/usb/host/ohci-exynos.c b/drivers/usb/host/ohci-exynos.c
> index 8bcbdb5..fc3091b 100644
> --- a/drivers/usb/host/ohci-exynos.c
> +++ b/drivers/usb/host/ohci-exynos.c
> @@ -12,6 +12,7 @@
>   */
> 
>  #include <linux/clk.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <mach/ohci.h>
>  #include <plat/usb-phy.h>
> @@ -71,6 +72,8 @@ static const struct hc_driver exynos_ohci_hc_driver = {
>  	.start_port_reset	= ohci_start_port_reset,
>  };
> 
> +static u64 ohci_exynos_dma_mask = DMA_BIT_MASK(32);
> +
>  static int __devinit exynos_ohci_probe(struct platform_device *pdev)
>  {
>  	struct exynos4_ohci_platdata *pdata;
> @@ -87,6 +90,16 @@ static int __devinit exynos_ohci_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
> 
> +	/*
> +	 * Right now device-tree probed devices don't get dma_mask set.
> +	 * Since shared usb code relies on it, set it here for now.
> +	 * Once we move to full device tree support this will vanish off.
> +	 */
> +	if (!pdev->dev.dma_mask)
> +		pdev->dev.dma_mask = &ohci_exynos_dma_mask;
> +	if (!pdev->dev.coherent_dma_mask)
> +		pdev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
> +
>  	exynos_ohci = devm_kzalloc(&pdev->dev, sizeof(struct exynos_ohci_hcd),
>  					GFP_KERNEL);
>  	if (!exynos_ohci)
> @@ -256,6 +269,14 @@ static const struct dev_pm_ops exynos_ohci_pm_ops = {
>  	.resume		= exynos_ohci_resume,
>  };
> 
> +#ifdef CONFIG_OF
> +static const struct of_device_id exynos_ohci_match[] = {
> +	{ .compatible = "samsung,exynos-ohci" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, exynos_ohci_match);
> +#endif
> +
>  static struct platform_driver exynos_ohci_driver = {
>  	.probe		= exynos_ohci_probe,
>  	.remove		= __devexit_p(exynos_ohci_remove),
> @@ -264,6 +285,7 @@ static struct platform_driver exynos_ohci_driver = {
>  		.name	= "exynos-ohci",
>  		.owner	= THIS_MODULE,
>  		.pm	= &exynos_ohci_pm_ops,
> +		.of_match_table	= of_match_ptr(exynos_ohci_match),
>  	}
>  };
> 
> --
> 1.7.0.4

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
