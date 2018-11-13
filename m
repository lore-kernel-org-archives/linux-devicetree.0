From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v4 03/26] clk: sunxi-ng: Add check for maximum rate to
 NKM PLLs
Date: Tue, 13 Nov 2018 14:26:58 +0100
Message-ID: <20181113132658.niwy6bqdqzaeqpv2@flea>
References: <20181113111633.20189-1-jagan@amarulasolutions.com>
 <20181113111633.20189-4-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qkzagaz2qwa76467"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181113111633.20189-4-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, Jernej Skrabec <jernej.skrabec@siol.net>, Vasily Khoruzhick <anarsoul@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, Michael Trimarchi <michael@amarulasolutions.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, linux-amarula@amarulasolutions.com
List-Id: devicetree@vger.kernel.org


--qkzagaz2qwa76467
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 13, 2018 at 04:46:10PM +0530, Jagan Teki wrote:
> Some NKM PLLs, frequency can be set above PLL working range.
>=20
> Add a constraint for maximum supported rate. This way, drivers can
> specify which is maximum allowed rate for PLL.
>=20
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> Acked-by: Stephen Boyd <sboyd@kernel.org>

As Vasily reported on a previous version, this should be squashed with
the patch 2.

> ---
>  drivers/clk/sunxi-ng/ccu_nkm.c | 3 +++
>  drivers/clk/sunxi-ng/ccu_nkm.h | 1 +
>  2 files changed, 4 insertions(+)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu_nk=
m.c
> index 6b5ad990f802..b8b66cdd30bf 100644
> --- a/drivers/clk/sunxi-ng/ccu_nkm.c
> +++ b/drivers/clk/sunxi-ng/ccu_nkm.c
> @@ -128,6 +128,9 @@ static unsigned long ccu_nkm_round_rate(struct ccu_mu=
x_internal *mux,
>  	if (rate < nkm->min_rate)
>  		return nkm->min_rate;
> =20
> +	if (nkm->max_rate && rate > nkm->max_rate)
> +		return nkm->max_rate;
> +

I would expect the test to be the same for the minimum and maximum cases.

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--qkzagaz2qwa76467
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCW+rRIQAKCRDj7w1vZxhR
xUtiAP0Qzz9KTR8SbP2fs3KcowHxL8xYV+GOUNZ9/VA8BWSVxAD+KRBkAWya7D4N
adBknlFW6CNpkDt3SyJa46/5Dwt0WgU=
=E1t8
-----END PGP SIGNATURE-----

--qkzagaz2qwa76467--
