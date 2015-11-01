From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun4i: Enable audio codec on Olimex A20-SOM-EVB
Date: Sun, 1 Nov 2015 10:39:15 +0100
Message-ID: <20151101093915.GP6114@lukather>
References: <1446296142-4152-1-git-send-email-mweseloh42@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EqVOK5mkaJAMmtSx"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1446296142-4152-1-git-send-email-mweseloh42-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcus Weseloh <mweseloh42-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--EqVOK5mkaJAMmtSx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Oct 31, 2015 at 01:55:42PM +0100, Marcus Weseloh wrote:
> Enable the on-chip audio codec on the Olimex A20-SOM-EVB
>=20
> Signed-off-by: Marcus Weseloh <mweseloh42-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts b/arch/arm/bo=
ot/dts/sun7i-a20-olimex-som-evb.dts
> index b7fe102..03352cc 100644
> --- a/arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts
> +++ b/arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts
> @@ -86,6 +86,10 @@
>  	status =3D "okay";
>  };
> =20
> +&codec {
> +        status =3D "okay";
> +};

The indentation in the DT in with tabs, and not spaces (and checkpatch
actually complains about that).

Make sure you run checkpatch before sending a new patch.

I've fixed it, and queued the patch for 4.5. Thanks!

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--EqVOK5mkaJAMmtSx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWNd3DAAoJEBx+YmzsjxAgvxUP/0lEJouiMEM4lKymo1AHN6CQ
0e9dASWKKClGgEgq9YxPUK3P5c5fav+HNYzvWoXtQ4Io6jyxgRRxHpBNg4jD/28Z
iEe7aQ3z+sw33BcjZKv/gAIv7/J52xlP6vys5CLeYxwX3TMDxjCdQzmJDQUITl5t
3r+Po+LJWQHmOFr3c5it/wV8KjDLIoiSLpnpH8/ol1aq6GW55R8ZDBiDL+iudPhM
h437gwa7t+IfUhGZvU7NKG6jecLCGq7mFADnHSWnC6kYxPcUntc2ogukV630jDi3
01bC7kVJR5Sr6TKFyaYQttTei2QVOV4kUnOWngbTeo5qcZqFhcSi5vNJnZ3iOeuA
KcqiZV1JE/5KKGo2m5+6Zp68XITS5nL2breL6VS9SZ2wn0/zNiB7mk8o/zx4ZpLy
4QJgUS8bzOibQGkv/D7kaAUAqtMaPrk8gvoPFe/uVFlSBV9RhEM3XXvY+UoL0YS+
nb2NgrN8U/HKA32AH62N1L8qyMIGvAEBITAUC8+yEWPeGQKP4XqY6GRBHllXKi2a
XjYk9Kq1GGNcuLqpOYX1XW9HusZg19N3pkh2tv3lLXSfnN/EKZA+r78sAxBTfN0V
WEBM5CPuXz0P0JkWHNApbDxJwiKoUDDbVwRgYFDit+Dzzp+XgcWDkcDs+v99nWT4
/RhFjd1jf92BWHMa+nfk
=VTLK
-----END PGP SIGNATURE-----

--EqVOK5mkaJAMmtSx--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
