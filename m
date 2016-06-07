From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2] ARM: dts: sunxi: Add a startup delay for fixed
 regulator enabled phys
Date: Tue, 7 Jun 2016 23:26:15 +0200
Message-ID: <20160607212615.GG14179@lukather>
References: <1465037919-8497-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="L1c6L/cjZjI9d0Eq"
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1465037919-8497-1-git-send-email-hdegoede@redhat.com>
Sender: stable-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, devicetree <devicetree@vger.kernel.org>, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--L1c6L/cjZjI9d0Eq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 04, 2016 at 12:58:39PM +0200, Hans de Goede wrote:
> It seems that recent kernels have a shorter timeout when scanning for
> ethernet phys causing us to hit a timeout on boards where the phy's
> regulator gets enabled just before scanning, which leads to non working
> ethernet.
>=20
> A 10ms startup delay seems to be enough to fix it, this commit adds a
> 20ms startup delay just to be safe.
>=20
> This has been tested on a sun4i-a10-a1000 and sun5i-a10s-wobo-i5 board,
> both of which have non-working ethernet on recent kernels without this
> fix.
>=20
> Cc: stable@vger.kernel.org
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thanks!

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--L1c6L/cjZjI9d0Eq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXVzv2AAoJEBx+YmzsjxAgUnYP/itG1o0SAPebloKCTv/VzcLb
KBcgTWbvz/8WwvMbd5t7E1R4gkz8Rva683Bg/OTihBGgvEsXk31ZUL1lIsRb5kwr
2yIRgZ+568tI6CQ+dKLkFhVYZszE0lirMvpScXsnI5wX3H273Mo3wzniF/lsE89i
QorcBrHQsWRFJPEaEvVwgLTrlboTsvDy3OYPieeQ/Bf5zxmWou0LUVDbpzswHanl
18FnpQLPNIAAVJ1PCfGE9d7adpdDMh6TB5I2/xFBp2MoALpRygzloQOrkyoRsRyt
OH1y9AX/ivYDCOdLY2+gJW/7auZ9POB4SC5i/3hTMmsHm1sey7JpjOFRxxSETKFT
I8kmUIKDvWt8+I+ObqkvBSZWPnx6Z9BAWoSIizAD1SGmYXmyJS68M3t8N20Xa369
NP0NlHVVjfHmImRVneAqplcBpCsydJtUU+ZnD89SusQTO/lz1wmdOPkk58b83hG+
+Mn9aEW4mf+7P/0hn0xYoxxApryEBtQZovfK4iLCjqbi8RScat7RDYFfQJysbuD/
kh60vNJAYDuxvQ6DI4aVVWeAB1tzeO1HdqV4OiUNIUZivZbhtXTpqiQJJye4dcTD
EDbqexClhDxIG4hJ8OsY405AD8c3W/inayANrDlz9GCJRBxn+V/zYFEM4Wtt08lb
AMpWM3gm2xRWLkglPDvp
=x2qF
-----END PGP SIGNATURE-----

--L1c6L/cjZjI9d0Eq--
