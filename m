From: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Subject: Re: [PATCH 01/11] clk: sunxi-ng: Don't set k if width is 0 for nkmp
 plls
Date: Thu, 4 Jan 2018 15:25:30 +0100
Message-ID: <20180104142530.ffz26qs66c6y7b2h@flea.lan>
References: <20171230210203.24115-1-jernej.skrabec@siol.net>
 <20171230210203.24115-2-jernej.skrabec@siol.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ahqsuwxynlnofbo3"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171230210203.24115-2-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: airlied-cv59FeDIM0c@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ahqsuwxynlnofbo3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Dec 30, 2017 at 10:01:53PM +0100, Jernej Skrabec wrote:
> For example, A83T have nmp plls which are modelled as nkmp plls. Since k
> is not specified, it has offset 0, shift 0 and lowest value 1. This
> means that LSB bit is always set to 1, which may change clock rate.
>=20
> Fix that by applying k factor only if k width is greater than 0.
>=20
> Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>

This looks fine...

> ---
>  drivers/clk/sunxi-ng/ccu_nkmp.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu_nkmp.c b/drivers/clk/sunxi-ng/ccu_n=
kmp.c
> index e58c95787f94..709f528af2b3 100644
> --- a/drivers/clk/sunxi-ng/ccu_nkmp.c
> +++ b/drivers/clk/sunxi-ng/ccu_nkmp.c
> @@ -81,7 +81,7 @@ static unsigned long ccu_nkmp_recalc_rate(struct clk_hw=
 *hw,
>  					unsigned long parent_rate)
>  {
>  	struct ccu_nkmp *nkmp =3D hw_to_ccu_nkmp(hw);
> -	unsigned long n, m, k, p;
> +	unsigned long n, m, k =3D 1, p;
>  	u32 reg;
> =20
>  	reg =3D readl(nkmp->common.base + nkmp->common.reg);
> @@ -92,11 +92,13 @@ static unsigned long ccu_nkmp_recalc_rate(struct clk_=
hw *hw,
>  	if (!n)
>  		n++;
> =20
> -	k =3D reg >> nkmp->k.shift;
> -	k &=3D (1 << nkmp->k.width) - 1;
> -	k +=3D nkmp->k.offset;
> -	if (!k)
> -		k++;
> +	if (nkmp->k.width) {
> +		k =3D reg >> nkmp->k.shift;
> +		k &=3D (1 << nkmp->k.width) - 1;
> +		k +=3D nkmp->k.offset;
> +		if (!k)
> +			k++;
> +	}

=2E.. but could you add a comment there to explain why you're using a
different construct than the one used for the other factors?

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ahqsuwxynlnofbo3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlpOOVkACgkQ0rTAlCFN
r3Q/xg//aq4lc1fhAw5dqvwjrUqCxtH6bbhwFwxzez16WJlyRn4lh9/i1INor6MI
vDChUuzOOb8pwvXc6yDzy/A0zbU9PQmn5ZHuPQ1J0cTygvoUlNZ5KKepOWUmWrbX
7sbSze+zSSB1EC3GYx1xYN7NnZwi89NrXJ2fVxK4J6XHK8wiZy+hOQ141pP9lnzf
HRt61dHP0sfbuO2977wMkEvTuzw7vmMQblg0kHNjICEzNMOvPU1hdG7gZNsZ8aXu
OqZRpDK3oBr7I2V3m2gz0IQpJnHJUh+iSsiELEMpnq5Kw/7TGzMkKzJBZlNyq0/q
VXmfaM9MzWqOxW55E8l9not65gy5eGaSNel1xJG7anQDC7feA7zRb/NOvRGDrsaQ
UFuEpQZzWeoAqbP+MgoyQSkD5aWml+YPDHrIkiPGCIwnVEmNhiQ74CeIetLIZdI2
AN5DUO7o8WusnX4bLSoR5VUEb1naTGPA2wcsXl/WhgYQaVK4cHn074Og75pvbUmw
wkGsEYZMDhXJv16tLTQJqOMllLMlCoLZyneVKb9s+O9coyB4uIvJkRueDqgSk7Vx
GRx5GDPxrw9pl7gurkV38KfA5DbZRtBiUe9MNWqY3w8a9ViEP/QO+u4IacuewaVv
jM/XfXMtrxvdYdm9zp2CbJHi3cOI455dLXTDKO9CO96afwPmmQo=
=EQyV
-----END PGP SIGNATURE-----

--ahqsuwxynlnofbo3--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
