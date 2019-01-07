From: Bin Liu <b-liu@ti.com>
Subject: Re: [PATCH 2/4] usb: musb: jz4740: Add support for devicetree
Date: Mon, 7 Jan 2019 13:47:25 -0600
Message-ID: <20190107194725.GB25910@uda0271908>
References: <20181213144555.24031-1-paul@crapouillou.net>
 <20181213144555.24031-2-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181213144555.24031-2-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, od@zcrc.me
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Dec 13, 2018 at 03:45:53PM +0100, Paul Cercueil wrote:
> Add support for probing the driver from devicetree.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/usb/musb/jz4740.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/musb/jz4740.c b/drivers/usb/musb/jz4740.c
> index 04d8b2bc205a..9a2cebcac260 100644
> --- a/drivers/usb/musb/jz4740.c
> +++ b/drivers/usb/musb/jz4740.c
> @@ -10,6 +10,7 @@
>  #include <linux/errno.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/usb/usb_phy_generic.h>
>  
> @@ -188,11 +189,17 @@ static int jz4740_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static const struct of_device_id jz4740_musb_of_match[] = {
> +	{ .compatible = "ingenic,jz4740-musb" },
> +	{},
> +};

should be wrapped by '#ifdef CONFIG_OF'?

miss MODULE_DEVICE_TABLE()

> +
>  static struct platform_driver jz4740_driver = {
>  	.probe		= jz4740_probe,
>  	.remove		= jz4740_remove,
>  	.driver		= {
>  		.name	= "musb-jz4740",
> +		.of_match_table = of_match_ptr(jz4740_musb_of_match),
>  	},
>  };
>  

Regards,
-Bin.
