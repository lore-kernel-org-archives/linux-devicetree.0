From: Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] ARC: [plat-axs10x]: DTS: fix sdio ciu frequency
Date: Tue, 12 Sep 2017 11:38:23 -0700
Message-ID: <4df1bb54-5fa1-5089-7d96-799ccfc78fce@synopsys.com>
References: <20170912182045.20941-1-Eugeniy.Paltsev@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170912182045.20941-1-Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexey Brodkin <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/12/2017 11:20 AM, Eugeniy Paltsev wrote:
> DW sdio controller has external ciu clock divider controlled
> via register in SDIO IP. It divides sdio_ref_clk
> (which comes from CGU) by 16 for default. So default mmcclk
> clock (which comes to sdk_in) is 25000000 Hz.
>
> So fix wrong current value (50000000 Hz) to actual 25000000 Hz.

Is this a preventive fix or there are known issues with what we have today.
Is this triggered after addition of AXS clk driver ?

>
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> ---
>   arch/arc/boot/dts/axs10x_mb.dtsi | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arc/boot/dts/axs10x_mb.dtsi b/arch/arc/boot/dts/axs10x_mb.dtsi
> index 0ff7e07..7bdf581 100644
> --- a/arch/arc/boot/dts/axs10x_mb.dtsi
> +++ b/arch/arc/boot/dts/axs10x_mb.dtsi
> @@ -44,7 +44,14 @@
>   
>   			mmcclk: mmcclk {
>   				compatible = "fixed-clock";
> -				clock-frequency = <50000000>;
> +				/*
> +				 * DW sdio controller has external ciu clock divider
> +				 * controlled via register in SDIO IP. It divides
> +				 * sdio_ref_clk (which comes from CGU) by 16 for
> +				 * default. So default mmcclk clock (which comes
> +				 * to sdk_in) is 25000000 Hz.
> +				 */
> +				clock-frequency = <25000000>;
>   				#clock-cells = <0>;
>   			};
>   

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
