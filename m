From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH] of/irq: export of_get_irq_byname()
Date: Wed, 26 Aug 2015 18:36:33 +0200
Message-ID: <20150826163632.GA1521@katana>
References: <20150826000402.GA5042@dtor-ws>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pf9I7BMVVzbSWLtt"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150826000402.GA5042@dtor-ws>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Jeremy Linton <lintonrjeremy@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Stephen Rothwell <sfr@canb.auug.org.au>, Vignesh R <vigneshr@ti.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2015 at 05:04:02PM -0700, Dmitry Torokhov wrote:
> Similarly to of_get_irq(), let's export of_irq_get_byname(), so if a bus =
core
> can be compiled as a module (such as I2C) it can have access to the symbo=
l.
>=20
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Reported-by: kbuild test robot <fengguang.wu@intel.com>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Applied to for-next, thanks!


--pf9I7BMVVzbSWLtt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV3esQAAoJEBQN5MwUoCm2b6EQALQut4rV7qHiDYIx/AF5TBHd
LPruarArNyNAEcXfs9PS8Dewh7k2PYb2E1bCZLSTBqoWhvZt1TtNk4npzt7y3xPT
UIG4wYkzgCqR6eubCgwMmGSQlxig1Y08I8S+FZBPNc6bZ+TPrpJ+tbImCvp3p+jv
aOq0Z6MnuCnm4NRbmJ79JtprdfhOWIooxZXRvwXl0PzbuVPKNt23zo0iKC7uLV3n
BphjtLnjt+u/omF6PVCNBqhLd6+c+WzJBYOVccJe+8lhxZ8qDQacVsPbz+eeKC8e
uFJVNABhFPXo4z7HlZHhcYKscHBqAThF/XKJE88ZSAUCN9SJKGUosS85FjcWlo3y
iknjHcflyIBrl+Myd9Und4c9Qo84HQswckdqL1Em5m/AiYftCbq1UHIKHdJl/F1S
RLfps0Gse1fgoEpiEWQrUACBhioksT/KkxglpPpjoq9/RoLdHktcmabx6Xx5StIu
Z754a3rR1Xc1XgDiOA5XVwpPJEKFH0p/OBMyavZP91y+y8s/7i4/lzvjR3JbraUx
c8QwyZealdXXhz3U0ohajMqI6C+7hJM4w7sZEUOkFIf0cFlEuBlcR6Q8cmvq5kD/
UDC9kVXPc6cjd8iXzKKByydW1MMlklqP7ZgFTy34S87PyznXoREIr/H470Vdmesx
ZY1F1njxyd1nROx0Buy5
=frYn
-----END PGP SIGNATURE-----

--pf9I7BMVVzbSWLtt--
