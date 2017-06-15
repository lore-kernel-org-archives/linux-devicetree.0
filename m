From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] nvmem: rockchip-efuse: add support for rk322x-efuse
Date: Thu, 15 Jun 2017 17:12:15 +0200
Message-ID: <2703081.pOfGv2HUEs@phil>
References: <1494557060-105230-1-git-send-email-finley.xiao@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1494557060-105230-1-git-send-email-finley.xiao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Finley Xiao <finley.xiao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, tony.xie-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Freitag, 12. Mai 2017, 10:44:20 CEST schrieb Finley Xiao:
> This adds the necessary data for handling eFuse on the rk322x.
> 
> Signed-off-by: Finley Xiao <finley.xiao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/nvmem/rockchip-efuse.txt | 1 +
>  drivers/nvmem/rockchip-efuse.c                             | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.txt b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.txt
> index 94aeeea..194926f 100644
> --- a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.txt
> +++ b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.txt
> @@ -4,6 +4,7 @@ Required properties:
>  - compatible: Should be one of the following.
>    - "rockchip,rk3066a-efuse" - for RK3066a SoCs.
>    - "rockchip,rk3188-efuse" - for RK3188 SoCs.
> +  - "rockchip,rk322x-efuse" - for RK322x SoCs.

should be rockchip,rk3228-efuse.

While rk3228 and rk3229 are pratically the same soc, the compatible still
shouldn't contain placeholders.


Heiko

>    - "rockchip,rk3288-efuse" - for RK3288 SoCs.
>    - "rockchip,rk3399-efuse" - for RK3399 SoCs.
>  - reg: Should contain the registers location and exact eFuse size
> diff --git a/drivers/nvmem/rockchip-efuse.c b/drivers/nvmem/rockchip-efuse.c
> index 423907b..a0d4ede 100644
> --- a/drivers/nvmem/rockchip-efuse.c
> +++ b/drivers/nvmem/rockchip-efuse.c
> @@ -170,6 +170,10 @@ static const struct of_device_id rockchip_efuse_match[] = {
>  		.data = (void *)&rockchip_rk3288_efuse_read,
>  	},
>  	{
> +		.compatible = "rockchip,rk322x-efuse",
> +		.data = (void *)&rockchip_rk3288_efuse_read,
> +	},
> +	{
>  		.compatible = "rockchip,rk3288-efuse",
>  		.data = (void *)&rockchip_rk3288_efuse_read,
>  	},
> 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
