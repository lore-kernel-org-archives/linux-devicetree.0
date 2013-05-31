From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 5/7] USB chipidea i.MX: use devm_usb_get_phy_by_phandle
 to get phy
Date: Fri, 31 May 2013 23:23:02 +0400
Message-ID: <51A8F896.6080603@cogentembedded.com>
References: <1370025529-7414-1-git-send-email-mgr@pengutronix.de> <1370025529-7414-6-git-send-email-mgr@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370025529-7414-6-git-send-email-mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Grzeschik <mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello.

On 05/31/2013 10:38 PM, Michael Grzeschik wrote:

> From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>
> Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>   drivers/usb/chipidea/ci13xxx_imx.c | 41 ++++++++++++++++++--------------------
>   1 file changed, 19 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/usb/chipidea/ci13xxx_imx.c b/drivers/usb/chipidea/ci13xxx_imx.c
> index 4d64541..48c446b 100644
> --- a/drivers/usb/chipidea/ci13xxx_imx.c
> +++ b/drivers/usb/chipidea/ci13xxx_imx.c
[...]
> @@ -140,19 +139,21 @@ static int ci13xxx_imx_probe(struct platform_device *pdev)
[...]
> +	phy = devm_usb_get_phy_by_phandle(&pdev->dev, "fsl,usbphy", 0);
> +

     Empty line is not really needed here, don't you think?

> +	if (PTR_ERR(phy) == -EPROBE_DEFER) {

    Hm, can PTR_ERR() be called on non-error pointers? Seems so...

> +		ret = -EPROBE_DEFER;
> +		goto err_clk;
> +	}
> +
> +	if (!IS_ERR(phy)) {
> +		ret = usb_phy_init(phy);
> +		if (ret) {
> +			dev_err(&pdev->dev, "unable to init phy: %d\n", ret);
> +			goto err_clk;
>   		}
> +
> +		data->phy = phy;
>   	}

     Shouldn't this come first instead, with the above PTR_ERR() 
condition in
the *else* branch?

WBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
