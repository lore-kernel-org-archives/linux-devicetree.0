Return-Path: <SRS0=tqXi=N2=jmondi.org=jacopo@kernel.org>
Date: Thu, 15 Nov 2018 17:28:17 +0100
From: jacopo mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v6 1/2] pinctrl: Add RZ/A2 pin and gpio controller
Message-ID: <20181115162817.GB28299@w540>
References: <20181115140045.24733-1-chris.brandt@renesas.com>
 <20181115140045.24733-2-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kVXhAStRUZ/+rrGn"
Content-Disposition: inline
In-Reply-To: <20181115140045.24733-2-chris.brandt@renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--kVXhAStRUZ/+rrGn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Chris,

On Thu, Nov 15, 2018 at 09:00:44AM -0500, Chris Brandt wrote:
> Adds support for the pin and gpio controller found in R7S9210 (RZ/A2) SoCs.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
> v5:
>  * Specify number of ports using of_device_id.data and save as priv->npins
>  * Use priv->npins everywhere instead of hard coded RZA2_NPINS
>  * Check gpio-ranges to make sure args matches SOC

Sorry about this, I didn't want to ask you to do this now, it might
have had post-poned to when a new SoC will have to be supported, but..

[snip]

> +
> +static const struct of_device_id rza2_pinctrl_of_match[] = {
> +	{ .compatible = "renesas,r7s9210-pinctrl", .data = (void *)22, },

... I really don't like this, I'm sorry.

I would rather make a 'struct rza_pinctrl_info' or similar which
contains all the fields you now hardcode (number of ports, pins per
port etc) and which is easily extensible in case you need to do so.

I'm sorry this is more work, and again, it might be post-poned imo,
provided you drop this change you have introduced here.

Thanks
   j


> +	{ /* sentinel */ }
> +};
> +
> +static struct platform_driver rza2_pinctrl_driver = {
> +	.driver = {
> +		.name = DRIVER_NAME,
> +		.of_match_table = rza2_pinctrl_of_match,
> +	},
> +	.probe = rza2_pinctrl_probe,
> +};
> +
> +static int __init rza2_pinctrl_init(void)
> +{
> +	return platform_driver_register(&rza2_pinctrl_driver);
> +}
> +core_initcall(rza2_pinctrl_init);
> +
> +MODULE_AUTHOR("Chris Brandt <chris.brandt@renesas.com>");
> +MODULE_DESCRIPTION("Pin and gpio controller driver for RZ/A2 SoC");
> +MODULE_LICENSE("GPL v2");
> --
> 2.16.1
>

--kVXhAStRUZ/+rrGn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJb7Z6hAAoJEHI0Bo8WoVY8758QALbw/IFn7Ga3VAGhjuzadD8K
WpIXgpCzTRWNQMXSJcYNgyaQ36vWd2FAu/gbyWawBLUADx3hI7a2/uSgokIQFOI6
tGPHji7oVUbPyP8NDS+rkc+ZPOSvAisZXeAbYSgtAFtGiOpbmTc+IuMIdYI80u2q
bk3j5mBXIWNDEElG6wzA8FupMnj1s75GIu6t8DRBLedjYWprnewybKJD0wggEX9u
PZbvyQmB/jqEu4lEWyGF7xHre5izZDWIjvw9YnZT68xWfuDlOPwd7qr+nfLIpvZg
f8vDzZ59iJwC4HQvJiMVxIrxTpLILCPdkW3fJRPWpGo9I0lsh4bXZmrRHpUPlDTr
JqiwMxCgM9ZjSS56SJyFw1uJwpfYHhv0HnK00dVFU8jgWbGizMCwtH0Zgh8im5J2
TbUwPGGuc51MBUulw1q1EANJR1yPB+DymezQ1Z8UEG1EvgiBCGm8ZHV8nHfJTf9q
rEPMEgTJfzVnV8Iz/9ZLKFbxeIzWbpj2RFuTJLYE6frLwF/pUbqJMZgoY1y6Vy4/
O+1c+KyQX4JQboO8x7w91P0sppHsFrFpo68ID5EGhTCmq5QafavDhB+koVU3wXDs
OH5rzZHqAWXti8nvYzYIhHeCP3Ng8Ah1mX905zBLsBb/wXxt3WsL/fkNJKs1Roq6
9NfEL3NRECEhHAksm9Kx
=41dy
-----END PGP SIGNATURE-----

--kVXhAStRUZ/+rrGn--
