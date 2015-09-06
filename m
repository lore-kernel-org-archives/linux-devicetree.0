From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V6 3/3] ARM: mxs: enable ocotp for i.MX23 and i.MX28
Date: Sun, 6 Sep 2015 15:55:18 +0800
Message-ID: <20150906075518.GJ30746@tiger>
References: <1439418116-1833-1-git-send-email-stefan.wahren@i2se.com>
 <1439418116-1833-4-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1439418116-1833-4-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Janusz =?utf-8?Q?U=C5=BCycki?= <j.uzycki-cjVIcFy54eMe9JSWTWOYM+658FiBabzs@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 12, 2015 at 10:21:56PM +0000, Stefan Wahren wrote:
> This patch enables On Chip OTP support for i.MX23 and i.MX28 SoCs,
> but keeps the old compatible string.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
> ---
>  arch/arm/boot/dts/imx23.dtsi |    7 +++++--
>  arch/arm/boot/dts/imx28.dtsi |    7 +++++--
>  2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx23.dtsi b/arch/arm/boot/dts/imx23.dtsi
> index b995333..0541563 100644
> --- a/arch/arm/boot/dts/imx23.dtsi
> +++ b/arch/arm/boot/dts/imx23.dtsi
> @@ -383,9 +383,12 @@
>  			};
>  
>  			ocotp@8002c000 {
> -				compatible = "fsl,ocotp";
> +				compatible = "fsl,imx23-ocotp", "fsl,ocotp";
> +				#address-cells = <1>;
> +				#size-cells = <1>;
>  				reg = <0x8002c000 0x2000>;
> -				status = "disabled";
> +				clocks = <&clks 15>;
> +				status = "okay";

For devices we want to enable by default, omitting "status" property
will just do the job.

I just dropped the line (imx28.dtsi as well) and applied the patch.

Shawn

>  			};
>  
>  			axi-ahb@8002e000 {
> diff --git a/arch/arm/boot/dts/imx28.dtsi b/arch/arm/boot/dts/imx28.dtsi
> index 4e073e8..648d790 100644
> --- a/arch/arm/boot/dts/imx28.dtsi
> +++ b/arch/arm/boot/dts/imx28.dtsi
> @@ -936,9 +936,12 @@
>  			};
>  
>  			ocotp: ocotp@8002c000 {
> -				compatible = "fsl,ocotp";
> +				compatible = "fsl,imx28-ocotp", "fsl,ocotp";
> +				#address-cells = <1>;
> +				#size-cells = <1>;
>  				reg = <0x8002c000 0x2000>;
> -				status = "disabled";
> +				clocks = <&clks 25>;
> +				status = "okay";
>  			};
>  
>  			axi-ahb@8002e000 {
> -- 
> 1.7.9.5
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
