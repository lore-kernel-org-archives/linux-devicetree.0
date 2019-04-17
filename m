From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 3/7] ARM: dts: sun8i: v40:
 bananapi-m2-berry: Enable GMAC ethernet controller
Date: Wed, 17 Apr 2019 12:19:47 +0200
Message-ID: <20190417101947.xzper4dbxo4c7vyj@flea>
References: <1555492863-88860-1-git-send-email-pgreco@centosproject.org>
 <1555492863-88860-4-git-send-email-pgreco@centosproject.org>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="j4bmablfkqbqicv6"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBRP33PSQKGQEGZHVSOI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1555492863-88860-4-git-send-email-pgreco-/kQrlZ55X3WoClj4AeEUq9i2O/JbrIOy@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Pablo Greco <pgreco-/kQrlZ55X3WoClj4AeEUq9i2O/JbrIOy@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--j4bmablfkqbqicv6
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Wed, Apr 17, 2019 at 06:20:58AM -0300, Pablo Greco wrote:
>  &pio {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&clk_out_a_pin>;
> +	vcc-pa-supply = <&reg_aldo2>;
> +	vcc-gmac-phy-supply = <&reg_dc1sw>;
> +};

The PIO banks regulators addition should be in a separate
patch. Otherwise, the comments I made on patch 1 still apply.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--j4bmablfkqbqicv6--
