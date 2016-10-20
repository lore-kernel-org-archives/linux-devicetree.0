From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [RESEND PATCH v2 1/3] reset: oxnas: Add OX820 support
Date: Thu, 20 Oct 2016 12:01:20 +0200
Message-ID: <1476957680.2709.21.camel@pengutronix.de>
References: <20161005152710.2898-1-narmstrong@baylibre.com>
         <20161005152710.2898-2-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161005152710.2898-2-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: linux-oxnas-Xt5XgHjqiBU06sgRBLv0+0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, den 05.10.2016, 17:27 +0200 schrieb Neil Armstrong:
> In order to support the Oxford Semiconductor OX820 SoC, add a new
> compatible string.
> 
> Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> ---
>  drivers/reset/reset-oxnas.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/reset/reset-oxnas.c b/drivers/reset/reset-oxnas.c
> index 9449805..0d9036d 100644
> --- a/drivers/reset/reset-oxnas.c
> +++ b/drivers/reset/reset-oxnas.c
> @@ -80,6 +80,7 @@ static const struct reset_control_ops oxnas_reset_ops = {
>  
>  static const struct of_device_id oxnas_reset_dt_ids[] = {
>  	 { .compatible = "oxsemi,ox810se-reset", },
> +	 { .compatible = "oxsemi,ox820-reset", },
>  	 { /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, oxnas_reset_dt_ids);

Applied all three, thanks.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
