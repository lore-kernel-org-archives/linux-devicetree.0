From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 2/3] phy: meson8b-usb2: request a shared reset line
Date: Tue, 15 Nov 2016 18:24:46 +0530
Message-ID: <582B0596.4060903@ti.com>
References: <20161001152134.8168-1-martin.blumenstingl@googlemail.com>
 <20161112131305.26088-1-martin.blumenstingl@googlemail.com>
 <20161112131305.26088-3-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161112131305.26088-3-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Saturday 12 November 2016 06:43 PM, Martin Blumenstingl wrote:
> Both PHYs are sharing one reset line. With recent improvements to the
> reset framework we can now also use reset_control_reset with shared
> resets.
> This allows us to drop some workarounds where the reset was only
> specified for one PHY but not the other, to make sure that the reset it
> only executed once (as the reset framework was not able to use
> reset_control_reset with shared reset lines).
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>

merged $patch to -next.

Thanks
Kishon
> ---
>  drivers/phy/phy-meson8b-usb2.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/phy-meson8b-usb2.c b/drivers/phy/phy-meson8b-usb2.c
> index 73bf632..f1ee96a 100644
> --- a/drivers/phy/phy-meson8b-usb2.c
> +++ b/drivers/phy/phy-meson8b-usb2.c
> @@ -237,8 +237,7 @@ static int phy_meson8b_usb2_probe(struct platform_device *pdev)
>  	if (IS_ERR(priv->clk_usb))
>  		return PTR_ERR(priv->clk_usb);
>  
> -	priv->reset = devm_reset_control_get_optional_exclusive(&pdev->dev,
> -								NULL);
> +	priv->reset = devm_reset_control_get_optional_shared(&pdev->dev, NULL);
>  	if (PTR_ERR(priv->reset) == -EPROBE_DEFER)
>  		return PTR_ERR(priv->reset);
>  
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
