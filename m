From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: dts: sunxi: Update dts for
 A20-OLinuXino boards
Date: Tue, 28 Nov 2017 22:32:53 +0100
Message-ID: <20171128213252.2bysq3kzubio7cxw@flea.home>
References: <1511784231-6485-1-git-send-email-stefan@olimex.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="l4yinkne7y5ramij"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBBVM67IAKGQECPE25BQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1511784231-6485-1-git-send-email-stefan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Stefan Mavrodiev <stefan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--l4yinkne7y5ramij
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

Hi Stefan,

On Mon, Nov 27, 2017 at 02:03:51PM +0200, Stefan Mavrodiev wrote:
> There will be option with 16MB flash for the following boards:
> 
>   * A20-OLinuXino-MICRO Rev.K
>   * A20-OLinuXino-LIME Rev.J
>   * A20-OLinuXino-LIME2 Rev.J
>   * A20-SOM-EVB Rev.E
> 
> The used flash chip is Winbond W25Q128FV, which is connected to
> SPI0 port. Since this is optional feature, spi0 node is dissabled
> by default. Also this option is incompatible with NAND flash, so
> they shouldn't be enabled at the same time.
> 
> Signed-off-by: Stefan Mavrodiev <stefan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts  | 14 ++++++++++++++
>  arch/arm/boot/dts/sun7i-a20-olinuxino-lime.dts  | 14 ++++++++++++++
>  arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts | 14 ++++++++++++++
>  arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts | 14 ++++++++++++++
>  4 files changed, 56 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts b/arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts
> index 64c8ef9..98b7697 100644
> --- a/arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts
> +++ b/arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts
> @@ -291,6 +291,20 @@
>  	status = "okay";
>  };
>  
> +&spi0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&spi0_pins_b>,<&spi0_cs0_pins_b>;
> +	status = "disabled";
> +
> +	flash@0 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "winbond,w25q128","jedec,spi-nor";
> +		reg = <0>;
> +		spi-max-frequency = <40000000>;
> +	};
> +};
> +

So those kind of variations are usually best handled using overlays.

This as become quite convenient using the FIT image rework that
Pantelis did here:
https://lists.denx.de/pipermail/u-boot/2017-June/296879.html

and got merged since 2017.11.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--l4yinkne7y5ramij--
