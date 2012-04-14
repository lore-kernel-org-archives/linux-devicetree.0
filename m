From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 3/3] ARM: imx6q: switch to use pinctrl driver
Date: Sat, 14 Apr 2012 15:53:31 +0200
Message-ID: <20120414135331.GB3852@pengutronix.de>
References: <1334333915-1174-1-git-send-email-b29396@freescale.com>
 <1334333915-1174-3-git-send-email-b29396@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1334333915-1174-3-git-send-email-b29396@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dong Aisheng <b29396@freescale.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linus.walleij@stericsson.com, swarren@wwwdotorg.org, shawn.guo@freescale.com, kernel@pengutronix.de, grant.likely@secretlab.ca, rob.herring@calxeda.com
List-Id: devicetree@vger.kernel.org

On Sat, Apr 14, 2012 at 12:18:35AM +0800, Dong Aisheng wrote:
> From: Dong Aisheng <dong.aisheng@linaro.org>
> 
> ---
> This patch is used for test the new pinctrl driver.

Then please test it with i.MX35, i.MX5...

>  
> +	imx_data->p = pinctrl_get_select_default(&pdev->dev);
> +	if (IS_ERR(imx_data->p)) {
> +		err = PTR_ERR(imx_data->p);
> +		goto pin_err;
> +	}
> +

... which will fail here.

Sascha


-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
