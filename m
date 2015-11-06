From: Eduardo Valentin <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 9/9] arm64: dts: Enable the Thermal on R88 board
Date: Fri, 6 Nov 2015 11:16:11 -0800
Message-ID: <20151106191611.GF8202@localhost.localdomain>
References: <1446700685-18017-1-git-send-email-wxt@rock-chips.com>
 <1446700685-18017-10-git-send-email-wxt@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1446700685-18017-10-git-send-email-wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 05, 2015 at 01:18:05PM +0800, Caesar Wang wrote:
> This patch enable the TS-ADC.
> 
> When a thermal temperature is invoked use the CRU to reset the chip
> on R88 board. TSHUT is low active on this board.
> 

Acked-by: Eduardo Valentin <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

> Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> 
> ---
> 
> Changes in v2: None
> Changes in v1: None
> 
>  arch/arm64/boot/dts/rockchip/rk3368-r88.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3368-r88.dts b/arch/arm64/boot/dts/rockchip/rk3368-r88.dts
> index 401a812..7684426a 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3368-r88.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3368-r88.dts
> @@ -336,6 +336,12 @@
>  	status = "okay";
>  };
>  
> +&tsadc {
> +	rockchip,hw-tshut-mode = <0>; /* tshut mode 0:CRU 1:GPIO */
> +	rockchip,hw-tshut-polarity = <0>; /* tshut polarity 0:LOW 1:HIGH */
> +	status = "okay";
> +}
> +
>  &uart2 {
>  	status = "okay";
>  };
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
