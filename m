From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 2/3 v2] USB: ehci-s5p: Add support for device tree
Date: Fri, 13 Jul 2012 16:03:33 +0900
Message-ID: <001901cd60c5$9ddb9650$d992c2f0$%han@samsung.com>
References: <1342072512-29945-1-git-send-email-gautam.vivek@samsung.com>
 <1342072512-29945-3-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1342072512-29945-3-git-send-email-gautam.vivek@samsung.com>
Content-language: ko
Sender: linux-kernel-owner@vger.kernel.org
To: 'Vivek Gautam' <gautam.vivek@samsung.com>, stern@rowland.harvard.edu, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: l.majewski@samsung.com, a.kesavan@samsung.com, prashanth.g@samsung.com, kmpark@infradead.org, joshi@samsung.com, jy0922.shim@samsung.com, sshtylyov@mvista.com, olofj@google.com, 'Jingoo Han' <jg1.han@samsung.com>
List-Id: devicetree@vger.kernel.org

On Thursday, July 12, 2012 2:55 PM, Vivek Gautam wrote:
> 
> This patch adds support to parse probe data for
> ehci driver for exynos using device tree
> 
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
> 
> diff --git a/drivers/usb/host/ehci-s5p.c b/drivers/usb/host/ehci-s5p.c
> index c474cec..52d0049 100644
> --- a/drivers/usb/host/ehci-s5p.c
> +++ b/drivers/usb/host/ehci-s5p.c
> @@ -13,6 +13,7 @@
>   */
> 
>  #include <linux/clk.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <plat/ehci.h>
>  #include <plat/usb-phy.h>
> @@ -63,6 +64,8 @@ static const struct hc_driver s5p_ehci_hc_driver = {
>  	.clear_tt_buffer_complete	= ehci_clear_tt_buffer_complete,
>  };
> 
> +static u64 ehci_s5p_dma_mask = DMA_BIT_MASK(32);
> +
>  static int __devinit s5p_ehci_probe(struct platform_device *pdev)
>  {
>  	struct s5p_ehci_platdata *pdata;
> @@ -79,6 +82,16 @@ static int __devinit s5p_ehci_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
> 
> +	/*
> +	 * Right now device-tree probed devices don't get dma_mask set.
> +	 * Since shared usb code relies on it, set it here for now.
> +	 * Once we move to full device tree support this will vanish off.
> +	 */
> +	if (!pdev->dev.dma_mask)
> +		pdev->dev.dma_mask = &ehci_s5p_dma_mask;
> +	if (!pdev->dev.coherent_dma_mask)
> +		pdev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
> +
>  	s5p_ehci = kzalloc(sizeof(struct s5p_ehci_hcd), GFP_KERNEL);

This makes conflict on 'usb-next' branch.
Please re-base the patch on 'usb-next' branch.


>  	if (!s5p_ehci)
>  		return -ENOMEM;
> @@ -298,6 +311,14 @@ static int s5p_ehci_resume(struct device *dev)
>  #define s5p_ehci_resume		NULL
>  #endif
> 
> +#ifdef CONFIG_OF
> +static const struct of_device_id exynos_ehci_match[] = {
> +	{ .compatible = "samsung,exynos-ehci" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, exynos_ehci_match);
> +#endif
> +

Please move " struct of_device_id exynos_ehci_match[]"
to the next of "struct dev_pm_ops s5p_ehci_pm_ops",
as you did at 1st patch '[PATCH 1/3 v2] USB: ohci-exynos: Add support for device tree'.

Please keep the code sync as possible.

>  static const struct dev_pm_ops s5p_ehci_pm_ops = {
>  	.suspend	= s5p_ehci_suspend,
>  	.resume		= s5p_ehci_resume,
> @@ -311,6 +332,7 @@ static struct platform_driver s5p_ehci_driver = {
>  		.name	= "s5p-ehci",
>  		.owner	= THIS_MODULE,
>  		.pm	= &s5p_ehci_pm_ops,
> +		.of_match_table = of_match_ptr(exynos_ehci_match),
>  	}
>  };
> 
> --
> 1.7.0.4
