From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: sun7i: dt: Add pll3 and pll7 clocks
Date: Wed, 4 May 2016 20:32:55 +0200
Message-ID: <20160504183255.GD17159@lukather>
References: <1462295659-6945-1-git-send-email-plaes@plaes.org>
 <1462295659-6945-3-git-send-email-plaes@plaes.org>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yKpjvgUFh4AHjl21"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBYUAVG4QKGQENNXCX2Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1462295659-6945-3-git-send-email-plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--yKpjvgUFh4AHjl21
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Tue, May 03, 2016 at 08:14:19PM +0300, Priit Laes wrote:
> Enable pll3 and pll7 clocks that are needed by display clocks.

Missing signed-off-by

> ---
>  arch/arm/boot/dts/sun7i-a20.dtsi | 41 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
> index bf5d056..2688512 100644
> --- a/arch/arm/boot/dts/sun7i-a20.dtsi
> +++ b/arch/arm/boot/dts/sun7i-a20.dtsi
> @@ -187,6 +187,15 @@
>  			clock-output-names = "osc24M";
>  		};
>  
> +		osc3M: osc3M_clk {
> +			#clock-cells = <0>;
> +			compatible = "fixed-factor-clock";
> +			clock-div = <8>;
> +			clock-mult = <1>;
> +			clocks = <&osc24M>;
> +			clock-output-names = "osc3M";
> +		};
> +
>  		osc32k: clk@0 {
>  			#clock-cells = <0>;
>  			compatible = "fixed-clock";
> @@ -211,6 +220,22 @@
>  					     "pll2-4x", "pll2-8x";
>  		};
>  
> +		pll3: clk@01c20010 {
> +			#clock-cells = <0>;
> +			compatible = "allwinner,sun4i-a10-pll3-clk";
> +			reg = <0x01c20010 0x4>;
> +			clock = <&osc3M>;
> +			clock-output-names = "pll3";
> +};

The indentation is off.

> +
> +		pll3x2: pll3x2_clk {
> +			#clock-cells = <0>;
> +			compatible = "fixed-factor-clock";
> +			clock-div = <1>;
> +			clock-mult = <2>;
> +			clock-output-names = "pll3-2x";
> +		};
> +
>  		pll4: clk@01c20018 {
>  			#clock-cells = <0>;
>  			compatible = "allwinner,sun7i-a20-pll4-clk";
> @@ -236,6 +261,22 @@
>  					     "pll6_div_4";
>  		};
>  
> +		pll7: clk@01c20030 {
> +			#clock-cells = <0>;
> +			compatible = "allwinner,sun4i-a10-pll3-clk";
> +			reg = <0x01c20030 0x4>;
> +			clock = <&osc3M>;
> +			clock-output-names = "pll7";
> +};

Ditto.

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--yKpjvgUFh4AHjl21--
