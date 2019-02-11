From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 6/7] ARM: dts: suniv: Add pinmux for SPI0
 and SPI1 of F1C100s
Date: Mon, 11 Feb 2019 16:51:52 +0100
Message-ID: <20190211155152.gnocoojqa27fmeay@flea>
References: <cover.1549875778.git.mesihkilinc@gmail.com>
 <37f573797e18fc22f8f78d0a62550b6d5e460a8d.1549875778.git.mesihkilinc@gmail.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zkkgxlj3vb7km2v6"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBHFUQ3RQKGQE3XPQMXQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <37f573797e18fc22f8f78d0a62550b6d5e460a8d.1549875778.git.mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Mesih Kilinc <mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--zkkgxlj3vb7km2v6
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Mon, Feb 11, 2019 at 12:21:12PM +0300, Mesih Kilinc wrote:
> PC0~PC4 is pin group for SPI0. PA0~PA4 is pin group for SPI1.
> Add device tree nodes for this groups.
> 
> Signed-off-by: Mesih Kilinc <mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/suniv-f1c100s.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/suniv-f1c100s.dtsi b/arch/arm/boot/dts/suniv-f1c100s.dtsi
> index 1b332d9..a92a411 100644
> --- a/arch/arm/boot/dts/suniv-f1c100s.dtsi
> +++ b/arch/arm/boot/dts/suniv-f1c100s.dtsi
> @@ -96,6 +96,16 @@
>  				pins = "PE0", "PE1";
>  				function = "uart0";
>  			};
> +
> +			spi0_pc_pins: spi0-pc-pins {
> +				pins = "PC0", "PC1", "PC2", "PC3";
> +				function = "spi0";
> +			};
> +
> +			spi1_pa_pins: spi1-pa-pins {
> +				pins = "PA0", "PA1", "PA2", "PA3";
> +				function = "spi1";
> +			};

Are they the only options for the muxing of the SPI pins? if so, you'd
need to remove the pin bank, and to set the pinctrl-0 and
pinctrl-names in the DTSI.

We also move the CS pin out in a separate group to accomodate devices
that use a GPIO instead.

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--zkkgxlj3vb7km2v6--
