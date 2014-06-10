From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 0/2] ARM: topology: Allow to set the frequency through a
 clock
Date: Tue, 10 Jun 2014 13:47:52 +0200
Message-ID: <20140610114752.GL9791@lukather>
References: <1400700796-5763-1-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DN8g+DOX2TxGxleI"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1400700796-5763-1-git-send-email-maxime.ripard@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Nicolas Pitre <nico@linaro.org>
List-Id: devicetree@vger.kernel.org


--DN8g+DOX2TxGxleI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2014 at 09:33:14PM +0200, Maxime Ripard wrote:
> Hi,
>=20
> This patch series add the possibility for the topology code to get the
> CPU frequency through a DT clock handle instead of needing a
> clock-frequency property.
>=20
> Indeed, this information can be quite redundant if the clock tree
> defined in the DT is already describing the CPU parent clock.

Ping?

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--DN8g+DOX2TxGxleI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTlvBoAAoJEBx+YmzsjxAgUukP/156rKpf5kfu5EOyOMRrPUnr
h2gIXX7IeGekEPCTcWVEvtzJ72D0oUxgen1BiPIGsoDyieWqpITKOvvm14VYprmJ
acfv1Ki7twVBA3bwRskXSMPaYrgllrbqUDX79IQEGCzdn3pKjWefpi1oCuSxra3p
Q5Bh+KF9r2z5QP5oVohEuyFJdT7CpvOjhHxjXXwraJrA+PClvCec5W9q90OirvvC
OtG9f1vapTHgprc+xFZcNdcHqI/nInpvMJc70zw2JzkT/Vlv0jEiip7342H+DpNj
Q2cYSM8rufTiIRtGVGLJDNnLJ08x4/f2pfAzHACqALlQkDbEM24rwSmnJyltOkSR
FN9MYzvJOIH7k9cQvVFlyPaJG3Gdqo9IhrgOAjEdoDXXFU8GMKaWwtO2WNILIUq+
zxV1pnukXyyY2cZy0fOT47UyWuPxBPCxJa3DIMPt4y/inbgOqkgcNud4EWVxSmsB
KkaMUyoVJEEJpqDD1dPht+PO1HZcvU3NsVfkra2QWcTyUmDwO8AeoBkNZPRfUSJc
PDrCyRX56dlS9x+Y0TGGXjIiOd63CVUGVdHsDzluYnnRFTBhg1YWCwhL5LZOSbxD
DSwyej2TeiPZyICWiXW6SaXQT7uPiXt1w+Mp4LA7sibh9YL8j4f+Wnkr+G2Vetcr
SeEjUeNgJM/vuGtOMka7
=IuMQ
-----END PGP SIGNATURE-----

--DN8g+DOX2TxGxleI--
