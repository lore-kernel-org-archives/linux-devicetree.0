From: Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: Re: [PATCH 2/2] arm64: dts: hi6220: add acpu_sctrl
Date: Tue, 15 Aug 2017 14:32:43 +0100
Message-ID: <5992F7FB.9080709@hisilicon.com>
References: <1492478242-16146-1-git-send-email-zhangfei.gao@linaro.org>
 <1492478242-16146-2-git-send-email-zhangfei.gao@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1492478242-16146-2-git-send-email-zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Li Pengcheng <lipengcheng8-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Zhangfei,

On 2017/4/18 2:17, Zhangfei Gao wrote:
> Add acpu_sctrl clock node
> 
> Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Li Pengcheng <lipengcheng8-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm64/boot/dts/hisilicon/hi6220.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
> index 470461d..710cc34 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
> @@ -262,6 +262,12 @@
>  			#clock-cells = <1>;
>  		};
>  
> +		acpu_sctrl: acpu_sctrl@f7032000 {
> +			compatible = "hisilicon,hi6220-acpu-sctrl", "syscon";
> +			reg = <0x0 0xf6504000 0x0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
>  		medianoc_ade: medianoc_ade@f4520000 {
>  			compatible = "syscon";
>  			reg = <0x0 0xf4520000 0x0 0x4000>;
> 

Thanks!
Applied to the hisilicon dt tree since the driver part is in the mainline now.

Best Regards,
Wei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
