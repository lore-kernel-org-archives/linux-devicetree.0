From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] ARM: dts: sunxi: Add num-cs for A20 spi nodes
Date: Thu, 24 Nov 2016 20:55:17 +0100
Message-ID: <20161124195517.qrq7briu3pwjnp4n@lukather>
References: <20161122170616.29557-1-manu@bidouilliste.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3660187730839752658=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161122170616.29557-1-manu@bidouilliste.com>
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


--===============3660187730839752658==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="asdfgkkesomkgkki"
Content-Disposition: inline


--asdfgkkesomkgkki
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 22, 2016 at 06:06:16PM +0100, Emmanuel Vadot wrote:
> The spi0 controller on the A20 have up to 4 CS (Chip Select) while the
> others three only have 1.
> Add the num-cs property to each node.
>=20
> Signed-off-by: Emmanuel Vadot <manu@bidouilliste.com>

I don't think we have any code that uses it at the moment. What is the
rationale behind this patch?

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--asdfgkkesomkgkki
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYN0WlAAoJEBx+YmzsjxAgPtoQALh/YqG/UBKDqpcOrTv7792L
G4vh9l2hKgF9NofwfL3+kbGqWpHsA9ENaaAjLPolU6nVXkYJocqEbojPtsVcXaGT
uyAEvYlcZ73V1eJKsh7O2F4asEv1kVkipqpVN4gzd0MfAHSAuLGCXYLPDjjycm93
UwoDf/756TiWRAUucIy8aXEFdB/RCXvcrlB8OV3L7hiRPYf65ToImGgM5wi0dY7+
aiHq+aO1gfoCsGrljJS8HrtL63hxh2r8a+8cdVJM/uM2I4XOg4I5I7cx4eDWRIl1
ixhZD7sgpYBCP0/TSm8iOM6blg4fvS2wlU6dJTEhUb+7TWuWY45eViyhezX/Ivno
10k/0Qq2wjwDAP3+SSjCEFPd+hVI9dX66oUiznFVr4nTrHgdk5cNV08jdWmpNuz3
lw+X3xvbLI4S4LvD8gA2lDLKvuu/3hSra6K0WL0IdTNDiK4JWaRN2UP9B+t4Qswj
K+AXsxN8FQLcds4fDmqC7j6LGLvu4OsQ32V1pnElgC45b3dOs05DFFJx0DDK5wRG
aY/nzfqpsskMWJak7/67lGTvhIhGW/0I2ER0d9ceC15NfKCos/a7ICrIxPFlYBkG
7flb9996esIs4T7PqljlOJEuI7mChoCOzAduOTkDwcaHm3xkqnN316LYMS6t6nhQ
fpPYv1uJBwMH2Wi8Mwop
=xI3n
-----END PGP SIGNATURE-----

--asdfgkkesomkgkki--


--===============3660187730839752658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3660187730839752658==--
