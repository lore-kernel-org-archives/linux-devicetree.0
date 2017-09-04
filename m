From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 2/2] ARM: dts: sun8i: h3: Improved Wifi
 bindings on Bananapi M2 Plus
Date: Mon, 4 Sep 2017 10:05:19 +0200
Message-ID: <20170904080519.mec6ypjei7uvo5k7@flea>
References: <1504283401-4263-1-git-send-email-embed3d@gmail.com>
 <1504283401-4263-3-git-send-email-embed3d@gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="m2x3r73jxsrlo2md"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBSUSWTGQKGQED25CNHQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1504283401-4263-3-git-send-email-embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--m2x3r73jxsrlo2md
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

Hi Philipp,

On Fri, Sep 01, 2017 at 06:30:01PM +0200, Philipp Rossak wrote:
> From: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> * vqmmc is in this case not needed
> * no need for pincontrol nodes when the pin is set to a GPIO
> 
> Signed-off-by: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts b/arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts
> index d756ff8..f7e5d8a 100644
> --- a/arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts
> +++ b/arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts
> @@ -98,7 +98,6 @@
>  	wifi_pwrseq: wifi_pwrseq {
>  		compatible = "mmc-pwrseq-simple";
>  		pinctrl-names = "default";
> -		pinctrl-0 = <&wifi_en_bpi_m2p>;
>  		reset-gpios = <&r_pio 0 7 GPIO_ACTIVE_LOW>; /* PL7 */
>  	};
>  };
> @@ -153,7 +152,6 @@
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&mmc1_pins_a>;
>  	vmmc-supply = <&reg_vcc3v3>;
> -	vqmmc-supply = <&reg_vcc3v3>;

So we actually need this one.

>  	mmc-pwrseq = <&wifi_pwrseq>;
>  	bus-width = <4>;
>  	non-removable;
> @@ -200,11 +198,6 @@
>  		pins = "PL3";
>  		function = "gpio_in";
>  	};
> -
> -	wifi_en_bpi_m2p: wifi_en_pin {
> -		pins = "PL7";
> -		function = "gpio_out";
> -	};

And there's also other GPIO pins here, I'd prefer if you could tackle
them all at once.

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--m2x3r73jxsrlo2md--
