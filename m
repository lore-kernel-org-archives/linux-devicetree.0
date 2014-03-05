From: Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] dts: add support for MMC on socfpga boards
Date: Wed, 5 Mar 2014 10:23:48 -0600
Message-ID: <1394036628.23289.0.camel@linux-builds1>
References: <20140305162350.GA3674@pollux.denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140305162350.GA3674-E0MFdw8UecLj/ljBK/0BTg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ZY - pavel <pavel-ynQEQJNshbs@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2014-03-05 at 17:23 +0100, ZY - pavel wrote:
> Add DTS binding for MMC on socfpga boards. Tested on Sockit.
>     
> Signed-off-by: Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>
> 
> diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
> index 537f1a5..cad7526 100644
> --- a/arch/arm/boot/dts/socfpga.dtsi
> +++ b/arch/arm/boot/dts/socfpga.dtsi
> @@ -521,6 +521,23 @@
>  			reg-io-width = <4>;
>  		};
>  
> +		mmc: dwmmc0@ff704000 {
> +			compatible = "snps,dw-mshc";
> +			reg = <0xff704000 0x1000>;
> +			interrupts = <0 139 4>;
> +			clock-frequency = <12500000>; /*12.5 MHz*/
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			num-slots = <1>;
> +			supports-highspeed;
> +			broken-cd;
> +			fifo-depth = <0x400>;
> +			slot@0 {
> +				reg = <0>;
> +				bus-width = <4>;
> +			};
> +		};
> +
>  		rstmgr@ffd05000 {
>  			compatible = "altr,rst-mgr";
>  			reg = <0xffd05000 0x1000>;
> 

This is already queued in Chris Ball's MMC tree.

Thanks,
Dinh


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
