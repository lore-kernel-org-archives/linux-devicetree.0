From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH -next] ARM: dts: sun8i: Add NFC node to Allwinner A23/A33
 SoC
Date: Thu, 7 Jul 2016 09:23:22 +0200
Message-ID: <20160707072322.GC5907@lukather>
References: <20160706003352.28194-1-icenowy@aosc.xyz>
 <20160706202932.GD4247@lukather> <34841467849881@web8m.yandex.ru>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5628899298908738685=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <34841467849881@web8m.yandex.ru>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "wens@csie.org" <wens@csie.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============5628899298908738685==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z4+8/lEcDcG5Ke9S"
Content-Disposition: inline


--z4+8/lEcDcG5Ke9S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 07, 2016 at 08:04:41AM +0800, Icenowy Zheng wrote:
> with a http://linux-sunxi.org/Aoson_M751s tablet, (SKhynix
> H27UCG8T2ETR-BC NAND chip).
>=20
> I used the patchset at
> http://lists.infradead.org/pipermail/linux-mtd/2016-June/067848.html
> to ensure the NAND chip to work properly (otherwise the chip id
> cannot be correctly identified)

(Please reply in-line and wrap your mails).

Ok. That needs to be in the commit log then.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--z4+8/lEcDcG5Ke9S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXfgNpAAoJEBx+YmzsjxAgqRcQAL2l301mU0hdJMYkwq6yNYKJ
LMd+Dx4sy+8VpG6H7Qu2LCQeeftXK2rP9GUqC7QfEQQRzaQNr/+KplLpYU0VFOGg
/5LdcNuVyILTVlB+NFsfYeTDbD7Vf5AiuyWqPDk3vzle1vuVIFY4txL9MvuTQXDl
L8uygt5WEbvtEqGoS/gTeXXWKFTO9DyKCbOqzJHve89xtVKmj9wAY1egh70dTlmf
bzFACY27EAZEGnMqklS7ctyCguNZlEjvfY2WTcs+/V/GE6RT489onllu6l7NA8QH
eJyO7t5K2HmHQ3HLaKTNv4M01a0SrfBqTyYQjXkUuoOkISgHRVa+aqtXBAFsOrC7
hYKbyWvvTy3PD+MICbnlTDaI5QuuqS8sbBlhs4UJ60RT/V6Y6ALbh3O9Z18MntQt
ieIdh6xR285Z7NRc8EGGhL+Fe++FboVxb9O86UysuPSMZoc6q32n2GHU5b+u13gO
rivXvyuIDFcNr15oWG9FUILmS9WUmh7ugvX3uBWUv8fR2njnV3X6AZQvZu0zzVBV
Hh+qRpkRmN0yc4wvZC2FCRpKapW3Q/Q8J2ROEYgFZs5GyaYiNbuI13rSr0Y5+22P
dDx+fbAglv3ZlgJ6HetqDJbSBXycnlJ8oswwTBKRokB9EhTrIJ/A+LAAD4xwmk0C
j3KqLvVGrSGWSyfk5co4
=edlz
-----END PGP SIGNATURE-----

--z4+8/lEcDcG5Ke9S--


--===============5628899298908738685==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5628899298908738685==--
