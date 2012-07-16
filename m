From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH 3/3 v3] USB: ehci-s5p: Add vbus setup function to the
 s5p ehci glue layer
Date: Mon, 16 Jul 2012 10:10:02 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1207161008520.1660-100000@iolanthe.rowland.org>
References: <1342418138-6192-4-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1342418138-6192-4-git-send-email-gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, l.majewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, prashanth.g-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kmpark-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 16 Jul 2012, Vivek Gautam wrote:

> This patch retrieves and configures the vbus control gpio via
> the device tree. The suspend/resume callbacks will be later
> modified for vbus control.
> 
> Signed-off-by: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> 
> diff --git a/drivers/usb/host/ehci-s5p.c b/drivers/usb/host/ehci-s5p.c
> index 37d84cf..4037878 100644
> --- a/drivers/usb/host/ehci-s5p.c
> +++ b/drivers/usb/host/ehci-s5p.c
> @@ -15,6 +15,7 @@
>  #include <linux/clk.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/of_gpio.h>
>  #include <plat/ehci.h>
>  #include <plat/usb-phy.h>
>  
> @@ -64,6 +65,28 @@ static const struct hc_driver s5p_ehci_hc_driver = {
>  	.clear_tt_buffer_complete	= ehci_clear_tt_buffer_complete,
>  };
>  
> +static int s5p_ehci_setup_gpio(struct platform_device *pdev)
> +{
> +	int err;
> +	int gpio;
> +
> +	if (!pdev->dev.of_node)
> +		return 0;
> +
> +	gpio = of_get_named_gpio(pdev->dev.of_node,
> +			"samsung,vbus-gpio", 0);
> +	if (!gpio_is_valid(gpio))
> +		return 0;
> +
> +	err = gpio_request_one(gpio, GPIOF_OUT_INIT_HIGH, "ehci_vbus_gpio");
> +	if (err) {
> +		dev_err(&pdev->dev, "can't request ehci vbus gpio %d", gpio);
> +		return err;

This "return" statement is unnecessary.

> +	}
> +
> +	return err;
> +}
> +
>  static u64 ehci_s5p_dma_mask = DMA_BIT_MASK(32);
>  
>  static int __devinit s5p_ehci_probe(struct platform_device *pdev)
> @@ -92,6 +115,8 @@ static int __devinit s5p_ehci_probe(struct platform_device *pdev)
>  	if (!pdev->dev.coherent_dma_mask)
>  		pdev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
>  
> +	s5p_ehci_setup_gpio(pdev);

Why does the function return an error code if that error code is just 
going to be ignored?

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
