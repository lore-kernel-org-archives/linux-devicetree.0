From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] ARM: dts: sunxi: Use axp209.dtsi for Olinuxino Lime2
Date: Thu, 5 Jan 2017 18:14:06 +0100
Message-ID: <20170105171406.s5xpbtcpe4esn6iz@lukather>
References: <20161227102238.20110-1-manu@bidouilliste.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6576532119163168624=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161227102238.20110-1-manu@bidouilliste.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Emmanuel Vadot <manu@bidouilliste.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, wens@csie.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============6576532119163168624==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s37qztz6jqdsrdoe"
Content-Disposition: inline


--s37qztz6jqdsrdoe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 27, 2016 at 11:22:38AM +0100, Emmanuel Vadot wrote:
> Use axp209.dtsi in sun7i-a20-olinuxino-lime2.dts and correct
> some regulators.
>=20
> DCDC2 is used for vdd-cpu so it should never be bellow 1V and above 1.4V
> DCDC3 is used for VDD_INT so same as above.
> LD01 is used for the RTC, and should have a typical value of 1.3V
> LD02 is used for AVCC and should have a typical value of 3.0V
> LD03/4 are used for Port-E/Port-G Power pin, and the schematics recommands
> to set them to 2.8V as they can be used for CSI0/1.
>=20
> Signed-off-by: Emmanuel Vadot <manu@bidouilliste.com>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--s37qztz6jqdsrdoe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYbn7ZAAoJEBx+YmzsjxAgYV4QALrEDyqMnnLuHxy1mdbPg1U/
By9IyJyBQNOYYt/fluWQoj97DRBPHBZjapFc2KzAWwRMvXLiH3mKkHuk+0/KJtEW
km24Nq5rMbXf27epOxFFoqQel9uf3PObp33YFpDfckM8AUrrj1XHFR7m043/ebX9
4h4ljd3m9vpsnZE+gIvIoIFUKb943mMEYa0z5phO0qPwgYUe3UQhCqdZdvF4T3/C
oirvi7+4wtzSDIVIo95eyvybFBZKDZLR0PmtlvWoYl2H8PIpc/f7TYcPoSGALKqd
tQ5/ZNtvVMiyHKTQKe+s1Lluq4T/Vf7UyTl7xv5wKb1f43356DlmU/qgbd93cdyV
9Osuexx+wHNWmY3RxloAQBrJf0bc1QaDDqy6Aw05/dtEk2jNmG7N0Iq1d9U4VZIp
PeIkouXcl+tR+p1hOow4CiZALw2NwN/4LZS6kCAQzRW+tMlulpPq/k5BrVZeV+GR
IRB+OYejvcHA5Ys8SPidQacNrgbaVKwAqgb+ywl751gECFlxlQGkebSvuiMXpiAn
9cKKKsvNhH7h5UD702BDRap9oSjJsqTMIRhuBISnrSmdADMuoOxUsSshzx57oUMA
P7bftd8rJBVJJ7NeILjeniDd89afnuGhFtJlOhg2AGY7qDgoCe5vojWAToltqP8C
RLOWjM2Oc5fXJ1Cc+zL5
=LbZ6
-----END PGP SIGNATURE-----

--s37qztz6jqdsrdoe--


--===============6576532119163168624==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6576532119163168624==--
