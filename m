From: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH RFC 6/7] usb: host: ehci-exynos: Remove unnecessary usb-phy
 support
Date: Mon, 18 Aug 2014 10:36:08 +0900
Message-ID: <009f01cfba84$c8ebf4f0$5ac3ded0$%han@samsung.com>
References: <1408026240-28365-1-git-send-email-gautam.vivek@samsung.com>
 <1408026240-28365-7-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1408026240-28365-7-git-send-email-gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Content-language: ko
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Vivek Gautam' <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, 'Jingoo Han' <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday, August 14, 2014 11:24 PM, Vivek Gautam wrote:
> 
> Now that we have completely moved from older USB-PHY drivers
> to newer GENERIC-PHY drivers for PHYs available with USB controllers
> on Exynos series of SoCs, we can remove the support for the same
> in our host drivers too.
> This should fix the issue on ehci-exynos, wherein in the absence of
> SAMSUNG_USB2PHY config symbol, we ended up getting the NOP_USB_XCEIV phy
> when the same is enabled. And thus the PHYs are not configured properly.
> 
> Reported-by: Sachin Kamat <sachin.kamat-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Reviewed-by: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Best regards,
Jingoo Han

> ---
>  drivers/usb/host/ehci-exynos.c |   53 ++++++----------------------------------
>  1 file changed, 8 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-exynos.c b/drivers/usb/host/ehci-exynos.c
> index cda0a2f..54944cc 100644
> --- a/drivers/usb/host/ehci-exynos.c
> +++ b/drivers/usb/host/ehci-exynos.c
> @@ -21,11 +21,8 @@
>  #include <linux/of_gpio.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
> -#include <linux/usb/phy.h>
> -#include <linux/usb/samsung_usb_phy.h>
>  #include <linux/usb.h>
>  #include <linux/usb/hcd.h>
> -#include <linux/usb/otg.h>
> 
>  #include "ehci.h"
> 
> @@ -47,9 +44,7 @@ static struct hc_driver __read_mostly exynos_ehci_hc_driver;
> 
>  struct exynos_ehci_hcd {
>  	struct clk *clk;
> -	struct usb_phy *phy;
> -	struct usb_otg *otg;
> -	struct phy *phy_g[PHY_NUMBER];
> +	struct phy *phy[PHY_NUMBER];
>  };
> 
>  #define to_exynos_ehci(hcd) (struct exynos_ehci_hcd *)(hcd_to_ehci(hcd)->priv)
> @@ -62,18 +57,6 @@ static int exynos_ehci_get_phy(struct device *dev,
>  	int phy_number;
>  	int ret = 0;
> 
> -	exynos_ehci->phy = devm_usb_get_phy(dev, USB_PHY_TYPE_USB2);
> -	if (IS_ERR(exynos_ehci->phy)) {
> -		ret = PTR_ERR(exynos_ehci->phy);
> -		if (ret != -ENXIO && ret != -ENODEV) {
> -			dev_err(dev, "no usb2 phy configured\n");
> -			return ret;
> -		}
> -		dev_dbg(dev, "Failed to get usb2 phy\n");
> -	} else {
> -		exynos_ehci->otg = exynos_ehci->phy->otg;
> -	}
> -
>  	for_each_available_child_of_node(dev->of_node, child) {
>  		ret = of_property_read_u32(child, "reg", &phy_number);
>  		if (ret) {
> @@ -98,7 +81,7 @@ static int exynos_ehci_get_phy(struct device *dev,
>  			}
>  			dev_dbg(dev, "Failed to get usb2 phy\n");
>  		}
> -		exynos_ehci->phy_g[phy_number] = phy;
> +		exynos_ehci->phy[phy_number] = phy;
>  	}
> 
>  	return ret;
> @@ -111,16 +94,13 @@ static int exynos_ehci_phy_enable(struct device *dev)
>  	int i;
>  	int ret = 0;
> 
> -	if (!IS_ERR(exynos_ehci->phy))
> -		return usb_phy_init(exynos_ehci->phy);
> -
>  	for (i = 0; ret == 0 && i < PHY_NUMBER; i++)
> -		if (!IS_ERR(exynos_ehci->phy_g[i]))
> -			ret = phy_power_on(exynos_ehci->phy_g[i]);
> +		if (!IS_ERR(exynos_ehci->phy[i]))
> +			ret = phy_power_on(exynos_ehci->phy[i]);
>  	if (ret)
>  		for (i--; i >= 0; i--)
> -			if (!IS_ERR(exynos_ehci->phy_g[i]))
> -				phy_power_off(exynos_ehci->phy_g[i]);
> +			if (!IS_ERR(exynos_ehci->phy[i]))
> +				phy_power_off(exynos_ehci->phy[i]);
> 
>  	return ret;
>  }
> @@ -131,14 +111,9 @@ static void exynos_ehci_phy_disable(struct device *dev)
>  	struct exynos_ehci_hcd *exynos_ehci = to_exynos_ehci(hcd);
>  	int i;
> 
> -	if (!IS_ERR(exynos_ehci->phy)) {
> -		usb_phy_shutdown(exynos_ehci->phy);
> -		return;
> -	}
> -
>  	for (i = 0; i < PHY_NUMBER; i++)
> -		if (!IS_ERR(exynos_ehci->phy_g[i]))
> -			phy_power_off(exynos_ehci->phy_g[i]);
> +		if (!IS_ERR(exynos_ehci->phy[i]))
> +			phy_power_off(exynos_ehci->phy[i]);
>  }
> 
>  static void exynos_setup_vbus_gpio(struct device *dev)
> @@ -231,9 +206,6 @@ skip_phy:
>  		goto fail_io;
>  	}
> 
> -	if (exynos_ehci->otg)
> -		exynos_ehci->otg->set_host(exynos_ehci->otg, &hcd->self);
> -
>  	err = exynos_ehci_phy_enable(&pdev->dev);
>  	if (err) {
>  		dev_err(&pdev->dev, "Failed to enable USB phy\n");
> @@ -273,9 +245,6 @@ static int exynos_ehci_remove(struct platform_device *pdev)
> 
>  	usb_remove_hcd(hcd);
> 
> -	if (exynos_ehci->otg)
> -		exynos_ehci->otg->set_host(exynos_ehci->otg, &hcd->self);
> -
>  	exynos_ehci_phy_disable(&pdev->dev);
> 
>  	clk_disable_unprepare(exynos_ehci->clk);
> @@ -298,9 +267,6 @@ static int exynos_ehci_suspend(struct device *dev)
>  	if (rc)
>  		return rc;
> 
> -	if (exynos_ehci->otg)
> -		exynos_ehci->otg->set_host(exynos_ehci->otg, &hcd->self);
> -
>  	exynos_ehci_phy_disable(dev);
> 
>  	clk_disable_unprepare(exynos_ehci->clk);
> @@ -316,9 +282,6 @@ static int exynos_ehci_resume(struct device *dev)
> 
>  	clk_prepare_enable(exynos_ehci->clk);
> 
> -	if (exynos_ehci->otg)
> -		exynos_ehci->otg->set_host(exynos_ehci->otg, &hcd->self);
> -
>  	ret = exynos_ehci_phy_enable(dev);
>  	if (ret) {
>  		dev_err(dev, "Failed to enable USB phy\n");
> --
> 1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
