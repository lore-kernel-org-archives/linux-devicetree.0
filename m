From: Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] ARM: zx296702-ad1: remove deprecated supports-highspeed
Date: Thu, 21 Jan 2016 18:44:03 +0900
Message-ID: <56A0A863.1010103@samsung.com>
References: <1453366905-3964-1-git-send-email-shawn.lin@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1453366905-3964-1-git-send-email-shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Jun Nie <jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi, Shaw.

On 01/21/2016 06:01 PM, Shawn Lin wrote:
> supports-highspeed property is deprecated for dw_mmc,
> this patch replace it with cap-sd-highspeed and cap-mmc-highspeed.
> 
> Cc: Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
> 
>  arch/arm/boot/dts/zx296702-ad1.dts | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/zx296702-ad1.dts b/arch/arm/boot/dts/zx296702-ad1.dts
> index 081f980..bfbcd805d 100644
> --- a/arch/arm/boot/dts/zx296702-ad1.dts
> +++ b/arch/arm/boot/dts/zx296702-ad1.dts
> @@ -19,7 +19,8 @@
>  
>  &mmc0 {
>  	num-slots = <1>;
> -	supports-highspeed;
> +	cap-sd-highspeed;
> +	cap-mmc-highspeed;
>  	non-removable;
>  	disable-wp;
>  	status = "okay";

I saw the below codes..

slot@0 {
	reg = <0>;
	bus-width = <4>;
};

Slot is also deprecated.. You can change those..

Best Regards,
Jaehoon Chung

> @@ -32,7 +33,8 @@
>  
>  &mmc1 {
>  	num-slots = <1>;
> -	supports-highspeed;
> +	cap-sd-highspeed;
> +	cap-mmc-highspeed;
>  	non-removable;
>  	disable-wp;
>  	status = "okay";
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
