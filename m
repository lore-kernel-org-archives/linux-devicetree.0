From: Wookey <wookey-Xpnwy/r4z8dg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v5 0/5] Add ARM Mali Midgard device tree bindings and gpu
 node for rk3288
Date: Wed, 10 May 2017 15:52:05 +0100
Message-ID: <20170510145205.GJ27127@mail.wookware.org>
References: <cover.1493804968.git.guillaume.tucker@collabora.com>
 <12996903.t3AZceNVOh@diego>
 <b63475e9-21f6-5995-90b6-e0eeae8144ab@rock-chips.com>
 <b43fc703-3c39-58e9-6006-1aa7f9d0cea6@collabora.com>
 <ddec5773-43ef-a4c3-2280-8f0c5b1f1c4d@rock-chips.com>
 <425541fd-e648-1db7-9c31-13d2d4f094b4@collabora.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7091948103703605405=="
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <425541fd-e648-1db7-9c31-13d2d4f094b4-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heiko =?iso-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Randy Li <randy.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, John Reitan <john.reitan-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============7091948103703605405==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yr/DzoowOgTDcSCF"
Content-Disposition: inline


--yr/DzoowOgTDcSCF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2017-05-10 11:10 +0100, Guillaume Tucker wrote:
>=20
> On a side note, it would be fantastic to get all this available
> in Debian packages :)

There are prototype debian packages here:
https://git.linaro.org/people/wookey/mali/mali-dkms.git/
https://git.linaro.org/people/wookey/mali/mali-drivers.git/

Which I'm very happy to get feedback on if people try them with
guillaume's DTB patches.

Quite hacky at the moment, but I want to prove they work at all before
tarting up the packaging.

Wookey
--=20
Principal hats:  Linaro, Debian, Wookware, ARM
http://wookware.org/

--yr/DzoowOgTDcSCF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZEykVAAoJEPuGMlGob55HvM8QAKCGtiMZ79EdD3PvfVxTZDyU
7f4OvpwNFPfMrDSRPIjIFYA75qKQUJxjds4n1xrxvWnKPUsCSAJcZ5pnmm85aJQT
voT1Sxjmq/KLC8/HC0CGuBAjq5YORVWUz0zccP2hHS0wiLlop2f+s1BYbwqjIpFM
ERVr3PaVAkBJlw5ib6My45pbaqvA5oFrhWxytqvlRIqjPDOD1Vx7dglpP4Z5njL2
MntVfCLBWjYjkmH8q/+u5X1kmGx8EqtiLAg9rePKseo7O8gjobUcc0yXMveqjUqS
yoM1Q3AI4UicWm8wN7/P/C+XQfbp1APJK4dcEyxVzm1j2dfTDh4BguWtfDYjb6iW
BChXO8chJFkTflnGL/EigcF3je/UP9heSSw8Ye3hFJksbuMtJTF3AxD8VEEu2uZS
9dKwrg5mClJvzd6tbmLTbSo5txIayKbbOVpWrh72n2Dl7WjCKIY+bg2ViTMk0f3r
yHSqsCfOKXlhAkYu/XGuFiFyHwWqp6smaU5vL7kp8j4GLGJfOkCod9wYkiPEXSEV
dX6HRfiLf0tF+ubto7RboWn1cR2x+SRwAU4C0cNt1J1EnkEQSauaZdkVnj1srP9t
SauhPc2h+NnnNWa8QDk2F3IRUW13YLH13dz104RsHdCTipievaskPuNTwbk9QILI
AbnyR/jb0ge+zq8t37Ot
=plZu
-----END PGP SIGNATURE-----

--yr/DzoowOgTDcSCF--


--===============7091948103703605405==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-rockchip mailing list
Linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
http://lists.infradead.org/mailman/listinfo/linux-rockchip

--===============7091948103703605405==--
