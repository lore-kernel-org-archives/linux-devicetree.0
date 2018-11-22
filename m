From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RFC PATCH v3 09/17] pinctrl: sunxi: add support
 for suniv F1C100s (newer F-series SoCs)
Date: Thu, 22 Nov 2018 09:45:26 +0100
Message-ID: <20181122084526.gc5qfez4ppxstq3d@flea>
References: <cover.1542824904.git.mesihkilinc@gmail.com>
 <fc20d96f5531d7d1eb5ce3d5cf920c8bf59cad58.1542824904.git.mesihkilinc@gmail.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eposblfbribc57f5"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBMOZ3HPQKGQEI6RMG6A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <fc20d96f5531d7d1eb5ce3d5cf920c8bf59cad58.1542824904.git.mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Mesih Kilinc <mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--eposblfbribc57f5
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

Hi,

On Wed, Nov 21, 2018 at 09:30:42PM +0300, Mesih Kilinc wrote:
> +static const struct sunxi_pinctrl_desc suniv_f1c100s_pinctrl_data = {
> +	.pins = suniv_f1c100s_pins,
> +	.npins = ARRAY_SIZE(suniv_f1c100s_pins),
> +	.irq_banks = 3,
> +	.disable_strict_mode = true,
> +};

One thing I forgot to check before giving my Acked-by, you shouldn't
disable the strict mode here, this is only meant as a legacy option,
new drivers need to enforce it.

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--eposblfbribc57f5--
