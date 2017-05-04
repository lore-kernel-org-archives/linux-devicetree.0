From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 03/10] pinctrl: sunxi: add A20 support to
 A10 driver
Date: Thu, 4 May 2017 16:02:20 +0200
Message-ID: <20170504140220.26kguf3trz7ocylv@lukather>
References: <20170504135006.16483-1-icenowy@aosc.io>
 <20170504135006.16483-4-icenowy@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ze3rfne35fxc5myi"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB3PIVTEAKGQEFROXZGY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170504135006.16483-4-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ze3rfne35fxc5myi
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Thu, May 04, 2017 at 09:49:59PM +0800, Icenowy Zheng wrote:
>  static const struct of_device_id sun4i_a10_pinctrl_match[] = {
> -	{ .compatible = "allwinner,sun4i-a10-pinctrl", },
> +	{
> +		.compatible = "allwinner,sun4i-a10-pinctrl",
> +		.data = (void *)PINCTRL_SUN4I_A10
> +	},
> +	{
> +		.compatible = "allwinner,sun7i-a20-pinctrl",
> +		.data = (void *)PINCTRL_SUN7I_A20
> +	},
>  	{}
>  };

This means you're going to have two drivers probing for the same
device: this driver, and the old one. This is not ok, and probably
introduces some corner cases.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--ze3rfne35fxc5myi--
