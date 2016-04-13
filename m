From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] dts/ls1043a-rdb: add the DTS for DSPI support
Date: Wed, 13 Apr 2016 09:53:13 +0800
Message-ID: <20160413015313.GC28903@tiger>
References: <1456897935-40507-1-git-send-email-B56489@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1456897935-40507-1-git-send-email-B56489-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yunhui Cui <B56489-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, yao.yuan-3arQi8VN3Tc@public.gmane.org, leoli-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 02, 2016 at 01:52:15PM +0800, Yunhui Cui wrote:
> This patch adds dts nodes for DSPI on LS1043A-RDB.
> 
> Signed-off-by: Yunhui Cui <B56489-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Signed-off-by: Yuan Yao <yao.yuan-3arQi8VN3Tc@public.gmane.org>

The patch subject prefix should be like 'arm64: dts: ls1043a-rdb: '.  I
fixed it up and applied the patch.

Shawn

> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts
> index ce23557..f895fc0 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts
> @@ -107,6 +107,19 @@
>  		};
>  };
>  
> +&dspi0 {
> +	bus-num = <0>;
> +	status = "okay";
> +
> +	flash@0 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "n25q128a13", "jedec,spi-nor";  /* 16MB */
> +		reg = <0>;
> +		spi-max-frequency = <1000000>; /* input clock */
> +	};
> +};
> +
>  &duart0 {
>  	status = "okay";
>  };
> -- 
> 2.1.0.27.g96db324
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
