From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v5 3/7] ARM: dts: sun8i: v40:
 bananapi-m2-berry: Enable GMAC ethernet controller
Date: Thu, 2 May 2019 09:39:04 +0200
Message-ID: <20190502073904.yng5dz5kwgulw6ha@flea>
References: <1556040365-10913-1-git-send-email-pgreco@centosproject.org>
 <1556040365-10913-4-git-send-email-pgreco@centosproject.org>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="d2v4zsdy3ohit6tk"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBGV5VLTAKGQESQETWOI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1556040365-10913-4-git-send-email-pgreco-/kQrlZ55X3WoClj4AeEUq9i2O/JbrIOy@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Pablo Greco <pgreco-/kQrlZ55X3WoClj4AeEUq9i2O/JbrIOy@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--d2v4zsdy3ohit6tk
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Tue, Apr 23, 2019 at 02:26:00PM -0300, Pablo Greco wrote:
> Just like the Bananapi M2 Ultra, the Bananapi M2 Berry has a Realtek
> RTL8211E RGMII PHY tied to the GMAC.
> The PMIC's DC1SW output provides power for the PHY, while the ALDO2
> output provides I/O voltages on both sides.
>
> Signed-off-by: Pablo Greco <pgreco-/kQrlZ55X3WoClj4AeEUq9i2O/JbrIOy@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts | 29 +++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts b/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
> index 2cb2ce0..561319b 100644
> --- a/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
> +++ b/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
> @@ -50,6 +50,7 @@
>  	compatible = "sinovoip,bpi-m2-berry", "allwinner,sun8i-r40";
>
>  	aliases {
> +		ethernet0 = &gmac;
>  		serial0 = &uart0;
>  	};
>
> @@ -92,6 +93,22 @@
>  	status = "okay";
>  };
>
> +&gmac {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gmac_rgmii_pins>;
> +	phy-handle = <&phy1>;
> +	phy-mode = "rgmii";
> +	phy-supply = <&reg_dc1sw>;
> +	status = "okay";
> +};
> +
> +&gmac_mdio {
> +	phy1: ethernet-phy@1 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <1>;
> +	};
> +};
> +
>  &i2c0 {
>  	status = "okay";
>
> @@ -133,6 +150,12 @@
>  	vcc-pg-supply = <&reg_dldo1>;
>  };
>
> +&reg_aldo2 {
> +	regulator-min-microvolt = <2500000>;
> +	regulator-max-microvolt = <2500000>;
> +	regulator-name = "vcc-pa";
> +};
> +

Shouldn't this one be added to the patch 2?

Thanks
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--d2v4zsdy3ohit6tk--
