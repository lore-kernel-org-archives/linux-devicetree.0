From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 6/9] ARM: dts: sunxi: Add usb3_vbus regulator to
 common regulators dtsi
Date: Sun, 25 Jan 2015 17:06:25 +0100
Message-ID: <20150125160625.GH8470@lukather>
References: <1422188530-1794-1-git-send-email-wens@csie.org>
 <1422188530-1794-7-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2oox5VnwalALFvA7"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1422188530-1794-7-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--2oox5VnwalALFvA7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 25, 2015 at 08:22:07PM +0800, Chen-Yu Tsai wrote:
> Some SoCs have a total of 4 possible USB controllers. One such example
> is the A80, which has one USB3 dual role device and 3 EHCI/OHCI pairs.
>=20
> Add a common VBUS regulator for the last host controller.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>  arch/arm/boot/dts/sunxi-common-regulators.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sunxi-common-regulators.dtsi b/arch/arm/bo=
ot/dts/sunxi-common-regulators.dtsi
> index e02baa66b33c..97fe8d73c4f7 100644
> --- a/arch/arm/boot/dts/sunxi-common-regulators.dtsi
> +++ b/arch/arm/boot/dts/sunxi-common-regulators.dtsi
> @@ -130,6 +130,16 @@
>  		status =3D "disabled";
>  	};
> =20
> +	reg_usb3_vbus: usb3-vbus {
> +		compatible =3D "regulator-fixed";
> +		pinctrl-names =3D "default";
> +		regulator-name =3D "usb3-vbus";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		enable-active-high;
> +		status =3D "disabled";
> +	};
> +

If the A80 is the only user so far, maybe that would make more sense
to have it in the A80 dtsi? Especially since this regulator doesn't
really do anything else than reg_vcc5v0.

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--2oox5VnwalALFvA7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUxRSBAAoJEBx+YmzsjxAgIhsP/3al6+9rvBl+KBN1vuxlFCQo
dH84folpyRVRxongNZM5gvnYWELlf8+Nup70BSSwJvGYvHGHLYk1uP8kiPLkJWku
vlnB/uliy0Taywf/H/hf8l+UajSBXwtmRIYY9QRB6y4xt3J5El85UpS7TxcJtljF
mqTo0p6PHX/4PPgf3RTDWYsOtY7jL9M9vycPUWXkZQNOSYD30au9I/2wfeFsQEZ/
yXFzUwFsgqBrEU75hXyfUKqo8RQn3rHiiw/FNZzEYzexHya4oCICeNDNAr7Et9WY
KJFNQ6w9860qq6lkv1W4w4/uMjloMwnSNSC/lHBdGKaJVLS0cMbfNqnR5Q4N18of
9v+2bJ2a3lNWyFY9+xDWI+996e3+Sk1mjC6Gzhv6jGj9XlJgXyknHCxzFzwatKHk
O6+g8K529V4W4O2wdDcHRgGmc9H3N3mEz4qxArFBNzjri6Tcz9DH6OuwP133LiqZ
MOFD4ytuMyhT/Y6JQbtqjKoRY8nJIR2scQ1atbmnqPY++TRtjhz3oMSRg8AtxYS6
l1rfIkLlRjNtUgJCtAd6Nigg6Vmjo6eUdgx+RH8Y+QgE0eXPy+egPC7LmXMp3PXp
oF/PZLcgrzBthCBIwhPjVxo7RWwMBV4Af7RSqikiiAPfx26XOJV/nAuQUZdi0HLH
Gp5JhU6MVCLvgkSi+UJr
=PrD2
-----END PGP SIGNATURE-----

--2oox5VnwalALFvA7--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
