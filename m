From: Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: ux500: Enable GPIO regulator for SD-card for
 HREF boards
Date: Mon, 20 Apr 2015 19:27:30 +0100
Message-ID: <20150420182730.GI3447@x1>
References: <1429538553-17366-1-git-send-email-ulf.hansson@linaro.org>
 <1429538553-17366-3-git-send-email-ulf.hansson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1429538553-17366-3-git-send-email-ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 20 Apr 2015, Ulf Hansson wrote:

> Fixes: c94a4ab7af3f ("ARM: ux500: Disable the MMCI gpio-regulator by default")
> Signed-off-by: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm/boot/dts/ste-href.dtsi | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/ste-href.dtsi b/arch/arm/boot/dts/ste-href.dtsi
> index 8cf499a..744c1e3 100644
> --- a/arch/arm/boot/dts/ste-href.dtsi
> +++ b/arch/arm/boot/dts/ste-href.dtsi
> @@ -124,8 +124,6 @@
>  
>  			states = <1800000 0x1
>  				  2900000 0x0>;
> -
> -			status = "disabled";
>  		};

Seems weird to do this in a separate patch.

>  		// External Micro SD slot
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
