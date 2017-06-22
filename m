From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] nvmem: rockchip-efuse: amend compatible rk322x-efuse to rk3228-efuse
Date: Thu, 22 Jun 2017 11:10:46 +0200
Message-ID: <48352151.OspxPMcbie@phil>
References: <1498121207-24941-1-git-send-email-frank.wang@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1498121207-24941-1-git-send-email-frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, finley.xiao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, wmc-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 22. Juni 2017, 16:46:47 CEST schrieb Frank Wang:
> As the comments from Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> that compatible
> should not contain any placeholders, this patch fix it for rk3228 SoC.
> 
> Signed-off-by: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

not sure how this slipped through in the first place, but the rk322x
compatible would only make it into 4.13, so it should still be fine to
simply correct that issue, before it hits mainline.

Reviewed-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>

> ---
>  Documentation/devicetree/bindings/nvmem/rockchip-efuse.txt | 2 +-
>  drivers/nvmem/rockchip-efuse.c                             | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.txt b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.txt
> index 194926f..1ff02afd 100644
> --- a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.txt
> +++ b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.txt
> @@ -4,7 +4,7 @@ Required properties:
>  - compatible: Should be one of the following.
>    - "rockchip,rk3066a-efuse" - for RK3066a SoCs.
>    - "rockchip,rk3188-efuse" - for RK3188 SoCs.
> -  - "rockchip,rk322x-efuse" - for RK322x SoCs.
> +  - "rockchip,rk3228-efuse" - for RK3228 SoCs.
>    - "rockchip,rk3288-efuse" - for RK3288 SoCs.
>    - "rockchip,rk3399-efuse" - for RK3399 SoCs.
>  - reg: Should contain the registers location and exact eFuse size
> diff --git a/drivers/nvmem/rockchip-efuse.c b/drivers/nvmem/rockchip-efuse.c
> index a0d4ede..63e3eb5 100644
> --- a/drivers/nvmem/rockchip-efuse.c
> +++ b/drivers/nvmem/rockchip-efuse.c
> @@ -170,7 +170,7 @@ static const struct of_device_id rockchip_efuse_match[] = {
>  		.data = (void *)&rockchip_rk3288_efuse_read,
>  	},
>  	{
> -		.compatible = "rockchip,rk322x-efuse",
> +		.compatible = "rockchip,rk3228-efuse",
>  		.data = (void *)&rockchip_rk3288_efuse_read,
>  	},
>  	{
> 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
