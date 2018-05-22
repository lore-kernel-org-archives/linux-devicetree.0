From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 1/9] ARM: shmobile: defconfig: Enable MTD command line
 partition parsing
Date: Tue, 22 May 2018 14:32:53 +0200
Message-ID: <20180522123253.gvxinjmam5hwse5c@ninjato>
References: <20180522120257.13232-1-marek.vasut+renesas@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5032247212923332956=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180522120257.13232-1-marek.vasut+renesas@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Simon Horman <horms+renesas@verge.net.au>, linux-arm-kernel@lists.infradead.org, Marek Vasut <marek.vasut+renesas@gmail.com>
List-Id: devicetree@vger.kernel.org


--===============5032247212923332956==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4bbgvzjmey25ks6c"
Content-Disposition: inline


--4bbgvzjmey25ks6c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 22, 2018 at 02:02:49PM +0200, Marek Vasut wrote:
> In preparation for removing MTD partitioning from the DTs and moving
> it over to kernel command line partition parsing, enable the support
> for kernel command line MTD partition parsing.
>=20
> The argument for not having MTD partitions in the DT is the same as
> for not having hard drive partitions in DT, neither describes the
> hardware itself, so it shouldn't be in the DT. Furthermore, kernel
> command line MTD partition passing allows greater flexibility in
> case someone decided to repartition the flash, which is well in the
> realm of possibility with these systems.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>

Makes a lot of sense to me.

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--4bbgvzjmey25ks6c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlsEDfEACgkQFA3kzBSg
KbY+dg/9HMlpFXhuk4Qd5jIwAs2znBC3GnO+RH10krylfgWdqaa4uzDt5ibzRDCs
UBroGdOxPMforBaSy0pCa2fvKFXDnYDWqFqe+fHkcfcGPeMUg6CF4XT+eLFONSvl
jPBJJrrtkfTcd6baKe2sc0QGEooHrZU3v6uptcU0R9hGoe4Q4G9+41vnOdZNgDgA
l+TQawaGB7tq5gs80YUns56qlRLmrlOEr7JHexin3j7eAL5PAGEMWjRkCxXK7dvQ
Pcpil67/Isc6P8VPBJsM/NDmTWqTh3NybQm9fYKkCQl3vlQDd9sMaWcsI2/28ZS6
xo+sW214unS4pK+wvzD7G0hcWWs81lkCa63tMK80CH1EHDhWF1u0eKXtKQ6smi9T
zukkf2nTHoFAjTHEuadI6bZpCp95JAf8hVaF5dnnModsB9hV7TprfnfWzcIOqQGk
fbaKR8C0nWUMYkjXBfPelmLCL/CM8Hrp+o05W0uHKc6aeAo7EpVJP7/oidqnXwdP
aaOhoTteFgLFXolUEikZwSqrasQl1nSf3qIiaPIJ0+e48MghFh/+V7JGE3ej/J/K
BB71aLOPdqCcL+q3+DEKyQYUj7FPYyEBiXTJ9kUQTBTL/hT1EZ3N/0z39Xz6cyau
3S3x642M/MvozeVYkmNhMjr4sF6ZM9qPmDmQk+l/JUi1lmVz/Rw=
=24iJ
-----END PGP SIGNATURE-----

--4bbgvzjmey25ks6c--


--===============5032247212923332956==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5032247212923332956==--
