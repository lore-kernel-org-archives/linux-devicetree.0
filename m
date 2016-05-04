From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: sun4i: dt: Add pll3 and pll7 clocks
Date: Wed, 4 May 2016 20:32:06 +0200
Message-ID: <20160504183206.GC17159@lukather>
References: <1462295659-6945-1-git-send-email-plaes@plaes.org>
 <1462295659-6945-2-git-send-email-plaes@plaes.org>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZDIREgaZHBBvWU9r"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBMMAVG4QKGQEXJ4ITIA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1462295659-6945-2-git-send-email-plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--ZDIREgaZHBBvWU9r
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Tue, May 03, 2016 at 08:14:18PM +0300, Priit Laes wrote:
> Enable pll3 and pll7 clocks that are needed to drive display clocks.
> 
> Signed-off-by: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun4i-a10.dtsi | 44 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/sun4i-a10.dtsi b/arch/arm/boot/dts/sun4i-a10.dtsi
> index 268a150..c893744 100644
> --- a/arch/arm/boot/dts/sun4i-a10.dtsi
> +++ b/arch/arm/boot/dts/sun4i-a10.dtsi
> @@ -184,6 +184,15 @@
>  			clock-output-names = "osc24M";
>  		};
>  
> +		osc3M: osc3M_clk {
> +			compatible = "fixed-factor-clock";
> +			#clock-cells = <0>;
> +			clock-div = <8>;
> +			clock-mult = <1>;
> +			clocks = <&osc24M>;
> +			clock-output-names = "osc3M";
> +		};
> +
>  		osc32k: clk@0 {
>  			#clock-cells = <0>;
>  			compatible = "fixed-clock";
> @@ -208,6 +217,24 @@
>  					     "pll2-4x", "pll2-8x";
>  		};
>  
> +		pll3: clk@01c20010 {
> +			#clock-cells = <0>;
> +			compatible = "allwinner,sun4i-a10-pll3-clk";
> +			reg = <0x01c20010 0x4>;
> +			clocks = <&osc3M>;
> +			clock-output-names = "pll3";
> +		};
> +
> +		pll3x2: pll3x2_clk {
> +			compatible = "fixed-factor-clock";
> +			#clock-cells = <0>;
> +			clock-div = <1>;
> +			clock-mult = <2>;
> +			clocks = <&pll3>;
> +			clock-output-names = "pll3-x2";

We usually call them -2x

> +		};
> +
> +

One newline too many.

Fixed it and applied the patch.

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--ZDIREgaZHBBvWU9r--
