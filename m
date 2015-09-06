From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH RESEND] ARM: dts: Fix Makefile target for
 sun4i-a10-itead-iteaduino-plus
Date: Sun, 6 Sep 2015 13:20:46 +0200
Message-ID: <20150906112046.GK31584@lukather>
References: <20150904124934.GD464@hansolo.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J2pR2RtFp0tAjF3C"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150904124934.GD464@hansolo.redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Josh Boyer <jwboyer@fedoraproject.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Olof Johansson <olof@lixom.net>, Josef Gajdusek <atx@atx.name>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--J2pR2RtFp0tAjF3C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 04, 2015 at 08:49:34AM -0400, Josh Boyer wrote:
> Commit 79ae3e66f8d (ARM: dts: sun4i: Add Iteaduino Plus A10) added a new
> make target for the sun4i-a10-itead-iteaduino-plus dts file, but mistaken=
ly
> used .dts instead of the correct .dtb suffix.  This resulted in a build e=
rror
> like:
>=20
>         scripts/Makefile.dtbinst:42: target 'sun4i-a10-itead-iteaduino-pl=
us.dts' doesn't match the target pattern
>=20
> when doing a make dtbs_install.
>=20
> Fix it to use the proper file name.
>=20
> Signed-off-by: Josh Boyer <jwboyer@fedoraproject.org>

Queued, thanks!

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--J2pR2RtFp0tAjF3C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV7CGOAAoJEBx+YmzsjxAgaSUP/jml36iyr2KG5I5kmzXI2wxJ
InYjxnVRa3hj0qy34QKKk9PbOzeQJH1Ktg40eUlyzbIQDcCRK6Lh17Cv9d0IwO4X
26VNQ4YhQnYng91QMceSRUmU+6Ny6jOnPoe5byoE5FQ2FGg+yFbkCTZKSpF8HGhL
YT5mc+389Ugdg6MIxi/jpKBq73pEZl2aQ5rT0hlB+H0i5jsi+Y+mKe1yQqpvlQuD
+5IFRTs3Q+EAjVVW1gv0dvUDk3S+m6wVQ6HgTTMnpse1/eQjT5hmXack07JfNNxV
OFlz4HEL3Gz1BF/D3g4iR3daOaf8+epCNJrrrTOLIaTchIFUnAEOXTmj5qwmTcn/
rb6+T/j11hMqNs07iMoi0lw+Y0zQ+CK5N+b7Mz/zDG5PsGg92tVahQl2DOTDBWyE
6dKaPRPJLmsIGDyImhTI44Ih8OdD/1/6xEw+Ad5DVC6w7xX+IGYUwukFAp2bIFs/
kGAsKKpSPyqu6rt6k6YI0eSb6yc2/7FK3Y79IVdd29g41Tl5b+xNg/6aiAFSk0EQ
lodjzzR1rt/f2IzIcwE5tmbxiS2fGz2WFOZoShqOaTLFC38NbB+KhCHrf4phCvL5
70VWhmRt7sTKeHkLlCRAPZn2bF6QsW+NMfP1ALXvf9Mip4uT1RNiAlRNA8I5ABGX
r+6J8HUIzVObP3sjjcNW
=kCiO
-----END PGP SIGNATURE-----

--J2pR2RtFp0tAjF3C--
