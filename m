From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx6qdl-sabresd: Do not place regulator nodes
 under simple-bus
Date: Wed, 12 Feb 2014 17:22:30 +0800
Message-ID: <20140212092227.GA24834@S2101-09.ap.freescale.net>
References: <1392165078-25794-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1392165078-25794-1-git-send-email-festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 11, 2014 at 10:31:18PM -0200, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> According to Documentation/devicetree/bindings/regulator/regulator.txt 
> regulator nodes should not be placed under 'simple-bus'.

I failed to read that statement from the binding doc.  Can you quote the
doc specifically on that statement?

> 
> Mark Rutland also explains about it at:
> http://www.spinics.net/lists/linux-usb/msg101497.html 
>  
> Signed-off-by: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> Shawn,
> 
> I can convert other dts files if you are fine with this approach.

I take it as an unnecessary churn, unless I see the consensus from most
of DT maintainers and arm-soc folks that we should make this change.
And see comment below ...

> 
>  arch/arm/boot/dts/imx6qdl-sabresd.dtsi | 51 ++++++++++++++--------------------
>  1 file changed, 21 insertions(+), 30 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
> index 0d816d3..d7df5b2 100644
> --- a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
> @@ -18,38 +18,29 @@
>  		reg = <0x10000000 0x40000000>;
>  	};
>  
> -	regulators {
> -		compatible = "simple-bus";
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		reg_usb_otg_vbus: regulator@0 {
> -			compatible = "regulator-fixed";
> -			reg = <0>;
> -			regulator-name = "usb_otg_vbus";
> -			regulator-min-microvolt = <5000000>;
> -			regulator-max-microvolt = <5000000>;
> -			gpio = <&gpio3 22 0>;
> -			enable-active-high;
> -		};
> +	reg_usb_otg_vbus: regulator@0 {

nodename@num should only be used for nodes that have 'reg' property.
Why are you dropping 'reg' property here?  Right, it does not compile if
you do not drop it.  You can take it as a reason of why I endorse
simple-bus regulators container.

Shawn

> +		compatible = "regulator-fixed";
> +		regulator-name = "usb_otg_vbus";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&gpio3 22 0>;
> +		enable-active-high;
> +	};
>  
> -		reg_usb_h1_vbus: regulator@1 {
> -			compatible = "regulator-fixed";
> -			reg = <1>;
> -			regulator-name = "usb_h1_vbus";
> -			regulator-min-microvolt = <5000000>;
> -			regulator-max-microvolt = <5000000>;
> -			gpio = <&gpio1 29 0>;
> -			enable-active-high;
> -		};
> +	reg_usb_h1_vbus: regulator@1 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "usb_h1_vbus";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&gpio1 29 0>;
> +		enable-active-high;
> +	};
>  
> -		reg_audio: regulator@2 {
> -			compatible = "regulator-fixed";
> -			reg = <2>;
> -			regulator-name = "wm8962-supply";
> -			gpio = <&gpio4 10 0>;
> -			enable-active-high;
> -		};
> +	reg_audio: regulator@2 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "wm8962-supply";
> +		gpio = <&gpio4 10 0>;
> +		enable-active-high;
>  	};
>  
>  	gpio-keys {
> -- 
> 1.8.1.2
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
