From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun7i: Add Goodix GT911 nodes for Wexler
 TAB7200
Date: Tue, 31 Mar 2015 07:43:38 -0700
Message-ID: <20150331144338.GG23664@lukather>
References: <1427789897-4085-1-git-send-email-mamlinav@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OzigliFs3e0dNr73"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1427789897-4085-1-git-send-email-mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--OzigliFs3e0dNr73
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Mar 31, 2015 at 11:18:17AM +0300, Aleksei Mamlin wrote:
> This patch adds nodes for the Goodix GT911 touchscreen controller found
> on the Wexler TAB7200 tablet. Controller uses one of following I2C
> addresses: 0x5d or 0x14, so just add two nodes.

In which case are these different addresses encountered? Different
revisions of the same board?

> Signed-off-by: Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> DT support for the Goodix GT911 touchscreen controller has been queued up
> by Dmitry Torokhov for merging into 4.1:
> https://git.kernel.org/cgit/linux/kernel/git/dtor/input.git/commit/?h=3Dn=
ext&id=3D771d8f1b178e7e09fcc641fccd48852958dbc329
>=20
> IRQ flags are set by the touchscreen controller driver, so use IRQ_TYPE_N=
ONE.
>=20
>  arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts b/arch/arm/bo=
ot/dts/sun7i-a20-wexler-tab7200.dts
> index 2ad3b09..34e2bce 100644
> --- a/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts
> +++ b/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts
> @@ -101,6 +101,20 @@
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&i2c2_pins_a>;
>  	status =3D "okay";
> +
> +	gt911@5d {

The node name should be the class of the device. touchscreen in this
case.

> +		compatible =3D "goodix,gt911";
> +		reg =3D <0x5d>;
> +		interrupt-parent =3D <&pio>;
> +		interrupts =3D <21 IRQ_TYPE_NONE>; /* EINT21 (PH21) */

Unfortunately, IRQ_TYPE_NONE is not a valid value for the GIC
bindings.

You're also not adding a pinctrl group for that pin?

> +	};
> +
> +	gt911@14 {
> +		compatible =3D "goodix,gt911";
> +		reg =3D <0x14>;
> +		interrupt-parent =3D <&pio>;
> +		interrupts =3D <21 IRQ_TYPE_NONE>; /* EINT21 (PH21) */
> +	};

And nodes should be ordered by addresses ascending order.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--OzigliFs3e0dNr73
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVGrKaAAoJEBx+YmzsjxAgqGsQAKcVm9Cv37NmxFdbmbdueoiA
iKPGh3+oQ16gz+dYopJ37Mo79jnddKm7um/qj/wZ3h80ZytQBQMsncoRteGDDz2B
HgigY6pSniheacyOCKZ4H2BP02y4v6NED0udQJTFH0KDhnl0v//+2fzS9vfkxjyo
o9ThMGmZ3Rd3cOVa7G/7ZVfsD6Pj5hCxd4qNgMuAAeUr61TX04ZqnlfIFEf397SH
KcRLCdpT1YdFFunEwz2Nsrm8I6STvfO1FOgWZw3dKJDwYA1JIGNd3HUECxwqghAv
3aVdxlhh0LHSpKDLxUnYWWaagaVVnAWHLjW0xXOH0vJbn9gSTPlE6DaoiSwX344r
vWZDt4+qXKIzUMYGglutNIg1e1g4PiMVw0my5//9+9BAdvl21Y8tefsN9du0ezhA
oFABLOmQpeYiD/qVJf13xNrFyOdsb4LcjmGWZmuoNecYC6ARD/t4IGr1JHlich3m
BpbAnGvMnFrx8bk2lAdcRUbFIXhLS+E4C/Lewoy/bR3oynuNveoUNxvUNbufX3dl
dNIMYGoZVck5wNaeiFvryr8eyJR5hYgNjTx2L3u5gOi7vrGF83AgHdp9VppE65tb
0+tGu2PuQRM/Pi5VNGlGnvRrXZ/sjW8+w/pXnwCYFMi2JqanwTFxc2SpwsEXbwT9
WTBLHWA4XoiePbS7skwR
=+vDD
-----END PGP SIGNATURE-----

--OzigliFs3e0dNr73--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
