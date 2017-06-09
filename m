From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2] arm64: allwinner: a64: Add initial NanoPi A64 support
Date: Fri, 9 Jun 2017 16:51:41 +0200
Message-ID: <20170609145141.aknbsis25vmy3rj6@flea.home>
References: <1497012052-14027-1-git-send-email-jteki@openedev.com>
 <1497012052-14027-2-git-send-email-jteki@openedev.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="qfqgwt3rrbt4e3fk"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1497012052-14027-2-git-send-email-jteki@openedev.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jagan Teki <jagannadh.teki@gmail.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Sean Wang <sean.wang@mediatek.com>, Icenowy Zheng <icenowy@aosc.io>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Michael Trimarchi <michael@amarulasolutions.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org


--qfqgwt3rrbt4e3fk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jagan,

On Fri, Jun 09, 2017 at 12:40:52PM +0000, Jagan Teki wrote:
> +&i2c1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c1_pins>;
> +	status =3D "okay";
> +};
> +
> +&i2c1_pins {
> +	bias-pull-up;
> +};

What is connected on that bus?

> +&uart1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart1_pins>, <&uart1_rts_cts_pins>;
> +	status =3D "okay";
> +};

And on that UART?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--qfqgwt3rrbt4e3fk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZOrX9AAoJEBx+YmzsjxAgQdwP/3P4rnhjVZCw7tv3Wg5/D6NQ
28MDP7cHPu+HzvkXPTdL9GA0gEf95YMZ/zRGwdjfFif9yHMNSMwBgYzHJ38TaTdL
wHCmrEZ5yaMAScP2fJB/zLPopgaEJJDBbrK19ekv9NWKo13ylEEjRPcqXsAcf787
SKA3HFXNi2OAeqAoeZM2nhuvgKuHeXT/Gg7+stZAMFlFS+/xbIvR9qWhICEkHiZ2
vXATGwa+3kD+OLeQKPdTVFm317zPl1/lVFqxBCgbRbjZrulFZn0PtO01nt2sbQce
9G/Ybiin0DB8C3sNwIcGpVzbKfcMw303uW2FxCSjpfYqVBWUlVl/YUxe+opL4W+A
7lP9LOj32Sq6+NA3S1tEGnJ8Gw73I8cTmY1Oac4WDKV0jOB46fI0NvAGLfJuaQ28
oYzvh4eJxI3lseEXClg6bHvOjVpoKbT06Pbewg5gtK/V9tOGtIXhPvX4TbWtUTsG
mBD28FlykZdPnpAWsMo45Rp3gSUh8EbMMfFfsQSXEcoDkxVgt5NuBntF6+/WL7ny
BsTnnVVsqXwilELVVapmiHNdQ6wpvHrCFGI8jFNH/KcYMw796JwbIQmTekaqauxB
AiQoHQMYsmpWMDa3KVskysEvFCrh/H2CHD5jSoXr42UXP+5s05F5FPdsK27ALVgc
n8+HzTYkC6/z2OuvIUt6
=LS3k
-----END PGP SIGNATURE-----

--qfqgwt3rrbt4e3fk--
