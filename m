From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: imx6sx-sdb: update TX D_CAL for USBPHY
Date: Sat, 5 Nov 2016 16:31:46 +0800
Message-ID: <20161105083145.GF5597@dragon>
References: <1477882709-2518-1-git-send-email-peter.chen@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1477882709-2518-1-git-send-email-peter.chen-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 31, 2016 at 10:58:28AM +0800, Peter Chen wrote:
> We need to change trimming value (as a percentage) of the 17.78mA TX
> reference current for better signal quality. With this change, we
> can patch the eye-diagram test on this board.

s/patch/pass?  I just want to confirm this is a typo, and can fix it up
when applying.

Shawn

> 
> Signed-off-by: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>
> ---
>  arch/arm/boot/dts/imx6sx-sdb.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6sx-sdb.dtsi b/arch/arm/boot/dts/imx6sx-sdb.dtsi
> index 85f56a5..4933c56 100644
> --- a/arch/arm/boot/dts/imx6sx-sdb.dtsi
> +++ b/arch/arm/boot/dts/imx6sx-sdb.dtsi
> @@ -317,6 +317,14 @@
>  	status = "okay";
>  };
>  
> +&usbphy1 {
> +	fsl,tx-d-cal = <106>;
> +};
> +
> +&usbphy2 {
> +	fsl,tx-d-cal = <106>;
> +};
> +
>  &usdhc2 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_usdhc2>;
> -- 
> 2.7.4
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
