From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 06/14] ARM: dts: sun8i-a83t: Correct low
 speed oscillator clocks
Date: Tue, 2 Feb 2016 14:18:51 +0100
Message-ID: <20160202131851.GR4652@lukather>
References: <1454203266-4450-1-git-send-email-vishnupatekar0510@gmail.com>
 <1454203266-4450-7-git-send-email-vishnupatekar0510@gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YkilVOb9qhI0mB+X"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBPGZYK2QKGQEN7XOE3A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1454203266-4450-7-git-send-email-vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org, jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--YkilVOb9qhI0mB+X
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

1;4002;0c
On Sun, Jan 31, 2016 at 09:20:58AM +0800, Vishnu Patekar wrote:
> From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> 
> The A83T does not have a 32.768 kHz low speed oscillator, either as
> an external crystal or input. It has a 16 MHz RC-based (inaccurate)
> internal oscillator, which is then divided by 512 for a clock close
> to 32 kHz.
> 
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-a83t.dtsi | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
> index 8d27b63..45b725c 100644
> --- a/arch/arm/boot/dts/sun8i-a83t.dtsi
> +++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
> @@ -118,6 +118,7 @@
>  		#size-cells = <1>;
>  		ranges;
>  
> +		/* TODO: PRCM block has a mux for this. */
>  		osc24M: osc24M_clk {
>  			#clock-cells = <0>;
>  			compatible = "fixed-clock";
> @@ -125,11 +126,25 @@
>  			clock-output-names = "osc24M";
>  		};
>  
> -		osc32k: osc32k_clk {
> +		/*
> +		 * This is called "internal OSC" in some places.
> +		 * It is an internal RC-based oscillator.
> +		 * TODO: Its controls are in the PRCM block.
> +		 */
> +		osc16M: osc16M_clk {
>  			#clock-cells = <0>;
>  			compatible = "fixed-clock";
> -			clock-frequency = <32768>;
> -			clock-output-names = "osc32k";
> +			clock-frequency = <16000000>;
> +			clock-output-names = "osc16M";
> +		};
> +
> +		osc16Md512: osc16Md512_clk {
> +			#clock-cells = <0>;
> +			compatible = "fixed-factor-clock";
> +			clock-div = <512>;
> +			clock-mult = <1>;
> +			clocks = <&osc16M>;
> +			clock-output-names = "osc16Md512";

We've been using a dash to separate between the clock and its divider
on other SoCs.

I changed that and applied the patch.

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--YkilVOb9qhI0mB+X--
