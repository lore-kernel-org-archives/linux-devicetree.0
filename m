From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v7 2/3] ARM: sun7i/sun6i: dts: Add NMI
 irqchip support
Date: Wed, 26 Mar 2014 10:39:46 +0100
Message-ID: <20140326093946.GE6120@lukather>
References: <1395256879-8475-1-git-send-email-carlo@caione.org>
 <1395256879-8475-3-git-send-email-carlo@caione.org>
 <53329243.8090604@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="so9zsI5B81VjUb/o"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB5GAZKMQKGQEHJ3T5KI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53329243.8090604-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--so9zsI5B81VjUb/o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2014 at 09:39:31AM +0100, Hans de Goede wrote:
> Hi,
>=20
> On 03/19/2014 08:21 PM, Carlo Caione wrote:
> > This patch adds DTS entries for NMI controller as child of GIC.
> >=20
> > Signed-off-by: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
>=20
> Note this breaks the kernel on sun6i / A31 since we don't have a
> pmic driver there yet, and thus the nmi gets constantly fired without
> anything clearing it.
>=20
> So the sun6i section needs a status =3D "disabled"; until we actually hav=
e pmic
> support.

I guess it also applies to the A20, since the PMIC patches will
probably get merged later on?

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--so9zsI5B81VjUb/o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJTMqBiAAoJEBx+YmzsjxAgGrwQAKq7sO9vus0S8JEITfrbDuf+
lhI+uKqahiXb2SDQHRokfq1L37k6ldfCiME9+e6BFZcAyNvPKL8WbLkgdV7NKED1
A6lb6GjC2ITriTpalsfaK4B7+Is/gvdWU0bQyPDMsZCtNMKKBgBl3GamjuM7yQIe
gSzLXbuUQilaA6p+xWWR0c/yNFE1u1NSRFA4I+9YmlmQj3wMyFDm/FX5Nc83QgT4
wVEK+LzBHF9Lfc544qN+9xgdJ2bKBcnjdpjTeut2a0OtfYwTaedcsEmXrF/AqZb8
t3pV3zJnXNJWGVhs+6roxlTjgcpFrXWm3kQAqb2AV8SaWG7RTGO8UxoUQzmfej8S
gRPOUqJC4blGC3mJc7wx63U7Ycn5zZf2WULLKBHARxsCWIOa1WHHgPfGzyr+ASEj
7YI33MPG9jQc+bUMGWsasxnBEdiqGwJovgDfyCpXHMmxpnVvR4dMjXEGt/6ddvVB
EaVk9stpXFmztf2kZ62WrpLt3EjrYiAXJiQm/Nn+iNth6aiioePUrhu8dKV6WVDY
mjNKLGCwFwzahY6ZAdcIECdz5AzGT+mQ3yl6w9jLcn+VmoonDgXubshgtG8wQ555
uEtygkN/rWxRkx+ZXDXT8mkj7PMwhA2qnJKrcZUPfEmuX6YL4z9TgfQvZkPOX+vq
OfsWBbkpAUQE1XFQBqS7
=hp+a
-----END PGP SIGNATURE-----

--so9zsI5B81VjUb/o--
