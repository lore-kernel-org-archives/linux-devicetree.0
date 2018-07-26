From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun8i: r40/v40: rewrite BPi M2
 Berry DTS to rebase on M2 Ultra
Date: Thu, 26 Jul 2018 17:24:27 +0200
Message-ID: <20180726152427.cjji4ymwfjifja4q@flea>
References: <20180724163655.61365-1-icenowy@aosc.io>
 <20180726124119.dwne2sncws2p3sdi@flea>
 <BA51039A-02DD-42C2-A7A9-E1B866074CA6@aosc.io>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rzdcwqlnpfqrlwqg"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBLGP47NAKGQECXVD4NY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <BA51039A-02DD-42C2-A7A9-E1B866074CA6-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--rzdcwqlnpfqrlwqg
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 26, 2018 at 08:47:34PM +0800, Icenowy Zheng wrote:
>=20
>=20
> =E4=BA=8E 2018=E5=B9=B47=E6=9C=8826=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=88=
8:41:19, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> =E5=86=99=E5=88=B0:
> >On Wed, Jul 25, 2018 at 12:36:55AM +0800, Icenowy Zheng wrote:
> >> Banana Pi designs the BPi M2 Berry board to be software compatible
> >with
> >> BPi M2 Ultra,
> >
> >Do you have a reference for this?
>=20
> See [1], it says "BPI-M2U and BPI-M2 Berry share the same image".
>=20
> [1] http://www.banana-pi.org/download.html

Debian supports different SoC from different vendor using the same
image, so it's not really a good argument to share the device tree. I
mean, you can even boot an H3 to a shell using an A33 device tree.

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--rzdcwqlnpfqrlwqg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAltZ56oACgkQ0rTAlCFN
r3QygBAAksC5oQgLhyS60oyqCjAVdKvSOxT5nUlK4bDETzsA8Bb02d0w9tIflHPS
kqjgptPYuzahoPYlW2XASy0aE0GmPorGjmrX1fLDatAc67itzMQZ8U/G9wWvhhCH
dgvUX3txiB1WEK658t+Foz/f5yp6y/nnaWJyL73KUvEMqeI2vK97mrQtAfyeaHFw
TYuOWGE9VVciVIoU7b+mjAzOehXJyLWjEj/ZLgqtp0ut3DMo4Whtarpuhb4bdyN8
jYPwCy5AFdNXv2kVyqXLR0+2laKhBu6kL3ZFKvIgcJoTj5P+5kpKWGNz+epBiZQ5
BxOBe9plT5tBAw863rNjH/SufJtrFhzkgrmYnv+03rs0CgyJeNhVNACnsEgleR/S
eStylZVwriHR50k/DFv1EkvelBD2ms85jB4RDna5AiERamqtMSwaO3KZMeIuuvei
Q2aOklpa4LbDm4cLIWcj3ThU6ecEFbT8SVyD3PpHv6OPhS2zmw3h1NFE0pCb++N6
xvHgLXKfgiLMQM4fv2SO6ADt0o6QEmdob7YweAFlWw2PtCLpomfqYdLtI8voxK/x
amsUxZa/byuUIPRHl75fXXFgxeK91sbCA5FVXgHyHvpDdFqXvpr49vUrtDS3XSAz
OaOTS9MY1RNN8eUNGQNpH7Tk9+go67Fq4ZEffM8Ck/QAkggt+zM=
=uBBx
-----END PGP SIGNATURE-----

--rzdcwqlnpfqrlwqg--
