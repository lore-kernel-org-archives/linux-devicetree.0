From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 3/3] arm: dts: mt7623: fix card detection issue on
 bananapi-r2
Date: Thu, 14 Dec 2017 12:17:46 +0100
Message-ID: <14ba6eb7-c9a3-f78b-e0e2-c44846aa1f76@gmail.com>
References: <cover.1512628593.git.sean.wang@mediatek.com>
 <e71b755467ce9a1f8bf78e2b6cd2e1b63e8338cd.1512628593.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e71b755467ce9a1f8bf78e2b6cd2e1b63e8338cd.1512628593.git.sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 12/07/2017 07:43 AM, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> Fix that bananapi-r2 booting from SD-card would fail since incorrect
> polarity is applied to the previous setup with GPIO_ACTIVE_HIGH.
> 
> Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Fixes: 0eed8d097612 ("arm: dts: mt7623: Add SD-card and EMMC to bananapi-r2")
> Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Tested-by: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
> index 688a863..7bf5aa2 100644
> --- a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
> +++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
> @@ -204,7 +204,7 @@
>  	bus-width = <4>;
>  	max-frequency = <50000000>;
>  	cap-sd-highspeed;
> -	cd-gpios = <&pio 261 0>;
> +	cd-gpios = <&pio 261 GPIO_ACTIVE_LOW>;
>  	vmmc-supply = <&mt6323_vmch_reg>;
>  	vqmmc-supply = <&mt6323_vio18_reg>;
>  };
> 

2 and 3 pushed to v4.15-next/dts32

Thanks!
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
