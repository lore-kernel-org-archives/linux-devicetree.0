From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH] pinctrl: pinctrl-imx27.c:  Cleaning up remove a struct
 that is unused
Date: Tue, 1 Jul 2014 09:07:20 +0200
Message-ID: <20140701070720.GP14257@pengutronix.de>
References: <1403992120-8160-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1403992120-8160-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
Cc: Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Jun 28, 2014 at 11:48:40PM +0200, Rickard Strandqvist wrote:
> Removal of a struct that is never used
> 
> This was found using a static code analysis program called cppcheck
> 
> Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>

It wasn't even used on the initial commit introducing it.

Acked-by: Sascha Hauer <s.hauer@pengutronix.de>

Sascha

> ---
>  drivers/pinctrl/pinctrl-imx27.c |    6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-imx27.c b/drivers/pinctrl/pinctrl-imx27.c
> index 417c992..27ae7ce 100644
> --- a/drivers/pinctrl/pinctrl-imx27.c
> +++ b/drivers/pinctrl/pinctrl-imx27.c
> @@ -440,12 +440,6 @@ static struct of_device_id imx27_pinctrl_of_match[] = {
>  	{ /* sentinel */ }
>  };
>  
> -struct imx27_pinctrl_private {
> -	int num_gpio_childs;
> -	struct platform_device **gpio_dev;
> -	struct mxc_gpio_platform_data *gpio_pdata;
> -};
> -
>  static int imx27_pinctrl_probe(struct platform_device *pdev)
>  {
>  	return imx1_pinctrl_core_probe(pdev, &imx27_pinctrl_info);
> -- 
> 1.7.10.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
